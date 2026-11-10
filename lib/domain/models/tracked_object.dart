import 'dart:ui';

import 'object_class.dart';

enum TrackState { tentative, confirmed, lost }

/// Coarse, qualitative range bucket. Never presented as a measured distance.
enum ProximityZone { veryClose, close, medium, far, unknown }

/// A detection associated across frames by the tracker (lib/features/tracking).
class TrackedObject {
  const TrackedObject({
    required this.id,
    required this.cls,
    required this.box,
    required this.confidence,
    required this.state,
    required this.ageFrames,
    required this.missedFrames,
    required this.lastSeenTs,
    required this.velocity,
    required this.light,
    required this.bearingDeg,
    required this.approxRangeM,
    required this.zone,
  });

  final int id;
  final ObjectClass cls;

  /// Smoothed normalized box (top-left origin, upright frame).
  final Rect box;
  final double confidence;
  final TrackState state;
  final int ageFrames;
  final int missedFrames;
  final double lastSeenTs;

  /// Box-centre velocity in normalized units per second (dx, dy) and
  /// relative height growth per second in `scaleRate` (positive = approaching).
  final ({double dx, double dy, double scaleRate}) velocity;

  /// Temporally filtered lamp state (traffic lights only).
  final LightState light;

  /// Horizontal bearing relative to camera axis, degrees (+ right).
  final double bearingDeg;

  /// Very approximate range in metres from the pinhole/nominal-height model;
  /// null when not estimable. Only used for map placement & zones.
  final double? approxRangeM;
  final ProximityZone zone;

  bool get isConfirmed => state == TrackState.confirmed;
}
