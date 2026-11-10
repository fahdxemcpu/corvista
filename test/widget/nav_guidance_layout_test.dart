import 'dart:typed_data';

import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/features/navigation/widgets/maneuver_icon.dart';
import 'package:corvista/features/navigation/widgets/nav_widgets.dart';
import 'package:corvista/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _FixedNav extends NavigationController {
  _FixedNav(this.fixed);
  final NavState fixed;
  @override
  NavState build() => fixed;
}

/// Guidance chrome lays out without overflow in portrait / landscape, LTR and
/// RTL (Arabic), with long street names; arrows keep real-world direction.
void main() {
  const step = RouteStep(
    instructions: 'At the roundabout, take the second exit onto Boulevard Mohammed Zerktouni شارع محمد الزرقطوني',
    distanceM: 400,
    lat: 0,
    lon: 0,
  );
  final route = RouteInfo(
    id: 'r0',
    name: 'Boulevard de la Corniche',
    distanceM: 15240,
    expectedTravelTimeS: 1900,
    advisories: const ['Toll road'],
    polyline: Float64List.fromList([0, 0, 0.01, 0.01]),
    steps: const [step],
  );
  final guidance = Guidance(
    stepIndex: 0,
    nextStep: step,
    distanceToNextM: 1250,
    remainingM: 15240,
    remaining: const Duration(minutes: 31),
    eta: DateTime(2026, 11, 7, 15, 50),
    offRoute: false,
    arrived: false,
    maneuver: const Maneuver(
      ManeuverType.roundabout,
      angle: 30,
      exit: 2,
      exitAngle: 70,
    ),
    thenStep: step,
    thenManeuver: const Maneuver(ManeuverType.left, angle: -90),
    thenDistanceM: 120,
  );
  final state = NavState(
    phase: NavPhase.navigating,
    destination: const Place(
      name: 'Morocco Mall — Boulevard de l’Océan Atlantique',
      address: 'Boulevard de l’Océan 1, 20180 Casablanca, Morocco',
      lat: 0,
      lon: 0,
    ),
    routes: [route, route],
    guidance: guidance,
  );

  Future<void> pump(
    WidgetTester t, {
    required Size size,
    required Locale locale,
    NavState? nav,
    Widget? child,
  }) async {
    t.view.physicalSize = size * 3;
    t.view.devicePixelRatio = 3;
    addTearDown(t.view.reset);
    await t.pumpWidget(
      ProviderScope(
        retry: (_, _) => null,
        overrides: [
          initialSettingsProvider.overrideWithValue(
            const AppSettings(hudShowSpeed: false),
          ),
          navigationProvider.overrideWith(() => _FixedNav(nav ?? state)),
        ],
        child: MaterialApp(
          locale: locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child:
                    child ??
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const ManeuverBanner(),
                        const Spacer(),
                        TripBar(onOverview: () {}),
                      ],
                    ),
              ),
            ),
          ),
        ),
      ),
    );
    await t.pump();
  }

  for (final (name, size) in [
    ('portrait SE', const Size(375, 667)),
    ('landscape', const Size(874, 402)),
  ]) {
    for (final locale in const [Locale('en'), Locale('ar'), Locale('de')]) {
      testWidgets('banner + trip bar: $name ${locale.languageCode}', (t) async {
        await pump(t, size: size, locale: locale);
        expect(t.takeException(), isNull);
        expect(find.byKey(const ValueKey('nav-distance')), findsOneWidget);
        expect(find.byType(ManeuverIcon), findsNWidgets(2));
        // Expanded trip bar.
        await t.tap(find.byKey(const ValueKey('nav-trip-bar')));
        await t.pumpAndSettle();
        expect(t.takeException(), isNull);
        expect(find.byKey(const ValueKey('nav-end')), findsOneWidget);
      });
    }
  }

  testWidgets('RTL does not mirror maneuver arrows', (t) async {
    await pump(t, size: const Size(375, 667), locale: const Locale('ar'));
    final paint = t.widget<CustomPaint>(
      find.descendant(
        of: find.byType(ManeuverIcon).first,
        matching: find.byType(CustomPaint),
      ),
    );
    // Arrows are painted in a fixed LTR frame, never flipped by a Transform.
    expect(
      (paint.painter! as ManeuverPainter).textDirection,
      TextDirection.ltr,
    );
    expect(
      find.ancestor(
        of: find.byType(ManeuverIcon).first,
        matching: find.byType(Transform),
      ),
      findsNothing,
    );
  });

  testWidgets('route preview + arrival card fit on a small phone', (t) async {
    await pump(
      t,
      size: const Size(375, 667),
      locale: const Locale('fr'),
      nav: state.copyWith(phase: NavPhase.choosingRoute),
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: RoutePreviewCard(),
      ),
    );
    expect(t.takeException(), isNull);
    expect(find.byKey(const ValueKey('nav-go')), findsOneWidget);
    await pump(
      t,
      size: const Size(375, 667),
      locale: const Locale('ar'),
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: ArrivalCard(),
      ),
    );
    expect(t.takeException(), isNull);
  });
}
