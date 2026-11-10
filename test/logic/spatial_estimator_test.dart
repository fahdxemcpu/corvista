import 'dart:math' as math;

import 'package:corvista/domain/models/object_class.dart';
import 'package:corvista/domain/models/tracked_object.dart';
import 'package:corvista/features/detection/spatial_estimator.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const e = SpatialEstimator();
  const size = Size(1280, 720);

  test('focal length from HFOV', () {
    expect(SpatialEstimator.focalPx(1280, 90), closeTo(640, 1e-6));
    expect(SpatialEstimator.focalPx(1280, 68), closeTo(948.9, 0.5));
  });

  test('pinhole range for a car', () {
    final f = SpatialEstimator.focalPx(1280, 68);
    final hPx = 150.0;
    final r = e.estimate(
      cls: ObjectClass.car,
      box: Rect.fromCenter(
        center: const Offset(0.5, 0.5),
        width: 0.2,
        height: hPx / 720,
      ),
      frameSize: size,
      hfovDeg: 68,
    );
    expect(r.rangeM, closeTo(f * 1.5 / hPx, 1e-6));
    expect(r.zone, ProximityZone.close);
    expect(r.bearingDeg, closeTo(0, 1e-9));
  });

  test('bearing to the right edge equals half the HFOV', () {
    final r = e.estimate(
      cls: ObjectClass.person,
      box: Rect.fromCenter(
        center: const Offset(1.0, 0.5),
        width: 0.0,
        height: 0.3,
      ),
      frameSize: size,
      hfovDeg: 68,
    );
    expect(r.bearingDeg, closeTo(34, 1e-6));
    final l = e.estimate(
      cls: ObjectClass.person,
      box: Rect.fromCenter(
        center: const Offset(0.25, 0.5),
        width: 0.05,
        height: 0.3,
      ),
      frameSize: size,
      hfovDeg: 68,
    );
    expect(
      l.bearingDeg,
      closeTo(
        -math.atan(0.25 * 1280 / SpatialEstimator.focalPx(1280, 68)) *
            180 /
            math.pi,
        1e-6,
      ),
    );
  });

  test('zone thresholds', () {
    expect(e.zoneFor(3.9), ProximityZone.veryClose);
    expect(e.zoneFor(4), ProximityZone.close);
    expect(e.zoneFor(9.9), ProximityZone.close);
    expect(e.zoneFor(24), ProximityZone.medium);
    expect(e.zoneFor(25), ProximityZone.far);
    expect(e.zoneFor(null), ProximityZone.unknown);
  });

  test('truncated boxes have no range', () {
    final top = e.estimate(
      cls: ObjectClass.trafficLight,
      box: const Rect.fromLTWH(0.4, 0.0, 0.05, 0.1),
      frameSize: size,
      hfovDeg: 68,
    );
    expect(top.rangeM, isNull);
    expect(top.truncated, isTrue);
    expect(top.zone, ProximityZone.unknown);

    final bigBottom = e.estimate(
      cls: ObjectClass.car,
      box: const Rect.fromLTWH(0.2, 0.4, 0.6, 0.6),
      frameSize: size,
      hfovDeg: 68,
    );
    expect(bigBottom.rangeM, isNull);
    expect(bigBottom.zone, ProximityZone.veryClose);
  });

  test('tiny boxes are far with no range', () {
    final r = e.estimate(
      cls: ObjectClass.car,
      box: const Rect.fromLTWH(0.5, 0.5, 0.002, 0.003),
      frameSize: size,
      hfovDeg: 68,
    );
    expect(r.rangeM, isNull);
    expect(r.zone, ProximityZone.far);
  });
}
