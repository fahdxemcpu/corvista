import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/ai_models/ai_models_screen.dart';
import '../features/clips/clip_player_screen.dart';
import '../features/clips/clips_screen.dart';
import '../features/emergency/emergency_alert_screen.dart';
import '../features/emergency/emergency_setup_screen.dart';
import '../features/hud/drive_screen.dart';
import '../features/navigation/widgets/destination_sheet.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/onboarding/permissions_screen.dart';
import '../features/settings/diagnostics_screen.dart';
import '../features/settings/hud_customize_screen.dart';
import '../features/settings/info_screens.dart';
import '../features/settings/language_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/trips/trip_detail_screen.dart';
import '../features/trips/trips_screen.dart';
import 'providers.dart';

/// Route paths. Use these constants instead of string literals.
abstract final class Routes {
  static const onboarding = '/onboarding';
  static const permissions = '/permissions';
  static const drive = '/drive';
  static const clips = '/clips';
  static String clip(String id) => '/clips/$id';
  static const settings = '/settings';
  static const settingsHud = '/settings/hud';
  static const settingsLanguage = '/settings/language';
  static const settingsDiagnostics = '/settings/diagnostics';
  static const privacy = '/settings/privacy';
  static const terms = '/settings/terms';
  static const help = '/settings/help';
  static const models = '/models';
  static const emergencySetup = '/emergency/setup';
  static const emergencyAlert = '/emergency/alert';
  static const safety = '/safety';
  static const destination = '/destination';
  static const trips = '/trips';
  static String trip(String id) => '/trips/$id';

  /// Reachable before onboarding is complete.
  static const preOnboarding = {
    onboarding,
    permissions,
    safety,
    privacy,
    terms,
  };
}

/// A go_router page that presents its child as a modal bottom sheet.
class SheetPage<T> extends Page<T> {
  const SheetPage({required this.child, super.key, super.name});

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
    settings: this,
    builder: (_) => child,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
  );
}

final routerProvider = Provider<GoRouter>((ref) {
  final onboardingDone = ValueNotifier<bool>(
    ref.read(settingsProvider).onboardingDone,
  );
  ref.listen(
    settingsProvider.select((s) => s.onboardingDone),
    (_, v) => onboardingDone.value = v,
  );
  ref.onDispose(onboardingDone.dispose);

  final router = GoRouter(
    initialLocation: Routes.drive,
    refreshListenable: onboardingDone,
    redirect: (context, state) {
      final loc = state.matchedLocation;
      if (!onboardingDone.value) {
        return Routes.preOnboarding.contains(loc) ? null : Routes.onboarding;
      }
      if (loc == Routes.onboarding) return Routes.drive;
      return null;
    },
    routes: [
      GoRoute(
        path: Routes.onboarding,
        builder: (_, _) => const OnboardingScreen(),
      ),
      GoRoute(
        path: Routes.permissions,
        builder: (_, _) => const PermissionsScreen(),
      ),
      GoRoute(path: Routes.drive, builder: (_, _) => const DriveScreen()),
      GoRoute(
        path: Routes.clips,
        builder: (_, _) => const ClipsScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (_, s) =>
                ClipPlayerScreen(clipId: s.pathParameters['id']!),
          ),
        ],
      ),
      GoRoute(
        path: Routes.settings,
        builder: (_, _) => const SettingsScreen(),
        routes: [
          GoRoute(path: 'hud', builder: (_, _) => const HudCustomizeScreen()),
          GoRoute(path: 'language', builder: (_, _) => const LanguageScreen()),
          GoRoute(
            path: 'diagnostics',
            builder: (_, _) => const DiagnosticsScreen(),
          ),
          GoRoute(path: 'privacy', builder: (_, _) => const PrivacyScreen()),
          GoRoute(path: 'terms', builder: (_, _) => const TermsScreen()),
          GoRoute(path: 'help', builder: (_, _) => const HelpScreen()),
          // ui:extra-settings-routes
        ],
      ),
      GoRoute(path: Routes.models, builder: (_, _) => const AiModelsScreen()),
      GoRoute(
        path: Routes.emergencySetup,
        builder: (_, _) => const EmergencySetupScreen(),
      ),
      GoRoute(
        path: Routes.emergencyAlert,
        pageBuilder: (_, s) => MaterialPage(
          key: s.pageKey,
          fullscreenDialog: true,
          child: const EmergencyAlertScreen(),
        ),
      ),
      GoRoute(path: Routes.safety, builder: (_, _) => const SafetyScreen()),
      GoRoute(
        path: Routes.destination,
        pageBuilder: (_, s) =>
            SheetPage(key: s.pageKey, child: const DestinationSheet()),
      ),
      GoRoute(
        path: Routes.trips,
        builder: (_, _) => const TripsScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (_, s) =>
                TripDetailScreen(tripId: s.pathParameters['id']!),
          ),
        ],
      ),
      // ui:extra-routes
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
