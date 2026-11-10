class LocationFix {
  const LocationFix({
    required this.lat,
    required this.lon,
    required this.alt,
    required this.hAcc,
    required this.speed,
    required this.speedAcc,
    required this.course,
    required this.heading,
    required this.headingAcc,
    required this.ts,
  });

  final double lat, lon, alt, hAcc;

  /// m/s, negative when invalid.
  final double speed;
  final double speedAcc;

  /// Course over ground (deg), negative when invalid.
  final double course;

  /// Device heading (deg), negative when invalid.
  final double heading;
  final double headingAcc;
  final double ts;

  bool get hasSpeed => speed >= 0;
  bool get hasCourse => course >= 0;
  bool get hasHeading => heading >= 0;

  /// Best available travel direction: course when moving, else compass heading.
  double? get bestDirection {
    if (hasCourse && hasSpeed && speed > 2) return course;
    if (hasHeading) return heading;
    if (hasCourse) return course;
    return null;
  }

  static LocationFix fromMap(Map<Object?, Object?> m) {
    double d(String k, [double def = -1]) => (m[k] as num?)?.toDouble() ?? def;
    return LocationFix(
      lat: d('lat', 0),
      lon: d('lon', 0),
      alt: d('alt', 0),
      hAcc: d('hAcc'),
      speed: d('speed'),
      speedAcc: d('speedAcc'),
      course: d('course'),
      heading: d('heading'),
      headingAcc: d('headingAcc'),
      ts: d('ts', 0),
    );
  }
}
