import 'package:corvista/features/trips/trip_recorder.dart';

const tripT0 = 1700000000000.0;
const _mPerDegLat = 111195.08;

/// Builds a synthetic 1 Hz GPS trace heading north from (lat0, lon0).
class TraceBuilder {
  TraceBuilder({this.lat = 45.0, this.lon = 7.0, this.ts = tripT0});

  double lat, lon, ts;
  final fixes = <TripFix>[];

  /// Drive at [kmh] for [seconds] (1 fix / s).
  void drive(double kmh, double seconds, {double hAcc = 5}) {
    final ms = kmh / 3.6;
    for (var i = 0; i < seconds; i++) {
      ts += 1000;
      lat += ms / _mPerDegLat;
      fixes.add(
        TripFix(ts: ts, lat: lat, lon: lon, speed: ms, course: 0, hAcc: hAcc),
      );
    }
  }

  /// Stand still for [seconds] with small GPS jitter.
  void stop(double seconds, {double jitterM = 3}) {
    for (var i = 0; i < seconds; i++) {
      ts += 1000;
      final j = (i.isEven ? 1 : -1) * jitterM / _mPerDegLat;
      fixes.add(
        TripFix(ts: ts, lat: lat + j, lon: lon, speed: 0, course: -1, hAcc: 8),
      );
    }
  }

  /// A single wild fix [metres] east (GPS glitch), not moving the vehicle.
  void glitch(double metres) {
    ts += 1000;
    fixes.add(
      TripFix(
        ts: ts,
        lat: lat,
        lon: lon + metres / 78626.0,
        speed: 15,
        hAcc: 10,
      ),
    );
  }
}
