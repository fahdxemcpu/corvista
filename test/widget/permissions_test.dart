import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/features/onboarding/permissions_screen.dart';
import 'package:corvista/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// Records the order of permission prompts; [deny] are answered "denied".
class _FakePermissions extends PermissionsController {
  _FakePermissions(this.log, {this.deny = const {}});

  final List<AppPermission> log;
  final Set<AppPermission> deny;
  int settingsOpened = 0;

  @override
  Map<AppPermission, PermissionStatus> build() => {
    for (final p in AppPermission.values) p: PermissionStatus.notDetermined,
  };

  @override
  Future<void> refresh() async {}

  @override
  Future<PermissionStatus> request(AppPermission p) async {
    log.add(p);
    await Future<void>.delayed(const Duration(milliseconds: 10));
    final s = deny.contains(p)
        ? PermissionStatus.denied
        : PermissionStatus.granted;
    state = {...state, p: s};
    return s;
  }

  @override
  Future<void> openSettings() async => settingsOpened++;
}

class _MemorySettings extends SettingsController {
  @override
  AppSettings build() => const AppSettings();

  @override
  Future<void> update(AppSettings Function(AppSettings s) f) async =>
      state = f(state);
}

Widget _app(_FakePermissions perms) {
  final router = GoRouter(
    initialLocation: '/permissions',
    routes: [
      GoRoute(
        path: '/permissions',
        builder: (_, _) => const PermissionsScreen(),
      ),
      GoRoute(
        path: '/drive',
        builder: (_, _) => const Scaffold(body: Text('DRIVE')),
      ),
    ],
  );
  return ProviderScope(
    overrides: [
      permissionsProvider.overrideWith(() => perms),
      settingsProvider.overrideWith(_MemorySettings.new),
    ],
    child: MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    ),
  );
}

void main() {
  setUp(() {});

  testWidgets('Allow all asks camera → location → microphone → speech, '
      'never notifications, then continues when all are granted', (
    tester,
  ) async {
    final log = <AppPermission>[];
    await tester.pumpWidget(_app(_FakePermissions(log)));
    await tester.pumpAndSettle();

    for (final t in [
      'Camera',
      'Location',
      'Microphone',
      'Speech recognition',
    ]) {
      expect(find.text(t), findsOneWidget);
    }
    expect(find.text('Allow all'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('permissions-allow-all')));
    await tester.pumpAndSettle();

    expect(log, [
      AppPermission.camera,
      AppPermission.locationWhenInUse,
      AppPermission.microphone,
      AppPermission.speech,
    ]);
    expect(log, isNot(contains(AppPermission.notifications)));
    expect(find.text('DRIVE'), findsOneWidget);
  });

  testWidgets('a denied permission shows status + Open Settings and waits', (
    tester,
  ) async {
    final log = <AppPermission>[];
    final perms = _FakePermissions(log, deny: {AppPermission.speech});
    await tester.pumpWidget(_app(perms));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('permissions-allow-all')));
    await tester.pumpAndSettle();

    expect(log.length, 4);
    expect(find.text('DRIVE'), findsNothing);
    expect(find.text('Allowed'), findsNWidgets(3));
    // Row action (+ banner action when scrolled into view).
    expect(find.text('Open Settings'), findsWidgets);
    await tester.ensureVisible(find.text('Open Settings').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Open Settings').first);
    expect(perms.settingsOpened, 1);

    // No prompts left: primary action becomes Start driving.
    expect(find.text('Allow all'), findsNothing);
    await tester.tap(find.byKey(const ValueKey('permissions-start')));
    await tester.pumpAndSettle();
    expect(find.text('DRIVE'), findsOneWidget);
  });

  testWidgets('Not now continues without prompting', (tester) async {
    final log = <AppPermission>[];
    await tester.pumpWidget(_app(_FakePermissions(log)));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('permissions-not-now')));
    await tester.pumpAndSettle();
    expect(log, isEmpty);
    expect(find.text('DRIVE'), findsOneWidget);
  });
}
