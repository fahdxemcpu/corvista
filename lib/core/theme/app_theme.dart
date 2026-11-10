import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Tabular numerals for speed, timers and counters.
const tabular = [FontFeature.tabularFigures()];

abstract final class AppTheme {
  static ThemeData dark() => _build(
    brightness: Brightness.dark,
    bg: AppColors.background,
    surface: AppColors.surface,
    elevated: AppColors.elevated,
    text: AppColors.textPrimary,
    text2: AppColors.textSecondary,
    border: AppColors.border,
  );

  static ThemeData light() => _build(
    brightness: Brightness.light,
    bg: AppColors.lightBackground,
    surface: AppColors.lightSurface,
    elevated: AppColors.lightElevated,
    text: AppColors.lightText,
    text2: AppColors.lightTextSecondary,
    border: AppColors.lightBorder,
  );

  static ThemeData _build({
    required Brightness brightness,
    required Color bg,
    required Color surface,
    required Color elevated,
    required Color text,
    required Color text2,
    required Color border,
  }) {
    final scheme = ColorScheme(
      brightness: brightness,
      primary: AppColors.cyan,
      onPrimary: AppColors.background,
      secondary: AppColors.blue,
      onSecondary: Colors.white,
      tertiary: AppColors.green,
      onTertiary: AppColors.background,
      error: AppColors.red,
      onError: Colors.white,
      surface: surface,
      onSurface: text,
      onSurfaceVariant: text2,
      surfaceContainerLowest: bg,
      surfaceContainerLow: surface,
      surfaceContainer: surface,
      surfaceContainerHigh: elevated,
      surfaceContainerHighest: elevated,
      outline: border,
      outlineVariant: border,
    );
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      brightness: brightness,
      platform: TargetPlatform.iOS,
      scaffoldBackgroundColor: bg,
      splashFactory: NoSplash.splashFactory,
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: AppColors.cyan,
      ),
    );
    final tt = base.textTheme.apply(bodyColor: text, displayColor: text);
    return base.copyWith(
      textTheme: tt.copyWith(
        displayLarge: tt.displayLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -1.2,
          fontFeatures: tabular,
        ),
        displayMedium: tt.displayMedium?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
          fontFeatures: tabular,
        ),
        headlineLarge: tt.headlineLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -.6,
        ),
        headlineMedium: tt.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -.4,
        ),
        titleLarge: tt.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        titleMedium: tt.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        bodyMedium: tt.bodyMedium?.copyWith(color: text2, height: 1.4),
        labelSmall: tt.labelSmall?.copyWith(
          letterSpacing: .6,
          fontWeight: FontWeight.w600,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: bg,
        foregroundColor: text,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: tt.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: text,
        ),
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: border),
        ),
      ),
      dividerTheme: DividerThemeData(color: border, thickness: .5, space: .5),
      listTileTheme: ListTileThemeData(
        iconColor: text2,
        textColor: text,
        minVerticalPadding: 12,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (s) =>
              s.contains(WidgetState.selected) ? AppColors.background : text2,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? AppColors.cyan : elevated,
        ),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.cyan,
        inactiveTrackColor: elevated,
        thumbColor: AppColors.cyan,
        overlayColor: AppColors.cyan.withValues(alpha: .12),
        trackHeight: 4,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.cyan,
          foregroundColor: AppColors.background,
          minimumSize: const Size(64, 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: text,
          minimumSize: const Size(64, 54),
          side: BorderSide(color: border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.cyan),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: surface,
        showDragHandle: true,
        dragHandleColor: border,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: elevated,
        contentTextStyle: TextStyle(color: text, fontSize: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(
          selectedBackgroundColor: AppColors.cyan.withValues(alpha: .16),
          selectedForegroundColor: AppColors.cyan,
          side: BorderSide(color: border),
        ),
      ),
    );
  }
}
