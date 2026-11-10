import 'dart:math' as math;

import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/test_container.dart';
import '../fixtures/track_fixtures.dart';

void main() {
  group('DriveSessionController', () {
    test('start orchestrates native modules and writes a session row; stop reverses', () async {
      final env = await makeEnv(
        settings: const AppSettings(emergencyEnabled: true),
      );
      env.container.listen(driveSessionProvider, (_, _) {});
      await env.read(driveSessionProvider.notifier).start();
      final st = env.read(driveSessionProvider);
      expect(st.active, isTrue);
      expect(st.sessionId, isNotNull);
      final m = env.engine.methods;
      for (final call in [
        'system.keepAwake',
        'camera.start',
        'recorder.configure',
        'ai.setModel',
        'ai.configure',
        'location.start',
        'motion.start',
      ]) {
        expect(m, contains(call));
      }
      expect(m.indexOf('camera.start'), lessThan(m.indexOf('location.start')));
      expect(env.read(emergencyProvider).phase, EmergencyPhase.armed);
      expect(await env.db.select(env.db.drivingSessions).get(), hasLength(1));

      await env.read(driveSessionProvider.notifier).stop();
      expect(env.read(driveSessionProvider).active, isFalse);
      expect(
        env.engine.methods,
        containsAll(['motion.stop', 'location.stop', 'camera.stop']),
      );
      expect(env.engine.argsOf('system.keepAwake').last['on'], false);
      expect(
        (await env.db.select(env.db.drivingSessions).get()).single.endedAt,
        isNotNull,
      );
    });

    test('camera failure does not stop location/recorder/AI', () async {
      final env = await makeEnv();
      env.engine.failures['camera.start'] = PlatformException(
        code: 'unavailable',
      );
      await env.read(driveSessionProvider.notifier).start();
      expect(env.read(cameraProvider).status, CameraStatus.unavailable);
      expect(
        env.engine.methods,
        containsAll(['recorder.configure', 'ai.setModel', 'location.start']),
      );
    });

    test('the stored model is loaded when the drive starts', () async {
      final env = await makeEnv(
        settings: const AppSettings(modelId: 'enhanced'),
      );
      await env.read(driveSessionProvider.notifier).start();
      expect(env.engine.argsOf('ai.setModel').single['id'], 'enhanced');
    });

    test('app background pauses camera; resume restarts it', () async {
      final env = await makeEnv();
      final n = env.read(driveSessionProvider.notifier);
      await n.start();
      await n.handleLifecycle(AppLifecycleState.paused);
      expect(env.engine.count('camera.stop'), 1);
      expect(env.engine.count('camera.start'), 1);
      await n.handleLifecycle(AppLifecycleState.resumed);
      expect(env.engine.count('camera.start'), 2);
    });

    test(
      'power policy changes are applied to ai.configure while active',
      () async {
        final env = await makeEnv();
        env.container.listen(powerProvider, (_, _) {});
        await env.read(driveSessionProvider.notifier).start();
        env.engine.statusCtl.add({'type': 'thermal', 'state': 'critical'});
        await settle();
        final last = env.engine.argsOf('ai.configure').last;
        expect(last['maxHz'], 3);
        expect(last['segmentationHz'], 0);
        expect(env.read(powerProvider).notice, PowerNotice.thermalCritical);
      },
    );

    test('parking view activates parking assist', () async {
      final env = await makeEnv();
      final n = env.read(driveSessionProvider.notifier);
      await n.start();
      n.setView(DriveView.parking);
      expect(env.read(parkingProvider).active, isTrue);
      n.setView(DriveView.maps);
      expect(env.read(parkingProvider).active, isFalse);
    });
  });

  group('NavigationController', () {
    const lat0 = 45.0, lon0 = 7.0;
    const mPerDegLat = 111195.08;
    final mPerDegLon = mPerDegLat * math.cos(lat0 * math.pi / 180);
    double n(double m) => lat0 + m / mPerDegLat;
    double e(double m) => lon0 + m / mPerDegLon;
    final routeMap = <Object?, Object?>{
      'id': 'r',
      'name': 'Main',
      'distanceM': 2000.0,
      'expectedTravelTimeS': 200.0,
      'advisories': <Object?>[],
      'polyline': <Object?>[lat0, lon0, n(1000), lon0, n(1000), e(1000)],
      'steps': <Object?>[
        {
          'instructions': 'Head north',
          'distanceM': 1000.0,
          'lat': lat0,
          'lon': lon0,
        },
        {
          'instructions': 'Turn right',
          'distanceM': 1000.0,
          'lat': n(1000),
          'lon': lon0,
        },
      ],
    };

    test('completions are debounced (300 ms)', () async {
      final env = await makeEnv();
      final nav = env.read(navigationProvider.notifier);
      nav.setQuery('c');
      nav.setQuery('ca');
      nav.setQuery('caf');
      await Future<void>.delayed(const Duration(milliseconds: 150));
      expect(env.engine.count('nav.complete'), 0);
      await Future<void>.delayed(const Duration(milliseconds: 250));
      expect(env.engine.argsOf('nav.complete').single['query'], 'caf');
      expect(env.read(navigationProvider).suggestions.single.title, 'Cafe caf');
    });

    test('choose → routes from current fix → guidance → rate-limited reroute → arrival', () async {
      var now = DateTime(2026, 11, 7, 12);
      final env = await makeEnv(
        overrides: [clockProvider.overrideWithValue(() => now)],
      );
      env.engine.routes = [routeMap];
      final loc = env.read(locationProvider.notifier);
      env.container.listen(navigationProvider, (_, _) {});
      final nav = env.read(navigationProvider.notifier);

      await nav.choose(
        const PlaceSuggestion(id: 's1', title: 'Cafe', subtitle: ''),
      );
      expect(env.read(navigationProvider).error, 'no_location');

      loc.debugSetFix(fix(lat: lat0, lon: lon0));
      await nav.choose(
        const PlaceSuggestion(id: 's1', title: 'Cafe', subtitle: ''),
      );
      expect(env.read(navigationProvider).phase, NavPhase.choosingRoute);
      expect(env.engine.argsOf('nav.route').last['fromLat'], lat0);

      await nav.start();
      loc.debugSetFix(fix(lat: n(400), lon: lon0));
      var g = env.read(navigationProvider).guidance!;
      expect(g.distanceToNextM, closeTo(600, 3));
      expect(g.nextStep?.instructions, 'Turn right');

      final routeCalls = env.engine.count('nav.route');
      for (var i = 0; i < 6; i++) {
        now = now.add(const Duration(seconds: 1));
        loc.debugSetFix(fix(lat: n(400), lon: e(200)));
        await settle();
      }
      expect(env.engine.count('nav.route'), routeCalls + 1);
      now = now.add(const Duration(seconds: 16));
      loc.debugSetFix(fix(lat: n(400), lon: e(200)));
      await settle();
      expect(env.engine.count('nav.route'), routeCalls + 2);

      loc.debugSetFix(fix(lat: n(1000), lon: e(990), course: 90));
      g = env.read(navigationProvider).guidance!;
      expect(g.arrived, isTrue);

      nav.cancel();
      expect(env.read(navigationProvider).phase, NavPhase.idle);
    });
  });

  group('WeatherController', () {
    test('refresh needs a fix; success fills real values', () async {
      final env = await makeEnv();
      env.container.listen(weatherProvider, (_, _) {});
      await env.read(weatherProvider.notifier).refresh(force: true);
      expect(env.read(weatherProvider).error, 'no_location');
      env.read(locationProvider.notifier).debugSetFix(fix());
      await env.read(weatherProvider.notifier).refresh(force: true);
      final w = env.read(weatherProvider);
      expect(w.temperatureC, 21.5);
      expect(w.serviceName, 'Weather');
      expect(w.error, isNull);
    });

    test('errors surface as message, no fake values', () async {
      final env = await makeEnv();
      env.engine.failures['weather.get'] = PlatformException(
        code: 'unavailable',
        message: 'WeatherKit unavailable',
      );
      env.read(locationProvider.notifier).debugSetFix(fix());
      await env.read(weatherProvider.notifier).refresh(force: true);
      final w = env.read(weatherProvider);
      expect(w.error, 'WeatherKit unavailable');
      expect(w.temperatureC, isNull);
      expect(w.hasData, isFalse);
    });

    test('auto refresh respects the 15 min / 3 km cadence', () async {
      var now = DateTime(2026, 11, 7, 12);
      final env = await makeEnv(
        overrides: [clockProvider.overrideWithValue(() => now)],
      );
      env.container.listen(weatherProvider, (_, _) {});
      final loc = env.read(locationProvider.notifier);
      loc.debugSetFix(fix());
      await settle();
      expect(env.engine.count('weather.get'), 1); // HUD weather on by default
      loc.debugSetFix(fix(lat: 48.86));
      await settle();
      expect(env.engine.count('weather.get'), 1);
      loc.debugSetFix(fix(lat: 48.90)); // ~4.8 km
      await settle();
      expect(env.engine.count('weather.get'), 2);
      now = now.add(const Duration(minutes: 16));
      loc.debugSetFix(fix(lat: 48.90));
      await settle();
      expect(env.engine.count('weather.get'), 3);
    });
  });

  group('Power / perf / permissions / camera', () {
    test('system.info poll feeds power state and perf memory', () async {
      final env = await makeEnv();
      env.container.listen(powerProvider, (_, _) {});
      env.container.listen(perfProvider, (_, _) {});
      await settle(10);
      expect(env.read(powerProvider).battery, 0.8);
      expect(env.read(perfProvider).memoryMB, 300);
      env.engine.statusCtl.add({
        'type': 'perf',
        'inferenceMs': 25.0,
        'detectHz': 9.0,
        'memoryMB': 310.0,
        'droppedFrames': 2,
      });
      env.engine.statusCtl.add({
        'type': 'camera',
        'state': 'running',
        'fps': 30.0,
        'droppedFrames': 3,
      });
      await settle();
      final p = env.read(perfProvider);
      expect(p.inferenceMs, 25);
      expect(p.cameraFps, 30);
    });

    test('power mode setting changes policy', () async {
      final env = await makeEnv();
      env.container.listen(powerProvider, (_, _) {});
      await env
          .read(settingsProvider.notifier)
          .update((s) => s.copyWith(powerMode: PowerMode.powerSaver));
      expect(env.read(powerProvider).aiHz, 5);
      expect(env.read(powerProvider).reducedEffects, isTrue);
    });

    test('permissions refresh and request', () async {
      final env = await makeEnv();
      env.container.listen(permissionsProvider, (_, _) {});
      await env.read(permissionsProvider.notifier).refresh();
      expect(
        env.read(permissionsProvider)[AppPermission.camera],
        PermissionStatus.granted,
      );
      expect(
        await env
            .read(permissionsProvider.notifier)
            .request(AppPermission.speech),
        PermissionStatus.granted,
      );
    });

    test('camera permission denied is reported', () async {
      final env = await makeEnv();
      env.engine.failures['camera.start'] = PlatformException(
        code: 'permission_denied',
      );
      await env.read(cameraProvider.notifier).start();
      expect(env.read(cameraProvider).status, CameraStatus.permissionDenied);
    });

    test('camera quality follows the recording profile', () async {
      final env = await makeEnv();
      await env.read(cameraProvider.notifier).start();
      expect(env.engine.argsOf('camera.start').single['quality'], 'hd720');
      final env2 = await makeEnv(
        settings: const AppSettings(recordingProfile: RecordingProfile.premium),
      );
      await env2.read(cameraProvider.notifier).start();
      expect(env2.engine.argsOf('camera.start').single['quality'], 'fhd1080');
    });
  });
}
