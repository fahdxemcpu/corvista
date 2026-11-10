import 'package:corvista/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/widgets/common.dart';
import '../../../core/widgets/format.dart';
import '../../../domain/models/app_settings.dart';
import '../../../l10n/l10n.dart';
import '../../ai_models/ai_models_screen.dart' show modelDisplayName;
import 'settings_labels.dart';
import 'settings_tiles.dart';

Future<void> updateSettings(
  WidgetRef ref,
  AppSettings Function(AppSettings s) f,
) => ref.read(settingsProvider.notifier).update(f);

/// Persists a recording-related change and pushes it to the native recorder.
Future<void> updateRecording(
  WidgetRef ref,
  AppSettings Function(AppSettings s) f,
) async {
  await updateSettings(ref, f);
  try {
    await ref.read(recorderProvider.notifier).applyConfig();
  } catch (_) {
    // Recorder not running yet: config is applied when the next drive starts.
  }
}

String _pct(BuildContext context, double v) => Fmt.percent(context, v);

// ---------------------------------------------------------------- Camera

class CameraSettingsSection extends ConsumerStatefulWidget {
  const CameraSettingsSection({super.key});

  @override
  ConsumerState<CameraSettingsSection> createState() =>
      _CameraSettingsSectionState();
}

class _CameraSettingsSectionState extends ConsumerState<CameraSettingsSection> {
  @override
  void initState() {
    super.initState();
    if (ref.read(cameraProvider).devices.isEmpty) {
      Future.microtask(
        () => ref
            .read(cameraProvider.notifier)
            .loadDevices()
            .catchError((Object _) {}),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final s = ref.watch(settingsProvider);
    final devices = ref.watch(cameraProvider.select((c) => c.devices));
    final available = {for (final d in devices) d['deviceType'] as String?};
    bool has(String t) => devices.isEmpty || available.contains(t);
    final stabModes = <String>{
      for (final d in devices.where((d) => d['deviceType'] == s.cameraDevice))
        ...((d['stabilizationModes'] as List?)?.cast<String>() ??
            const <String>[]),
    };
    bool stabOk(String m) =>
        m == 'auto' || m == 'off' || stabModes.isEmpty || stabModes.contains(m);

    return CvSection(
      title: l10n.settingsSectionCamera,
      footer: l10n.settingsCameraFooter,
      children: [
        SettingChoiceTile<String>(
          icon: Icons.camera_outlined,
          title: l10n.settingsCameraLens,
          value: s.cameraDevice,
          options: [
            for (final t in const ['wide', 'ultraWide', 'telephoto'])
              ChoiceOption(
                t,
                l10n.lens(t),
                enabled: has(t),
                subtitle: has(t) ? null : l10n.settingsLensUnavailable,
              ),
          ],
          onSelected: (v) =>
              updateSettings(ref, (x) => x.copyWith(cameraDevice: v)),
        ),
        SettingChoiceTile<String>(
          icon: Icons.vibration_rounded,
          title: l10n.settingsStabilization,
          value: s.stabilization,
          options: [
            for (final m in const ['auto', 'off', 'standard', 'cinematic'])
              ChoiceOption(m, l10n.stabilization(m), enabled: stabOk(m)),
          ],
          onSelected: (v) =>
              updateSettings(ref, (x) => x.copyWith(stabilization: v)),
        ),
        SettingSliderTile(
          icon: Icons.layers_outlined,
          title: l10n.settingsOverlayOpacity,
          value: s.overlayOpacity,
          min: .2,
          max: 1,
          divisions: 16,
          format: (v) => _pct(context, v),
          onChanged: (v) =>
              updateSettings(ref, (x) => x.copyWith(overlayOpacity: v)),
        ),
        SettingSwitchTile(
          icon: Icons.speed_rounded,
          title: l10n.settingsShowFps,
          subtitle: l10n.settingsShowFpsSubtitle,
          value: s.showFps,
          onChanged: (v) => updateSettings(ref, (x) => x.copyWith(showFps: v)),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- AI

class AiSettingsSection extends ConsumerWidget {
  const AiSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final s = ref.watch(settingsProvider);
    final ai = ref.watch(aiModelsProvider);
    final model = ai.models.where((m) => m.id == ai.selectedId).firstOrNull;
    return CvSection(
      title: l10n.settingsSectionAi,
      footer: l10n.settingsAiFooter,
      children: [
        SettingNavTile(
          icon: Icons.memory_rounded,
          title: l10n.settingsAiModel,
          value: model != null
              ? modelDisplayName(l10n, model)
              : l10n.modelsEfficientName,
          onTap: () => context.push(Routes.models),
        ),
        SettingSliderTile(
          icon: Icons.tune_rounded,
          title: l10n.settingsConfidence,
          value: s.confidenceThreshold,
          min: .2,
          max: .8,
          divisions: 12,
          format: (v) => _pct(context, v),
          onChanged: (v) =>
              updateSettings(ref, (x) => x.copyWith(confidenceThreshold: v)),
        ),
        SettingSwitchTile(
          icon: Icons.track_changes_rounded,
          title: l10n.settingsTracking,
          subtitle: l10n.settingsTrackingSubtitle,
          value: s.trackingEnabled,
          onChanged: (v) =>
              updateSettings(ref, (x) => x.copyWith(trackingEnabled: v)),
        ),
        SettingSwitchTile(
          icon: Icons.label_outline_rounded,
          title: l10n.settingsShowLabels,
          value: s.showLabels,
          onChanged: (v) =>
              updateSettings(ref, (x) => x.copyWith(showLabels: v)),
        ),
        SettingSwitchTile(
          icon: Icons.percent_rounded,
          title: l10n.settingsShowConfidence,
          value: s.showConfidence,
          onChanged: s.showLabels
              ? (v) => updateSettings(ref, (x) => x.copyWith(showConfidence: v))
              : null,
        ),
        SettingSliderTile(
          icon: Icons.blur_on_rounded,
          title: l10n.settingsSegmentationOpacity,
          value: s.segmentationOpacity,
          min: .1,
          max: .9,
          divisions: 16,
          format: (v) => _pct(context, v),
          onChanged: (v) =>
              updateSettings(ref, (x) => x.copyWith(segmentationOpacity: v)),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- Alerts

/// Languages that have spoken alert phrases (AlertPhrases).
const _alertLanguages = [
  'en',
  'fr',
  'ar',
  'es',
  'de',
  'pt',
  'it',
  'nl',
  'tr',
  'hi',
  'zh',
  'ja',
];

class AlertSettingsSection extends ConsumerWidget {
  const AlertSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final s = ref.watch(settingsProvider);
    final voices = ref.watch(voiceAlertsProvider.select((v) => v.voices));
    String lang(Map v) =>
        (v['language'] as String? ?? '').split(RegExp('[-_]')).first;
    final installedLangs = {for (final v in voices) lang(v)};
    final effectiveLang =
        (s.voiceLanguage ??
                s.localeTag ??
                Localizations.localeOf(context).languageCode)
            .split(RegExp('[-_]'))
            .first;
    final langVoices = voices.where((v) => lang(v) == effectiveLang).toList();
    final on = s.voiceAlerts;

    String qualityLabel(Map v) => switch (v['quality']) {
      'enhanced' => ' · ${l10n.settingsVoiceQualityEnhanced}',
      'premium' => ' · ${l10n.settingsVoiceQualityPremium}',
      _ => '',
    };

    return Column(
      children: [
        CvSection(
          title: l10n.settingsSectionAlerts,
          footer: l10n.settingsAlertsFooter,
          children: [
            SettingSwitchTile(
              icon: Icons.record_voice_over_outlined,
              title: l10n.settingsVoiceAlerts,
              value: on,
              onChanged: (v) =>
                  updateSettings(ref, (x) => x.copyWith(voiceAlerts: v)),
            ),
            SettingChoiceTile<String?>(
              icon: Icons.translate_rounded,
              title: l10n.settingsVoiceLanguage,
              enabled: on,
              value: s.voiceLanguage,
              options: [
                ChoiceOption<String?>(null, l10n.settingsVoiceLanguageAuto),
                for (final code in _alertLanguages)
                  ChoiceOption<String?>(
                    code,
                    localeNativeName(code),
                    enabled: voices.isEmpty || installedLangs.contains(code),
                    subtitle:
                        voices.isNotEmpty && !installedLangs.contains(code)
                        ? l10n.settingsNoVoices
                        : null,
                  ),
              ],
              onSelected: (v) => updateSettings(
                ref,
                (x) => x.copyWith(voiceLanguage: () => v, voiceId: () => null),
              ),
            ),
            SettingChoiceTile<String?>(
              icon: Icons.graphic_eq_rounded,
              title: l10n.settingsVoice,
              enabled: on,
              value: langVoices.any((v) => v['id'] == s.voiceId)
                  ? s.voiceId
                  : null,
              options: [
                ChoiceOption<String?>(null, l10n.settingsVoiceDefault),
                for (final v in langVoices)
                  ChoiceOption<String?>(
                    v['id'] as String?,
                    '${v['name']}${qualityLabel(v)}',
                  ),
              ],
              onSelected: (v) =>
                  updateSettings(ref, (x) => x.copyWith(voiceId: () => v)),
            ),
            if (on && voices.isNotEmpty && langVoices.isEmpty)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                child: InfoBanner(
                  message: l10n.settingsNoVoices,
                  tone: BannerTone.warning,
                ),
              ),
            SettingSegmentedTile<AlertSensitivity>(
              icon: Icons.sensors_rounded,
              title: l10n.settingsSensitivity,
              enabled: on,
              value: s.alertSensitivity,
              options: [
                for (final v in AlertSensitivity.values)
                  ChoiceOption(v, l10n.sensitivity(v)),
              ],
              onSelected: (v) =>
                  updateSettings(ref, (x) => x.copyWith(alertSensitivity: v)),
            ),
            SettingSliderTile(
              icon: Icons.timer_outlined,
              title: l10n.settingsCooldown,
              enabled: on,
              value: s.alertCooldownS.toDouble(),
              min: 4,
              max: 60,
              divisions: 14,
              format: (v) => l10n.settingsSecondsShort(v.round()),
              onChanged: (v) => updateSettings(
                ref,
                (x) => x.copyWith(alertCooldownS: v.round()),
              ),
            ),
            SettingSliderTile(
              icon: Icons.volume_up_outlined,
              title: l10n.settingsVolume,
              enabled: on,
              value: s.voiceVolume,
              min: 0,
              max: 1,
              divisions: 20,
              format: (v) => _pct(context, v),
              onChanged: (v) =>
                  updateSettings(ref, (x) => x.copyWith(voiceVolume: v)),
            ),
            SettingSwitchTile(
              icon: Icons.notifications_paused_outlined,
              title: l10n.settingsQuietMode,
              subtitle: l10n.settingsQuietModeSubtitle,
              value: s.quietMode,
              onChanged: on
                  ? (v) => updateSettings(ref, (x) => x.copyWith(quietMode: v))
                  : null,
            ),
            SettingNavTile(
              icon: Icons.play_circle_outline_rounded,
              title: l10n.settingsTestVoice,
              enabled: on,
              onTap: () async {
                showSnack(context, l10n.settingsTestVoiceDone);
                try {
                  await ref.read(voiceAlertsProvider.notifier).testSpeak();
                } catch (e) {
                  if (context.mounted) {
                    showSnack(context, l10n.commonErrorDetail(e.toString()));
                  }
                }
              },
            ),
            SettingSwitchTile(
              icon: Icons.surround_sound_outlined,
              title: l10n.settingsParkingBeeps,
              value: s.parkingBeeps,
              onChanged: (v) =>
                  updateSettings(ref, (x) => x.copyWith(parkingBeeps: v)),
            ),
            SettingSliderTile(
              icon: Icons.volume_down_outlined,
              title: l10n.settingsBeepVolume,
              enabled: s.parkingBeeps,
              value: s.beepVolume,
              min: 0,
              max: 1,
              divisions: 20,
              format: (v) => _pct(context, v),
              onChanged: (v) =>
                  updateSettings(ref, (x) => x.copyWith(beepVolume: v)),
            ),
          ],
        ),
        CvSection(
          title: l10n.settingsSectionAlertCategories,
          children: [
            _cat(
              ref,
              on,
              Icons.directions_walk_rounded,
              l10n.settingsAlertPedestrian,
              s.alertPedestrian,
              (x, v) => x.copyWith(alertPedestrian: v),
            ),
            _cat(
              ref,
              on,
              Icons.pedal_bike_rounded,
              l10n.settingsAlertCyclist,
              s.alertCyclist,
              (x, v) => x.copyWith(alertCyclist: v),
            ),
            _cat(
              ref,
              on,
              Icons.two_wheeler_rounded,
              l10n.settingsAlertMotorcycle,
              s.alertMotorcycle,
              (x, v) => x.copyWith(alertMotorcycle: v),
            ),
            _cat(
              ref,
              on,
              Icons.directions_bus_rounded,
              l10n.settingsAlertBus,
              s.alertBus,
              (x, v) => x.copyWith(alertBus: v),
            ),
            _cat(
              ref,
              on,
              Icons.directions_car_rounded,
              l10n.settingsAlertVehicleClose,
              s.alertVehicleClose,
              (x, v) => x.copyWith(alertVehicleClose: v),
            ),
            _cat(
              ref,
              on,
              Icons.traffic_rounded,
              l10n.settingsAlertTrafficLight,
              s.alertTrafficLight,
              (x, v) => x.copyWith(alertTrafficLight: v),
            ),
            _cat(
              ref,
              on,
              Icons.moving_rounded,
              l10n.settingsAlertTrafficMoving,
              s.alertTrafficMoving,
              (x, v) => x.copyWith(alertTrafficMoving: v),
            ),
            _cat(
              ref,
              on,
              Icons.do_not_disturb_on_outlined,
              l10n.settingsAlertStopSign,
              s.alertStopSign,
              (x, v) => x.copyWith(alertStopSign: v),
            ),
          ],
        ),
      ],
    );
  }

  Widget _cat(
    WidgetRef ref,
    bool enabled,
    IconData icon,
    String title,
    bool value,
    AppSettings Function(AppSettings x, bool v) apply,
  ) => SettingSwitchTile(
    icon: icon,
    title: title,
    value: value,
    onChanged: enabled ? (v) => updateSettings(ref, (x) => apply(x, v)) : null,
  );
}

// ---------------------------------------------------------------- Recording

class RecordingSettingsSection extends ConsumerWidget {
  const RecordingSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final s = ref.watch(settingsProvider);
    final storage = ref.watch(storageInfoProvider);
    final micStatus = ref.watch(
      permissionsProvider.select((p) => p[AppPermission.microphone]),
    );
    final micDenied =
        micStatus == PermissionStatus.denied ||
        micStatus == PermissionStatus.restricted;

    Future<void> setAudio(bool v) async {
      if (!v) {
        return updateRecording(ref, (x) => x.copyWith(recordAudio: false));
      }
      final st = await ref
          .read(permissionsProvider.notifier)
          .request(AppPermission.microphone);
      if (st == PermissionStatus.granted || st == PermissionStatus.limited) {
        await updateRecording(ref, (x) => x.copyWith(recordAudio: true));
      } else if (context.mounted) {
        showSnack(
          context,
          l10n.settingsMicDenied,
          actionLabel: l10n.commonOpenSettings,
          onAction: () => ref.read(permissionsProvider.notifier).openSettings(),
        );
      }
    }

    return CvSection(
      title: l10n.settingsSectionRecording,
      footer: l10n.settingsRecordingFooter,
      children: [
        SettingChoiceTile<RecordingProfile>(
          icon: Icons.high_quality_outlined,
          title: l10n.settingsRecordingProfile,
          value: s.recordingProfile,
          options: [
            ChoiceOption(
              RecordingProfile.standard,
              l10n.settingsProfileStandard,
            ),
            ChoiceOption(RecordingProfile.premium, l10n.settingsProfilePremium),
          ],
          onSelected: (v) =>
              updateRecording(ref, (x) => x.copyWith(recordingProfile: v)),
        ),
        SettingSegmentedTile<int>(
          icon: Icons.history_rounded,
          title: l10n.settingsBufferLength,
          value: s.bufferSeconds,
          options: [
            ChoiceOption(20, l10n.settingsBufferSeconds(20)),
            ChoiceOption(30, l10n.settingsBufferSeconds(30)),
          ],
          onSelected: (v) =>
              updateRecording(ref, (x) => x.copyWith(bufferSeconds: v)),
        ),
        // Manual (continuous) recording auto-stop.
        SettingSegmentedTile<int>(
          icon: Icons.fiber_manual_record_outlined,
          title: l10n.settingsManualMaxLength,
          value: s.manualMaxMinutes,
          options: [
            for (final m in const [15, 30, 60])
              ChoiceOption(m, l10n.settingsManualMaxMinutes(m)),
            ChoiceOption(0, l10n.settingsManualMaxUnlimited),
          ],
          onSelected: (v) =>
              updateSettings(ref, (x) => x.copyWith(manualMaxMinutes: v)),
        ),
        SettingSwitchTile(
          icon: Icons.mic_none_rounded,
          title: l10n.settingsRecordAudio,
          subtitle: l10n.settingsRecordAudioSubtitle,
          value: s.recordAudio && !micDenied,
          onChanged: setAudio,
        ),
        if (s.recordAudio && micDenied)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
            child: InfoBanner(
              tone: BannerTone.warning,
              message: l10n.settingsMicDenied,
              actionLabel: l10n.commonOpenSettings,
              onAction: () =>
                  ref.read(permissionsProvider.notifier).openSettings(),
            ),
          ),
        SettingSwitchTile(
          icon: Icons.branding_watermark_outlined,
          title: l10n.settingsWatermark,
          value: s.watermark,
          onChanged: (v) =>
              updateRecording(ref, (x) => x.copyWith(watermark: v)),
        ),
        SettingSwitchTile(
          icon: Icons.schedule_rounded,
          title: l10n.settingsTimestamp,
          value: s.timestamp,
          onChanged: (v) =>
              updateRecording(ref, (x) => x.copyWith(timestamp: v)),
        ),
        SettingSwitchTile(
          icon: Icons.location_on_outlined,
          title: l10n.settingsSaveLocation,
          value: s.saveLocation,
          onChanged: (v) =>
              updateSettings(ref, (x) => x.copyWith(saveLocation: v)),
        ),
        SettingNavTile(
          icon: Icons.sd_storage_outlined,
          title: l10n.settingsStorage,
          subtitle: storage.when(
            data: (i) => l10n.settingsStorageSummary(
              i.clipCount,
              Fmt.bytes(context, i.clipsBytes + i.bufferBytes),
              Fmt.bytes(context, i.freeBytes),
            ),
            loading: () => l10n.commonLoading,
            error: (_, _) => l10n.commonNotAvailable,
          ),
          onTap: () => context.push(Routes.clips),
        ),
        SettingNavTile(
          icon: Icons.cleaning_services_outlined,
          title: l10n.settingsFreeUpSpace,
          subtitle: l10n.settingsFreeUpSpaceSubtitle,
          onTap: () => _freeUpSpace(context, ref),
        ),
      ],
    );
  }

  /// Deletes temporary data only (stale buffer segments, partial exports,
  /// share/GPX temp files, orphan thumbnails, image caches). Saved clips and
  /// trips are never touched.
  Future<void> _freeUpSpace(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    // Shared with the Clips library header (lib/features/clips/clip_actions.dart).
    final freed = await ref.read(clipActionsProvider).freeUpSpace();
    ref.invalidate(storageInfoProvider);
    if (!context.mounted) return;
    showSnack(
      context,
      freed > 0
          ? l10n.settingsFreedBytes(Fmt.bytes(context, freed))
          : l10n.settingsNothingToFree,
    );
  }
}
