import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/errors/app_errors.dart';
import '../../domain/models/incident.dart';
import '../../domain/repositories/clips_repository.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../maps/location_controller.dart';
import '../settings/settings_controller.dart';

enum RecorderStatus { idle, buffering, saving, error }

class RecorderState {
  const RecorderState({
    this.status = RecorderStatus.idle,
    this.bufferedMs = 0,
    this.targetBufferMs = 20000,
    this.width = 0,
    this.height = 0,
    this.audio = false,
    this.watermark = true,
    this.fallbackReason,
    this.lastSaved,
    this.error,
    this.manualActive = false,
    this.manualBusy = false,
    this.manualElapsedMs = 0,
    this.manualParts = 0,
    this.manualStartedAt,
    this.lastManualPart,
    this.lastStopReason,
  });

  final RecorderStatus status;
  final int bufferedMs;
  final int targetBufferMs;
  final int width;
  final int height;
  final bool audio;
  final bool watermark;
  final String? fallbackReason;
  final IncidentResult? lastSaved;

  /// Last error code (`not_running`, `storage_full`, ...).
  final String? error;

  /// Manual (continuous) recording is running.
  final bool manualActive;

  /// A start/stop request is in flight (stop waits for the last part to be written).
  final bool manualBusy;
  final int manualElapsedMs;

  /// Parts written by the current/last manual recording.
  final int manualParts;
  final DateTime? manualStartedAt;
  final IncidentResult? lastManualPart;

  /// Why the last manual recording ended: `user`, `storage`, `max_duration`,
  /// `camera_stopped`, `background`, `thermal`.
  final String? lastStopReason;

  RecorderState copyWith({
    RecorderStatus? status,
    int? bufferedMs,
    int? targetBufferMs,
    int? width,
    int? height,
    bool? audio,
    bool? watermark,
    String? Function()? fallbackReason,
    IncidentResult? Function()? lastSaved,
    String? Function()? error,
    bool? manualActive,
    bool? manualBusy,
    int? manualElapsedMs,
    int? manualParts,
    DateTime? Function()? manualStartedAt,
    IncidentResult? Function()? lastManualPart,
    String? Function()? lastStopReason,
  }) => RecorderState(
    status: status ?? this.status,
    bufferedMs: bufferedMs ?? this.bufferedMs,
    targetBufferMs: targetBufferMs ?? this.targetBufferMs,
    width: width ?? this.width,
    height: height ?? this.height,
    audio: audio ?? this.audio,
    watermark: watermark ?? this.watermark,
    fallbackReason: fallbackReason != null
        ? fallbackReason()
        : this.fallbackReason,
    lastSaved: lastSaved != null ? lastSaved() : this.lastSaved,
    error: error != null ? error() : this.error,
    manualActive: manualActive ?? this.manualActive,
    manualBusy: manualBusy ?? this.manualBusy,
    manualElapsedMs: manualElapsedMs ?? this.manualElapsedMs,
    manualParts: manualParts ?? this.manualParts,
    manualStartedAt: manualStartedAt != null
        ? manualStartedAt()
        : this.manualStartedAt,
    lastManualPart: lastManualPart != null
        ? lastManualPart()
        : this.lastManualPart,
    lastStopReason: lastStopReason != null
        ? lastStopReason()
        : this.lastStopReason,
  );
}

class RecorderController extends Notifier<RecorderState> {
  StreamSubscription<Map<Object?, Object?>>? _sub;

