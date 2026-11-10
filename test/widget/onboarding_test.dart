import 'package:corvista/features/onboarding/onboarding_screen.dart';
import 'package:corvista/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

Widget _app() {
  final router = GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(path: '/onboarding', builder: (_, _) => const OnboardingScreen()),
      GoRoute(
        path: '/permissions',
        builder: (_, _) => const Scaffold(body: Text('PERMISSIONS')),
      ),
      GoRoute(
        path: '/safety',
        builder: (_, _) => const Scaffold(body: Text('SAFETY')),
      ),
    ],
  );
  return ProviderScope(
    child: MediaQuery(
      // Disable animations: illustrations hold still and pages jump.
      data: const MediaQueryData(disableAnimations: true, size: Size(390, 844)),
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
    ),
  );
}

void main() {
  testWidgets('walks the five onboarding pages with exact copy', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(_app());
    await tester.pump();

    const pages = [
      (
        'See more of every drive.',
        'Turn your iPhone into an intelligent dashcam and driving-awareness companion.',
      ),
      (
        'Intelligence in every frame.',
        'Recognize supported vehicles, people, bicycles, and road signals directly on your iPhone.',
      ),
      (
        'One road. Multiple perspectives.',
        'Switch between live detection, virtual driving views, interactive maps, and parking visualization.',
      ),
      (
        'Keep the moments that matter.',
        'Save recent dashcam footage, review incidents, and share recordings.',
      ),
    ];
    final next = find.byKey(const ValueKey('onboarding-next'));
    for (final (title, body) in pages) {
      expect(find.text(title), findsOneWidget);
      expect(find.text(body), findsOneWidget);
      await tester.tap(next);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
    }

    // Safety & privacy page: Continue is disabled until acknowledged.
    expect(find.text('Safety & privacy'), findsOneWidget);
    expect(
      find.textContaining('does not control your vehicle'),
      findsOneWidget,
    );
    expect(tester.widget<FilledButton>(next).onPressed, isNull);

    await tester.ensureVisible(find.byKey(const ValueKey('onboarding-ack')));
    await tester.tap(find.byKey(const ValueKey('onboarding-ack')));
    await tester.pump();
    expect(tester.widget<FilledButton>(next).onPressed, isNotNull);

    await tester.tap(next);
    await tester.pumpAndSettle();
    expect(find.text('PERMISSIONS'), findsOneWidget);
  });

  testWidgets('Skip jumps to the safety page', (tester) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(_app());
    await tester.pump();
    await tester.tap(find.text('Skip'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    expect(find.text('Safety & privacy'), findsOneWidget);
    expect(find.text('Skip'), findsNothing);
  });
}
