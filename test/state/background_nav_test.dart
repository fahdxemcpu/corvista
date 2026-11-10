import 'dart:typed_data';
import 'dart:ui' show Locale;

import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/features/navigation/background_nav_bridge.dart';
import 'package:corvista/features/navigation/live_activity_bridge.dart';
import 'package:corvista/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart' show AppLifecycleState;
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/test_container.dart';

final _route = RouteInfo(
  id: 'r',
  name: 'A1',
  distanceM: 12400,
  expectedTravelTimeS: 1080,
  advisories: const [],
  polyline: Float64List.fromList([33.58, -7.60, 33.57, -7.65]),
  steps: const [
    RouteStep(
      instructions: 'Turn left onto Bd Zerktouni',
      distanceM: 350,
      lat: 33.58,
      lon: -7.61,
    ),
  ],
);

Guidance _guidance({bool arrived = false, bool offRoute = false}) => Guidance(
  stepIndex: 0,
  nextStep: _route.steps.first,
  distanceToNextM: 347,
  remainingM: 12020,
  remaining: const Duration(minutes: 17),
  eta: DateTime.utc(2026, 11, 7, 14, 31, 40),
  offRoute: offRoute,
  arrived: arrived,
  maneuver: const Maneuver(ManeuverType.left, angle: -90),
  progressM: 380,
  totalM: 12400,
);

NavState _nav({Guidance? g}) => NavState(
  phase: NavPhase.navigating,
  routes: [_route],
  destination: const Place(
    name: 'Morocco Mall',
    address: '',
    lat: 33.57,
    lon: -7.70,
  ),
  guidance: g,
);

class _GuidingNav extends NavigationController {
  @override
  NavState build() => _nav(g: _guidance());
}

void main() {
  final en = lookupAppLocalizations(const Locale('en'));

  group('background navigation', () {
    test('wanted only while actively guiding', () {
      expect(backgroundNavWanted(const NavState()), isFalse);
      expect(
        backgroundNavWanted(const NavState(phase: NavPhase.choosingRoute)),
        isFalse,
      );
      expect(backgroundNavWanted(_nav(g: _guidance())), isTrue);
      expect(backgroundNavWanted(_nav()), isTrue);
      expect(backgroundNavWanted(_nav(g: _guidance(arrived: true))), isFalse);
    });

    test('backgrounding while navigating keeps location; resume shows the '
        'recording-paused notice', () async {
      final env = await makeEnv(
        overrides: [navigationProvider.overrideWith(_GuidingNav.new)],
      );
      final n = env.read(driveSessionProvider.notifier);
      env.engine.calls.clear();
      await n.start();
      // Camera running (fake engine starts it).
      expect(env.read(cameraProvider).status, CameraStatus.running);
      await n.handleLifecycle(AppLifecycleState.paused);
      expect(env.engine.count('camera.stop'), 1);
      expect(env.engine.count('location.stop'), 0);
      expect(env.read(driveSessionProvider).backgroundPaused, isTrue);
      await n.handleLifecycle(AppLifecycleState.resumed);
      final s = env.read(driveSessionProvider);
      expect(s.backgroundPaused, isFalse);
      expect(s.pausedNotice, isNotNull);
      expect(env.engine.count('camera.start'), 2);
    });

    test('backgrounding without navigation still stops location', () async {
      final env = await makeEnv();
      final n = env.read(driveSessionProvider.notifier);
      await n.start();
      await n.handleLifecycle(AppLifecycleState.paused);
      expect(env.engine.count('location.stop'), 1);
    });
  });

  group('live activity content', () {
    test('guiding: maneuver, distances, rounded ETA, progress', () {
      final c = liveActivityContent(
        nav: _nav(g: _guidance()),
        settings: const AppSettings(),
        l10n: en,
        locale: 'en',
        dashcam: 'recording',
      );
      expect(c['maneuver'], 'left');
      expect(c['distance'], '350 m');
      expect(c['instruction'], 'Turn left onto Bd Zerktouni');
      expect(c['remaining'], '12 km');
      expect(
        c['etaMs'],
        DateTime.utc(2026, 11, 7, 14, 32).millisecondsSinceEpoch.toDouble(),
      );
      expect(c['progress'], 0.03);
      expect(c['dashcam'], 'recording');
      expect(c['dashcamLabel'], en.liveActivityRec);
      expect(c['phase'], 'navigating');
    });

    test('miles, rerouting and arrival', () {
      final mi = liveActivityContent(
        nav: _nav(g: _guidance(offRoute: true)),
        settings: const AppSettings(speedUnit: SpeedUnit.mph),
        l10n: en,
        locale: 'en',
        dashcam: 'paused',
      );
      expect(mi['distance'], '0.2 mi');
      expect(mi['remaining'], '7.5 mi');
      expect(mi['phase'], 'rerouting');
      expect(mi['instruction'], en.navRerouting);
      expect(mi['dashcamLabel'], en.liveActivityPaused);

      final done = liveActivityContent(
        nav: _nav(g: _guidance(arrived: true)),
        settings: const AppSettings(),
        l10n: en,
        locale: 'en',
        dashcam: 'off',
      );
      expect(done['phase'], 'arrived');
      expect(done['maneuver'], 'arrive');
      expect(done['distance'], '');
      expect(done['progress'], 1.0);
    });

    test('before the first fix the route preview is used', () {
      final c = liveActivityContent(
        nav: _nav(),
        settings: const AppSettings(),
        l10n: en,
        locale: 'fr',
        dashcam: 'off',
        now: DateTime.utc(2026, 11, 7, 14),
      );
      expect(c['distance'], '350 m');
      expect(c['remaining'], '12 km');
      expect(c['maneuver'], 'straight');
      expect(
        c['etaMs'],
        DateTime.utc(2026, 11, 7, 14, 18).millisecondsSinceEpoch.toDouble(),
      );
    });
  });
}
