import 'package:corvista/features/maps/map_projector.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/track_fixtures.dart';

void main() {
  const p = MapProjector();

  test('object straight ahead heading north moves latitude only', () {
    final r = p.project(fix(course: 0, speed: 10), bearingDeg: 0, rangeM: 100)!;
    expect(r.lon, closeTo(2.3522, 1e-9));
    expect((r.lat - 48.8566) * 111320, closeTo(100, 1.0));
  });

  test('bearing is added to the travel direction (east)', () {
    final r = p.project(
      fix(course: 80, speed: 10),
      bearingDeg: 10,
      rangeM: 50,
    )!;
    expect(r.lat, closeTo(48.8566, 1e-7));
    expect(r.lon, greaterThan(2.3522));
  });

  test('uses heading when stationary', () {
    final r = p.project(
      fix(course: -1, speed: 0, heading: 180),
      bearingDeg: 0,
      rangeM: 20,
    )!;
    expect(r.lat, lessThan(48.8566));
  });

  test('rejects poor accuracy or missing direction', () {
    expect(p.project(fix(hAcc: 31), bearingDeg: 0, rangeM: 10), isNull);
    expect(p.project(fix(hAcc: -1), bearingDeg: 0, rangeM: 10), isNull);
    expect(
      p.project(fix(course: -1, heading: -1), bearingDeg: 0, rangeM: 10),
      isNull,
    );
  });

  test('projectAll keeps confirmed ranged tracks only', () {
    final out = p.projectAll(fix(), [
      track(id: 1, range: 10),
      track(id: 2, range: null),
      track(id: 3, range: 200),
    ]);
    expect(out.map((o) => o.id), [1]);
    expect(out.single.toMap()['approx'], true);
  });
}
