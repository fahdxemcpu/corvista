import 'dart:ui';

import 'package:corvista/domain/models/object_class.dart';
import 'package:corvista/features/voice_alerts/lead_vehicle_monitor.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/track_fixtures.dart';

void main() {
  const lead = Rect.fromLTWH(0.4, 0.4, 0.2, 0.2);

  List<bool> run(
    LeadVehicleMonitor m, {
    required double egoSpeed,
    required double scaleRate,
    double from = 0,
    double to = 5,
  }) {
    final out = <bool>[];
    for (var t = from; t < to; t += 0.1) {
      out.add(
        m.update([track(id: 7, box: lead, scaleRate: scaleRate)], egoSpeed, t),
      );
    }
    return out;
  }

  test('finds the largest central vehicle as lead', () {
    final l = LeadVehicleMonitor.findLead([
      track(id: 1, box: const Rect.fromLTWH(0.05, 0.4, 0.3, 0.3)), // off-centre
      track(id: 2, box: const Rect.fromLTWH(0.45, 0.4, 0.1, 0.1)),
      track(id: 3, box: const Rect.fromLTWH(0.4, 0.4, 0.2, 0.2)),
      track(
        id: 4,
        cls: ObjectClass.person,
        box: const Rect.fromLTWH(0.35, 0.3, 0.3, 0.5),
      ),
    ]);
    expect(l?.id, 3);
  });

  test('stationary ≥ 3 s then receding while stopped fires once', () {
    final m = LeadVehicleMonitor();
    expect(run(m, egoSpeed: 0, scaleRate: 0, to: 3.2).any((e) => e), isFalse);
    expect(m.armed, isTrue);
    final fired = run(m, egoSpeed: 0, scaleRate: -0.15, from: 3.2, to: 5);
    expect(fired.where((e) => e), hasLength(1));
  });

  test('brief recede (< 0.7 s) does not fire', () {
    final m = LeadVehicleMonitor();
    run(m, egoSpeed: 0, scaleRate: 0, to: 3.2);
    expect(
      run(m, egoSpeed: 0, scaleRate: -0.15, from: 3.2, to: 3.7).any((e) => e),
      isFalse,
    );
  });

  test('not armed before 3 s stationary', () {
    final m = LeadVehicleMonitor();
    run(m, egoSpeed: 0, scaleRate: 0, to: 2.5);
    expect(
      run(m, egoSpeed: 0, scaleRate: -0.15, from: 2.5, to: 3.5).any((e) => e),
      isFalse,
    );
  });

  test('ego moving resets', () {
    final m = LeadVehicleMonitor();
    run(m, egoSpeed: 0, scaleRate: 0, to: 3.2);
    run(m, egoSpeed: 3, scaleRate: 0, from: 3.2, to: 3.4);
    expect(m.armed, isFalse);
    expect(
      run(m, egoSpeed: 3, scaleRate: -0.15, from: 3.4, to: 5).any((e) => e),
      isFalse,
    );
  });

  test('unknown ego speed never fires', () {
    final m = LeadVehicleMonitor();
    expect(run(m, egoSpeed: -1, scaleRate: 0, to: 4).any((e) => e), isFalse);
    expect(m.armed, isFalse);
  });
}
