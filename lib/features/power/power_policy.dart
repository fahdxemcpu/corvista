import 'dart:math' as math;

import '../../domain/models/app_settings.dart';

enum ThermalLevel {
  nominal,
  fair,
  serious,
  critical;

  static ThermalLevel parse(Object? s) =>
      values.firstWhere((v) => v.name == s, orElse: () => ThermalLevel.nominal);
}

/// Notice keys (UI localizes them).
abstract final class PowerNotice {
  static const thermalSerious = 'thermal_serious';
  static const thermalCritical = 'thermal_critical';
  static const lowPowerMode = 'low_power_mode';
  static const batteryLow = 'battery_low';
}

class PowerPolicyOutput {
  const PowerPolicyOutput({
    required this.aiHz,
    required this.segHz,
    required this.reducedEffects,
    this.notice,
  });
  final double aiHz;
  final double segHz;
  final bool reducedEffects;
  final String? notice;

  @override
  bool operator ==(Object other) =>
      other is PowerPolicyOutput &&
      other.aiHz == aiHz &&
      other.segHz == segHz &&
      other.reducedEffects == reducedEffects &&
      other.notice == notice;

  @override
  int get hashCode => Object.hash(aiHz, segHz, reducedEffects, notice);

  @override
  String toString() =>
      'PowerPolicyOutput(ai $aiHz Hz, seg $segHz Hz, reduced $reducedEffects, $notice)';
}

/// Maps (mode, thermal, battery, low-power) → inference rates and effects.
///
/// | mode        | aiHz | segHz |
/// |-------------|------|-------|
/// | performance | 15   | 4     |
/// | balanced    | 10   | 2     |
/// | powerSaver  | 5    | 1     | (reduced effects)
///
/// Constraints are applied as caps (most restrictive wins):
/// thermal fair ×0.8 · serious ≤ 6 / 1 Hz + reduced · critical ≤ 3 / 0 Hz + reduced ·
/// Low Power Mode ≤ 5 / 1 Hz + reduced · battery < 15 % (not charging) ≤ 5 / 1 Hz + reduced.
abstract final class PowerPolicy {
  static PowerPolicyOutput evaluate({
    required PowerMode mode,
    required ThermalLevel thermal,
    required double battery,
    required bool charging,
    required bool lowPowerMode,
  }) {
    var (ai, seg, reduced) = switch (mode) {
      PowerMode.performance => (15.0, 4.0, false),
      PowerMode.balanced => (10.0, 2.0, false),
      PowerMode.powerSaver => (5.0, 1.0, true),
    };
    String? notice;

    final batteryLow = battery >= 0 && battery < 0.15 && !charging;
    if (batteryLow) {
      ai = math.min(ai, 5);
      seg = math.min(seg, 1);
      reduced = true;
      notice = PowerNotice.batteryLow;
    }
    if (lowPowerMode) {
      ai = math.min(ai, 5);
      seg = math.min(seg, 1);
      reduced = true;
      notice = PowerNotice.lowPowerMode;
    }
    switch (thermal) {
      case ThermalLevel.nominal:
        break;
      case ThermalLevel.fair:
        ai = (ai * 0.8).roundToDouble();
        seg = math.min(seg, 2);
      case ThermalLevel.serious:
        ai = math.min(ai, 6);
        seg = math.min(seg, 1);
        reduced = true;
        notice = PowerNotice.thermalSerious;
      case ThermalLevel.critical:
        ai = math.min(ai, 3);
        seg = 0;
        reduced = true;
        notice = PowerNotice.thermalCritical;
    }
    return PowerPolicyOutput(
      aiHz: ai,
      segHz: seg,
      reducedEffects: reduced,
      notice: notice,
    );
  }
}
