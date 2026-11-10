import 'dart:async';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/tracked_object.dart';
import '../../domain/services/clock.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../../platform/native_bridge/native_engine.dart';
import '../camera/camera_controller.dart';
import '../settings/settings_controller.dart';
import '../tracking/tracker_controller.dart';
import 'parking_proximity.dart';

export 'parking_proximity.dart';

class ParkingState {
  const ParkingState({
    this.active = false,
    this.beepsEnabled = true,
    this.assessment = ParkingAssessment.empty,
  });
  final bool active;
  final bool beepsEnabled;
  final ParkingAssessment assessment;

  ParkingZone get zone => assessment.zone;
  ParkingObject? get nearest => assessment.nearest;
  int get toneLevel => assessment.toneLevel;

  ParkingState copyWith({
    bool? active,
    bool? beepsEnabled,
    ParkingAssessment? assessment,
  }) => ParkingState(
    active: active ?? this.active,
    beepsEnabled: beepsEnabled ?? this.beepsEnabled,
    assessment: assessment ?? this.assessment,
  );
}

/// Parking assist: close-range zones per side + beeps. Drives
/// `audio.proximity` (level = zone: 3 continuous / 2 fast / 1 slow / 0 off)
/// only while active and beeps are on; level 0 on deactivate or mute.
class ParkingController extends Notifier<ParkingState> {
  final ParkingProximity model = ParkingProximity();
  int _sentLevel = 0;
  late NativeEngine _engine;

  @override
  ParkingState build() {
    _engine = ref.read(nativeEngineProvider);
    ref.listen(tracksProvider, (_, tracks) => evaluate(tracks));
    ref.listen(settingsProvider.select((s) => s.parkingBeeps), (_, v) {
      state = state.copyWith(beepsEnabled: v);
      _sendTone(v && state.active ? state.toneLevel : 0);
    });
    ref.listen(settingsProvider.select((s) => s.beepVolume), (_, _) {
      if (_sentLevel != 0) _sendTone(_sentLevel, force: true);
    });
    ref.onDispose(() {
      if (_sentLevel != 0) unawaited(_silence());
    });
    return ParkingState(beepsEnabled: ref.read(settingsProvider).parkingBeeps);
  }

  Future<void> _silence() async {
    try {
      await _engine.proximityTone(0, 0);
    } catch (_) {}
  }

  void setActive(bool v) {
    if (v == state.active) return;
    model.reset();
    state = state.copyWith(active: v, assessment: ParkingAssessment.empty);
    if (!v) _sendTone(0, force: true);
  }

  /// Feeds tracks (called on each tracker update; public for tests).
  void evaluate(List<TrackedObject> tracks, {double? tsS}) {
    if (!state.active) return;
    final t = tsS ?? ref.read(clockProvider)().millisecondsSinceEpoch / 1000;
    final cam = ref.read(cameraProvider);
    final s = ref.read(settingsProvider);
    final a = model.evaluate(
      tracks,
      frameSize: cam.previewSize.isEmpty
          ? const Size(1280, 720)
          : cam.previewSize,
      hfovDeg: cam.hfovDeg > 0 ? cam.hfovDeg : s.cameraFov,
      tsS: t,
    );
    state = state.copyWith(assessment: a);
    _sendTone(state.beepsEnabled ? a.toneLevel : 0);
  }

  void _sendTone(int level, {bool force = false}) {
    if (level == _sentLevel && !force) return;
    _sentLevel = level;
    final vol = ref.read(settingsProvider).beepVolume;
    unawaited(() async {
      try {
        await _engine.proximityTone(level, level == 0 ? 0 : vol);
      } catch (_) {}
    }());
  }
}

final parkingProvider = NotifierProvider<ParkingController, ParkingState>(
  ParkingController.new,
);
