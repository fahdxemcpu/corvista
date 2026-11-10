import 'dart:math' as math;
import 'dart:ui';

import '../../domain/models/object_class.dart';
import '../../domain/models/tracked_object.dart';

/// Result of [SpatialEstimator.estimate]. Rough monocular estimate — see
/// docs/ESTIMATION.md. Never present [rangeM] as a measured distance.
class SpatialEstimate {
  const SpatialEstimate({
    required this.bearingDeg,
    required this.rangeM,
    required this.zone,
    required this.truncated,
  });

  /// Horizontal angle from the optical axis, degrees, + = right.
  final double bearingDeg;

  /// Approximate range in metres; null when the box is truncated or degenerate.
  final double? rangeM;
  final ProximityZone zone;

  /// The box touches the top or bottom frame edge, so its height is not the
  /// object's full projected height.
  final bool truncated;
}

/// Pinhole-camera range/bearing estimator using nominal object heights.
///
/// * `f_px = (W_px / 2) / tan(HFOV / 2)` (square pixels → same vertical focal).
/// * `range ≈ f_px · H_nominal / h_px`.
/// * `bearing = atan((cx − 0.5) · W_px / f_px)`.
class SpatialEstimator {
  const SpatialEstimator({
    this.veryCloseM = 4,
    this.closeM = 10,
    this.mediumM = 25,
    this.edgeMargin = 0.01,
    this.minBoxHeightPx = 4,
    this.maxRangeM = 150,
  });

  final double veryCloseM;
  final double closeM;
  final double mediumM;

  /// Normalized distance from the top/bottom edge within which a box counts
  /// as truncated.
  final double edgeMargin;

  /// Boxes smaller than this (pixels) are too noisy to range.
  final double minBoxHeightPx;

  /// Ranges beyond this are clamped to "far"/null.
  final double maxRangeM;

  /// Focal length in pixels for a frame [widthPx] wide with [hfovDeg].
  static double focalPx(double widthPx, double hfovDeg) {
    final half = (hfovDeg.clamp(10.0, 170.0)) * math.pi / 360;
    return (widthPx / 2) / math.tan(half);
  }

  ProximityZone zoneFor(double? rangeM) {
    if (rangeM == null) return ProximityZone.unknown;
    if (rangeM < veryCloseM) return ProximityZone.veryClose;
    if (rangeM < closeM) return ProximityZone.close;
    if (rangeM < mediumM) return ProximityZone.medium;
    return ProximityZone.far;
  }

  /// [box] normalized (0..1, top-left origin) in the upright frame of
  /// [frameSize] pixels. [hfovDeg] is the horizontal FOV of that upright frame.
  SpatialEstimate estimate({
    required ObjectClass cls,
    required Rect box,
    required Size frameSize,
    required double hfovDeg,
  }) {
    final w = frameSize.width > 0 ? frameSize.width : 1280.0;
    final h = frameSize.height > 0 ? frameSize.height : 720.0;
    final f = focalPx(w, hfovDeg);
    final cx = box.center.dx;
    final bearing = math.atan((cx - 0.5) * w / f) * 180 / math.pi;

    final truncated = box.top <= edgeMargin || box.bottom >= 1 - edgeMargin;
    if (truncated) {
      // Height unusable. A large box cut off by the bottom edge is almost
      // certainly very near the camera; otherwise the zone is unknown.
      final bottomCut = box.bottom >= 1 - edgeMargin;
      final zone = bottomCut && box.height >= 0.45 && !cls.isSignal
          ? ProximityZone.veryClose
          : ProximityZone.unknown;
      return SpatialEstimate(
        bearingDeg: bearing,
        rangeM: null,
        zone: zone,
        truncated: true,
      );
    }

    final hPx = box.height * h;
    if (hPx < minBoxHeightPx) {
      return SpatialEstimate(
        bearingDeg: bearing,
        rangeM: null,
        zone: ProximityZone.far,
        truncated: false,
      );
    }
    var range = f * cls.nominalHeightM / hPx;
    if (range > maxRangeM) range = maxRangeM;
    return SpatialEstimate(
      bearingDeg: bearing,
      rangeM: range,
      zone: zoneFor(range),
      truncated: false,
    );
  }
}
