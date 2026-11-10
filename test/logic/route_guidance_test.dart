import 'dart:math' as math;
import 'dart:typed_data';

import 'package:corvista/features/navigation/navigation_models.dart';
import 'package:corvista/features/navigation/route_guidance.dart';
import 'package:flutter_test/flutter_test.dart';

/// L-shaped route: 1 km north from (lat0, lon0), then 1 km east.
void main() {
  const lat0 = 45.0, lon0 = 7.0;
  const mPerDegLat = 111195.08; // R=6371008.8
  final mPerDegLon = mPerDegLat * math.cos(lat0 * math.pi / 180);
  double north(double m) => lat0 + m / mPerDegLat;
  double east(double m) => lon0 + m / mPerDegLon;

  final corner = (north(1000), lon0);
  final end = (north(1000), east(1000));
  final route = RouteInfo(
    id: 'r1',
    name: 'L',
    distanceM: 2000,
    expectedTravelTimeS: 200,
    advisories: const [],
    polyline: Float64List.fromList([
      lat0, lon0, //
      north(500), lon0,
      corner.$1, corner.$2,
      corner.$1, east(500),
      end.$1, end.$2,
    ]),
    steps: [
      const RouteStep(
        instructions: 'Head north',
        distanceM: 1000,
        lat: lat0,
        lon: lon0,
      ),
      RouteStep(
        instructions: 'Turn right',
        distanceM: 1000,
        lat: corner.$1,
        lon: corner.$2,
      ),
      RouteStep(instructions: 'Arrive', distanceM: 0, lat: end.$1, lon: end.$2),
    ],
  );
  final now = DateTime(2026, 11, 7, 12);

  test('total length and step positions', () {
    final g = RouteGuidance(route);
    expect(g.totalM, closeTo(2000, 2));
    expect(g.stepAlong[0], closeTo(0, 1));
    expect(g.stepAlong[1], closeTo(1000, 1));
    expect(g.stepAlong[2], closeTo(2000, 2));
  });

  test('progress on first leg with lateral offset', () {
    final g = RouteGuidance(route);
    final r = g.update(north(300), east(10), now); // 10 m east of the line
    expect(r.stepIndex, 1);
    expect(r.nextStep?.instructions, 'Turn right');
    expect(r.distanceToNextM, closeTo(700, 2));
    expect(r.remainingM, closeTo(1700, 3));
    expect(r.remaining.inSeconds, closeTo(170, 1));
    expect(r.eta, now.add(r.remaining));
    expect(r.offRoute, isFalse);
    expect(r.arrived, isFalse);
  });

  test('second leg after the corner', () {
    final g = RouteGuidance(route);
    g.update(north(900), lon0, now);
    final r = g.update(north(1000), east(400), now);
    expect(r.stepIndex, 2);
    expect(r.distanceToNextM, closeTo(600, 3));
    expect(r.remainingM, closeTo(600, 3));
  });

  test('off-route only after 3 consecutive fixes > 60 m', () {
    final g = RouteGuidance(route);
    g.update(north(200), lon0, now);
    expect(g.update(north(250), east(100), now).offRoute, isFalse);
    expect(g.update(north(260), east(100), now).offRoute, isFalse);
    expect(g.update(north(270), east(100), now).offRoute, isTrue);
    // Back on route resets.
    expect(g.update(north(300), east(5), now).offRoute, isFalse);
  });

  test('off-route fixes do not advance progress', () {
    final g = RouteGuidance(route);
    g.update(north(200), lon0, now);
    g.update(north(900), east(300), now); // far off to the east
    expect(g.progressM, closeTo(200, 2));
  });

  test('arrival within 30 m of destination', () {
    final g = RouteGuidance(route);
    g.update(north(1000), east(900), now);
    expect(g.update(north(1000), east(960), now).arrived, isFalse);
    expect(g.update(north(1000), east(980), now).arrived, isTrue);
  });

  test('rejects degenerate polylines', () {
    expect(
      () => RouteGuidance(
        RouteInfo(
          id: 'x',
          name: 'x',
          distanceM: 0,
          expectedTravelTimeS: 0,
          advisories: const [],
          polyline: Float64List.fromList([1, 2]),
          steps: const [],
        ),
      ),
      throwsArgumentError,
    );
  });
}
