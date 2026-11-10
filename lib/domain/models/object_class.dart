import 'dart:ui';

/// The seven supported road-object categories. `index` == native class id.
enum ObjectClass {
  person,
  bicycle,
  motorcycle,
  car,
  bus,
  trafficLight,
  stopSign;

  static ObjectClass? fromId(int id) =>
      id >= 0 && id < values.length ? values[id] : null;

  bool get isVehicle => this == car || this == bus || this == motorcycle;
  bool get isVulnerable =>
      this == person || this == bicycle || this == motorcycle;
  bool get isSignal => this == trafficLight || this == stopSign;

  /// Nominal real-world height in metres used for coarse monocular range
  /// estimation (see docs/ESTIMATION.md). Approximate by design.
  double get nominalHeightM => switch (this) {
    person => 1.7,
    bicycle => 1.1,
    motorcycle => 1.3,
    car => 1.5,
    bus => 3.1,
    trafficLight => 0.9,
    stopSign => 0.75,
  };

  /// Nominal width in metres (for top-down footprint rendering).
  double get nominalWidthM => switch (this) {
    person => 0.55,
    bicycle => 0.6,
    motorcycle => 0.8,
    car => 1.85,
    bus => 2.55,
    trafficLight => 0.35,
    stopSign => 0.75,
  };

  Color get color => switch (this) {
    person => const Color(0xFFFFCB65),
    bicycle => const Color(0xFF65DBAA),
    motorcycle => const Color(0xFFB794FF),
    car => const Color(0xFF38D9E8),
    bus => const Color(0xFF4C80FF),
    trafficLight => const Color(0xFFFF9F5A),
    stopSign => const Color(0xFFF16B70),
  };
}

enum LightState { red, yellow, green, unknown }

LightState lightStateFrom(String? s) => switch (s) {
  'red' => LightState.red,
  'yellow' => LightState.yellow,
  'green' => LightState.green,
  _ => LightState.unknown,
};
