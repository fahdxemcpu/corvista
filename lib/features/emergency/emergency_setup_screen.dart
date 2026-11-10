import 'package:corvista/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/common.dart';
import '../../l10n/l10n.dart';
import '../settings/widgets/settings_sections_capture.dart';
import '../settings/widgets/settings_tiles.dart';

/// Experimental impact detection setup. Must be completed while parked:
/// every control is locked while GPS speed exceeds 5 km/h.
class EmergencySetupScreen extends ConsumerStatefulWidget {
  const EmergencySetupScreen({super.key});

  @override
  ConsumerState<EmergencySetupScreen> createState() =>
      _EmergencySetupScreenState();
}

class _EmergencySetupScreenState extends ConsumerState<EmergencySetupScreen> {
  bool _testing = false;

  Future<void> _setEnabled(bool v) async {
    final l10n = context.l10n;
    final s = ref.read(settingsProvider);
    if (v && s.emergencyNumber.trim().isEmpty) {
      showSnack(context, l10n.emergencyNeedNumber);
      return;
    }
    await updateSettings(ref, (x) => x.copyWith(emergencyEnabled: v));
    try {
      final c = ref.read(emergencyProvider.notifier);
      v ? await c.arm() : await c.disarm();
    } catch (e) {
      if (mounted) showSnack(context, l10n.commonErrorDetail(e.toString()));
    }
  }

  bool _ok(PermissionStatus s) =>
      s == PermissionStatus.granted || s == PermissionStatus.limited;

  Future<void> _setVoiceCancel(bool v) async {
    final l10n = context.l10n;
    if (!v) {
      return updateSettings(
        ref,
        (x) => x.copyWith(emergencyVoiceCancel: false),
      );
    }
    final perms = ref.read(permissionsProvider.notifier);
    final mic = await perms.request(AppPermission.microphone);
    final speech = _ok(mic)
        ? await perms.request(AppPermission.speech)
        : PermissionStatus.denied;
    if (_ok(mic) && _ok(speech)) {
      await updateSettings(ref, (x) => x.copyWith(emergencyVoiceCancel: true));
    } else if (mounted) {
      showSnack(
        context,
        l10n.emergencyVoicePermDenied,
        actionLabel: l10n.commonOpenSettings,
        onAction: () => perms.openSettings(),
      );
    }
  }

  Future<void> _test() async {
    setState(() => _testing = true);
    try {
      await ref.read(emergencyProvider.notifier).simulateForTest();
    } catch (e) {
      if (mounted) {
        showSnack(context, context.l10n.commonErrorDetail(e.toString()));
      }
    } finally {
      if (mounted) setState(() => _testing = false);
    }
  }

