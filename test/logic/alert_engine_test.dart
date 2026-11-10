import 'dart:ui';

import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/domain/models/object_class.dart';
import 'package:corvista/domain/models/tracked_object.dart';
import 'package:corvista/features/voice_alerts/alert_engine.dart';
import 'package:corvista/features/voice_alerts/alert_phrases.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/track_fixtures.dart';

void main() {
  const s = AppSettings();

  List<AlertKind> kinds(List<AlertEvent> e) => e.map((x) => x.kind).toList();

  group('AlertEngine', () {
    test('close pedestrian ahead → pedestrian alert', () {
      final e = AlertEngine();
      final out = e.evaluate(
        tracks: [track(cls: ObjectClass.person, range: 7)],
        egoSpeedMps: 8,
        settings: s,
        tsS: 0,
      );
      expect(kinds(out), [AlertKind.pedestrian]);
    });

    test('far or off-corridor pedestrian is ignored (medium sensitivity)', () {
      final e = AlertEngine();
      expect(
        e.evaluate(
          tracks: [track(cls: ObjectClass.person, range: 20)],
          egoSpeedMps: 8,
          settings: s,
          tsS: 0,
        ),
        isEmpty,
      );
      expect(
        e.evaluate(
          tracks: [track(cls: ObjectClass.person, range: 7, bearing: 30)],
          egoSpeedMps: 8,
          settings: s,
          tsS: 1,
        ),
        isEmpty,
      );
    });

    test('high sensitivity includes medium zone; low only very close', () {
      final hi = s.copyWith(alertSensitivity: AlertSensitivity.high);
      final lo = s.copyWith(alertSensitivity: AlertSensitivity.low);
      final p = track(cls: ObjectClass.person, range: 20);
      expect(
        AlertEngine().evaluate(
          tracks: [p],
          egoSpeedMps: 8,
          settings: hi,
          tsS: 0,
        ),
        hasLength(1),
      );
      expect(
        AlertEngine().evaluate(
          tracks: [track(cls: ObjectClass.person, range: 7)],
          egoSpeedMps: 8,
          settings: lo,
          tsS: 0,
        ),
        isEmpty,
      );
    });

    test('tentative or low-confidence tracks never alert', () {
      final e = AlertEngine();
      expect(
        e.evaluate(
          tracks: [
            track(
              cls: ObjectClass.person,
              range: 3,
              state: TrackState.tentative,
            ),
            track(id: 2, cls: ObjectClass.person, range: 3, conf: 0.2),
          ],
          egoSpeedMps: 8,
          settings: s,
          tsS: 0,
        ),
        isEmpty,
      );
    });

    test('global rate limit: at most one alert per 4 s', () {
      final e = AlertEngine();
      final tracks = [
        track(id: 1, cls: ObjectClass.person, range: 3),
        track(id: 2, cls: ObjectClass.bicycle, range: 3),
      ];
      final fired = <double>[];
      for (var t = 0.0; t < 10; t += 0.5) {
        if (e
            .evaluate(tracks: tracks, egoSpeedMps: 8, settings: s, tsS: t)
            .isNotEmpty) {
          fired.add(t);
        }
      }
      for (var i = 1; i < fired.length; i++) {
        expect(fired[i] - fired[i - 1], greaterThanOrEqualTo(4));
      }
      expect(fired.length, 2); // pedestrian @0, cyclist @4; then cooldowns
    });

    test('per-track cooldown suppresses repeats of the same object', () {
      final e = AlertEngine();
      final p = [track(id: 1, cls: ObjectClass.person, range: 3)];
      expect(
        e.evaluate(tracks: p, egoSpeedMps: 8, settings: s, tsS: 0),
        hasLength(1),
      );
      expect(
        e.evaluate(tracks: p, egoSpeedMps: 8, settings: s, tsS: 6),
        isEmpty,
      );
      expect(
        e.evaluate(tracks: p, egoSpeedMps: 8, settings: s, tsS: 12.1),
        hasLength(1),
      );
    });

    test('disabled kinds and quiet mode', () {
      final off = s.copyWith(alertPedestrian: false);
      expect(
        AlertEngine().evaluate(
          tracks: [track(cls: ObjectClass.person, range: 3)],
          egoSpeedMps: 8,
          settings: off,
          tsS: 0,
        ),
        isEmpty,
      );
      final quiet = s.copyWith(quietMode: true);
      expect(
        AlertEngine().evaluate(
          tracks: [track(cls: ObjectClass.person, range: 7)],
          egoSpeedMps: 8,
          settings: quiet,
          tsS: 0,
        ),
        isEmpty,
      );
      expect(
        AlertEngine().evaluate(
          tracks: [track(cls: ObjectClass.person, range: 3)],
          egoSpeedMps: 8,
          settings: quiet,
          tsS: 0,
        ),
        hasLength(1),
      );
      expect(
        AlertEngine().evaluate(
          tracks: [track(cls: ObjectClass.bus, range: 7)],
          egoSpeedMps: 8,
          settings: quiet,
          tsS: 0,
        ),
        isEmpty,
      );
    });

    test('vehicle very close ahead while moving', () {
      final out = AlertEngine().evaluate(
        tracks: [track(range: 3)],
        egoSpeedMps: 10,
        settings: s,
        tsS: 0,
      );
      expect(kinds(out), [AlertKind.vehicleClose]);
      // Stopped in traffic and not approaching → no alert.
      expect(
        AlertEngine().evaluate(
          tracks: [track(range: 3)],
          egoSpeedMps: 0,
          settings: s,
          tsS: 0,
        ),
        isEmpty,
      );
    });

    test('light red → green while stopped announces once', () {
      final e = AlertEngine();
      final red = track(
        id: 5,
        cls: ObjectClass.trafficLight,
        light: LightState.red,
        range: 20,
      );
      final green = track(
        id: 5,
        cls: ObjectClass.trafficLight,
        light: LightState.green,
        range: 20,
      );
      expect(
        e.evaluate(tracks: [red], egoSpeedMps: 0, settings: s, tsS: 0),
        isEmpty,
      );
      expect(
        kinds(e.evaluate(tracks: [green], egoSpeedMps: 0, settings: s, tsS: 1)),
        [AlertKind.trafficLightGreen],
      );
      expect(
        e.evaluate(tracks: [green], egoSpeedMps: 0, settings: s, tsS: 6),
        isEmpty,
      );
    });

    test(
      'green announcement waits for the global limiter instead of being lost',
      () {
        final e = AlertEngine();
        final ped = track(id: 1, cls: ObjectClass.person, range: 3);
        final red = track(
          id: 5,
          cls: ObjectClass.trafficLight,
          light: LightState.red,
          range: 20,
        );
        final green = track(
          id: 5,
          cls: ObjectClass.trafficLight,
          light: LightState.green,
          range: 20,
        );
        expect(
          kinds(
            e.evaluate(tracks: [ped, red], egoSpeedMps: 0, settings: s, tsS: 0),
          ),
          [AlertKind.pedestrian],
        );
        expect(
          e.evaluate(tracks: [green], egoSpeedMps: 0, settings: s, tsS: 2),
          isEmpty,
        );
        expect(
          kinds(
            e.evaluate(tracks: [green], egoSpeedMps: 0, settings: s, tsS: 4.1),
          ),
          [AlertKind.trafficLightGreen],
        );
      },
    );

    test('traffic ahead moving after a stop', () {
      final e = AlertEngine();
      const box = Rect.fromLTWH(0.4, 0.4, 0.2, 0.2);
      final events = <AlertKind>[];
      for (var t = 0.0; t < 3.5; t += 0.1) {
        events.addAll(
          kinds(
            e.evaluate(
              tracks: [track(id: 9, box: box, range: 12)],
              egoSpeedMps: 0,
              settings: s,
              tsS: t,
            ),
          ),
        );
      }
      for (var t = 3.5; t < 5; t += 0.1) {
        events.addAll(
          kinds(
            e.evaluate(
              tracks: [track(id: 9, box: box, range: 12, scaleRate: -0.2)],
              egoSpeedMps: 0,
              settings: s,
              tsS: t,
            ),
          ),
        );
      }
      expect(events, [AlertKind.trafficMoving]);
    });
  });

  group('AlertPhrases', () {
    test('every language has every kind, non-empty', () {
      for (final l in AlertPhrases.languages) {
        for (final k in AlertKind.values) {
          expect(AlertPhrases.phrase(k, l), isNotEmpty, reason: '$l/$k');
        }
        expect(AlertPhrases.testPhrase(l), isNotEmpty);
        expect(AlertPhrases.emergencyCancelPhrases(l), contains('cancel'));
      }
      expect(AlertPhrases.languages, hasLength(12));
    });

    test('regional tags and unknown languages fall back sensibly', () {
      expect(
        AlertPhrases.phrase(AlertKind.pedestrian, 'fr-CA'),
        'Piéton devant',
      );
      expect(
        AlertPhrases.phrase(AlertKind.pedestrian, 'sv'),
        'Pedestrian ahead',
      );
      expect(
        AlertPhrases.phrase(AlertKind.trafficMoving, null),
        'Traffic ahead is moving',
      );
    });

    test('English phrases never instruct to go or claim safety', () {
      for (final k in AlertKind.values) {
        final p = AlertPhrases.phrase(k, 'en').toLowerCase();
        expect(p, isNot(matches(RegExp(r'\bgo\b|safe|proceed'))));
      }
    });
  });
}
