import 'dart:ui';

import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/domain/models/object_class.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/test_container.dart';
import '../fixtures/track_fixtures.dart';

void main() {
  group('ParkingController', () {
    Future<TestEnv> env0({AppSettings settings = const AppSettings()}) async {
      final env = await makeEnv(settings: settings);
      env.container.listen(parkingProvider, (_, _) {});
      return env;
    }

    List<int> levels(TestEnv env) => [
      for (final a in env.engine.argsOf('audio.proximity')) a['level']! as int,
    ];

    // 1280×720, 68°: fully visible car ≈ 4 m from the camera (close); a
    // wide bottom-cut car (stop); a narrow bottom-cut one (very close).
    final close = track(box: const Rect.fromLTRB(.4, .3, .6, .9));
    final veryClose = track(box: const Rect.fromLTRB(.45, .6, .55, 1));
    final stop = track(box: const Rect.fromLTRB(0, .25, .95, 1));

    test('inactive: no tones', () async {
      final env = await env0();
      env.read(parkingProvider.notifier).evaluate([stop], tsS: 0);
      await settle();
      expect(env.engine.count('audio.proximity'), 0);
    });

    test('tone levels follow the zone; 0 when nothing qualifies; stop on deactivate', () async {
      final env = await env0();
      final n = env.read(parkingProvider.notifier)..setActive(true);
      n.evaluate([close], tsS: 0);
      expect(env.read(parkingProvider).zone, ParkingZone.close);
      n.evaluate([veryClose], tsS: 0.1);
      n.evaluate([stop], tsS: 0.2);
      n.evaluate([stop], tsS: 0.3); // unchanged → no duplicate call
      expect(env.read(parkingProvider).zone, ParkingZone.stop);
      expect(env.read(parkingProvider).nearest?.side, ParkingSide.centre);
      n.evaluate(const [], tsS: 0.4);
      n.evaluate(const [], tsS: 1.2); // after release time
      await settle();
      expect(levels(env), [1, 2, 3, 0]);
      expect(env.read(parkingProvider).toneLevel, 0);

      n.evaluate([stop], tsS: 2);
      n.setActive(false);
      await settle();
      expect(levels(env), [1, 2, 3, 0, 3, 0]);
      expect(env.read(parkingProvider).active, isFalse);
    });

    test(
      'muted: zone still computed, tones stay silent; unmute resumes',
      () async {
        final env = await env0(
          settings: const AppSettings(parkingBeeps: false),
        );
        final n = env.read(parkingProvider.notifier)..setActive(true);
        n.evaluate([stop], tsS: 0);
        await settle();
        expect(env.read(parkingProvider).toneLevel, 3);
        expect(levels(env).where((l) => l != 0), isEmpty);
        await env
            .read(settingsProvider.notifier)
            .update((s) => s.copyWith(parkingBeeps: true));
        await settle();
        expect(levels(env).last, 3);
      },
    );

    test('volume comes from settings and is re-sent when changed', () async {
      final env = await env0(settings: const AppSettings(beepVolume: 0.4));
      env.read(parkingProvider.notifier)
        ..setActive(true)
        ..evaluate([stop], tsS: 0);
      await settle();
      expect(env.engine.argsOf('audio.proximity').first['volume'], 0.4);
      await env
          .read(settingsProvider.notifier)
          .update((s) => s.copyWith(beepVolume: 0.9));
      await settle();
      expect(env.engine.argsOf('audio.proximity').last['volume'], 0.9);
      expect(env.engine.argsOf('audio.proximity').last['level'], 3);
    });
  });

  group('VoiceAlertController', () {
    Future<TestEnv> env0(AppSettings s) async {
      final env = await makeEnv(settings: s);
      env.container.listen(voiceAlertsProvider, (_, _) {});
      await settle();
      env.read(voiceAlertsProvider.notifier).setEgoSpeed(8);
      return env;
    }

    test('speaks English phrase in en-US by default', () async {
      final env = await env0(const AppSettings());
      env.read(voiceAlertsProvider.notifier).onTracks([
        track(cls: ObjectClass.person, range: 6),
      ], tsS: 0);
      await settle();
      final a = env.engine.argsOf('speech.speak').single;
      expect(a['text'], 'Pedestrian ahead');
      expect(a['language'], 'en-US');
      expect(env.read(voiceAlertsProvider).last?.kind, AlertKind.pedestrian);
    });

    test('app locale fr → French phrase with fr-FR voice', () async {
      final env = await env0(const AppSettings(localeTag: 'fr'));
      env.read(voiceAlertsProvider.notifier).onTracks([
        track(cls: ObjectClass.person, range: 6),
      ], tsS: 0);
      await settle();
      final a = env.engine.argsOf('speech.speak').single;
      expect(a['text'], 'Piéton devant');
      expect(a['language'], 'fr-FR');
    });

    test('no installed voice for language → en-US English fallback', () async {
      final env = await env0(const AppSettings(localeTag: 'ja'));
      final n = env.read(voiceAlertsProvider.notifier);
      expect(n.voiceAvailableFor('ja'), isFalse);
      expect(n.voiceAvailableFor('fr'), isTrue);
      n.onTracks([track(cls: ObjectClass.person, range: 6)], tsS: 0);
      await settle();
      final a = env.engine.argsOf('speech.speak').single;
      expect(a['text'], 'Pedestrian ahead');
      expect(a['language'], 'en-US');
    });

    test('voice alerts off → silent', () async {
      final env = await env0(const AppSettings(voiceAlerts: false));
      env.read(voiceAlertsProvider.notifier).onTracks([
        track(cls: ObjectClass.person, range: 3),
      ], tsS: 0);
      await settle();
      expect(env.engine.count('speech.speak'), 0);
    });

    test('tracker updates drive alerts end-to-end', () async {
      final env = await env0(const AppSettings());
      env.read(locationProvider.notifier).debugSetFix(fix(speed: 8));
      final tracker = env.read(tracksProvider.notifier);
      for (var i = 0; i < 4; i++) {
        tracker.onFrame(
          frame(i * 0.1, [
            det(ObjectClass.person, 0.5, 0.55, h: 0.45, w: 0.12),
          ]),
        );
      }
      await settle();
      expect(
        env.engine.argsOf('speech.speak').map((a) => a['text']),
        contains('Pedestrian ahead'),
      );
    });
  });
}
