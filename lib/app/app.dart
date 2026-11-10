import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/memory/memory_pressure.dart';
import '../core/theme/app_theme.dart';
import '../domain/models/app_settings.dart';
import '../features/navigation/background_nav_bridge.dart';
import '../features/navigation/live_activity_bridge.dart';
import '../l10n/app_localizations.dart';
import 'providers.dart';
import 'router.dart';

class CorvistaApp extends ConsumerWidget {
  const CorvistaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    ref.watch(backgroundNavBridgeProvider);
    ref.watch(liveActivityBridgeProvider);
    final themePref = ref.watch(settingsProvider.select((s) => s.themePref));
    final localeTag = ref.watch(settingsProvider.select((s) => s.localeTag));
    ref.watch(
      memoryPressureProvider,
    ); // frees image caches on native memory warnings

    // Possible-impact countdown: surface the full-screen alert from anywhere.
    ref.listen(emergencyProvider.select((s) => s.phase), (prev, next) {
      if (next == EmergencyPhase.countdown &&
          prev != EmergencyPhase.countdown) {
        final loc = router.state.matchedLocation;
        if (loc != Routes.emergencyAlert) router.push(Routes.emergencyAlert);
      }
    });

    return MaterialApp.router(
      onGenerateTitle: (c) => AppLocalizations.of(c).appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: switch (themePref) {
        ThemePref.system => ThemeMode.system,
        ThemePref.dark => ThemeMode.dark,
        ThemePref.light => ThemeMode.light,
      },
      locale: _parseLocale(localeTag),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}

/// Parses a BCP-47-ish tag ("pt-BR", "zh-Hant", "fr") into a [Locale].
Locale? _parseLocale(String? tag) {
  if (tag == null || tag.isEmpty) return null;
  final parts = tag.split(RegExp('[-_]'));
  String? script, country;
  for (final p in parts.skip(1)) {
    if (p.length == 4) {
      script = p;
    } else if (p.length == 2 || p.length == 3) {
      country = p.toUpperCase();
    }
  }
  return Locale.fromSubtags(
    languageCode: parts.first,
    scriptCode: script,
    countryCode: country,
  );
}
