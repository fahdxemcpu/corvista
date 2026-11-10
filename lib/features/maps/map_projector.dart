import 'dart:math' as math;

import '../../domain/models/location_fix.dart';
import '../../domain/models/tracked_object.dart';

/// An approximate map position for a detected object.
class ProjectedObject {
  const ProjectedObject({
    required this.id,
    required this.cls,
    required this.lat,
    required this.lon,
  });
  final int id;
  final int cls;
  final double lat;
  final double lon;

  /// Payload for `MapViewController.setObjects`.
  Map<String, Object?> toMap() => {
    'id': id,
    'cls': cls,
    'lat': lat,
    'lon': lon,
    'approx': true,
  };
}

/// Places camera-relative (bearing, range) observations on the map using a
/// local East-North-Up tangent plane at the vehicle position.
class MapProjector {
  const MapProjector({this.maxHorizontalAccuracyM = 30, this.maxRangeM = 80});

  static const earthRadiusM = 6378137.0;

  /// Fixes worse than this are rejected (null result).
  final double maxHorizontalAccuracyM;

  /// Objects estimated beyond this range are not projected.
  final double maxRangeM;

  /// Returns null when the fix is too inaccurate (hAcc > 30 m or invalid) or
  /// no travel direction is known.
  ({double lat, double lon})? project(
    LocationFix fix, {
    required double bearingDeg,
    required double rangeM,
  }) {
    if (fix.hAcc < 0 || fix.hAcc > maxHorizontalAccuracyM) return null;
    final dir = fix.bestDirection;
    if (dir == null) return null;
    if (!rangeM.isFinite || rangeM <= 0) return null;
    return offset(
      fix.lat,
      fix.lon,
      azimuthDeg: dir + bearingDeg,
      distanceM: rangeM,
    );
  }

  /// Moves [distanceM] from (lat, lon) along [azimuthDeg] (0 = north,
  /// clockwise) using the local ENU approximation (accurate for < few km).
  static ({double lat, double lon}) offset(
    double lat,
    double lon, {
    required double azimuthDeg,
    required double distanceM,
  }) {
    final az = azimuthDeg * math.pi / 180;
    final east = distanceM * math.sin(az);
    final north = distanceM * math.cos(az);
    final latRad = lat * math.pi / 180;
    final dLat = north / earthRadiusM;
    final dLon = east / (earthRadiusM * math.cos(latRad));
    return (lat: lat + dLat * 180 / math.pi, lon: lon + dLon * 180 / math.pi);
  }

  /// Projects all confirmed tracks with a range estimate.
  List<ProjectedObject> projectAll(
    LocationFix? fix,
    List<TrackedObject> tracks,
  ) {
    if (fix == null) return const [];
    final out = <ProjectedObject>[];
    for (final t in tracks) {
      final r = t.approxRangeM;
      if (!t.isConfirmed || r == null || r > maxRangeM) continue;
      final p = project(fix, bearingDeg: t.bearingDeg, rangeM: r);
      if (p == null) return const []; // fix unusable for all
      out.add(
        ProjectedObject(id: t.id, cls: t.cls.index, lat: p.lat, lon: p.lon),
      );
    }
    return out;
  }
}
