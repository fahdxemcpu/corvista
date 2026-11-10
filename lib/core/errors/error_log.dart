import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Private, on-device error log (`Application Support/logs/errors.log`).
///
/// * No analytics: nothing is ever sent automatically. The user can share the
///   file from Settings › Diagnostics (they pick the destination) or clear it.
/// * Entries are redacted before they touch the disk ([redact]): long digit
///   runs (phone numbers), coordinate-looking decimals, `lat`/`lon`/`name`/
///   `phone`/… values, e-mail addresses and registered sensitive terms
///   (emergency contact names) are replaced.
/// * Rotates at [maxBytes] (256 KB) keeping one `.1` backup.
class ErrorLog {
  ErrorLog(
    this.directory, {
    this.maxBytes = defaultMaxBytes,
    DateTime Function()? clock,
  }) : _clock = clock ?? DateTime.now;

  static const defaultMaxBytes = 256 * 1024;
  static const maxFrames = 15;
  static const fileName = 'errors.log';

  /// Process-wide log installed by [install]; `null` in tests / before init.
  static ErrorLog? instance;

  final Directory directory;
  final int maxBytes;
  final DateTime Function() _clock;

  String appVersion = '?';
  String build = '?';
  Set<String> _sensitive = const {};
  Future<void> _queue = Future.value();
  String? _lastCaughtKey;
  DateTime? _lastCaughtAt;

  File get file => File(p.join(directory.path, fileName));
  File get backup => File(p.join(directory.path, '$fileName.1'));

  /// Creates the log in `Application Support/logs` and installs
  /// `FlutterError.onError` and `PlatformDispatcher.instance.onError`.
  /// The default presentation (console dump / red screen in debug) is kept.
  /// Never throws: without a writable directory the app runs without a log.
  static Future<ErrorLog?> install() async {
    try {
      final support = await getApplicationSupportDirectory();
      final log = ErrorLog(Directory(p.join(support.path, 'logs')));
      instance = log;
      final previous = FlutterError.onError;
      FlutterError.onError = (details) {
        log.record(
          details.exception,
          details.stack,
          source: 'flutter',
          context: details.context?.toDescription(),
        );
        (previous ?? FlutterError.presentError)(details);
      };
      PlatformDispatcher.instance.onError = (error, stack) {
        log.record(error, stack, source: 'platform');
        // Debug: fall through to the default handler (prints to console).
        return !kDebugMode;
      };
      return log;
    } catch (e) {
      debugPrint('ErrorLog unavailable: $e');
      return null;
    }
  }

  /// Strings that must never appear in the log (e.g. emergency contact
  /// names). Matched case-insensitively.
  void setSensitiveTerms(Iterable<String> terms) {
    _sensitive = {
      for (final t in terms)
        if (t.trim().length >= 2) t.trim(),
    };
  }

  void setVersion(String version, String buildNumber) {
    appVersion = version;
    build = buildNumber;
  }

  /// Appends a redacted entry. Writes are serialised; failures are ignored.
  Future<void> record(
    Object error,
    StackTrace? stack, {
    String source = 'dart',
    String? context,
  }) {
    final entry = formatEntry(error, stack, source: source, context: context);
    return _enqueue(() => _append(entry));
  }

  /// Logs a `PlatformException` caught by a controller (see `errorCode` /
  /// `errorMessage`). Repeats of the same code+message within 2 s are
  /// skipped (controllers often call both helpers for one error). Quoted
  /// text in the message (search queries, names) is removed as well.
  void recordCaught(PlatformException e) {
    if (e.code == 'cancelled') return;
    final now = _clock();
    final key = '${e.code}|${e.message}';
    if (key == _lastCaughtKey &&
        _lastCaughtAt != null &&
        now.difference(_lastCaughtAt!) < const Duration(seconds: 2)) {
      return;
    }
    _lastCaughtKey = key;
    _lastCaughtAt = now;
    final msg = (e.message ?? '').replaceAll(_quoted, '"<redacted>"');
    record(
      'PlatformException(${e.code}${msg.isEmpty ? '' : ', $msg'})',
      StackTrace.current,
      source: 'caught',
    );
  }

