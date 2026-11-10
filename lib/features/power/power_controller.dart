import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/app_settings.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../settings/settings_controller.dart';
import 'power_policy.dart';

export 'power_policy.dart';

/// `system.info()` polled every 10 s (first value immediately).
final systemInfoProvider = StreamProvider<Map<Object?, Object?>>((ref) async* {
  final engine = ref.watch(nativeEngineProvider);
  while (true) {
    try {
      yield await engine.systemInfo();
    } catch (_) {
      // Keep polling; consumers keep their last value.
    }
    await Future<void>.delayed(const Duration(seconds: 10));
  }
});

class PowerState {
  const PowerState({
    this.mode = PowerMode.balanced,
    this.thermal = ThermalLevel.nominal,
    this.battery = -1,
    this.charging = false,
    this.lowPowerMode = false,
    this.aiHz = 10,
    this.segHz = 2,
    this.reducedEffects = false,
    this.notice,
  });

  final PowerMode mode;
  final ThermalLevel thermal;

  /// 0..1, −1 unknown.
  final double battery;
  final bool charging;
  final bool lowPowerMode;
  final double aiHz;
  final double segHz;
  final bool reducedEffects;

  /// [PowerNotice] key or null.
  final String? notice;

  PowerState copyWith({
    PowerMode? mode,
    ThermalLevel? thermal,
    double? battery,
    bool? charging,
    bool? lowPowerMode,
  }) => PowerState(
    mode: mode ?? this.mode,
    thermal: thermal ?? this.thermal,
    battery: battery ?? this.battery,
    charging: charging ?? this.charging,
    lowPowerMode: lowPowerMode ?? this.lowPowerMode,
    aiHz: aiHz,
    segHz: segHz,
    reducedEffects: reducedEffects,
    notice: notice,
  );

  PowerState withPolicy() {
    final o = PowerPolicy.evaluate(
      mode: mode,
      thermal: thermal,
      battery: battery,
      charging: charging,
      lowPowerMode: lowPowerMode,
    );
    return PowerState(
      mode: mode,
      thermal: thermal,
      battery: battery,
      charging: charging,
      lowPowerMode: lowPowerMode,
      aiHz: o.aiHz,
      segHz: o.segHz,
      reducedEffects: o.reducedEffects,
      notice: o.notice,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is PowerState &&
      other.mode == mode &&
      other.thermal == thermal &&
      other.battery == battery &&
      other.charging == charging &&
      other.lowPowerMode == lowPowerMode &&
      other.aiHz == aiHz &&
      other.segHz == segHz &&
      other.reducedEffects == reducedEffects &&
      other.notice == notice;

  @override
  int get hashCode => Object.hash(
    mode,
    thermal,
    battery,
    charging,
    lowPowerMode,
    aiHz,
    segHz,
    reducedEffects,
    notice,
  );
}

/// Device power/thermal state → [PowerPolicy] output. The drive session
/// applies `aiHz`/`segHz` to `ai.configure`.
class PowerController extends Notifier<PowerState> {
  StreamSubscription<Map<Object?, Object?>>? _sub;

  @override
  PowerState build() {
    ref.listen(systemInfoProvider, (_, next) {
      final m = next.value;
      if (m == null) return;
      final b = (m['battery'] as num?)?.toDouble() ?? -1;
      state = state
          .copyWith(
            thermal: ThermalLevel.parse(m['thermal']),
            battery: b,
            charging: m['charging'] == true,
            lowPowerMode: m['lowPower'] == true,
          )
          .withPolicy();
    });
    ref.listen(settingsProvider.select((s) => s.powerMode), (_, mode) {
      state = state.copyWith(mode: mode).withPolicy();
    });
    _sub = ref.read(nativeEngineProvider).status.listen((m) {
      if (m['type'] == 'thermal') {
        state = state
            .copyWith(thermal: ThermalLevel.parse(m['state']))
            .withPolicy();
      }
    }, onError: (_) {});
    ref.onDispose(() => _sub?.cancel());
    return PowerState(mode: ref.read(settingsProvider).powerMode).withPolicy();
  }
}

final powerProvider = NotifierProvider<PowerController, PowerState>(
  PowerController.new,
);
