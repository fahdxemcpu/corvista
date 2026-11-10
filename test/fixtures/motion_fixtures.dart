import 'package:corvista/features/emergency/impact_detector.dart';

/// Synthetic motion + speed scenarios for [ImpactDetector] tests.
/// Speeds are (t ms, m/s); motion is 100 Hz in ~200 ms batches.
abstract final class MotionFixtures {
  static List<(double, double)> _speeds(
    double fromMs,
    double toMs,
    double kmh, {
    double stepMs = 1000,
  }) => [for (var t = fromMs; t <= toMs; t += stepMs) (t, kmh / 3.6)];

  /// 20 s of ordinary driving at 50 km/h with road vibration and gentle
  /// manoeuvres (0.3 g longitudinal).
  static MotionScenario normalDriving() {
    final b = MotionTraceBuilder()
      ..driving(8000, vibrationG: 0.15)
      ..driving(3000, vibrationG: 0.1, ax: 0.3)
      ..driving(9000, vibrationG: 0.15);
    return MotionScenario(
      name: 'normal',
      batches: b.batches(),
      speeds: _speeds(0, 20000, 50),
    );
  }

  /// Pothole: sharp 5.5 g jolt (one sample above 4 g, ~10 ms), speed
  /// unchanged.
  static MotionScenario pothole() {
    final b = MotionTraceBuilder()
      ..driving(5000)
      ..pulse(30, 5.5)
      ..driving(200, vibrationG: 0.6)
      ..driving(10000);
    return MotionScenario(
      name: 'pothole',
      batches: b.batches(),
      speeds: _speeds(0, 15000, 45),
    );
  }

  /// Phone dropped in a moving car: 350 ms free fall (|a|≈1 g, tumbling)
  /// then an 8 g floor hit, while the car keeps going (speed later drops
  /// as the driver stops to pick it up — the worst case for the speed rule).
  static MotionScenario phoneDrop() {
    final b = MotionTraceBuilder()
      ..driving(5000)
      ..freeFall(350, tumble: 7)
      ..pulse(25, 8, rotation: 9)
      ..driving(10000);
    return MotionScenario(
      name: 'phone_drop',
      batches: b.batches(),
      speeds: [..._speeds(0, 7000, 30), ..._speeds(8000, 15000, 0)],
    );
  }

  /// Hard braking 70 → 0 km/h at ~0.9 g, no impact.
  static MotionScenario hardBraking() {
    final b = MotionTraceBuilder()
      ..driving(5000)
      ..driving(2200, vibrationG: 0.1, ax: -0.9)
      ..driving(8000);
    final speeds = <(double, double)>[
      ..._speeds(0, 5000, 70),
      (6000, 40 / 3.6),
      (7000, 5 / 3.6),
      ..._speeds(8000, 15000, 0),
    ];
    return MotionScenario(
      name: 'hard_braking',
      batches: b.batches(),
      speeds: speeds,
    );
  }

  /// Severe frontal impact at ~55 km/h, vehicle comes to rest.
  static MotionScenario severeImpact() => MotionScenario.severeImpact();

  /// Moderate impact (5 g, ~40 ms above 4 g) followed by a rollover (8 rad/s) — the
  /// rotation rule fires even though GPS speed is unavailable.
  static MotionScenario rollover() {
    final b = MotionTraceBuilder()
      ..driving(4000)
      ..pulse(100, 5, rotation: 3)
      ..roll(1200, 8)
      ..driving(6000);
    return MotionScenario(
      name: 'rollover',
      batches: b.batches(),
      speeds: const [],
    );
  }
}
