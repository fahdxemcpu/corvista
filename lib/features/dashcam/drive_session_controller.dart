import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show ProviderListenable;
import 'package:uuid/uuid.dart';

import '../../data/database/database.dart';
import '../../domain/models/app_settings.dart';
import '../../domain/services/clock.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../../platform/native_bridge/native_engine.dart';
import '../ai_models/ai_model_controller.dart';
import '../camera/camera_controller.dart';
import '../emergency/emergency_controller.dart';
import '../maps/location_controller.dart';
import '../navigation/navigation_controller.dart';
import '../parking/parking_controller.dart';
import '../power/perf_controller.dart';
import '../power/power_controller.dart';
import '../settings/settings_controller.dart';
import '../tracking/tracker_controller.dart';
import '../trips/trip_controller.dart';
import '../voice_alerts/voice_alert_controller.dart';
import 'recorder_controller.dart';

class DriveSessionState {
  const DriveSessionState({
    this.active = false,
    this.view = DriveView.detection,
    this.startedAt,
    this.sessionId,
    this.backgroundPaused = false,
    this.pausedNotice,
  });
  final bool active;
  final DriveView view;
  final DateTime? startedAt;
  final String? sessionId;

  /// The app is in the background and the camera / recorder are stopped (iOS
  /// does not allow camera capture in the background).
  final bool backgroundPaused;

  /// Set (to an increasing id) on return from the background when recording
  /// had to pause; drives the "Recording paused…" banner. Cleared after a while.
  final int? pausedNotice;

  DriveSessionState copyWith({
    bool? active,
    DriveView? view,
    DateTime? Function()? startedAt,
    String? Function()? sessionId,
    bool? backgroundPaused,
    int? Function()? pausedNotice,
  }) => DriveSessionState(
    active: active ?? this.active,
    view: view ?? this.view,
    startedAt: startedAt != null ? startedAt() : this.startedAt,
    sessionId: sessionId != null ? sessionId() : this.sessionId,
    backgroundPaused: backgroundPaused ?? this.backgroundPaused,
    pausedNotice: pausedNotice != null ? pausedNotice() : this.pausedNotice,
  );
}

/// Orchestrates a drive: camera, recorder, AI, location, motion (emergency),
/// voice alerts, power policy. Each step is independent — a failure in one
/// (e.g. no camera on Simulator, map/weather offline) never stops the others.
///
/// Pauses the camera when the app is backgrounded and resumes on return —
/// no hidden background recording. During turn-by-turn navigation location
/// keeps running in the background (see background_nav_bridge.dart).
class DriveSessionController extends Notifier<DriveSessionState> {
  static const pausedNoticeDuration = Duration(seconds: 12);

  late NativeEngine _engine;
  AppLifecycleListener? _lifecycle;
  bool _paused = false;
  bool _pausedRecording = false;
  int _noticeSeq = 0;
  Timer? _noticeTimer;
  final List<ProviderSubscription<Object?>> _keepAlive = [];

  @override
  DriveSessionState build() {
    _engine = ref.read(nativeEngineProvider);
    ref.listen(powerProvider, (prev, next) {
      if (!state.active || _paused) return;
      if (prev?.aiHz != next.aiHz || prev?.segHz != next.segHz) {
        unawaited(_configureAi());
      }
    });
    ref.listen(settingsProvider, (prev, next) {
      if (prev == null || !state.active) return;
      unawaited(_onSettingsChanged(prev, next));
    });
    ref.onDispose(() {
      _lifecycle?.dispose();
      _lifecycle = null;
      _noticeTimer?.cancel();
    });
    return DriveSessionState(view: ref.read(settingsProvider).defaultView);
  }

  Future<void> _step(Future<void> Function() f) async {
    try {
      await f();
    } catch (e) {
      debugPrint('DriveSession step failed: $e');
    }
  }

  Future<void> _configureAi() async {
    final s = ref.read(settingsProvider);
    final p = ref.read(powerProvider);
    await _step(
      () => _engine.aiConfigure(
        confidence: s.confidenceThreshold,
        maxHz: p.aiHz,
        segmentationHz: p.segHz,
        paused: s.modelId == 'none' || p.aiHz <= 0,
      ),
    );
  }

  Future<void> _onSettingsChanged(AppSettings prev, AppSettings next) async {
    if (prev.modelId != next.modelId) {
      await _step(
        () async => ref.read(aiModelsProvider.notifier).applySelected(),
      );
      await _configureAi();
    } else if (prev.confidenceThreshold != next.confidenceThreshold) {
      await _configureAi();
    }
    if (prev.recordingProfile != next.recordingProfile ||
        prev.bufferSeconds != next.bufferSeconds ||
        prev.recordAudio != next.recordAudio ||
        prev.watermark != next.watermark ||
        prev.timestamp != next.timestamp) {
      await _step(() => ref.read(recorderProvider.notifier).applyConfig());
    }
    if (prev.keepScreenOn != next.keepScreenOn) {
      await _step(() => _engine.keepAwake(next.keepScreenOn));
    }
    if (prev.emergencyEnabled != next.emergencyEnabled) {
      await _step(
        () => next.emergencyEnabled
            ? _engine.motionStart()
            : _engine.motionStop(),
      );
    }
  }

  void _holdControllers() {
    // Keep background controllers subscribed while driving even if no
    // widget currently watches them.
    for (final p in <ProviderListenable<Object?>>[
      tracksProvider,
      voiceAlertsProvider,
      emergencyProvider,
      parkingProvider,
      powerProvider,
      perfProvider,
      recorderProvider,
      locationProvider,
      tripProvider,
    ]) {
      _keepAlive.add(ref.listen(p, (_, _) {}));
    }
  }

