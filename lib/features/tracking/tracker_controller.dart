import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/database.dart';
import '../../domain/models/detection.dart';
import '../../domain/models/tracked_object.dart';
import '../../domain/services/clock.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../camera/camera_controller.dart';
import '../settings/settings_controller.dart';
import 'object_tracker.dart';

export 'object_tracker.dart';

/// Tracked objects for the latest frame (confirmed + lost tracks; UI should
/// draw `isConfirmed` prominently and fade `lost`).
class TrackerController extends Notifier<List<TrackedObject>> {
  late ObjectTracker _tracker;
  StreamSubscription<DetectionFrame>? _sub;
  Timer? _expiry;
  double _lastFrameWallMs = 0;
  int _framesSinceTrim = 0;
  String _lastModel = '';

  ObjectTracker get tracker => _tracker;

  @override
  List<TrackedObject> build() {
    _tracker = ObjectTracker();
    _sub = ref
        .read(nativeEngineProvider)
        .detections
        .listen(onFrame, onError: (_) {});
    // Expire tracks when frames stop arriving (AI paused, camera stopped).
    _expiry = Timer.periodic(const Duration(milliseconds: 500), (_) => _tick());
    ref.onDispose(() {
      _sub?.cancel();
      _expiry?.cancel();
    });
    return const [];
  }

  /// Feeds one frame (public for tests and file-replay).
  void onFrame(DetectionFrame f) {
    final s = ref.read(settingsProvider);
    _lastFrameWallMs = ref
        .read(clockProvider)()
        .millisecondsSinceEpoch
        .toDouble();
    _lastModel = f.model;
    // Prefer the FOV measured from the active camera format; fall back to the
    // configured assumption (e.g. test footage of unknown optics).
    final measured = ref.read(cameraProvider).hfovDeg;
    final tracks = _tracker.update(
      f,
      hfovDeg: measured > 0 ? measured : s.cameraFov,
    );
    state = tracks;
    if (s.saveDetectionLog) unawaited(_log(f, tracks));
  }

  void _tick() {
    if (state.isEmpty) return;
    final now = ref.read(clockProvider)().millisecondsSinceEpoch.toDouble();
    if (now - _lastFrameWallMs < 700) return;
    state = _tracker.expire(now);
  }

  void reset() {
    _tracker.reset();
    state = const [];
  }

  Future<void> _log(DetectionFrame f, List<TrackedObject> tracks) async {
    try {
      final db = ref.read(databaseProvider);
      final rows = [
        for (final t in tracks)
          if (t.isConfirmed && t.missedFrames == 0)
            DetectionsCompanion.insert(
              ts: f.frameTs,
              cls: t.cls.index,
              conf: t.confidence,
              x: t.box.left,
              y: t.box.top,
              w: t.box.width,
              h: t.box.height,
              trackId: Value(t.id),
              rangeM: Value(t.approxRangeM),
              bearing: Value(t.bearingDeg),
              modelId: Value(_lastModel),
            ),
      ];
      await db.logDetections(rows);
      if (++_framesSinceTrim >= 100) {
        _framesSinceTrim = 0;
        await db.trimDetectionLog();
      }
    } catch (_) {
      // Diagnostics only; never disturb tracking.
    }
  }
}

final tracksProvider = NotifierProvider<TrackerController, List<TrackedObject>>(
  TrackerController.new,
);
