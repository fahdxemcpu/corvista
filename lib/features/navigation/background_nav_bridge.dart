import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../platform/native_bridge/engine_provider.dart';
import 'navigation_controller.dart';

/// Background navigation (like Maps / Waze): while turn-by-turn guidance is
/// active, native keeps location updates (and the blue status-bar indicator)
/// running when the app is backgrounded or the screen locks, so
/// [NavigationController] keeps receiving fixes and speaking prompts.
/// Off as soon as navigation ends, is cancelled or arrives.
///
/// Read-only consumer of [navigationProvider]. Activated from the app widget.
/// The camera / recorder still stop in the background (iOS); see
/// DriveSessionController.handleLifecycle.
final backgroundNavBridgeProvider = Provider<void>((ref) {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) return;
  final engine = ref.read(nativeEngineProvider);
  bool? applied;

  Future<void> apply(bool on) async {
    if (applied == on) return;
    applied = on;
    try {
      final r = await engine.locationSetBackground(on);
      debugPrint('[bgnav] background location ${on ? 'ON' : 'OFF'} $r');
    } catch (e) {
      applied = null;
      debugPrint('[bgnav] setBackground($on) failed: $e');
    }
  }

  ref.listen<bool>(
    navigationProvider.select(backgroundNavWanted),
    (_, on) => unawaited(apply(on)),
    fireImmediately: true,
  );
});

/// Background location is wanted only while actively guiding.
bool backgroundNavWanted(NavState s) =>
    s.phase == NavPhase.navigating && !(s.guidance?.arrived ?? false);
