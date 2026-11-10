import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/features/hud/drive_screen.dart';
import 'package:corvista/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// Smoke test: every drive view lays out without exceptions (overflow etc.)
/// in portrait and landscape, for each HUD style, with no native engine.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(const MethodChannel('corvista/engine'), (
      call,
    ) async {
      if (call.method.endsWith('.models') ||
          call.method.endsWith('.devices') ||
          call.method.endsWith('.voices')) {
        return <Object?>[];
      }
      if (call.method.startsWith('permissions.')) return 'granted';
      return null;
    });
    for (final c in [
      'detections',
      'status',
      'location',
      'motion',
      'voice',
      'store',
    ]) {
      messenger.setMockStreamHandler(EventChannel('corvista/$c'), null);
    }
  });

  Widget app(AppSettings s) {
    final router = GoRouter(
      initialLocation: '/drive',
      routes: [GoRoute(path: '/drive', builder: (_, _) => const DriveScreen())],
    );
    return ProviderScope(
      // No automatic retries of failing (native-less) providers in tests.
      retry: (_, _) => null,
      overrides: [initialSettingsProvider.overrideWithValue(s)],
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

  for (final landscape in [false, true]) {
    for (final view in DriveView.values) {
      testWidgets(
        '${view.name} lays out (${landscape ? 'landscape' : 'portrait'})',
        (tester) async {
          tester.view.physicalSize = landscape
              ? const Size(2532, 1170)
              : const Size(1170, 2532);
          tester.view.devicePixelRatio = 3;
          addTearDown(tester.view.reset);
          for (final style in HudStyle.values) {
            await tester.pumpWidget(
              app(
                AppSettings(
                  onboardingDone: true,
                  tourDone: true,
                  defaultView: view,
                  hudStyle: style,
                  reduceMotion: true,
                ),
              ),
            );
            await tester.pump();
            await tester.pump(const Duration(milliseconds: 100));
            await tester.pumpWidget(const SizedBox());
            // Let one-shot timers (debounces, deferred teardown) run out.
            await tester.pump(const Duration(seconds: 15));
          }
        },
      );
    }
  }
}
