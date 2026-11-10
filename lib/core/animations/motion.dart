import 'dart:math' as math;

import 'package:flutter/widgets.dart';

/// Motion tokens. Every animated widget asks [Motion.enabled] first so the
/// in-app "Reduce motion" setting and iOS accessibility both disable effects.
abstract final class Motion {
  static const fast = Duration(milliseconds: 160);
  static const medium = Duration(milliseconds: 280);
  static const slow = Duration(milliseconds: 520);
  static const curve = Curves.easeOutCubic;

  /// [appReduceMotion] is `settings.reduceMotion`.
  static bool enabled(BuildContext context, {bool appReduceMotion = false}) =>
      !appReduceMotion && !MediaQuery.disableAnimationsOf(context);

  static Duration duration(
    BuildContext context,
    Duration d, {
    bool appReduceMotion = false,
  }) => enabled(context, appReduceMotion: appReduceMotion) ? d : Duration.zero;
}

/// Exponential smoothing factor for a frame of [dt] seconds with time
/// constant [tau] seconds (frame-rate independent lerp).
double smoothingAlpha(double dt, {double tau = 0.12}) {
  if (tau <= 0) return 1;
  return (1 - math.exp(-dt / tau)).clamp(0.0, 1.0);
}
