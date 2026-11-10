import 'package:corvista/features/trips/trip_recorder.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/trip_fixtures.dart';

void main() {
  ({TripRecorder r, List<TripFix> points, TripStats? ended, int starts}) run(
    List<TripFix> fixes, {
    TripRecorder? recorder,
  }) {
    final r = recorder ?? TripRecorder();
    final pts = <TripFix>[];
    TripStats? ended;
    var starts = 0;
    for (final f in fixes) {
      final u = r.onFix(f);
      if (u.started) starts++;
      pts.addAll(u.points);
      ended ??= u.ended;
    }
    return (r: r, points: pts, ended: ended, starts: starts);
  }

  test('haversine: 1° latitude ≈ 111.2 km', () {
    expect(haversineM(45, 7, 46, 7), closeTo(111195, 10));
  });

  group('start', () {
    test('needs ≥ 8 km/h for ≥ 5 s', () {
      final b = TraceBuilder()..drive(7, 30); // too slow
      expect(run(b.fixes).starts, 0);
      final c = TraceBuilder()
        ..drive(20, 4)
        ..stop(2)
        ..drive(20, 4); // never 5 s continuously
      expect(run(c.fixes).starts, 0);
      final d = TraceBuilder()..drive(20, 6);
      final res = run(d.fixes);
      expect(res.starts, 1);
      expect(res.r.active, isTrue);
      // Trip starts at the first fast fix.
      expect(res.points.first.ts, d.fixes.first.ts);
    });

    test('inaccurate fixes (hAcc > 50 m) are dropped', () {
      final b = TraceBuilder()..drive(30, 20, hAcc: 80);
      expect(run(b.fixes).starts, 0);
    });

    test('forceStart (navigation) starts immediately', () {
      final r = TripRecorder();
      final u = r.forceStart(
        at: const TripFix(ts: tripT0, lat: 45, lon: 7, speed: 0),
      );
      expect(u.started, isTrue);
      expect(u.points, hasLength(1));
      expect(r.active, isTrue);
    });
  });

  group('distance & sampling', () {
    test('distance matches the driven path; points thinned', () {
      final b = TraceBuilder()..drive(36, 120); // 10 m/s → 1200 m
      final res = run(b.fixes);
      final s = res.r.end()!;
      expect(s.distanceM, closeTo(1190, 15)); // first fix is the origin
      // 10 m/s: a point every 2 s (15 m rule not reached in 1 s).
      expect(res.points.length, inInclusiveRange(55, 65));
      expect(s.maxSpeedMs, closeTo(10, 0.5));
    });

    test('fast driving keeps every fix (≥ 15 m between fixes)', () {
      final b = TraceBuilder()..drive(90, 30); // 25 m/s
      expect(run(b.fixes).points.length, 30);
    });

    test('GPS jump implying > 250 km/h is rejected', () {
      final b = TraceBuilder()..drive(36, 30);
      b.glitch(2000);
      b.drive(36, 30);
      final s = run(b.fixes).r.end()!;
      expect(s.distanceM, closeTo(600, 25));
      expect(s.maxSpeedMs, lessThan(250 / 3.6));
    });

    test('persistent relocation re-anchors without adding distance', () {
      final a = TripAccumulator();
      a.add(const TripFix(ts: 0, lat: 45, lon: 7));
      for (var i = 1; i <= 6; i++) {
        a.add(TripFix(ts: i * 1000.0, lat: 46, lon: 7));
      }
      expect(a.stats().distanceM, 0);
      expect(a.last!.lat, 46);
    });
  });

  group('moving time & end', () {
    test('stationary periods are excluded from moving time; jitter adds no distance', () {
      final b = TraceBuilder()
        ..drive(36, 60)
        ..stop(120)
        ..drive(36, 60);
      final res = run(b.fixes);
      final s = res.r.end()!;
      expect(s.distanceM, closeTo(1190, 20));
      expect(s.movingTimeS, closeTo(120, 8));
      expect(s.durationS, closeTo(239, 3));
      expect(s.avgSpeedMs, closeTo(10, 0.8));
    });

    test(
      'ends after 5 min stationary with end time at the start of the stop',
      () {
        final b = TraceBuilder()..drive(36, 60);
        final stopAt = b.ts + 1000;
        b.stop(301);
        final res = run(b.fixes);
        expect(res.ended, isNotNull);
        expect(res.ended!.endTs, stopAt);
        expect(res.r.active, isFalse);
        expect(res.r.end(), isNull);
      },
    );

    test('4 min stop does not end the trip', () {
      final b = TraceBuilder()
        ..drive(36, 60)
        ..stop(240)
        ..drive(36, 10);
      final res = run(b.fixes);
      expect(res.ended, isNull);
      expect(res.r.active, isTrue);
    });

    test('a new trip can start after one ends', () {
      final b = TraceBuilder()
        ..drive(36, 60)
        ..stop(301)
        ..drive(36, 10);
      expect(run(b.fixes).starts, 2);
    });

    test('summarize replays stored points', () {
      final b = TraceBuilder()..drive(36, 60);
      final res = run(b.fixes);
      final s = TripAccumulator.summarize(res.points);
      expect(s.distanceM, closeTo(res.r.stats.distanceM, 1e-6));
      expect(s.pointCount, res.points.length);
    });
  });
}
