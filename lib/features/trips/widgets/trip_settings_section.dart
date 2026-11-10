import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/providers.dart';
import '../../../app/router.dart';
import '../../../domain/models/app_settings.dart';
import '../../../core/widgets/common.dart';
import '../../../l10n/l10n.dart';
import '../../settings/widgets/settings_tiles.dart';

/// Settings → Trip log: on/off, retention, open the log.
class TripSettingsSection extends ConsumerWidget {
  const TripSettingsSection({super.key});

  static const retentionOptions = [7, 30, 90, 365, 0];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final s = ref.watch(settingsProvider);
    final count = ref.watch(tripsProvider).value?.length;
    String label(int d) => switch (d) {
      0 => l10n.settingsRetentionForever,
      365 => l10n.settingsRetentionYear,
      _ => l10n.settingsRetentionDays(d),
    };
    Future<void> update(AppSettings Function(AppSettings) f) =>
        ref.read(settingsProvider.notifier).update(f);
    return CvSection(
      title: l10n.settingsSectionTrips,
      footer: l10n.settingsTripRetentionFooter,
      children: [
        SettingSwitchTile(
          icon: Icons.route_rounded,
          title: l10n.settingsTripLog,
          subtitle: l10n.settingsTripLogSubtitle,
          value: s.tripLogEnabled,
          onChanged: (v) => update((x) => x.copyWith(tripLogEnabled: v)),
        ),
        SettingChoiceTile<int>(
          icon: Icons.auto_delete_outlined,
          title: l10n.settingsTripRetention,
          value: retentionOptions.contains(s.tripRetentionDays)
              ? s.tripRetentionDays
              : 90,
          options: [
            for (final d in retentionOptions) ChoiceOption(d, label(d)),
          ],
          onSelected: (d) => update((x) => x.copyWith(tripRetentionDays: d)),
        ),
        SettingNavTile(
          icon: Icons.map_outlined,
          title: l10n.settingsViewTrips,
          value: count == null ? null : l10n.tripsCount(count),
          onTap: () => context.push(Routes.trips),
        ),
      ],
    );
  }
}
