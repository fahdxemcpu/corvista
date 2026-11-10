import 'dart:io';

import 'package:corvista/core/errors/app_errors.dart';
import 'package:corvista/core/errors/error_log.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ErrorLog.redact', () {
    String r(String s, [List<String> t = const []]) => ErrorLog.redact(s, t);

    test('phone numbers and long digit runs', () {
      expect(r('call +33 6 12 34 56 78 now'), 'call <digits> now');
      expect(r('tel (555) 123-4567'), 'tel <digits>');
      expect(r('id 12345678901'), 'id <digits>');
      expect(r('code 123456 kept'), 'code 123456 kept'); // < 7 digits
    });

    test('coordinates and keyed values', () {
      expect(r('fix 48.8566, 2.3522'), 'fix <num>, <num>');
      expect(r('at -122.41942 / 37.77493'), 'at <num> / <num>');
      expect(r('{lat: 48.85, lon: 2.35, speed: 3}'), contains('speed: 3'));
      expect(r('{lat: 48.85, lon: 2.35}'), isNot(contains('48')));
      expect(
        r('{identifier: c1, name: Ana Lopez, phone: 06 12}'),
        '{identifier: <redacted>, name: <redacted>, phone: <redacted>}',
      );
      expect(r('"latitude":"51.5"'), isNot(contains('51.5')));
      expect(r('write to jo@example.com failed'), 'write to <email> failed');
    });

    test('registered sensitive terms (contact names)', () {
      expect(r('Contact Ana missing', ['Ana']), 'Contact <redacted> missing');
      expect(r('ANA', ['ana']), '<redacted>');
    });

    test('keeps ordinary diagnostics intact', () {
      const frame =
          '#3      RecorderController.saveIncident (package:corvista/features/dashcam/recorder_controller.dart:132:7)';
      expect(r(frame), frame);
      expect(
        r('Bad state: camera not_running (1.5 s)'),
        'Bad state: camera not_running (1.5 s)',
      );
      expect(
        r('RangeError: index 3 out of range 0..2'),
        'RangeError: index 3 out of range 0..2',
      );
    });
  });

  group('ErrorLog file', () {
    late Directory tmp;
    setUp(() => tmp = Directory.systemTemp.createTempSync('corvista_log_'));
    tearDown(() {
      ErrorLog.instance = null;
      tmp.deleteSync(recursive: true);
    });

    test('entry: timestamp, version, redacted error, ≤ 15 frames', () async {
      final log = ErrorLog(tmp, clock: () => DateTime.utc(2026, 11, 10, 8))
        ..setVersion('1.0.0', '7')
        ..setSensitiveTerms(['Ana']);
      final stack = StackTrace.fromString(
        List.generate(
          30,
          (i) => '#$i      f$i (package:x/y.dart:$i:1)',
        ).join('\n'),
      );
      await log.record(
        StateError('Ana at 48.85661, 2.35222 phone +33612345678'),
        stack,
      );
      final text = log.file.readAsStringSync();
      expect(
        text,
        startsWith('=== 2026-11-10T08:00:00.000Z | Corvista 1.0.0 (7)'),
      );
      expect(text, isNot(contains('Ana')));
      expect(text, isNot(contains('48.85661')));
      expect(text, isNot(contains('33612345678')));
      expect(text, contains(' f14 ('));
      expect(text, isNot(contains(' f15 (')));
      expect(text, contains('15 more frames'));
    });

    test('rotates at maxBytes keeping exactly one backup', () async {
      final log = ErrorLog(tmp, maxBytes: 600);
      for (var i = 0; i < 20; i++) {
        await log.record('error number $i', null);
      }
      expect(log.file.existsSync(), isTrue);
      expect(log.backup.existsSync(), isTrue);
      expect(log.file.lengthSync(), lessThanOrEqualTo(600));
      expect(log.backup.lengthSync(), lessThanOrEqualTo(600));
      final names = tmp.listSync().map((e) => e.uri.pathSegments.last).toSet();
      expect(names, {'errors.log', 'errors.log.1'});
      // Newest entry in the live file, older ones rolled into the backup.
      expect(log.file.readAsStringSync(), contains('error number 19'));
      expect(log.backup.readAsStringSync(), isNot(contains('error number 19')));
      expect(log.file.readAsStringSync(), isNot(contains('error number 0\n')));
      expect(await log.size(), log.file.lengthSync() + log.backup.lengthSync());
      expect(await log.files(), hasLength(2));

      await log.clear();
      expect(await log.size(), 0);
      expect(await log.files(), isEmpty);
    });

    test('caught PlatformExceptions via errorCode, deduplicated', () async {
      var now = DateTime(2026);
      final log = ErrorLog(tmp, clock: () => now);
      ErrorLog.instance = log;
      final e = PlatformException(
        code: 'not_found',
        message: 'No route to "12 Baker Street"',
      );
      expect(errorCode(e), 'not_found');
      expect(errorMessage(e), 'No route to "12 Baker Street"');
      await log.flush();
      var text = log.file.readAsStringSync();
      expect('=== '.allMatches(text), hasLength(1));
      expect(text, contains('PlatformException(not_found'));
      expect(text, isNot(contains('Baker')));

      now = now.add(const Duration(seconds: 5));
      errorCode(e);
      errorCode(PlatformException(code: 'cancelled'));
      await log.flush();
      text = log.file.readAsStringSync();
      expect('=== '.allMatches(text), hasLength(2));
    });
  });
}
