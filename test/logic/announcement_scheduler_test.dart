import 'package:corvista/features/navigation/announcement_scheduler.dart';
import 'package:flutter_test/flutter_test.dart';

/// Drives the scheduler from [fromM] to 0 at constant [speed], one update
/// per second (1 Hz GPS).
List<Announcement> drive(
  AnnouncementScheduler s, {
  required double fromM,
  required double speed,
  int step = 0,
}) {
  final out = <Announcement>[];
  for (var d = fromM; d >= 0; d -= speed) {
    final a = s.update(stepIndex: step, distanceM: d, speedMps: speed);
    if (a != null) out.add(a);
  }
  return out;
}

void main() {
  test('city (40 km/h): 300 m, 100 m, now', () {
    final a = drive(AnnouncementScheduler(), fromM: 800, speed: 11);
    expect(a.map((x) => x.tier), [
      AnnouncementTier.prepare,
      AnnouncementTier.near,
      AnnouncementTier.now,
    ]);
    expect(a.map((x) => x.nominalM.round()).take(2), [300, 100]);
    // Spoken early enough to be finished at the nominal distance.
    expect(a[0].distanceM, inInclusiveRange(300, 300 + 11 * 1.2 + 11));
    // "Now" ≈ 3.5 s before the maneuver.
    expect(a[2].distanceM / 11, inInclusiveRange(2.4, 3.6));
  });

  test('motorway (110 km/h): 2 km, 1 km, 400 m, now', () {
    final a = drive(AnnouncementScheduler(), fromM: 4000, speed: 30.5);
    expect(a.map((x) => x.tier), [
      AnnouncementTier.early,
      AnnouncementTier.mid,
      AnnouncementTier.prepare,
      AnnouncementTier.now,
    ]);
    expect(a.map((x) => x.nominalM.round()).take(3), [2000, 1000, 400]);
    expect(a[3].distanceM, inInclusiveRange(75, 110));
  });

  test('road (70 km/h): 500 m, 200 m, now', () {
    final a = drive(AnnouncementScheduler(), fromM: 1500, speed: 19);
    expect(a.map((x) => x.nominalM.round()).take(2), [500, 200]);
    expect(a.last.tier, AnnouncementTier.now);
  });

  test('imperial: miles / feet, UK yards', () {
    final us = drive(
      AnnouncementScheduler(units: UnitSystem.imperialFeet),
      fromM: 5000,
      speed: 30,
    );
    expect(us.map((x) => x.nominalM.round()).take(3), [3219, 1609, 402]);
    final uk = drive(
      AnnouncementScheduler(units: UnitSystem.imperialYards),
      fromM: 800,
      speed: 10,
    );
    expect(uk.map((x) => x.nominalM.round()).take(2), [274, 91]);
  });

  test('no duplicates under GPS jitter', () {
    final s = AnnouncementScheduler();
    final out = <Announcement>[];
    for (final d in <double>[
      420,
      330,
      312,
      318,
      305,
      290,
      150,
      112,
      118,
      108,
      60,
      33,
      38,
      25,
      10,
    ]) {
      final a = s.update(stepIndex: 1, distanceM: d, speedMps: 10);
      if (a != null) out.add(a);
    }
    expect(out.map((x) => x.tier), [
      AnnouncementTier.prepare,
      AnnouncementTier.near,
      AnnouncementTier.now,
    ]);
  });

  test('speed class changes never repeat a farther prompt', () {
    final s = AnnouncementScheduler();
    // City prompt at 300 m…
    expect(s.update(stepIndex: 0, distanceM: 305, speedMps: 10)?.nominalM, 300);
    // …then the driver accelerates (road class: 500 m tier) — not spoken.
    expect(s.update(stepIndex: 0, distanceM: 280, speedMps: 20), isNull);
  });

  test('entering a step inside several tiers speaks only the closest', () {
    final s = AnnouncementScheduler();
    final a = s.update(stepIndex: 2, distanceM: 200, speedMps: 10);
    expect(a?.tier, AnnouncementTier.prepare);
    final s2 = AnnouncementScheduler();
    expect(
      s2.update(stepIndex: 0, distanceM: 25, speedMps: 10)?.tier,
      AnnouncementTier.now,
    );
    expect(s2.update(stepIndex: 0, distanceM: 200, speedMps: 10), isNull);
  });

  test('a tier < 4 s before the next one is folded into it', () {
    final s = AnnouncementScheduler();
    // At 15 m/s on a short step: 300 m and 200 m tiers nearly coincide.
    expect(s.update(stepIndex: 0, distanceM: 140, speedMps: 10), isNull);
    expect(
      s.update(stepIndex: 0, distanceM: 110, speedMps: 10)?.tier,
      AnnouncementTier.near,
    );
  });

  test('new step and reset start over', () {
    final s = AnnouncementScheduler();
    expect(
      s.update(stepIndex: 0, distanceM: 10, speedMps: 5)?.tier,
      AnnouncementTier.now,
    );
    expect(
      s.update(stepIndex: 1, distanceM: 10, speedMps: 5)?.tier,
      AnnouncementTier.now,
    );
    s.reset();
    expect(
      s.update(stepIndex: 1, distanceM: 10, speedMps: 5)?.tier,
      AnnouncementTier.now,
    );
  });
}
