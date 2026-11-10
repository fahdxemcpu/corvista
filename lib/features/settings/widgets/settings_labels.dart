import 'package:corvista/app/providers.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../domain/models/app_settings.dart';
import '../../../l10n/l10n.dart';

/// Localized labels for settings enums.
extension SettingsL10n on AppLocalizations {
  String hudStyle(HudStyle s) => switch (s) {
    HudStyle.classic => settingsHudStyleClassic,
    HudStyle.grid => settingsHudStyleGrid,
    HudStyle.minimal => settingsHudStyleMinimal,
    HudStyle.performance => settingsHudStylePerformance,
    HudStyle.navigation => settingsHudStyleNavigation,
    HudStyle.night => settingsHudStyleNight,
    HudStyle.highContrast => settingsHudStyleHighContrast,
  };

  String hudStyleDesc(HudStyle s) => switch (s) {
    HudStyle.classic => hudCustomDescClassic,
    HudStyle.grid => hudCustomDescGrid,
    HudStyle.minimal => hudCustomDescMinimal,
    HudStyle.performance => hudCustomDescPerformance,
    HudStyle.navigation => hudCustomDescNavigation,
    HudStyle.night => hudCustomDescNight,
    HudStyle.highContrast => hudCustomDescHighContrast,
  };

  String powerMode(PowerMode m) => switch (m) {
    PowerMode.balanced => settingsPowerBalanced,
    PowerMode.performance => settingsPowerPerformance,
    PowerMode.powerSaver => settingsPowerSaver,
  };

  String sensitivity(AlertSensitivity s) => switch (s) {
    AlertSensitivity.low => settingsSensitivityLow,
    AlertSensitivity.medium => settingsSensitivityMedium,
    AlertSensitivity.high => settingsSensitivityHigh,
  };

  String virtualStyle(VirtualStyle s) => switch (s) {
    VirtualStyle.minimal => settingsVirtualMinimal,
    VirtualStyle.perspective => settingsVirtualPerspective,
    VirtualStyle.highContrast => settingsVirtualHighContrast,
  };

  String drivingSide(DrivingSide s) => switch (s) {
    DrivingSide.auto => settingsDrivingSideAuto,
    DrivingSide.right => settingsDrivingSideRight,
    DrivingSide.left => settingsDrivingSideLeft,
  };

  String themePref(ThemePref t) => switch (t) {
    ThemePref.system => settingsThemeSystem,
    ThemePref.dark => settingsThemeDark,
    ThemePref.light => settingsThemeLight,
  };

  String lens(String deviceType) => switch (deviceType) {
    'ultraWide' => settingsLensUltraWide,
    'telephoto' => settingsLensTelephoto,
    _ => settingsLensWide,
  };

  String stabilization(String mode) => switch (mode) {
    'off' => settingsStabOff,
    'standard' => settingsStabStandard,
    'cinematic' => settingsStabCinematic,
    _ => settingsStabAuto,
  };

  String thermal(ThermalLevel t) => switch (t) {
    ThermalLevel.nominal => settingsThermalNominal,
    ThermalLevel.fair => settingsThermalFair,
    ThermalLevel.serious => settingsThermalSerious,
    ThermalLevel.critical => settingsThermalCritical,
  };

  String cameraStatus(CameraStatus s) => switch (s) {
    CameraStatus.idle => diagCamIdle,
    CameraStatus.starting => diagCamStarting,
    CameraStatus.running => diagCamRunning,
    CameraStatus.interrupted => diagCamInterrupted,
    CameraStatus.stopped => diagCamStopped,
    CameraStatus.unavailable => diagCamUnavailable,
    CameraStatus.permissionDenied => diagCamPermissionDenied,
    CameraStatus.error => diagCamError,
  };
}

Color thermalColor(ThermalLevel t) => switch (t) {
  ThermalLevel.nominal => AppColors.green,
  ThermalLevel.fair => AppColors.amber,
  ThermalLevel.serious => AppColors.red,
  ThermalLevel.critical => AppColors.red,
};

/// Native-language names for app locales (shown in the language list).
/// Native display names keyed by BCP-47 tag (most specific first in lookup).
const localeNativeNames = <String, String>{
  'en': 'English',
  'en-GB': 'English (UK)',
  'fr': 'Français',
  'fr-CA': 'Français (Canada)',
  'es': 'Español (España)',
  'es-419': 'Español (Latinoamérica)',
  'pt': 'Português (Brasil)',
  'pt-PT': 'Português (Portugal)',
  'de': 'Deutsch',
  'ar': 'العربية',
  'it': 'Italiano',
  'nl': 'Nederlands',
  'tr': 'Türkçe',
  'hi': 'हिन्दी',
  'zh': '简体中文',
  'zh-Hant': '繁體中文',
  'ja': '日本語',
  'ko': '한국어',
  'ru': 'Русский',
  'uk': 'Українська',
  'pl': 'Polski',
  'cs': 'Čeština',
  'sk': 'Slovenčina',
  'sv': 'Svenska',
  'da': 'Dansk',
  'nb': 'Norsk bokmål',
  'fi': 'Suomi',
  'hu': 'Magyar',
  'ro': 'Română',
  'el': 'Ελληνικά',
  'bg': 'Български',
  'hr': 'Hrvatski',
  'he': 'עברית',
  'fa': 'فارسی',
  'ur': 'اردو',
  'id': 'Bahasa Indonesia',
  'ms': 'Bahasa Melayu',
  'vi': 'Tiếng Việt',
  'th': 'ไทย',
  'bn': 'বাংলা',
  'ta': 'தமிழ்',
  'ca': 'Català',
  'lt': 'Lietuvių',
};

String localeNativeName(String tag) {
  final t = tag.replaceAll('_', '-');
  return localeNativeNames[t] ?? localeNativeNames[t.split('-').first] ?? tag;
}
