import 'package:corvista/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/common.dart';
import '../../l10n/l10n.dart';
import 'widgets/settings_labels.dart';

/// App language picker. `null` follows the iOS language.
class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final current = ref.watch(settingsProvider.select((s) => s.localeTag));
    final locales = [...AppLocalizations.supportedLocales]
      ..sort((a, b) {
        if (a.languageCode == 'en' && b.languageCode != 'en') return -1;
        if (b.languageCode == 'en' && a.languageCode != 'en') return 1;
        return localeNativeName(a.toLanguageTag())
            .compareTo(localeNativeName(b.toLanguageTag()));
      });

    Future<void> select(String? tag) => ref
        .read(settingsProvider.notifier)
        .update((s) => s.copyWith(localeTag: () => tag));

    Widget tile({
      required String title,
      String? subtitle,
      required String? tag,
    }) {
      // Exact match only, so "fr" and "fr-CA" are never both ticked.
      final selected =
          (current?.replaceAll('_', '-')) == tag?.replaceAll('_', '-');
      return ListTile(
        minTileHeight: 56,
        title: Text(title),
        subtitle: subtitle == null ? null : Text(subtitle),
        trailing: selected
            ? const Icon(Icons.check_rounded, color: AppColors.cyan)
            : null,
        selected: selected,
        onTap: () => select(tag),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.languageTitle)),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(top: 8, bottom: 32),
        children: [
          CvSection(
            footer: l10n.languageFooter,
            children: [
              tile(
                title: l10n.languageSystem,
                subtitle: l10n.languageSystemSubtitle,
                tag: null,
              ),
              for (final loc in locales)
                tile(
                  title: localeNativeName(loc.toLanguageTag()),
                  subtitle: loc.toLanguageTag(),
                  tag: loc.toLanguageTag(),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
