import 'package:corvista/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common.dart';
import '../../../core/widgets/format.dart';
import '../../../domain/models/app_settings.dart';
import '../../../l10n/l10n.dart';
import 'settings_labels.dart';
import 'settings_sections_capture.dart';
import 'settings_tiles.dart';

// ---------------------------------------------------------------- Driving

class DrivingSettingsSection extends ConsumerWidget {
  const DrivingSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final s = ref.watch(settingsProvider);
    return CvSection(
      title: l10n.settingsSectionDriving,
      children: [
        SettingChoiceTile<DriveView>(
          icon: Icons.view_carousel_outlined,
          title: l10n.settingsDefaultView,
          value: s.defaultView,
          options: [
            for (final v in DriveView.values)
              ChoiceOption(v, l10n.driveView(v)),
          ],
          onSelected: (v) =>
              updateSettings(ref, (x) => x.copyWith(defaultView: v)),
        ),
        SettingSegmentedTile<SpeedUnit>(
          icon: Icons.straighten_rounded,
          title: l10n.settingsUnits,
          value: s.speedUnit,
          options: [
            for (final u in SpeedUnit.values)
              ChoiceOption(u, l10n.speedUnit(u)),
          ],
          onSelected: (v) =>
              updateSettings(ref, (x) => x.copyWith(speedUnit: v)),
        ),
        SettingSwitchTile(
          icon: Icons.explore_outlined,
          title: l10n.settingsShowCompass,
          value: s.showCompass,
          onChanged: (v) =>
              updateSettings(ref, (x) => x.copyWith(showCompass: v)),
        ),
        SettingChoiceTile<HudStyle>(
          icon: Icons.dashboard_customize_outlined,
          title: l10n.settingsHudStyle,
          value: s.hudStyle,
          options: [
            for (final h in HudStyle.values)
              ChoiceOption(h, l10n.hudStyle(h), subtitle: l10n.hudStyleDesc(h)),
          ],
          onSelected: (v) =>
              updateSettings(ref, (x) => x.copyWith(hudStyle: v)),
        ),
        SettingNavTile(
          icon: Icons.tune_rounded,
          title: l10n.settingsHudCustomize,
          onTap: () => context.push(Routes.settingsHud),
        ),
        SettingChoiceTile<VirtualStyle>(
          icon: Icons.view_in_ar_outlined,
          title: l10n.settingsVirtualStyle,
          value: s.virtualStyle,
          options: [
            for (final v in VirtualStyle.values)
              ChoiceOption(v, l10n.virtualStyle(v)),
          ],
          onSelected: (v) =>
              updateSettings(ref, (x) => x.copyWith(virtualStyle: v)),
        ),
        SettingChoiceTile<DrivingSide>(
          icon: Icons.swap_horiz_rounded,
          title: l10n.settingsDrivingSide,
          value: s.drivingSide,
          options: [
            for (final v in DrivingSide.values)
              ChoiceOption(v, l10n.drivingSide(v)),
          ],
          onSelected: (v) =>
              updateSettings(ref, (x) => x.copyWith(drivingSide: v)),
        ),
        SettingSwitchTile(
          icon: Icons.my_location_rounded,
          title: l10n.settingsAutoRecenter,
          value: s.autoRecenter,
          onChanged: (v) =>
              updateSettings(ref, (x) => x.copyWith(autoRecenter: v)),
        ),
        SettingSwitchTile(
          icon: Icons.light_mode_outlined,
          title: l10n.settingsKeepScreenOn,
          value: s.keepScreenOn,
          onChanged: (v) =>
              updateSettings(ref, (x) => x.copyWith(keepScreenOn: v)),
        ),
        SettingSwitchTile(
          key: const ValueKey('settings-live-activity'),
          icon: Icons.dynamic_feed_rounded,
          title: l10n.settingsLiveActivity,
          subtitle: l10n.settingsLiveActivityDesc,
          value: s.liveActivity,
          onChanged: (v) =>
              updateSettings(ref, (x) => x.copyWith(liveActivity: v)),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- Power

class PowerSettingsSection extends ConsumerWidget {
  const PowerSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final mode = ref.watch(settingsProvider.select((s) => s.powerMode));
    final p = ref.watch(powerProvider);
    final battery = p.battery < 0
        ? l10n.commonNotAvailable
        : p.charging
        ? l10n.settingsBatteryCharging(Fmt.percent(context, p.battery))
        : Fmt.percent(context, p.battery);
    return CvSection(
      title: l10n.settingsSectionPower,
      footer: l10n.settingsPowerFooter,
      children: [
        SettingChoiceTile<PowerMode>(
          icon: Icons.bolt_outlined,
          title: l10n.settingsPowerMode,
          value: mode,
          options: [
            for (final m in PowerMode.values)
              ChoiceOption(m, l10n.powerMode(m)),
          ],
          onSelected: (v) =>
              updateSettings(ref, (x) => x.copyWith(powerMode: v)),
        ),
        SettingValueTile(
          icon: Icons.thermostat_outlined,
          title: l10n.settingsThermal,
          value: l10n.thermal(p.thermal),
          valueColor: thermalColor(p.thermal),
        ),
        SettingValueTile(
          icon: Icons.battery_std_outlined,
          title: l10n.settingsBattery,
          value: battery,
        ),
        SettingValueTile(
          icon: Icons.memory_rounded,
          title: l10n.settingsAiRate,
          value: l10n.settingsHzValue(
            Fmt.number(context, p.aiHz, decimals: p.aiHz < 10 ? 1 : 0),
          ),
        ),
        if (p.lowPowerMode || p.notice != null)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
            child: InfoBanner(
              tone: BannerTone.warning,
              message: [
                if (p.lowPowerMode) l10n.settingsLowPowerMode,
                ?p.notice,
              ].join('\n'),
            ),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------- Emergency

class EmergencySettingsSection extends ConsumerWidget {
  const EmergencySettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final s = ref.watch(settingsProvider);
    return CvSection(
      title: l10n.settingsSectionEmergency,
      footer: l10n.settingsEmergencyFooter,
      children: [
        SettingNavTile(
          icon: Icons.health_and_safety_outlined,
          title: l10n.settingsEmergencySetup,
          value: s.emergencyEnabled
              ? l10n.settingsEmergencyOn(s.emergencyCountdownS)
              : l10n.commonOff,
          onTap: () => context.push(Routes.emergencySetup),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- Appearance + language

class AppearanceSettingsSection extends ConsumerWidget {
  const AppearanceSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final s = ref.watch(settingsProvider);
    return Column(
      children: [
        CvSection(
          title: l10n.settingsSectionAppearance,
          children: [
            SettingSegmentedTile<ThemePref>(
              icon: Icons.contrast_rounded,
              title: l10n.settingsTheme,
              value: s.themePref,
              options: [
                for (final t in ThemePref.values)
                  ChoiceOption(t, l10n.themePref(t)),
              ],
              onSelected: (v) =>
                  updateSettings(ref, (x) => x.copyWith(themePref: v)),
            ),
            SettingSwitchTile(
              icon: Icons.animation_rounded,
              title: l10n.settingsReduceMotion,
              subtitle: l10n.settingsReduceMotionSubtitle,
              value: s.reduceMotion,
              onChanged: (v) =>
                  updateSettings(ref, (x) => x.copyWith(reduceMotion: v)),
            ),
          ],
        ),
        CvSection(
          title: l10n.settingsSectionLanguage,
          children: [
            SettingNavTile(
              icon: Icons.language_rounded,
              title: l10n.settingsAppLanguage,
              value: s.localeTag == null
                  ? l10n.languageSystem
                  : localeNativeName(s.localeTag!),
              onTap: () => context.push(Routes.settingsLanguage),
            ),
          ],
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- Privacy & data

class PrivacyDataSettingsSection extends ConsumerStatefulWidget {
  const PrivacyDataSettingsSection({super.key});

  @override
  ConsumerState<PrivacyDataSettingsSection> createState() =>
      _PrivacyDataSettingsSectionState();
}

class _PrivacyDataSettingsSectionState
    extends ConsumerState<PrivacyDataSettingsSection> {
  bool _erasing = false;

  Future<void> _deleteAll() async {
    final l10n = context.l10n;
    final ok = await confirmDialog(
      context,
      title: l10n.deleteAllTitle,
      message: l10n.deleteAllMessage,
      confirmLabel: l10n.deleteAllConfirm,
    );
    if (!ok || !mounted) return;
    // The app-level messenger and router outlive this screen, which the
    // onboarding redirect removes once settings are reset.
    final messenger = ScaffoldMessenger.maybeOf(context);
    final router = GoRouter.of(context);
    setState(() => _erasing = true);
    final report = await ref.read(dataEraserProvider).eraseAll();
    PaintingBinding.instance.imageCache
      ..clear()
      ..clearLiveImages();
    if (mounted) setState(() => _erasing = false);
    messenger
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            report.complete ? l10n.deleteAllDone : l10n.deleteAllPartial,
          ),
        ),
      );
    router.go(Routes.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CvSection(
      title: l10n.settingsSectionPrivacyData,
      footer: l10n.settingsPrivacyDataFooter,
      children: [
        SettingNavTile(
          icon: Icons.privacy_tip_outlined,
          title: l10n.settingsPrivacyPolicy,
          onTap: () => context.push(Routes.privacy),
        ),
        ListTile(
          enabled: !_erasing,
          leading: const Icon(
            Icons.delete_forever_outlined,
            size: 22,
            color: AppColors.red,
          ),
          title: Text(
            _erasing ? l10n.deleteAllInProgress : l10n.settingsDeleteAllData,
            style: const TextStyle(
              color: AppColors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(l10n.settingsDeleteAllDataSubtitle),
          trailing: _erasing
              ? const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : null,
          onTap: _erasing ? null : _deleteAll,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- Information

class InformationSettingsSection extends ConsumerStatefulWidget {
  const InformationSettingsSection({super.key});

  @override
  ConsumerState<InformationSettingsSection> createState() =>
      _InformationSettingsSectionState();
}

class _InformationSettingsSectionState
    extends ConsumerState<InformationSettingsSection> {
  late final Future<Map<Object?, Object?>> _info = ref
      .read(nativeEngineProvider)
      .systemInfo()
      .catchError((Object _) => const <Object?, Object?>{});

  Future<void> _support() async {
    final l10n = context.l10n;
    final uri = Uri(
      scheme: 'mailto',
      path: 'support@corvista.app',
      query: 'subject=Corvista%20support',
    );
    var ok = false;
    try {
      ok = await launchUrl(uri);
    } catch (_) {}
    if (!ok && mounted) showSnack(context, l10n.settingsSupportUnavailable);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CvSection(
      title: l10n.settingsSectionInformation,
      children: [
        SettingNavTile(
          icon: Icons.shield_outlined,
          title: l10n.settingsSafety,
          onTap: () => context.push(Routes.safety),
        ),
        SettingNavTile(
          icon: Icons.description_outlined,
          title: l10n.settingsTerms,
          onTap: () => context.push(Routes.terms),
        ),
        SettingNavTile(
          icon: Icons.help_outline_rounded,
          title: l10n.settingsHelp,
          onTap: () => context.push(Routes.help),
        ),
        SettingNavTile(
          icon: Icons.mail_outline_rounded,
          title: l10n.settingsSupport,
          external: true,
          onTap: _support,
        ),
        SettingNavTile(
          icon: Icons.article_outlined,
          title: l10n.settingsLicenses,
          onTap: () => showLicensePage(
            context: context,
            applicationName: 'Corvista',
            applicationLegalese: '© Corvista',
          ),
        ),
        SettingNavTile(
          icon: Icons.monitor_heart_outlined,
          title: l10n.settingsDiagnostics,
          onTap: () => context.push(Routes.settingsDiagnostics),
        ),
        FutureBuilder<Map<Object?, Object?>>(
          future: _info,
          builder: (context, snap) {
            final m = snap.data ?? const {};
            final version = m['appVersion'] as String? ?? '1.0.0';
            final build = m['build']?.toString() ?? '1';
            return SettingValueTile(
              icon: Icons.info_outline_rounded,
              title: l10n.settingsVersion,
              value: l10n.settingsVersionValue(version, build),
            );
          },
        ),
      ],
    );
  }
}
