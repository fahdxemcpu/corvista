import 'package:corvista/domain/models/object_class.dart';
import 'package:corvista/features/voice_alerts/traffic_light_filter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('state accepted after 4 consistent frames over 0.4 s', () {
    final f = TrafficLightFilter();
    final states = [
      for (var i = 0; i < 5; i++)
        f.update(1, LightState.red, 0.9, i * 0.1).state,
    ];
    expect(states, [
      LightState.unknown,
      LightState.unknown,
      LightState.unknown,
      LightState.unknown,
      LightState.red,
    ]);
  });

  test('4 frames in less than 0.4 s is not enough', () {
    final f = TrafficLightFilter();
    for (var i = 0; i < 4; i++) {
      f.update(1, LightState.green, 0.9, i * 0.05);
    }
    expect(f.stateOf(1), LightState.unknown);
  });

  test('low-confidence and unknown observations are ignored', () {
    final f = TrafficLightFilter();
    for (var i = 0; i < 10; i++) {
      f.update(1, LightState.red, 0.4, i * 0.1);
      f.update(1, LightState.unknown, 0.9, i * 0.1 + 0.05);
    }
    expect(f.stateOf(1), LightState.unknown);
  });

  test('single-frame flicker does not change accepted state', () {
    final f = TrafficLightFilter();
    var t = 0.0;
    for (var i = 0; i < 6; i++, t += 0.1) {
      f.update(1, LightState.red, 0.9, t);
    }
    f.update(1, LightState.green, 0.9, t);
    t += 0.1;
    expect(f.update(1, LightState.red, 0.9, t).state, LightState.red);
  });

  test('emits red → green transition once', () {
    final f = TrafficLightFilter();
    var t = 0.0;
    for (var i = 0; i < 6; i++, t += 0.1) {
      f.update(1, LightState.red, 0.9, t);
    }
    final ups = <LightUpdate>[];
    for (var i = 0; i < 8; i++, t += 0.1) {
      ups.add(f.update(1, LightState.green, 0.9, t));
    }
    expect(ups.where((u) => u.turnedGreen), hasLength(1));
    expect(f.stateOf(1), LightState.green);
  });

  test('tracks are independent and pruned', () {
    final f = TrafficLightFilter();
    for (var i = 0; i < 5; i++) {
      f.update(1, LightState.red, 0.9, i * 0.1);
      f.update(2, LightState.green, 0.9, i * 0.1);
    }
    expect(f.stateOf(1), LightState.red);
    expect(f.stateOf(2), LightState.green);
    f.prune(10);
    expect(f.stateOf(1), LightState.unknown);
  });
}
