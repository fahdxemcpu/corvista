import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/features/power/power_policy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PowerPolicyOutput eval({
    PowerMode mode = PowerMode.balanced,
    ThermalLevel thermal = ThermalLevel.nominal,
    double battery = 0.8,
    bool charging = false,
    bool lowPower = false,
  }) => PowerPolicy.evaluate(
    mode: mode,
    thermal: thermal,
    battery: battery,
    charging: charging,
    lowPowerMode: lowPower,
  );

  test('mode baselines', () {
    expect(
      eval(mode: PowerMode.performance),
      const PowerPolicyOutput(aiHz: 15, segHz: 4, reducedEffects: false),
    );
    expect(
      eval(),
      const PowerPolicyOutput(aiHz: 10, segHz: 2, reducedEffects: false),
    );
    expect(
      eval(mode: PowerMode.powerSaver),
      const PowerPolicyOutput(aiHz: 5, segHz: 1, reducedEffects: true),
    );
  });

  test('thermal caps', () {
    expect(
      eval(mode: PowerMode.performance, thermal: ThermalLevel.fair).aiHz,
      12,
    );
    final serious = eval(
      mode: PowerMode.performance,
      thermal: ThermalLevel.serious,
    );
    expect(serious.aiHz, 6);
    expect(serious.segHz, 1);
    expect(serious.reducedEffects, isTrue);
    expect(serious.notice, PowerNotice.thermalSerious);
    final critical = eval(thermal: ThermalLevel.critical);
    expect(critical.aiHz, 3);
    expect(critical.segHz, 0);
    expect(critical.notice, PowerNotice.thermalCritical);
  });

  test('low power mode and low battery', () {
    final lp = eval(mode: PowerMode.performance, lowPower: true);
    expect(lp.aiHz, 5);
    expect(lp.notice, PowerNotice.lowPowerMode);
    final lb = eval(battery: 0.1);
    expect(lb.aiHz, 5);
    expect(lb.notice, PowerNotice.batteryLow);
    expect(eval(battery: 0.1, charging: true).aiHz, 10);
    expect(eval(battery: -1).aiHz, 10); // unknown battery
  });

  test('most restrictive constraint wins', () {
    final o = eval(
      mode: PowerMode.performance,
      lowPower: true,
      thermal: ThermalLevel.critical,
    );
    expect(o.aiHz, 3);
    expect(o.notice, PowerNotice.thermalCritical);
  });

  test('ThermalLevel.parse', () {
    expect(ThermalLevel.parse('serious'), ThermalLevel.serious);
    expect(ThermalLevel.parse('bogus'), ThermalLevel.nominal);
  });
}
