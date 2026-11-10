import 'dart:math' as math;
import 'dart:typed_data';

import 'package:corvista/features/navigation/maneuver.dart';
import 'package:corvista/features/navigation/navigation_models.dart';
import 'package:corvista/features/navigation/route_guidance.dart';
import 'package:flutter_test/flutter_test.dart';

const lat0 = 33.57, lon0 = -7.59;
const mPerDegLat = 111195.08;
final mPerDegLon = mPerDegLat * math.cos(lat0 * math.pi / 180);

/// (east, north) metres → (lat, lon).
(double, double) ll(double e, double n) =>
    (lat0 + n / mPerDegLat, lon0 + e / mPerDegLon);

/// Polyline heading north for 200 m, then [angle] degrees (clockwise) for
/// 200 m. Steps: corner maneuver with [text], arrival at the end.
RouteInfo turnRoute(double angle, {String text = 'Turn'}) {
  final r = angle * math.pi / 180;
  final pts = <(double, double)>[
    (0, 0),
    (0, 100),
    (0, 200),
    (100 * math.sin(r), 200 + 100 * math.cos(r)),
    (200 * math.sin(r), 200 + 200 * math.cos(r)),
  ];
  final flat = <double>[];
  for (final (e, n) in pts) {
    final (la, lo) = ll(e, n);
    flat
      ..add(la)
      ..add(lo);
  }
  final (cLat, cLon) = ll(0, 200);
  final (eLat, eLon) = ll(pts.last.$1, pts.last.$2);
  return RouteInfo(
    id: 'r',
    name: 'test',
    distanceM: 400,
    expectedTravelTimeS: 60,
    advisories: const [],
    polyline: Float64List.fromList(flat),
    steps: [
      RouteStep(instructions: text, distanceM: 200, lat: cLat, lon: cLon),
      RouteStep(
        instructions: 'Arrive at the destination',
        distanceM: 200,
        lat: eLat,
        lon: eLon,
      ),
    ],
  );
}

ManeuverType typeFor(double angle, {String text = 'Turn'}) =>
    RouteGuidance(turnRoute(angle, text: text)).maneuvers.first.type;

void main() {
  group('geometry', () {
    test('turn angle normalisation', () {
      expect(ManeuverClassifier.turnAngle(350, 10), closeTo(20, 1e-9));
      expect(ManeuverClassifier.turnAngle(10, 350), closeTo(-20, 1e-9));
      expect(ManeuverClassifier.turnAngle(0, 180), closeTo(180, 1e-9));
    });

    test('straight / slight / normal / sharp / U-turn both sides', () {
      expect(typeFor(3), ManeuverType.straight);
      expect(typeFor(-25), ManeuverType.slightLeft);
      expect(typeFor(25), ManeuverType.slightRight);
      expect(typeFor(-90), ManeuverType.left);
      expect(typeFor(90), ManeuverType.right);
      expect(typeFor(-140), ManeuverType.sharpLeft);
      expect(typeFor(140), ManeuverType.sharpRight);
      expect(typeFor(-178), ManeuverType.uTurnLeft);
      expect(typeFor(178), ManeuverType.uTurnRight);
    });

    test('measured angle matches the polyline', () {
      final m = RouteGuidance(turnRoute(75)).maneuvers.first;
      expect(m.angle, closeTo(75, 1.5));
    });

    test('last step at the route end is the arrival', () {
      final g = RouteGuidance(turnRoute(90));
      expect(g.maneuvers.last.type, ManeuverType.arrive);
    });

    test('geometry wins over contradicting text', () {
      // MapKit says "left" but the road clearly goes right.
      expect(typeFor(90, text: 'Turn left'), ManeuverType.right);
    });
  });

  group('text tie-breakers', () {
    test('threshold band: "slight" vs "turn"', () {
      expect(
        typeFor(43, text: 'Slight right onto A'),
        ManeuverType.slightRight,
      );
      expect(typeFor(43, text: 'Turn right onto A'), ManeuverType.right);
      expect(typeFor(-118, text: 'Sharp left'), ManeuverType.sharpLeft);
    });

    test('"bear" (fork) up to ~55° stays slight; geometry gives the side', () {
      expect(
        typeFor(-45.4, text: 'Bear left onto Youssef Ibn Tachafine Boulevard'),
        ManeuverType.slightLeft,
      );
      expect(typeFor(-70, text: 'Bear left'), ManeuverType.left);
    });

    test('keep / merge use the geometry side', () {
      expect(
        typeFor(-15, text: 'Keep left at the fork'),
        ManeuverType.keepLeft,
      );
      expect(typeFor(20, text: 'Merge onto A7'), ManeuverType.mergeRight);
      expect(typeFor(-20, text: 'Serrez à gauche'), ManeuverType.keepLeft);
    });

    test('roundabout with exit number from localized text', () {
      final m = RouteGuidance(
        turnRoute(80, text: 'At the roundabout, take the 2nd exit'),
      ).maneuvers.first;
      expect(m.type, ManeuverType.roundabout);
      expect(m.exit, 2);
      expect(m.exitAngle, closeTo(80, 3));
      expect(
        ManeuverClassifier.exitNumber('Au rond-point, prenez la 3e sortie'),
        3,
      );
      expect(
        ManeuverClassifier.exitNumber('En la glorieta, toma la segunda salida'),
        2,
      );
      expect(ManeuverClassifier.exitNumber('في الدوار، اسلك المخرج الأول'), 1);
      expect(
        ManeuverClassifier.exitNumber('At the roundabout, continue'),
        isNull,
      );
    });
  });

  test(
    'roundabout drawn as a real circle keeps the overall exit direction',
    () {
      // Approach north, circulate counter-clockwise around a 20 m ring and
      // leave heading west (a left exit, i.e. ~270° of circulation).
      final flat = <double>[];
      void add(double e, double n) {
        final (la, lo) = ll(e, n);
        flat
          ..add(la)
          ..add(lo);
      }

      add(0, -200);
      add(0, -100);
      add(0, -20); // ring entry (south point of a ring centred at 0,0)
      for (var a = -90.0; a <= 180.0; a += 15) {
        final r = a * math.pi / 180;
        add(20 * math.cos(r), 20 * math.sin(r));
      }
      add(-100, 0);
      add(-200, 0);
      final (inLat, inLon) = ll(0, -20);
      final (outLat, outLon) = ll(-100, 0);
      final (endLat, endLon) = ll(-200, 0);
      final route = RouteInfo(
        id: 'rb',
        name: 'rb',
        distanceM: 600,
        expectedTravelTimeS: 60,
        advisories: const [],
        polyline: Float64List.fromList(flat),
        steps: [
          RouteStep(
            instructions: 'At the roundabout, take the third exit',
            distanceM: 200,
            lat: inLat,
            lon: inLon,
          ),
          RouteStep(
            instructions: 'Continue',
            distanceM: 100,
            lat: outLat,
            lon: outLon,
          ),
          RouteStep(
            instructions: 'Arrive',
            distanceM: 100,
            lat: endLat,
            lon: endLon,
          ),
        ],
      );
      final m = RouteGuidance(route).maneuvers.first;
      expect(m.type, ManeuverType.roundabout);
      expect(m.exit, 3);
      expect(m.exitAngle, closeTo(-90, 10));
    },
  );
}