  void _releaseControllers() {
    for (final s in _keepAlive) {
      s.close();
    }
    _keepAlive.clear();
  }

  Future<void> start() async {
    if (state.active) return;
    final s = ref.read(settingsProvider);
    final id = const Uuid().v4();
    final now = ref.read(clockProvider)();
    state = state.copyWith(
      active: true,
      startedAt: () => now,
      sessionId: () => id,
    );
    _paused = false;
    _holdControllers();
    ref.read(tripProvider.notifier).sessionStarted();
    _attachLifecycle();

    await _step(() => _engine.keepAwake(s.keepScreenOn));
    await _step(() => ref.read(cameraProvider.notifier).start());
    await _step(() => ref.read(recorderProvider.notifier).applyConfig());
    await _step(
      () async => ref.read(aiModelsProvider.notifier).applySelected(),
    );
    await _configureAi();
    await _step(() => ref.read(locationProvider.notifier).start());
    if (s.emergencyEnabled) {
      await _step(() => _engine.motionStart());
      await _step(() => ref.read(emergencyProvider.notifier).arm());
    }
    if (state.view == DriveView.parking) {
      ref.read(parkingProvider.notifier).setActive(true);
    }
    await _step(
      () => ref
          .read(databaseProvider)
          .startSession(
            id: id,
            startedAt: now,
            view: state.view.name,
            modelId: s.modelId,
            recordingProfile: s.recordingProfile.name,
          ),
    );
  }

  Future<void> stop() async {
    if (!state.active) return;
    final id = state.sessionId;
    ref.read(parkingProvider.notifier).setActive(false);
    await _step(() => _engine.motionStop());
    await _step(() => ref.read(locationProvider.notifier).stop());
    await _step(() => _engine.aiConfigure(paused: true));
    await _step(() => ref.read(cameraProvider.notifier).stop());
    await _step(() => _engine.keepAwake(false));
    if (id != null) {
      final perf = ref.read(perfProvider);
      await _step(
        () => ref
            .read(databaseProvider)
            .endSession(
              id,
              ref.read(clockProvider)(),
              metricsJson: jsonEncode({
                'inferenceMs': perf.inferenceMs,
                'detectHz': perf.detectHz,
                'cameraFps': perf.cameraFps,
                'droppedFrames': perf.droppedFrames,
              }),
            ),
      );
    }
    await _step(() => ref.read(tripProvider.notifier).sessionStopped());
    _lifecycle?.dispose();
    _lifecycle = null;
    _releaseControllers();
    ref.read(tracksProvider.notifier).reset();
    if (ref.mounted) {
      state = state.copyWith(
        active: false,
        startedAt: () => null,
        sessionId: () => null,
      );
    }
  }

  void setView(DriveView v) {
    final prev = state.view;
    state = state.copyWith(view: v);
    if (state.active) {
      ref.read(parkingProvider.notifier).setActive(v == DriveView.parking);
    }
    // The Perception view needs the segmentation model: load it for as long
    // as the view is open (without changing the user's saved model choice),
    // then return to the user's model.
    final ai = ref.read(aiModelsProvider.notifier);
    if (v == DriveView.segmentation && prev != DriveView.segmentation) {
      unawaited(_step(() async => ai.activate('segmentation')));
    } else if (prev == DriveView.segmentation && v != DriveView.segmentation) {
      unawaited(_step(() async => ai.applySelected()));
    }
  }

  void _attachLifecycle() {
    _lifecycle?.dispose();
    try {
      _lifecycle = AppLifecycleListener(
        onStateChange: (s) => unawaited(handleLifecycle(s)),
      );
    } catch (_) {
      _lifecycle = null; // No binding (pure unit tests).
    }
  }

  /// App lifecycle handling (public for tests).
  Future<void> handleLifecycle(AppLifecycleState s) async {
    if (!state.active) return;
    if (s == AppLifecycleState.paused || s == AppLifecycleState.hidden) {
      if (_paused) return;
      _paused = true;
      final cam = ref.read(cameraProvider).status;
      _pausedRecording =
          cam == CameraStatus.running || cam == CameraStatus.starting;
      state = state.copyWith(backgroundPaused: true);
      await _step(() => ref.read(cameraProvider.notifier).stop());
      // Guidance keeps receiving fixes in the background while navigating.
      if (ref.read(navigationProvider).phase != NavPhase.navigating) {
        await _step(() => ref.read(locationProvider.notifier).stop());
      }
      await _step(() => _engine.keepAwake(false));
    } else if (s == AppLifecycleState.resumed && _paused) {
      _paused = false;
      if (_pausedRecording) _showPausedNotice();
      state = state.copyWith(backgroundPaused: false);
      final settings = ref.read(settingsProvider);
      await _step(() => _engine.keepAwake(settings.keepScreenOn));
      await _step(() => ref.read(cameraProvider.notifier).resume());
      await _step(() => ref.read(recorderProvider.notifier).applyConfig());
      await _configureAi();
      await _step(() => ref.read(locationProvider.notifier).start());
    }
  }

  void _showPausedNotice() {
    final id = ++_noticeSeq;
    state = state.copyWith(pausedNotice: () => id);
    _noticeTimer?.cancel();
    _noticeTimer = Timer(pausedNoticeDuration, () {
      if (ref.mounted && state.pausedNotice == id) {
        state = state.copyWith(pausedNotice: () => null);
      }
    });
  }
}

final driveSessionProvider =
    NotifierProvider<DriveSessionController, DriveSessionState>(
      DriveSessionController.new,
    );