  Future<void> _removeContact(EmergencyContact c) async {
    final l10n = context.l10n;
    final ok = await confirmDialog(
      context,
      title: l10n.emergencyRemoveContactTitle(c.name),
      message: l10n.emergencyRemoveContactBody,
      confirmLabel: l10n.emergencyRemove,
    );
    if (ok) {
      await ref.read(emergencyContactsProvider.notifier).remove(c.identifier);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final s = ref.watch(settingsProvider);
    final speed = ref.watch(locationProvider.select((l) => l.fix?.speed));
    final moving = speed != null && speed * 3.6 > 5;
    final editable = !moving;
    final contacts = ref.watch(emergencyContactsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.emergencySetupTitle)),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: ListView(
              padding: const EdgeInsetsDirectional.only(top: 8, bottom: 32),
              children: [
                if (moving)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 8),
                    child: InfoBanner(
                      tone: BannerTone.warning,
                      icon: Icons.local_parking_rounded,
                      message: l10n.emergencyParkedWarning,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.health_and_safety_outlined,
                                color: AppColors.cyan,
                                size: 28,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  l10n.emergencySetupTitle,
                                  style: theme.textTheme.titleLarge,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.amber),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  l10n.emergencyExperimental.toUpperCase(),
                                  style: const TextStyle(
                                    color: AppColors.amber,
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            l10n.emergencyIntro,
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 12),
                          for (final t in [
                            l10n.emergencyDisclaimer1,
                            l10n.emergencyDisclaimer2,
                            l10n.emergencyDisclaimer3,
                          ])
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.only(
                                      top: 2,
                                      end: 8,
                                    ),
                                    child: Icon(
                                      Icons.info_outline_rounded,
                                      size: 16,
                                      color: AppColors.amber,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      t,
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                CvSection(
                  children: [
                    SettingSwitchTile(
                      icon: Icons.sensors_rounded,
                      title: l10n.emergencyEnable,
                      subtitle: l10n.emergencyEnableSubtitle,
                      value: s.emergencyEnabled,
                      onChanged: editable ? _setEnabled : null,
                    ),
                  ],
                ),
                CvSection(
                  title: l10n.emergencyContacts,
                  children: [
                    ...contacts.when(
                      data: (list) => [
                        if (list.isEmpty)
                          ListTile(
                            leading: const Icon(Icons.people_outline_rounded),
                            title: Text(
                              l10n.emergencyNoContacts,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        for (final c in list)
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: AppColors.cyan.withValues(
                                alpha: .15,
                              ),
                              foregroundColor: AppColors.cyan,
                              child: Text(
                                c.name.isEmpty
                                    ? '?'
                                    : c.name.characters.first.toUpperCase(),
                              ),
                            ),
                            title: Text(c.name),
                            subtitle: Text(
                              c.phone,
                              textDirection: TextDirection.ltr,
                            ),
                            trailing: IconButton(
                              tooltip: l10n.emergencyRemove,
                              icon: const Icon(
                                Icons.remove_circle_outline_rounded,
                                color: AppColors.red,
                              ),
                              onPressed: editable
                                  ? () => _removeContact(c)
                                  : null,
                            ),
                          ),
                      ],
                      loading: () => [
                        const ListTile(title: LinearProgressIndicator()),
                      ],
                      error: (_, _) => [
                        ListTile(title: Text(l10n.emergencyContactsError)),
                      ],
                    ),
                    ListTile(
                      enabled: editable,
                      leading: const Icon(
                        Icons.person_add_alt_1_outlined,
                        color: AppColors.cyan,
                      ),
                      title: Text(
                        l10n.emergencyAddContact,
                        style: const TextStyle(color: AppColors.cyan),
                      ),
                      onTap: () async {
                        try {
                          await ref
                              .read(emergencyContactsProvider.notifier)
                              .pickAndAdd();
                        } catch (e) {
                          if (context.mounted) {
                            showSnack(
                              context,
                              l10n.commonErrorDetail(e.toString()),
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
                CvSection(
                  children: [
                    SettingTextTile(
                      icon: Icons.phone_in_talk_outlined,
                      title: l10n.emergencyNumber,
                      value: s.emergencyNumber,
                      placeholder: l10n.emergencyNotSet,
                      hint: l10n.emergencyNumberHint,
                      keyboardType: TextInputType.phone,
                      enabled: editable,
                      saveLabel: l10n.commonSave,
                      cancelLabel: l10n.commonCancel,
                      onChanged: (v) => updateSettings(
                        ref,
                        (x) => x.copyWith(
                          emergencyNumber: v.replaceAll(
                            RegExp(r'[^0-9+*#]'),
                            '',
                          ),
                        ),
                      ),
                    ),
                    SettingTextTile(
                      icon: Icons.sms_outlined,
                      title: l10n.emergencyMessage,
                      value: s.emergencyMessage,
                      placeholder: l10n.emergencyMessageDefault,
                      hint: l10n.emergencyMessageHint,
                      multiline: true,
                      enabled: editable,
                      saveLabel: l10n.commonSave,
                      cancelLabel: l10n.commonCancel,
                      onChanged: (v) => updateSettings(
                        ref,
                        (x) => x.copyWith(emergencyMessage: v),
                      ),
                    ),
                    SettingSegmentedTile<int>(
                      icon: Icons.timer_outlined,
                      title: l10n.emergencyCountdown,
                      enabled: editable,
                      value: s.emergencyCountdownS,
                      options: [
                        for (final v in const [15, 30, 45, 60])
                          ChoiceOption(v, l10n.settingsSecondsShort(v)),
                      ],
                      onSelected: (v) => updateSettings(
                        ref,
                        (x) => x.copyWith(emergencyCountdownS: v),
                      ),
                    ),
                    SettingSwitchTile(
                      icon: Icons.keyboard_voice_outlined,
                      title: l10n.emergencyVoiceCancel,
                      subtitle: l10n.emergencyVoiceCancelSubtitle,
                      value: s.emergencyVoiceCancel,
                      onChanged: editable ? _setVoiceCancel : null,
                    ),
                    SettingSwitchTile(
                      icon: Icons.video_file_outlined,
                      title: l10n.emergencyAutoSave,
                      value: s.emergencyAutoSaveClip,
                      onChanged: editable
                          ? (v) => updateSettings(
                              ref,
                              (x) => x.copyWith(emergencyAutoSaveClip: v),
                            )
                          : null,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OutlinedButton.icon(
                        onPressed: editable && !_testing ? _test : null,
                        icon: _testing
                            ? const SizedBox.square(
                                dimension: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.science_outlined),
                        label: Text(l10n.emergencyTest),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.emergencyTestBody,
                        style: theme.textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
