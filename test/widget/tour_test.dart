import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/features/hud/drive_screen.dart';
import 'package:corvista/features/tour/coach_tour.dart';
import 'package:corvista/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

const _delegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

class _MemorySettings extends SettingsController {
  _MemorySettings(this.initial);
  final AppSettings initial;

  @override
  AppSettings build() => initial;

  @override
  Future<void> update(AppSettings Function(AppSettings s) f) async =>
      state = f(state);
}

void _mockEngine() {
  final m = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  m.setMockMethodCallHandler(const MethodChannel('corvista/engine'), (
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
  for (final c in ['detections', 'status', 'location', 'motion', 'voice']) {
    m.setMockStreamHandler(EventChannel('corvista/$c'), null);
  }
}

void main() {
  group('CoachTour', () {
    Future<List<bool>> pumpTour(
      WidgetTester tester, {
      required GlobalKey present,
      required GlobalKey absent,
      TextDirection dir = TextDirection.ltr,
    }) async {
      final results = <bool>[];
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: _delegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) =>
              Directionality(textDirection: dir, child: child!),
          home: Scaffold(
            body: Stack(
              children: [
                Positioned(
                  left: 20,
                  bottom: 40,
                  child: SizedBox(
                    key: present,
                    width: 80,
                    height: 80,
                    child: const Placeholder(),
                  ),
                ),
                Positioned.fill(
                  child: CoachTour(
                    reduceMotion: true,
                    onFinish: results.add,
                    steps: [
                      const TourStep(
                        id: 'a',
                        icon: Icons.star,
                        title: 'Intro',
                        body: 'No target',
                      ),
                      TourStep(
                        id: 'b',
                        target: present,
                        icon: Icons.star,
                        title: 'Present target',
                        body: 'Spotlighted',
                      ),
                      TourStep(
                        id: 'c',
                        target: absent,
                        icon: Icons.star,
                        title: 'Missing target',
                        body: 'Falls back to a centred card',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pump();
      return results;
    }

    testWidgets('steps forward/back, tolerates a missing target, finishes', (
      tester,
    ) async {
      final results = await pumpTour(
        tester,
        present: GlobalKey(),
        absent: GlobalKey(),
      );
      expect(find.text('Intro'), findsOneWidget);
      expect(find.byKey(const ValueKey('tour-back')), findsNothing);

      await tester.tap(find.byKey(const ValueKey('tour-next')));
      await tester.pumpAndSettle();
      expect(find.text('Present target'), findsOneWidget);

      await tester.tap(find.byKey(const ValueKey('tour-back')));
      await tester.pumpAndSettle();
      expect(find.text('Intro'), findsOneWidget);

      await tester.tap(find.byKey(const ValueKey('tour-next')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const ValueKey('tour-next')));
      await tester.pumpAndSettle();
      expect(find.text('Missing target'), findsOneWidget);
      expect(tester.takeException(), isNull);

      // Last step: no Skip; primary finishes.
      expect(find.byKey(const ValueKey('tour-skip')), findsNothing);
      await tester.tap(find.byKey(const ValueKey('tour-next')));
      expect(results, [true]);
    });

    testWidgets('Skip reports false; works right-to-left', (tester) async {
      final results = await pumpTour(
        tester,
        present: GlobalKey(),
        absent: GlobalKey(),
        dir: TextDirection.rtl,
      );
      await tester.tap(find.byKey(const ValueKey('tour-skip')));
      expect(results, [false]);
    });

    testWidgets('exposes progress to screen readers', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpTour(tester, present: GlobalKey(), absent: GlobalKey());
      expect(find.bySemanticsLabel('Step 1 of 3'), findsOneWidget);
      handle.dispose();
    });
  });

  group('Drive screen tour', () {
    setUp(_mockEngine);

    for (final landscape in [false, true]) {
      testWidgets('runs once after onboarding and persists tourDone '
          '(${landscape ? 'landscape' : 'portrait'})', (tester) async {
        tester.view.physicalSize = landscape
            ? const Size(2532, 1170)
            : const Size(1170, 2532);
        tester.view.devicePixelRatio = 3;
        addTearDown(tester.view.reset);

        late ProviderContainer container;
        final router = GoRouter(
          initialLocation: '/drive',
          routes: [
            GoRoute(path: '/drive', builder: (_, _) => const DriveScreen()),
          ],
        );
        await tester.pumpWidget(
          ProviderScope(
            retry: (_, _) => null,
            overrides: [
              settingsProvider.overrideWith(
                () => _MemorySettings(
                  const AppSettings(onboardingDone: true, reduceMotion: true),
                ),
              ),
            ],
            child: Consumer(
              builder: (context, ref, _) {
                container = ProviderScope.containerOf(context);
                return MaterialApp.router(
                  localizationsDelegates: _delegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  routerConfig: router,
                );
              },
            ),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        const titles = [
          'Your quick tour',
          'Your instrument strip',
          'Save Incident',
          'Record the whole drive',
          'Five ways to see the road',
          'Search & turn-by-turn',
          'Clips',
          'Settings',
          'Before you drive',
        ];
        for (final t in titles) {
          expect(find.text(t), findsOneWidget, reason: t);
          await tester.tap(find.byKey(const ValueKey('tour-next')));
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 500));
        }
        expect(find.byType(CoachTour), findsNothing);
        expect(container.read(settingsProvider).tourDone, isTrue);

        await tester.pumpWidget(const SizedBox());
        await tester.pump(const Duration(seconds: 15));
      });
    }
  });
}
