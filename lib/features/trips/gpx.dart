import '../../domain/repositories/trip_repository.dart';

String _esc(String s) => s
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;')
    .replaceAll("'", '&apos;');

String _time(double tsMs) => DateTime.fromMillisecondsSinceEpoch(
  tsMs.round(),
  isUtc: true,
).toIso8601String();

String _coord(double v) => v.toStringAsFixed(7);

/// GPX 1.1 document for a trip: one `<trk>`/`<trkseg>` with timestamped
/// points and a `<wpt>` per located event (incidents, emergencies, ...).
String buildGpx({
  required Trip trip,
  required List<TripPoint> points,
  List<TripEvent> events = const [],
  required String name,
}) {
  final b = StringBuffer()
    ..writeln('<?xml version="1.0" encoding="UTF-8"?>')
    ..writeln(
      '<gpx version="1.1" creator="Corvista" '
      'xmlns="http://www.topografix.com/GPX/1/1" '
      'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '
      'xsi:schemaLocation="http://www.topografix.com/GPX/1/1 '
      'http://www.topografix.com/GPX/1/1/gpx.xsd">',
    )
    ..writeln('  <metadata>')
    ..writeln('    <name>${_esc(name)}</name>')
    ..writeln(
      '    <time>${_time(trip.startedAt.millisecondsSinceEpoch.toDouble())}</time>',
    )
    ..writeln('  </metadata>');
  // Waypoints must precede tracks in GPX 1.1.
  for (final e in events) {
    final lat = e.lat, lon = e.lon;
    if (lat == null || lon == null) continue;
    b
      ..writeln('  <wpt lat="${_coord(lat)}" lon="${_coord(lon)}">')
      ..writeln('    <time>${_time(e.ts)}</time>')
      ..writeln('    <name>${_esc(e.label.isEmpty ? e.kind : e.label)}</name>')
      ..writeln('    <type>${_esc(e.kind)}</type>')
      ..writeln('  </wpt>');
  }
  b
    ..writeln('  <trk>')
    ..writeln('    <name>${_esc(name)}</name>')
    ..writeln('    <trkseg>');
  for (final p in points) {
    b
      ..writeln('      <trkpt lat="${_coord(p.lat)}" lon="${_coord(p.lon)}">')
      ..writeln('        <time>${_time(p.ts)}</time>')
      ..writeln('      </trkpt>');
  }
  b
    ..writeln('    </trkseg>')
    ..writeln('  </trk>')
    ..writeln('</gpx>');
  return b.toString();
}
