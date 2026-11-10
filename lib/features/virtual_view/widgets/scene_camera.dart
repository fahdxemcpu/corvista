import 'dart:math' as math;

import 'package:flutter/painting.dart';

import '../../detection/placement_filter.dart';

/// Stylized "instrument cluster" chase camera for the virtual view.
///
/// A level pinhole camera raised above and behind the ego vehicle. The scene
/// is framed inside [viewport] (the screen area not covered by the drive
/// shell's HUD and controls): the horizon sits just below the viewport top and
/// the ego vehicle's rear bumper rests on the viewport bottom.
///
/// World coordinates: metres, `x` to the right, `y` up from the road, `z`
/// forward from the virtual camera.
class SceneCamera {
  SceneCamera(this.size, EdgeInsets insets)
    : viewport = Rect.fromLTRB(
        insets.left,
        insets.top,
        math.max(insets.left + 1, size.width - insets.right),
        math.max(insets.top + 1, size.height - insets.bottom),
      ) {
    final landscape = size.width > size.height;
    cx = viewport.center.dx;
    horizon = viewport.top + viewport.height * (landscape ? .05 : .09);
    final egoRearY = viewport.bottom;
    fy = math.max(1.0, egoRearY - horizon) * egoZ / camH;
    fx = fy;
  }

  /// Camera height above the road (m).
  static const camH = 6.0;

  /// Distance from the camera to the ego vehicle's rear bumper (m).
  static const egoZ = 7.6;

  /// Ego vehicle length (m); the phone camera sits at its front.
  static const egoLen = 4.6;
  static const egoFront = egoZ + egoLen;

  final Size size;
  final Rect viewport;
  late final double cx, horizon, fx, fy;

  /// Scene depth (from the virtual camera) for an object [depth] metres ahead
  /// of the ego vehicle's front.
  static double zFor(double depth) => egoFront + math.max(0.0, depth);

  Offset project(double x, double y, double z) =>
      Offset(cx + fx * x / z, horizon + fy * (camH - y) / z);

  /// Pixels per metre at scene depth [z].
  double scaleAt(double z) => fx / z;

  /// Lateral mapping shared by the road and all objects: the phone camera
  /// sees wider than the stylized view, so world positions beyond the
  /// adjacent lanes are compressed. The mapping is depth-independent, so
  /// lane lines stay straight and objects stay in the lanes drawn for them.
  /// [z] and [marginPx] are accepted for call-site compatibility.
  double fitX(double x, double z, {double marginPx = 0}) {
    const keep = 5.25, k = .5;
    final ax = x.abs();
    if (ax <= keep) return x;
    return x.sign * (keep + (ax - keep) * k);
  }

  /// [project] after [fitX].
  Offset projectFit(double x, double y, double z) => project(fitX(x, z), y, z);

  /// Nearest scene depth whose road surface is still on screen.
  double get zNear => math.max(.5, fy * camH / (size.height - horizon + 2));

  @override
  bool operator ==(Object other) =>
      other is SceneCamera && other.size == size && other.viewport == viewport;

  @override
  int get hashCode => Object.hash(size, viewport);
}

/// Illustrative road layout drawn around the ego lane (x = 0), built from
/// the same [LaneModel] that `PlacementFilter` snaps objects to, mirrored
/// for left-hand traffic. Markings are decorative (captioned as such).
class RoadLayout {
  const RoadLayout({this.leftHand = false, this.lanes = const LaneModel()});

  final bool leftHand;
  final LaneModel lanes;

  double get _s => leftHand ? -1 : 1;

  /// Scene x for kerb-side coordinate [u].
  double x(double u) => _s * u;

  double get kerbEdge => x(lanes.kerbEdge);
  double get farEdge => x(lanes.farEdge);
  double get minX => math.min(kerbEdge, farEdge);
  double get maxX => math.max(kerbEdge, farEdge);

  /// Dashed lane boundaries (same-direction lanes and between oncoming).
  List<double> get dashes {
    final w = lanes.laneWidthM;
    return [
      for (var k = 0; k < lanes.kerbLanes; k++) x(w * (.5 + k)),
      for (var k = 0; k < lanes.farSameLanes; k++) x(-w * (.5 + k)),
      for (var k = 1; k < lanes.oncomingLanes; k++) x(lanes.centreLine - w * k),
    ];
  }

  double get centreLine => x(lanes.centreLine);

  /// Sidewalk strips (x0, x1) on both sides.
  List<(double, double)> get sidewalks => [
    (kerbEdge, x(lanes.kerbEdge + lanes.sidewalkM)),
    (farEdge, x(lanes.farEdge - lanes.sidewalkM)),
  ];

  /// Projected band between lateral positions [x0] and [x1] (fitted).
  static Path band(
    SceneCamera cam,
    double x0,
    double x1, {
    double? zNear,
    double zFar = 600,
  }) {
    final zn = zNear ?? cam.zNear;
    final path = Path();
    final zs = <double>[];
    for (var z = zn; z < zFar; z *= 1.12) {
      zs.add(z);
    }
    zs.add(zFar);
    for (var i = 0; i < zs.length; i++) {
      final p = cam.projectFit(x0, 0, zs[i]);
      i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
    }
    for (var i = zs.length - 1; i >= 0; i--) {
      final p = cam.projectFit(x1, 0, zs[i]);
      path.lineTo(p.dx, p.dy);
    }
    return path..close();
  }

  /// Projected road surface outline.
  Path surface(SceneCamera cam, {double zFar = 600}) =>
      band(cam, minX, maxX, zFar: zFar);
}
