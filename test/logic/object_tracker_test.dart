import 'package:corvista/domain/models/object_class.dart';
import 'package:corvista/domain/models/tracked_object.dart';
import 'package:corvista/features/tracking/object_tracker.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/track_fixtures.dart';

void main() {
  const hfov = 68.0;

  group('iou', () {
    test('identical, disjoint, half overlap', () {
      const a = Rect.fromLTWH(0, 0, 1, 1);
      expect(iou(a, a), 1);
      expect(iou(a, const Rect.fromLTWH(2, 2, 1, 1)), 0);
      expect(iou(a, const Rect.fromLTWH(0.5, 0, 1, 1)), closeTo(1 / 3, 1e-9));
    });
  });

  group('ObjectTracker', () {
    test('empty frames produce no tracks', () {
      final t = ObjectTracker();
      for (var i = 0; i < 5; i++) {
        expect(t.update(frame(i * 0.1, const []), hfovDeg: hfov), isEmpty);
      }
    });

    test('tentative until 3 hits, then confirmed', () {
      final t = ObjectTracker();
      expect(
        t.update(frame(0, [det(ObjectClass.car, 0.5, 0.5)]), hfovDeg: hfov),
        isEmpty,
      );
      expect(
        t.update(frame(0.1, [det(ObjectClass.car, 0.5, 0.5)]), hfovDeg: hfov),
        isEmpty,
      );
      final out = t.update(
        frame(0.2, [det(ObjectClass.car, 0.5, 0.5)]),
        hfovDeg: hfov,
      );
      expect(out, hasLength(1));
      expect(out.single.state, TrackState.confirmed);
    });

    test('id is stable over a moving box sequence; velocity estimated', () {
      final t = ObjectTracker();
      final ids = <int>{};
      List<TrackedObject> out = const [];
      for (var i = 0; i < 30; i++) {
        final x = 0.2 + 0.01 * i; // 0.1 normalized units / s
        final h = 0.2 + 0.002 * i; // growing → approaching
        out = t.update(
          frame(i * 0.1, [det(ObjectClass.car, x, 0.5, h: h)]),
          hfovDeg: hfov,
        );
        ids.addAll(out.map((o) => o.id));
      }
      expect(ids, {1});
      final o = out.single;
      expect(o.velocity.dx, closeTo(0.1, 0.02));
      expect(o.velocity.dy.abs(), lessThan(0.02));
      expect(o.velocity.scaleRate, greaterThan(0));
      expect(o.box.center.dx, closeTo(0.49, 0.01));
    });

    test('crossing objects keep their identities', () {
      final t = ObjectTracker();
      final firstX = <int, double>{};
      final lastX = <int, double>{};
      for (var i = 0; i <= 40; i++) {
        final ax = 0.1 + 0.02 * i; // left → right
        final bx = 0.9 - 0.02 * i; // right → left
        final out = t.update(
          frame(i * 0.1, [
            det(ObjectClass.person, ax, 0.45),
            det(ObjectClass.person, bx, 0.55),
          ]),
          hfovDeg: hfov,
        );
        for (final o in out) {
          firstX.putIfAbsent(o.id, () => o.box.center.dx);
          lastX[o.id] = o.box.center.dx;
        }
      }
      expect(lastX.keys, hasLength(2));
      for (final id in lastX.keys) {
        // Each id keeps moving in its own direction across the crossing.
        final movedRight = lastX[id]! > firstX[id]!;
        final startedLeft = firstX[id]! < 0.5;
        expect(movedRight, startedLeft, reason: 'track $id swapped');
      }
    });

    test(
      'short occlusion (< 1 s) keeps id; box extrapolation capped at 0.3 s',
      () {
        final t = ObjectTracker();
        var ts = 0.0;
        double x = 0.3;
        for (var i = 0; i < 10; i++) {
          t.update(frame(ts, [det(ObjectClass.car, x, 0.5)]), hfovDeg: hfov);
          ts += 0.1;
          x += 0.005; // 0.05 / s
        }
        final lastSeenX = x - 0.005;
        // 0.5 s gap: still confirmed (lost after 0.6 s), extrapolated ≤ 0.3 s.
        List<TrackedObject> out = const [];
        for (var i = 0; i < 5; i++) {
          out = t.update(frame(ts, const []), hfovDeg: hfov);
          ts += 0.1;
        }
        expect(out.single.state, TrackState.confirmed);
        expect(
          out.single.box.center.dx,
          closeTo(lastSeenX + 0.05 * 0.3, 0.006),
        );
        // 0.7 s unseen → lost.
        out = t.update(frame(ts + 0.1, const []), hfovDeg: hfov);
        expect(out.single.state, TrackState.lost);
        expect(
          out.single.box.center.dx,
          closeTo(lastSeenX + 0.05 * 0.3, 0.006),
        );
        // Reappears (0.9 s after last sighting) → same id, confirmed again.
        ts += 0.2;
        out = t.update(
          frame(ts, [det(ObjectClass.car, lastSeenX + 0.045, 0.5)]),
          hfovDeg: hfov,
        );
        expect(out.single.id, 1);
        expect(out.single.state, TrackState.confirmed);
      },
    );

    test(
      'long occlusion (> 1 s) removes the track; reappearance gets a new id',
      () {
        final t = ObjectTracker();
        var ts = 0.0;
        for (var i = 0; i < 5; i++) {
          t.update(frame(ts, [det(ObjectClass.car, 0.5, 0.5)]), hfovDeg: hfov);
          ts += 0.1;
        }
        for (var i = 0; i < 12; i++) {
          t.update(frame(ts, const []), hfovDeg: hfov);
          ts += 0.1;
        }
        expect(t.activeTrackCount, 0);
        List<TrackedObject> out = const [];
        for (var i = 0; i < 3; i++) {
          out = t.update(
            frame(ts, [det(ObjectClass.car, 0.5, 0.5)]),
            hfovDeg: hfov,
          );
          ts += 0.1;
        }
        expect(out.single.id, isNot(1));
      },
    );

    test('flickering detections are suppressed', () {
      final t = ObjectTracker();
      for (var i = 0; i < 20; i++) {
        final dets = i.isEven
            ? [det(ObjectClass.person, 0.5, 0.5)]
            : const <Never>[];
        expect(t.update(frame(i * 0.1, dets), hfovDeg: hfov), isEmpty);
      }
    });

    test('class switch is not merged into an existing track', () {
      final t = ObjectTracker();
      var ts = 0.0;
      for (var i = 0; i < 4; i++) {
        t.update(frame(ts, [det(ObjectClass.car, 0.5, 0.5)]), hfovDeg: hfov);
        ts += 0.1;
      }
      List<TrackedObject> out = const [];
      for (var i = 0; i < 3; i++) {
        out = t.update(
          frame(ts, [det(ObjectClass.bus, 0.5, 0.5)]),
          hfovDeg: hfov,
        );
        ts += 0.1;
      }
      final car = out.where((o) => o.cls == ObjectClass.car).single;
      final bus = out.where((o) => o.cls == ObjectClass.bus).single;
      expect(car.id, 1);
      expect(bus.id, isNot(1));
      expect(car.missedFrames, 3);
    });

    test('low-confidence detections extend tracks but never create them', () {
      final t = ObjectTracker();
      var ts = 0.0;
      for (var i = 0; i < 3; i++) {
        t.update(frame(ts, [det(ObjectClass.car, 0.5, 0.5)]), hfovDeg: hfov);
        ts += 0.1;
      }
      List<TrackedObject> out = const [];
      for (var i = 0; i < 15; i++) {
        out = t.update(
          frame(ts, [det(ObjectClass.car, 0.5, 0.5, conf: 0.3)]),
          hfovDeg: hfov,
        );
        ts += 0.1;
      }
      expect(out.single.id, 1);
      expect(out.single.missedFrames, 0);

      final t2 = ObjectTracker();
      for (var i = 0; i < 10; i++) {
        expect(
          t2.update(
            frame(i * 0.1, [det(ObjectClass.car, 0.5, 0.5, conf: 0.3)]),
            hfovDeg: hfov,
          ),
          isEmpty,
        );
      }
    });

    test('traffic-light state passes through the hysteresis filter', () {
      final t = ObjectTracker();
      List<TrackedObject> out = const [];
      final states = <LightState>[];
      for (var i = 0; i < 6; i++) {
        out = t.update(
          frame(i * 0.1, [
            det(
              ObjectClass.trafficLight,
              0.5,
              0.2,
              w: 0.03,
              h: 0.08,
              light: LightState.green,
              lightConf: 0.9,
            ),
          ]),
          hfovDeg: hfov,
        );
        if (out.isNotEmpty) states.add(out.single.light);
      }
      // Confirmed from frame 3; green accepted at frame 5 (4 frames, 0.4 s).
      expect(states, [
        LightState.unknown,
        LightState.unknown,
        LightState.green,
        LightState.green,
      ]);
    });

    test('spatial fields are filled from the estimator', () {
      final t = ObjectTracker();
      List<TrackedObject> out = const [];
      for (var i = 0; i < 3; i++) {
        out = t.update(
          frame(i * 0.1, [det(ObjectClass.car, 0.75, 0.5, h: 0.2)]),
          hfovDeg: hfov,
        );
      }
      final o = out.single;
      expect(o.bearingDeg, greaterThan(10));
      expect(o.approxRangeM, isNotNull);
      expect(o.zone, isNot(ProximityZone.unknown));
    });

    test('expire() ages out tracks without frames', () {
      final t = ObjectTracker();
      for (var i = 0; i < 3; i++) {
        t.update(
          frame(i * 0.1, [det(ObjectClass.car, 0.5, 0.5)]),
          hfovDeg: hfov,
        );
      }
      expect(t.expire(baseTsMs + 2000), isEmpty);
      expect(t.activeTrackCount, 0);
    });
  });
}
