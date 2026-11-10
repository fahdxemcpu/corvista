import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../domain/models/app_settings.dart';
import '../../detection/widgets/camera_layer.dart';

/// Colours + panel treatment for each [HudStyle].
class HudPalette {
  const HudPalette({
    required this.style,
    required this.panel,
    required this.border,
    required this.text,
    required this.text2,
    required this.accent,
    required this.warn,
    required this.danger,
    this.blur = true,
    this.sceneDim = 0,
    this.boxTint,
    this.highContrast = false,
  });

  final HudStyle style;
  final Color panel, border, text, text2, accent, warn, danger;
  final bool blur;

  /// Black overlay alpha over the scene (night style).
  final double sceneDim;
  final Color? boxTint;
  final bool highContrast;

  OverlayLook get look =>
      OverlayLook(tint: boxTint, highContrast: highContrast);

  static HudPalette of(HudStyle style) => switch (style) {
    HudStyle.night => const HudPalette(
      style: HudStyle.night,
      panel: Color(0xCC0A0505),
      border: Color(0x33FF5A4E),
      text: Color(0xFFFFB0A6),
      text2: Color(0xFFB0645C),
      accent: Color(0xFFFF5A4E),
      warn: Color(0xFFFF8A4E),
      danger: Color(0xFFFF3B30),
      sceneDim: .35,
      boxTint: Color(0xFFFF5A4E),
    ),
    HudStyle.highContrast => const HudPalette(
      style: HudStyle.highContrast,
      panel: Color(0xF2000000),
      border: Colors.white,
      text: Colors.white,
      text2: Color(0xFFE0E0E0),
      accent: Color(0xFFFFE600),
      warn: Color(0xFFFFE600),
      danger: Color(0xFFFF4040),
      blur: false,
      highContrast: true,
    ),
    HudStyle.minimal => const HudPalette(
      style: HudStyle.minimal,
      panel: Color(0x66080C12),
      border: Color(0x00000000),
      text: AppColors.textPrimary,
      text2: AppColors.textSecondary,
      accent: AppColors.cyan,
      warn: AppColors.amber,
      danger: AppColors.red,
    ),
    _ => HudPalette(
      style: style,
      panel: AppColors.glass,
      border: AppColors.glassBorder,
      text: AppColors.textPrimary,
      text2: AppColors.textSecondary,
      accent: AppColors.cyan,
      warn: AppColors.amber,
      danger: AppColors.red,
    ),
  };
}