  @override
  RecorderState build() {
    _sub = ref.read(nativeEngineProvider).status.listen((m) {
      if (m['type'] != 'recorder') return;
      _onManualEvent(m);
      if (m['event'] != null) return; // part events carry no buffer status
      if (state.status == RecorderStatus.saving) {
        state = state.copyWith(bufferedMs: (m['bufferedMs'] as num?)?.toInt());
        return;
      }
      state = state.copyWith(
        status: switch (m['state']) {
          'buffering' => RecorderStatus.buffering,
          'saving' => RecorderStatus.saving,
          'error' => RecorderStatus.error,
          _ => RecorderStatus.idle,
        },
        bufferedMs: (m['bufferedMs'] as num?)?.toInt(),
        width: (m['width'] as num?)?.toInt(),
        height: (m['height'] as num?)?.toInt(),
        audio: m['audio'] as bool?,
      );
    }, onError: (_) {});
    ref.onDispose(() => _sub?.cancel());
    final s = ref.read(settingsProvider);
    return RecorderState(
      targetBufferMs: s.bufferSeconds * 1000,
      watermark: s.watermark,
    );
  }

  /// Sends the stored recording config to native.
  Future<void> applyConfig() async {
    final s = ref.read(settingsProvider);
    try {
      final r = await ref
          .read(nativeEngineProvider)
          .recorderConfigure(
            profile: s.recordingProfile.name,
            bufferSeconds: s.bufferSeconds,
            audio: s.recordAudio,
            watermark: s.watermark,
            timestamp: s.timestamp,
          );
      if (!ref.mounted) return;
      state = state.copyWith(
        targetBufferMs:
            ((r['bufferSeconds'] as num?)?.toInt() ?? s.bufferSeconds) * 1000,
        width: (r['width'] as num?)?.toInt(),
        height: (r['height'] as num?)?.toInt(),
        audio: r['audio'] as bool? ?? s.recordAudio,
        watermark: r['watermark'] as bool? ?? s.watermark,
        fallbackReason: () => r['fallbackReason'] as String?,
        error: () => null,
      );
    } catch (e) {
      if (ref.mounted) state = state.copyWith(error: () => errorCode(e));
    }
  }

  /// Saves the rolling buffer as an incident clip.
  ///
  /// Allowed at any speed. Native failures return null with `state.error`
  /// set to the bridge error code.
  Future<IncidentResult?> saveIncident({String reason = 'manual'}) async {
    final s = ref.read(settingsProvider);
    final fix = ref.read(locationProvider).fix;
    final prev = state.status;
    state = state.copyWith(status: RecorderStatus.saving, error: () => null);
    try {
      final r = await ref
          .read(nativeEngineProvider)
          .saveIncident(
            reason: reason,
            lat: s.saveLocation ? fix?.lat : null,
            lon: s.saveLocation ? fix?.lon : null,
            speed: fix != null && fix.hasSpeed ? fix.speed : null,
          );
      await ref.read(clipsRepositoryProvider).add(r);
      if (ref.mounted) {
        state = state.copyWith(
          status: prev == RecorderStatus.saving
              ? RecorderStatus.buffering
              : prev,
          lastSaved: () => r,
        );
      }
      return r;
    } catch (e) {
      if (ref.mounted) {
        state = state.copyWith(
          status: prev == RecorderStatus.saving
              ? RecorderStatus.buffering
              : prev,
          error: () => errorCode(e),
        );
      }
      return null;
    }
  }

  // ---- manual (continuous) recording ----

  final _seenParts = <String>{};

  /// Default pre-roll included before the moment Record is pressed.
  static const manualPreRollSeconds = 5.0;

  /// Part length; each part becomes its own clip.
  static const manualSplitMinutes = 5.0;

  void _onManualEvent(Map<Object?, Object?> m) {
    final manual = m['manual'];
    if (manual is Map) {
      final active = manual['active'] == true;
      state = state.copyWith(
        manualActive: active,
        manualElapsedMs: active
            ? (manual['elapsedMs'] as num?)?.toInt() ?? state.manualElapsedMs
            : state.manualElapsedMs,
        manualParts: (manual['files'] as num?)?.toInt() ?? state.manualParts,
        manualStartedAt: active
            ? () => switch (manual['startedAt']) {
                final num t => DateTime.fromMillisecondsSinceEpoch(t.toInt()),
                _ => state.manualStartedAt,
              }
            : null,
      );
    }
    switch (m['event']) {
      case 'manual_part':
        final part = m['part'];
        if (part is Map) unawaited(_addPart(IncidentResult.fromMap(part)));
      case 'manual_part_failed':
        state = state.copyWith(error: () => m['code'] as String? ?? 'failed');
    }
    final note = m['note'];
    if (note is String && note.startsWith('manual_stopped_')) {
      state = state.copyWith(
        manualActive: false,
        manualBusy: false,
        lastStopReason: () => note.substring('manual_stopped_'.length),
      );
    }
  }

