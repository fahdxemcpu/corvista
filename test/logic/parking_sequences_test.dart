import 'package:corvista/features/parking/parking_proximity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/parking_sequences.dart';

/// Regression over REAL parking footage detections (YOLOX-S, 5 fps; see
/// test/fixtures/parking_sequences/README.md). Expectations were checked
/// against the rendered frames (test/widget/parking_render_test.dart).
void main() {
  Map<String, List<ParkingStep>> run() => {
    for (final n in ParkingSequence.names)
      n: replayParking(ParkingSequence.load(n)),
  };
  final steps = run();

  int changes(List<ParkingStep> s) {
    var n = 0;
    for (var i = 1; i < s.length; i++) {
      if (s[i].assessment.toneLevel != s[i - 1].assessment.toneLevel) n++;
    }
    return n;
  }

  bool any(String n, bool Function(ParkingAssessment a) f) =>
      steps[n]!.any((s) => f(s.assessment));

  test('garage (windscreen, bonnet in view): bonnet never alarms', () {
    const n = 'garage_tuebingen';
    expect(any(n, (a) => a.ownVehicleIds.isNotEmpty), isTrue);
    expect(any(n, (a) => a.zone == ParkingZone.stop), isFalse);
    // Parked cars ahead while turning into the bay register as close.
    expect(any(n, (a) => a.zone == ParkingZone.close), isTrue);
  });

  test('garage (crossing traffic): stop for a car right across the front', () {
    const n = 'garage_franconia';
    expect(any(n, (a) => a.zone == ParkingZone.stop), isTrue);
    expect(
      any(
        n,
        (a) =>
            a.sectors[ParkingSide.left] == ParkingZone.veryClose &&
            a.nearest?.side == ParkingSide.left,
      ),
      isTrue,
    );
  });

  test('open lot: passing parked cars on the right are very close / right', () {
    const n = 'lot_monmouth';
    expect(any(n, (a) => a.zone == ParkingZone.stop), isFalse);
    expect(
      any(
        n,
        (a) =>
            a.zone == ParkingZone.veryClose &&
            a.nearest?.side == ParkingSide.right,
      ),
      isTrue,
    );
  });

  test('beeps do not chatter (hysteresis)', () {
    for (final e in steps.entries) {
      final perMinute = changes(e.value) / (e.value.length / 5 / 60);
      expect(perMinute, lessThan(40), reason: e.key);
    }
  });

  test('replay is deterministic', () {
    final again = run();
    for (final n in ParkingSequence.names) {
      expect(
        [for (final s in again[n]!) s.assessment.zone],
        [for (final s in steps[n]!) s.assessment.zone],
      );
    }
  });
}
