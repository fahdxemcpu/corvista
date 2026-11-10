import 'dart:math' as math;
import 'dart:ui';

import '../../domain/models/object_class.dart';
import 'spatial_estimator.dart';

/// How a [GroundFix] distance was obtained.
enum GroundSource {
  /// Ground-contact and height estimates agreed and were blended.
  fused,

  /// Only the ground-contact (box bottom) estimate was usable.
  ground,

  /// Only the nominal-height estimate was usable (signals, feet hidden).
  height,

  /// The box is cut by the bottom frame edge: an upper bound (very near).
  bound,
}

/// Approximate position of one detection on the road plane. Rough monocular
/// estimate (docs/ESTIMATION.md) — never shown as a number.
class GroundFix {
  const GroundFix({
    required this.distanceM,
    required this.lateralM,
    required this.tanBearing,
    required this.source,
    this.groundM,
    this.heightM,
  });

  /// Forward distance from the camera along the road (m).
  final double distanceM;

  /// Lateral offset from the camera axis at [distanceM] (m, + right).
  final double lateralM;

  /// `(x − cx) / f` of the box bottom-centre: lateral = distance × this.
  final double tanBearing;
  final GroundSource source;

  /// Raw ground-contact / nominal-height distances (diagnostics).
  final double? groundM, heightM;
}

/// Pinhole ground-plane projector.
///
/// For a box whose bottom-centre (the road contact point) is at pixel
/// `(x_b, y_b)` in a `W × H` upright frame with focal length
/// `f = (W/2) / tan(HFOV/2)` and horizon row `y_h`:
///
/// * ground distance  `d_g = h_cam · f / (y_b − y_h)`
/// * height distance  `d_h = f · H_nominal / h_px`
/// * lateral offset   `x = (x_b − W/2) · d / f`
///
/// `d_g` and `d_h` are blended (geometric, weighted toward the ground
/// estimate) when they agree within [agreeRatio]; otherwise the smaller is
/// kept (occlusion and a wrong horizon both inflate a distance). The horizon
/// starts at [defaultHorizon] (camera axis level with the road) and is
/// self-calibrated from fully visible vehicles: for a vehicle of nominal
/// height `H` standing on the road, `y_h = y_b − h_px · h_cam / H`. The robust
/// median of recent samples absorbs the phone's mount pitch.
class GroundProjector {
  GroundProjector({
    this.cameraHeightM = 1.3,
    this.defaultHorizon = 0.5,
    this.autoHorizon = true,
    this.edgeMargin = 0.01,
    this.minRangeM = 1.5,
    this.maxRangeM = 90,
    this.agreeRatio = 1.8,
    this.groundWeight = 0.6,
    this.horizonWindow = 120,
    this.minHorizonSamples = 8,
  });

  /// Assumed camera mount height above the road (m). ~1.3 m for a phone on
  /// a car windscreen.
  final double cameraHeightM;

  /// Horizon row (normalized, 0 = top) used until enough samples exist.
  final double defaultHorizon;
  final bool autoHorizon;
  final double edgeMargin;
  final double minRangeM;
  final double maxRangeM;
  final double agreeRatio;
  final double groundWeight;
  final int horizonWindow;
  final int minHorizonSamples;

  final List<double> _samples = [];
  int _next = 0;
  double? _horizon;

  /// Current horizon row estimate (normalized).
  double get horizon => _horizon ?? defaultHorizon;

  /// Whether the horizon has been self-calibrated (or calibration is off).
  bool get calibrated => !autoHorizon || _horizon != null;
  int get horizonSamples => _samples.length;

  void reset() {
    _samples.clear();
    _next = 0;
    _horizon = null;
  }

  bool _bottomCut(Rect b) => b.bottom >= 1 - edgeMargin;
  bool _topCut(Rect b) => b.top <= edgeMargin;

  /// Feeds a confirmed detection; full-height cars/buses refine the horizon.
  void observe(ObjectClass cls, Rect box) {
    if (!autoHorizon) return;
    if (cls != ObjectClass.car && cls != ObjectClass.bus) return;
    if (_bottomCut(box) || _topCut(box)) return;
    if (box.height < .025 ||
        box.left <= edgeMargin ||
        box.right >= 1 - edgeMargin) {
      return;
    }
    final y = box.bottom - box.height * cameraHeightM / cls.nominalHeightM;
    if (y < .15 || y > .9) return;
    if (_samples.length < horizonWindow) {
      _samples.add(y);
    } else {
      _samples[_next] = y;
      _next = (_next + 1) % horizonWindow;
    }
    if (_samples.length >= minHorizonSamples) {
      final s = [..._samples]..sort();
      _horizon = s[s.length ~/ 2].clamp(.15, .9);
    }
  }

  /// Projects a normalized [box] (top-left origin, upright frame). Returns
  /// null when no usable distance exists (degenerate, above the horizon with
  /// no usable height, beyond [maxRangeM]).
  GroundFix? project({
    required ObjectClass cls,
    required Rect box,
    required Size frameSize,
    required double hfovDeg,
  }) {
    final w = frameSize.width > 0 ? frameSize.width : 1280.0;
    final h = frameSize.height > 0 ? frameSize.height : 720.0;
    final f = SpatialEstimator.focalPx(w, hfovDeg);
    final tan = (box.center.dx - .5) * w / f;
    final bottomCut = _bottomCut(box), topCut = _topCut(box);

    double? dg;
    // Until the horizon is calibrated the ground estimate is only a fallback
    // (an assumed horizon above the true one makes everything look near).
    if (!cls.isSignal && !bottomCut) {
      final dy = (box.bottom - horizon) * h;
      if (dy >= 2) dg = cameraHeightM * f / dy;
    }
    double? dh;
    final hPx = box.height * h;
    if (!bottomCut && !topCut && hPx >= 4) dh = f * cls.nominalHeightM / hPx;

    double d;
    GroundSource src;
    if (bottomCut) {
      // Contact point is below the frame: nearer than the frame-bottom ray.
      if (cls.isSignal || box.height < .2) return null;
      final bound = cameraHeightM * f / math.max(2.0, (1 - horizon) * h);
      d = bound * .85;
      src = GroundSource.bound;
    } else if (dg != null && dh != null && !calibrated) {
      d = dh;
      src = GroundSource.height;
    } else if (dg != null && dh != null) {
      final r = dg / dh;
      if (r <= agreeRatio && r >= 1 / agreeRatio) {
        d = math.exp(
          groundWeight * math.log(dg) + (1 - groundWeight) * math.log(dh),
        );
        src = GroundSource.fused;
      } else {
        // Occlusion inflates both, so keep the nearer — but a ground value
        // far below the height value means a wrong horizon, not proximity.
        d = math.max(math.min(dg, dh), dh / 2);
        src = dg < dh ? GroundSource.ground : GroundSource.height;
      }
    } else if (dg != null) {
      d = dg;
      src = GroundSource.ground;
    } else if (dh != null) {
      d = dh;
      src = GroundSource.height;
    } else {
      return null;
    }
    if (d > maxRangeM) return null;
    d = math.max(minRangeM, d);
    return GroundFix(
      distanceM: d,
      lateralM: d * tan,
      tanBearing: tan,
      source: src,
      groundM: dg,
      heightM: dh,
    );
  }
}
