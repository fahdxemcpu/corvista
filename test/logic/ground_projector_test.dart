import 'dart:math' as math;

import 'package:corvista/domain/models/object_class.dart';
import 'package:corvista/features/detection/ground_projector.dart';
import 'package:corvista/features/detection/spatial_estimator.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const size = Size(1280, 720);
  final f = SpatialEstimator.focalPx(1280, 68);

  /// Box of a [heightM]-tall object standing on the road [d] m ahead and
  /// [x] m right, seen from [camH] m with the horizon at row [hz].
  Rect boxAt(double d, double x, double heightM, {double hz = .5}) {
    const camH = 1.3;
    final yb = hz * 720 + camH * f / d;
    final hPx = f * heightM / d;
    final cx = 640 + x * f / d;
    final wPx = f * 1.8 / d;
    return Rect.fromLTRB(
      (cx - wPx / 2) / 1280,
      (yb - hPx) / 720,
      (cx + wPx / 2) / 1280,
      yb / 720,
    );
  }

  test('ground contact gives distance and lateral offset', () {
    final p = GroundProjector(autoHorizon: false);
    final fix = p.project(
      cls: ObjectClass.car,
      box: boxAt(20, -3.5, 1.5),
      frameSize: size,
      hfovDeg: 68,
    )!;
    expect(fix.groundM, closeTo(20, .2));
    expect(fix.heightM, closeTo(20, .2));
    expect(fix.source, GroundSource.fused);
    expect(fix.distanceM, closeTo(20, .3));
    expect(fix.lateralM, closeTo(-3.5, .1));
  });

  test('height-only for signals; null beyond max range', () {
    final p = GroundProjector(autoHorizon: false);
    final light = p.project(
      cls: ObjectClass.trafficLight,
      box: Rect.fromLTWH(.6, .2, .02, .9 * f / 30 / 720),
      frameSize: size,
      hfovDeg: 68,
    )!;
    expect(light.source, GroundSource.height);
    expect(light.distanceM, closeTo(30, .5));
    expect(
      p.project(
        cls: ObjectClass.car,
        box: boxAt(200, 0, 1.5),
        frameSize: size,
        hfovDeg: 68,
      ),
      isNull,
    );
  });

  test('box cut by the bottom edge is very near (upper bound)', () {
    final p = GroundProjector(autoHorizon: false);
    final fix = p.project(
      cls: ObjectClass.car,
      box: const Rect.fromLTRB(.55, .45, 1, 1),
      frameSize: size,
      hfovDeg: 68,
    )!;
    expect(fix.source, GroundSource.bound);
    expect(fix.distanceM, lessThan(4));
  });

  test('occluded bottom: estimates disagree, nearer kept but bounded', () {
    final p = GroundProjector(autoHorizon: false);
    // Bottom hidden: box bottom raised 40 px → ground says farther.
    final b = boxAt(12, 0, 1.5);
    final occluded = Rect.fromLTRB(b.left, b.top, b.right, b.bottom - 40 / 720);
    final fix = p.project(
      cls: ObjectClass.car,
      box: occluded,
      frameSize: size,
      hfovDeg: 68,
    )!;
    expect(fix.distanceM, lessThan(fix.groundM!));
    expect(fix.distanceM, greaterThanOrEqualTo(fix.heightM! / 2));
  });

  test('horizon self-calibrates from vehicles (pitched camera)', () {
    final p = GroundProjector();
    expect(p.calibrated, isFalse);
    // Uncalibrated: ground estimate ignored when height is usable.
    final first = p.project(
      cls: ObjectClass.car,
      box: boxAt(25, 0, 1.5, hz: .8),
      frameSize: size,
      hfovDeg: 68,
    )!;
    expect(first.source, GroundSource.height);
    final rnd = math.Random(1);
    for (var i = 0; i < 30; i++) {
      p.observe(
        ObjectClass.car,
        boxAt(8 + rnd.nextDouble() * 30, rnd.nextDouble() * 6 - 3, 1.5, hz: .8),
      );
    }
    expect(p.calibrated, isTrue);
    expect(p.horizon, closeTo(.8, .01));
    final fix = p.project(
      cls: ObjectClass.person,
      box: boxAt(15, 2, 1.7, hz: .8),
      frameSize: size,
      hfovDeg: 68,
    )!;
    expect(fix.distanceM, closeTo(15, .5));
    expect(fix.lateralM, closeTo(2, .15));
  });
}
