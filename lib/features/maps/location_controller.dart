import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/errors/app_errors.dart';
import '../../domain/models/location_fix.dart';
import '../../platform/native_bridge/engine_provider.dart';

export 'map_projector.dart';

class LocationState {
  const LocationState({
    this.fix,
    this.permissionGranted = false,
    this.active = false,
    this.error,
  });

  final LocationFix? fix;
  final bool permissionGranted;
  final bool active;
  final String? error;

  /// Speed in km/h, null when unknown.
  double? get speedKmh =>
      fix != null && fix!.hasSpeed ? fix!.speed * 3.6 : null;

  LocationState copyWith({
    LocationFix? Function()? fix,
    bool? permissionGranted,
    bool? active,
    String? Function()? error,
  }) => LocationState(
    fix: fix != null ? fix() : this.fix,
    permissionGranted: permissionGranted ?? this.permissionGranted,
    active: active ?? this.active,
    error: error != null ? error() : this.error,
  );
}

class LocationController extends Notifier<LocationState> {
  StreamSubscription<LocationFix>? _fixSub;
  StreamSubscription<String>? _authSub;

  @override
  LocationState build() {
    final engine = ref.read(nativeEngineProvider);
    _fixSub = engine.location.listen(_onFix, onError: (_) {});
    _authSub = engine.locationAuth.listen((s) {
      final granted =
          s == 'granted' ||
          s == 'authorizedWhenInUse' ||
          s == 'authorizedAlways';
      state = state.copyWith(permissionGranted: granted);
    }, onError: (_) {});
    ref.onDispose(() {
      _fixSub?.cancel();
      _authSub?.cancel();
    });
    return const LocationState();
  }

  void _onFix(LocationFix f) {
    state = state.copyWith(
      fix: () => f,
      permissionGranted: true,
      error: () => null,
    );
  }

  /// Injects a fix (tests / file replay).
  void debugSetFix(LocationFix f) => _onFix(f);

  Future<void> start() async {
    final engine = ref.read(nativeEngineProvider);
    try {
      await engine.locationStart();
      if (!ref.mounted) return;
      state = state.copyWith(active: true, error: () => null);
      final cur = await engine.locationCurrent();
      if (cur != null && ref.mounted && state.fix == null) _onFix(cur);
    } catch (e) {
      if (!ref.mounted) return;
      final code = errorCode(e);
      state = state.copyWith(
        active: false,
        permissionGranted: code == BridgeErrorCode.permissionDenied
            ? false
            : null,
        error: () => code,
      );
    }
  }

  Future<void> stop() async {
    try {
      await ref.read(nativeEngineProvider).locationStop();
    } catch (_) {}
    if (ref.mounted) state = state.copyWith(active: false);
  }
}

final locationProvider = NotifierProvider<LocationController, LocationState>(
  LocationController.new,
);