  /// Catalogues a finished part once (it arrives both as an event and in the
  /// stop result).
  Future<void> _addPart(IncidentResult r) async {
    if (!_seenParts.add(r.id)) return;
    try {
      await ref.read(clipsRepositoryProvider).add(r);
    } catch (_) {}
    if (ref.mounted) state = state.copyWith(lastManualPart: () => r);
  }

  /// Starts continuous recording (5 s pre-roll, parts of 5 min, max length from
  /// settings). Allowed on every tier; the recording profile follows the
  /// recorder config. Returns false with `state.error` set on failure.
  Future<bool> startManual() async {
    if (state.manualActive || state.manualBusy) return state.manualActive;
    final s = ref.read(settingsProvider);
    final fix = ref.read(locationProvider).fix;
    state = state.copyWith(
      manualBusy: true,
      error: () => null,
      lastStopReason: () => null,
    );
    try {
      final r = await ref
          .read(nativeEngineProvider)
          .startManualRecording(
            preRollSeconds: manualPreRollSeconds,
            maxMinutes: s.manualMaxMinutes,
            splitMinutes: manualSplitMinutes,
            lat: s.saveLocation ? fix?.lat : null,
            lon: s.saveLocation ? fix?.lon : null,
            speed: fix != null && fix.hasSpeed ? fix.speed : null,
          );
      if (!ref.mounted) return false;
      state = state.copyWith(
        manualBusy: false,
        manualActive: r['active'] == true,
        manualElapsedMs: (r['elapsedMs'] as num?)?.toInt() ?? 0,
        manualParts: 0,
        manualStartedAt: () => switch (r['startedAt']) {
          final num t => DateTime.fromMillisecondsSinceEpoch(t.toInt()),
          _ => DateTime.now(),
        },
      );
      return state.manualActive;
    } catch (e) {
      if (ref.mounted) {
        state = state.copyWith(manualBusy: false, error: () => errorCode(e));
      }
      return false;
    }
  }

  /// Stops and waits for the final part(s); returns them (already catalogued).
  Future<List<IncidentResult>> stopManual() async {
    if (!state.manualActive || state.manualBusy) return const [];
    final s = ref.read(settingsProvider);
    final fix = ref.read(locationProvider).fix;
    state = state.copyWith(manualBusy: true);
    try {
      final r = await ref
          .read(nativeEngineProvider)
          .stopManualRecording(
            lat: s.saveLocation ? fix?.lat : null,
            lon: s.saveLocation ? fix?.lon : null,
            speed: fix != null && fix.hasSpeed ? fix.speed : null,
          );
      final parts = [
        for (final p in (r['parts'] as List? ?? const []))
          if (p is Map) IncidentResult.fromMap(p),
      ];
      for (final p in parts) {
        await _addPart(p);
      }
      if (ref.mounted) {
        state = state.copyWith(
          manualActive: false,
          manualBusy: false,
          lastStopReason: () => 'user',
          manualParts:
              ((r['manual'] as Map?)?['files'] as num?)?.toInt() ??
              state.manualParts + parts.length,
        );
      }
      return parts;
    } catch (e) {
      if (ref.mounted) {
        state = state.copyWith(manualBusy: false, error: () => errorCode(e));
      }
      return const [];
    }
  }

  Future<void> toggleManual() =>
      state.manualActive ? stopManual() : startManual();

  Future<void> clearBuffer() async {
    try {
      await ref.read(nativeEngineProvider).clearBuffer();
    } catch (_) {}
  }
}

final recorderProvider = NotifierProvider<RecorderController, RecorderState>(
  RecorderController.new,
);
