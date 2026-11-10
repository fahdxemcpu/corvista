import 'dart:math' as math;
import 'dart:typed_data';

import 'maneuver.dart';

class PlaceSuggestion {
  const PlaceSuggestion({
    required this.id,
    required this.title,
    required this.subtitle,
  });
  final String id, title, subtitle;

  static PlaceSuggestion fromMap(Map<Object?, Object?> m) => PlaceSuggestion(
    id: m['id'] as String? ?? '',
    title: m['title'] as String? ?? '',
    subtitle: m['subtitle'] as String? ?? '',
  );
}

class Place {
  const Place({
    required this.name,
    required this.address,
    required this.lat,
    required this.lon,
    this.category,
  });
  final String name, address;
  final double lat, lon;
  final String? category;

  static Place fromMap(Map<Object?, Object?> m) => Place(
    name: m['name'] as String? ?? '',
    address: m['address'] as String? ?? '',
    lat: (m['lat'] as num).toDouble(),
    lon: (m['lon'] as num).toDouble(),
    category: m['category'] as String?,
  );

  Map<String, Object?> toJson() => {
    'name': name,
    'address': address,
    'lat': lat,
    'lon': lon,
    'category': ?category,
  };

  /// Same place (name and within ~50 m).
  bool sameAs(Place o) =>
      name == o.name &&
      (lat - o.lat).abs() < 0.0005 &&
      (lon - o.lon).abs() < 0.0005;
}

class RouteStep {
  const RouteStep({
    required this.instructions,
    required this.distanceM,
    required this.lat,
    required this.lon,
    this.walking = false,
  });
  final String instructions;
  final double distanceM, lat, lon;

  /// MapKit walking leg (after parking).
  final bool walking;

  static RouteStep fromMap(Map<Object?, Object?> m) => RouteStep(
    instructions: m['instructions'] as String? ?? '',
    distanceM: (m['distanceM'] as num?)?.toDouble() ?? 0,
    lat: (m['lat'] as num?)?.toDouble() ?? 0,
    lon: (m['lon'] as num?)?.toDouble() ?? 0,
    walking: m['walking'] == true,
  );

  static const _park = [
    'park your car',
    'garez',
    'stationnez',
    'estacion',
    'aparca',
    'parken sie',
    'parcheggia',
    '駐車',
    'اركن',
  ];

  /// "Prepare to park your car" — the end of the driving part.
  bool get isParking {
    final t = instructions.toLowerCase();
    return _park.any(t.contains);
  }
}

class RouteInfo {
  RouteInfo({
    required this.id,
    required this.name,
    required this.distanceM,
    required this.expectedTravelTimeS,
    required this.advisories,
    required this.polyline,
    required this.steps,
  });
  final String id, name;
  final double distanceM, expectedTravelTimeS;
  final List<String> advisories;

  /// Flat (lat, lon) pairs.
  final Float64List polyline;
  final List<RouteStep> steps;

  /// Distance on foot after parking (0 when the car reaches the end).
  double get walkM => _walkM;
  double _walkM = 0;

  /// The driving part only: when MapKit appends a walk ("Prepare to park
  /// your car" + walking steps), the route ends at the parking point.
  RouteInfo drivingOnly() {
    var park = -1;
    for (var i = 0; i < steps.length; i++) {
      if (steps[i].walking) {
        park = i - 1;
        break;
      }
      if (steps[i].isParking && i < steps.length - 1) {
        park = i;
        break;
      }
    }
    if (park < 0 || polyline.length < 4) return this;
    final p = steps[park];
    // Cut the polyline at the vertex closest to the parking point.
    var best = 0, bestD = double.infinity;
    for (var i = 0; i + 1 < polyline.length; i += 2) {
      final dLat = polyline[i] - p.lat, dLon = polyline[i + 1] - p.lon;
      final d = dLat * dLat + dLon * dLon;
      if (d < bestD) {
        bestD = d;
        best = i;
      }
    }
    if (best < 2) return this;
    var drive = 0.0;
    for (var i = 0; i <= park; i++) {
      drive += steps[i].distanceM;
    }
    final frac = distanceM > 0 ? (drive / distanceM).clamp(0.05, 1.0) : 1.0;
    final out = RouteInfo(
      id: id,
      name: name,
      distanceM: drive,
      expectedTravelTimeS: expectedTravelTimeS * frac,
      advisories: advisories,
      polyline: Float64List.fromList(polyline.sublist(0, best + 2)),
      steps: steps.sublist(0, park + 1),
    );
    out._walkM = math.max(0, distanceM - drive);
    return out;
  }

  static RouteInfo fromMap(Map<Object?, Object?> m) {
    final poly = m['polyline'];
    return RouteInfo(
      id: m['id'] as String? ?? '',
      name: m['name'] as String? ?? '',
      distanceM: (m['distanceM'] as num?)?.toDouble() ?? 0,
      expectedTravelTimeS: (m['expectedTravelTimeS'] as num?)?.toDouble() ?? 0,
      advisories: [
        for (final a in (m['advisories'] as List? ?? const [])) '$a',
      ],
      polyline: poly is Float64List
          ? poly
          : Float64List.fromList([
              for (final v in (poly as List? ?? const []))
                (v as num).toDouble(),
            ]),
      steps: [
        for (final s in (m['steps'] as List? ?? const []))
          RouteStep.fromMap(s as Map<Object?, Object?>),
      ],
    );
  }
}

class Guidance {
  const Guidance({
    required this.stepIndex,
    required this.nextStep,
    required this.distanceToNextM,
    required this.remainingM,
    required this.remaining,
    required this.eta,
    required this.offRoute,
    required this.arrived,
    this.maneuver,
    this.thenStep,
    this.thenManeuver,
    this.thenDistanceM,
    this.progressM = 0,
    this.totalM = 0,
    this.snappedLat,
    this.snappedLon,
    this.segmentIndex = 0,
    this.routeBearing,
    this.speedMps = 0,
    this.degraded = false,
    this.crossTrackM = 0,
  });
  final int stepIndex;
  final RouteStep? nextStep;
  final double distanceToNextM;
  final double remainingM;
  final Duration remaining;
  final DateTime eta;
  final bool offRoute;
  final bool arrived;

  /// Geometry-derived maneuver for [nextStep].
  final Maneuver? maneuver;

  /// The step after [nextStep] and its distance after [nextStep]'s maneuver.
  final RouteStep? thenStep;
  final Maneuver? thenManeuver;
  final double? thenDistanceM;

  /// Distance travelled along / total length of the route polyline (m).
  final double progressM;
  final double totalM;

  /// Fix projected onto the route (null while off route) and the polyline
  /// segment it lies on.
  final double? snappedLat, snappedLon;
  final int segmentIndex;

  /// Route direction at the current position (deg), for the puck / camera.
  final double? routeBearing;

  /// Filtered speed along the route (m/s).
  final double speedMps;

  /// GPS accuracy too poor to match: position is dead-reckoned.
  final bool degraded;

  /// Distance from the fix to the route (m).
  final double crossTrackM;
}
