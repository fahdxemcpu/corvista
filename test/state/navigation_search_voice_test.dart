import 'dart:math' as math;

import 'package:corvista/app/providers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/test_container.dart';
import '../fixtures/track_fixtures.dart';

void main() {
  const lat0 = 45.0, lon0 = 7.0;
  const mPerDegLat = 111195.08;
  final mPerDegLon = mPerDegLat * math.cos(lat0 * math.pi / 180);
  double n(double m) => lat0 + m / mPerDegLat;
  double e(double m) => lon0 + m / mPerDegLon;

  // 1 km north, right turn, 1 km east.
  final routeMap = <Object?, Object?>{
    'id': 'r0',
    'name': 'Main',
    'distanceM': 2000.0,
    'expectedTravelTimeS': 200.0,
    'advisories': <Object?>[],
    'polyline': <Object?>[lat0, lon0, n(1000), lon0, n(1000), e(1000)],
    'steps': <Object?>[
      {
        'instructions': 'Turn right onto Rue A',
        'distanceM': 1000.0,
        'lat': n(1000),
        'lon': lon0,
      },
      {
        'instructions': 'Arrive at the destination',
        'distanceM': 1000.0,
        'lat': n(1000),
        'lon': e(1000),
      },
    ],
  };
  final slower = {...routeMap, 'id': 'r1', 'expectedTravelTimeS': 260.0};

  group('destination search', () {
    test('typing shows loading at once, then the engine suggestions', () async {
      final env = await makeEnv();
      env.engine.completions = [
        {
          'id': 'c1',
          'title': 'Morocco Mall',
          'subtitle': "Boulevard de l'Océan 1, 20180 Casablanca, Morocco",
        },
        {'id': 'c2', 'title': 'Morocco Mall Bouskoura', 'subtitle': 'A7'},
      ];
      final nav = env.read(navigationProvider.notifier);
      nav.setQuery('Morocco Mall');
      var s = env.read(navigationProvider);
      // Regression: the sheet used to show "No matching places" during the
      // debounce window because nothing was loading yet.
      expect(s.loading, isTrue);
      expect(s.noResults, isFalse);
      await Future<void>.delayed(const Duration(milliseconds: 400));
      s = env.read(navigationProvider);
      expect(s.loading, isFalse);
      expect(s.suggestions.map((x) => x.title), [
        'Morocco Mall',
        'Morocco Mall Bouskoura',
      ]);
      expect(s.completedQuery, 'Morocco Mall');
      expect(s.noResults, isFalse);
    });

    test(
      'empty autocomplete falls back to full search before "no results"',
      () async {
        final env = await makeEnv();
        env.engine.completions = [];
        final nav = env.read(navigationProvider.notifier);
        nav.setQuery('morocco mal');
        await Future<void>.delayed(const Duration(milliseconds: 400));
        var s = env.read(navigationProvider);
        expect(env.engine.count('nav.search'), 1);
        expect(s.places.single.name, 'Cafe Place');
        expect(s.noResults, isFalse);

        env.engine.places = [];
        nav.setQuery('zzzz');
        await Future<void>.delayed(const Duration(milliseconds: 400));
        s = env.read(navigationProvider);
        expect(s.noResults, isTrue);
      },
    );

    test('Search submit calls nav.search and lists places', () async {
      final env = await makeEnv();
      final nav = env.read(navigationProvider.notifier);
      nav.setQuery('Morocco Mall');
      await nav.submit();
      final s = env.read(navigationProvider);
      expect(env.engine.argsOf('nav.search').last['query'], 'Morocco Mall');
      expect(s.submitted, isTrue);
      expect(s.places.single.name, 'Cafe Place');
      // The pending debounced completion was cancelled.
      await Future<void>.delayed(const Duration(milliseconds: 400));
      expect(env.engine.count('nav.complete'), 0);
    });

    test('stale completions are dropped', () async {
      final env = await makeEnv();
      final nav = env.read(navigationProvider.notifier);
      nav.setQuery('caf');
      await Future<void>.delayed(const Duration(milliseconds: 350));
      nav.setQuery('cafe');
      await Future<void>.delayed(const Duration(milliseconds: 350));
      expect(
        env.read(navigationProvider).suggestions.single.title,
        'Cafe cafe',
      );
    });

    test('suggestion → resolve → route preview with fastest route', () async {
      final env = await makeEnv();
      env.engine.routes = [slower, routeMap];
      env
          .read(locationProvider.notifier)
          .debugSetFix(fix(lat: lat0, lon: lon0));
      final nav = env.read(navigationProvider.notifier);
      await nav.choose(
        const PlaceSuggestion(id: 'c1', title: 'Cafe', subtitle: ''),
      );
      final s = env.read(navigationProvider);
      expect(env.engine.argsOf('nav.resolve').single['id'], 'c1');
      expect(s.phase, NavPhase.choosingRoute);
      expect(s.routes, hasLength(2));
      expect(s.fastestRoute, 1);
    });

    test(
      'recent destinations: added on start, deduped, max 10, clear',
      () async {
        final env = await makeEnv();
        env.engine.routes = [routeMap];
        env
            .read(locationProvider.notifier)
            .debugSetFix(fix(lat: lat0, lon: lon0));
        final rec = env.read(recentDestinationsProvider.notifier);
        await rec.ready();
        final nav = env.read(navigationProvider.notifier);
        for (var i = 0; i < 12; i++) {
          await nav.chooseDestination(
            Place(name: 'P$i', address: '', lat: 45 + i / 100, lon: 7),
          );
          await nav.start();
          nav.cancel();
        }
        await nav.chooseDestination(
          const Place(name: 'P5', address: '', lat: 45.05, lon: 7),
        );
        await nav.start();
        await settle();
        final list = env.read(recentDestinationsProvider);
        expect(list, hasLength(10));
        expect(list.first.name, 'P5');
        expect(list.where((p) => p.name == 'P5'), hasLength(1));

        // Persisted: a fresh controller on the same DB reads them back.
        final env2 = await makeEnv(db: env.db);
        await env2.read(recentDestinationsProvider.notifier).ready();
        expect(env2.read(recentDestinationsProvider).first.name, 'P5');

        await rec.clear();
        expect(env.read(recentDestinationsProvider), isEmpty);
      },
    );
  });

  group('guidance', () {
    /// Navigation session whose clock advances 1 s per [go] (1 Hz GPS).
    Future<(TestEnv, NavigationController, void Function(double, double))>
    navigate({double speed = 10}) async {
      var now = DateTime(2026, 11, 7, 12);
      final env = await makeEnv(
        overrides: [clockProvider.overrideWithValue(() => now)],
      );
      env.engine.routes = [routeMap];
      final loc = env.read(locationProvider.notifier);
      env.container.listen(navigationProvider, (_, _) {});
      loc.debugSetFix(fix(lat: lat0, lon: lon0, speed: speed));
      final nav = env.read(navigationProvider.notifier);
      await nav.chooseDestination(
        const Place(name: 'Cafe', address: '', lat: 45.01, lon: 7.01),
      );
      await nav.start();
      addTearDown(nav.cancel);
      return (
        env,
        nav,
        (double lat, double lon) {
          now = now.add(const Duration(seconds: 1));
          // Course from the route direction at that point.
          final course = lat < n(999) ? 0.0 : 90.0;
          loc.debugSetFix(
            fix(lat: lat, lon: lon, speed: speed, course: course),
          );
        },
      );
    }

    test(
      'city prompts: 300 m, 100 m, now — once each — then arrival',
      () async {
        final (env, nav, go) = await navigate();
        for (var m = 10.0; m <= 1000; m += 10) {
          go(n(m), lon0);
        }
        for (var m = 10.0; m <= 1000; m += 10) {
          go(n(1000), e(m));
        }
        await settle();
        expect(nav.spoken, [
          'In 300 meters, turn right onto Rue A',
          'In 100 meters, turn right onto Rue A',
          'Turn right onto Rue A',
          'In 300 meters, arrive at the destination',
          'In 100 meters, arrive at the destination',
          'You have arrived',
        ]);
        expect(env.engine.count('speech.speak'), nav.spoken.length);
        final g = env.read(navigationProvider).guidance!;
        expect(g.maneuver?.type, ManeuverType.arrive);
        expect(g.arrived, isTrue);
        // Smooth frames are published while driving.
        expect(env.read(navFrameProvider), isNotNull);
      },
    );

    test('voice mute persists and silences guidance', () async {
      final (env, nav, go) = await navigate();
      await nav.setVoice(false);
      expect(env.read(settingsProvider).navVoice, isFalse);
      for (var m = 10.0; m <= 1000; m += 10) {
        go(n(m), lon0);
      }
      await settle();
      expect(nav.spoken, isNotEmpty);
      expect(env.engine.count('speech.speak'), 0);
    });

    test('off route after ~3 s → one reroute; then ≥ 10 s apart', () async {
      final (env, nav, go) = await navigate();
      go(n(100), lon0);
      go(n(200), lon0);
      final before = env.engine.count('nav.route');
      for (var i = 0; i < 8; i++) {
        go(n(300), e(300)); // 300 m off the route
        await settle();
      }
      expect(env.engine.count('nav.route'), before + 1);
      expect(nav.spoken.where((t) => t == 'Rerouting'), hasLength(1));
      // Heading hint: the new route starts ahead of the car along its course.
      expect(
        env.engine.argsOf('nav.route').last['fromLat'],
        greaterThan(n(300)),
      );
      for (var i = 0; i < 6; i++) {
        go(n(300), e(300));
        await settle();
      }
      expect(env.engine.count('nav.route'), before + 2);
      expect(env.read(navigationProvider).routeVersion, greaterThan(1));
    });

    test('GPS noise / bad accuracy never reroutes', () async {
      final (env, _, _) = await navigate();
      final loc = env.read(locationProvider.notifier);
      final before = env.engine.count('nav.route');
      for (var i = 0; i < 20; i++) {
        // 120 m off but hAcc 150 m (urban canyon / tunnel exit).
        loc.debugSetFix(fix(lat: n(100), lon: e(120), hAcc: 150));
        await settle();
      }
      expect(env.engine.count('nav.route'), before);
    });

    test('reroute failure keeps guiding on the old route', () async {
      final (env, _, go) = await navigate();
      env.engine.failures['nav.route'] = PlatformException(code: 'unavailable');
      go(n(100), lon0);
      for (var i = 0; i < 5; i++) {
        go(n(300), e(300));
        await settle();
      }
      final s = env.read(navigationProvider);
      expect(s.phase, NavPhase.navigating);
      expect(s.error, 'unavailable');
      expect(s.rerouting, isFalse);
    });
  });

  test('speech arbiter: hazard alerts skipped while guidance speaks', () async {
    var now = DateTime(2026, 11, 7, 12);
    final env = await makeEnv(
      overrides: [clockProvider.overrideWithValue(() => now)],
    );
    final arb = env.read(speechArbiterProvider);
    expect(
      await arb.speak(
        'In 400 meters, turn right onto Boulevard Mohammed Zerktouni',
        channel: SpeechChannel.guidance,
        language: 'en-US',
      ),
      isTrue,
    );
    expect(arb.guidanceSpeaking, isTrue);
    expect(
      await arb.speak(
        'Pedestrian ahead',
        channel: SpeechChannel.alert,
        language: 'en-US',
      ),
      isFalse,
    );
    // Near the end of the guidance utterance the alert queues behind it.
    now = now.add(const Duration(milliseconds: 3500));
    expect(
      await arb.speak(
        'Pedestrian ahead',
        channel: SpeechChannel.alert,
        language: 'en-US',
      ),
      isTrue,
    );
    // Guidance is never dropped, even while an alert is speaking.
    expect(
      await arb.speak(
        'Turn right',
        channel: SpeechChannel.guidance,
        language: 'en-US',
      ),
      isTrue,
    );
    expect(env.engine.count('speech.speak'), 3);
  });
}