  String formatEntry(
    Object error,
    StackTrace? stack, {
    required String source,
    String? context,
  }) {
    final b = StringBuffer()
      ..writeln(
        '=== ${_clock().toUtc().toIso8601String()} | '
        'Corvista $appVersion ($build) | '
        '${defaultTargetPlatform.name} | $source',
      );
    if (context != null && context.isNotEmpty) {
      b.writeln('Context: ${redact(context, _sensitive)}');
    }
    b.writeln('Error: ${redact('$error', _sensitive)}');
    final frames = (stack?.toString() ?? '')
        .split('\n')
        .map((l) => l.trimRight())
        .where((l) => l.trim().isNotEmpty)
        .toList();
    if (frames.isNotEmpty) {
      b.writeln('Stack:');
      for (final f in frames.take(maxFrames)) {
        b.writeln('  ${redact(f, _sensitive)}');
      }
      if (frames.length > maxFrames) {
        b.writeln('  … ${frames.length - maxFrames} more frames');
      }
    }
    return b.toString();
  }

  Future<void> _enqueue(Future<void> Function() f) {
    final next = _queue.then((_) async {
      try {
        await f();
      } catch (e) {
        debugPrint('ErrorLog write failed: $e');
      }
    });
    _queue = next;
    return next;
  }

  Future<void> _append(String entry) async {
    await directory.create(recursive: true);
    final f = file;
    final bytes = entry.length; // close enough (ASCII mostly)
    if (f.existsSync() && f.lengthSync() + bytes > maxBytes) {
      final bak = backup;
      if (bak.existsSync()) bak.deleteSync();
      f.renameSync(bak.path);
    }
    await f.writeAsString(entry, mode: FileMode.append, flush: true);
  }

  /// Completes when pending writes are done.
  Future<void> flush() => _queue;

  /// Total size of the log and its backup in bytes.
  Future<int> size() async {
    await flush();
    var total = 0;
    for (final f in [file, backup]) {
      if (f.existsSync()) total += f.lengthSync();
    }
    return total;
  }

  /// Existing log files, oldest first (for sharing).
  Future<List<File>> files() async {
    await flush();
    return [
      for (final f in [backup, file])
        if (f.existsSync() && f.lengthSync() > 0) f,
    ];
  }

  /// Deletes the log and its backup.
  Future<void> clear() => _enqueue(() async {
    for (final f in [file, backup]) {
      if (f.existsSync()) f.deleteSync();
    }
  });

  // ---------------------------------------------------------------- redaction

  static final _quoted = RegExp('"[^"\\n]*"|\'[^\'\\n]*\'');
  static final _email = RegExp(r'[\w.+-]+@[\w-]+\.[\w.-]+');
  static final _keyed = RegExp(
    r'\b(lat|lon|lng|latitude|longitude|coordinate|coordinates|name|phone|'
    r'phones|number|recipients?|identifier|address|title|query|body)'
    r'''(["']?\s*[:=]\s*)(\[[^\]\n]*\]|"[^"\n]*"|'[^'\n]*'|[^,;}\)\n]+)''',
    caseSensitive: false,
  );
  // Decimal numbers that could be coordinates: up to 3 integer digits and at
  // least 3 decimals (≈ 100 m precision or better).
  static final _coord = RegExp(r'(?<![\w.])-?\d{1,3}\.\d{3,}(?![\w.])');
  // Phone-number-like: 7+ digits, optionally separated by spaces, dashes,
  // dots or parentheses, optionally starting with + or (.
  static final _phone = RegExp(r'\+?\(?\d(?:[\s\-().]{0,2}\d){6,}');

  /// Removes personal data from [s]. Pure; unit-tested.
  static String redact(String s, [Iterable<String> sensitive = const []]) {
    var out = s;
    for (final t in sensitive) {
      out = out.replaceAll(
        RegExp(RegExp.escape(t), caseSensitive: false),
        '<redacted>',
      );
    }
    out = out
        .replaceAll(_email, '<email>')
        .replaceAllMapped(_keyed, (m) => '${m[1]}${m[2]}<redacted>')
        .replaceAll(_coord, '<num>')
        .replaceAllMapped(_phone, (m) {
          final digits = m[0]!.replaceAll(RegExp(r'\D'), '').length;
          return digits >= 7 ? '<digits>' : m[0]!;
        });
    return out;
  }
}

/// The installed log (`null` when unavailable). Tests override this.
final errorLogProvider = Provider<ErrorLog?>((ref) => ErrorLog.instance);

/// Size of the log + backup in bytes (Settings › Diagnostics).
final errorLogSizeProvider = FutureProvider.autoDispose<int>((ref) async {
  final log = ref.watch(errorLogProvider);
  return log == null ? 0 : log.size();
});
