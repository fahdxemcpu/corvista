import 'dart:ui';

import 'package:corvista/domain/models/object_class.dart';
import 'package:corvista/domain/models/tracked_object.dart';
import 'package:corvista/features/detection/ground_projector.dart';
import 'package:corvista/features/detection/spatial_estimator.dart';
import 'package:corvista/features/parking/parking_proximity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/track_fixtures.dart';

const _size = Size(1280, 720);
const _hfov = 68.0;
final _f = SpatialEstimator.focalPx(1280, _hfov);

/// Model with a fixed horizon (0.5) so geometry is exact; optional
/// unfiltered (gain 1) and immediate-release variants for hysteresis tests.
ParkingProximity _model({bool raw = false, double releaseS = 0.6}) =>
    ParkingProximity(
      projector: GroundProjector(
        autoHorizon: false,
        minRangeM: 0.3,
        maxRangeM: 40,
      ),
      approachGain: raw ? 1 : 0.7,
      recedeGain: raw ? 1 : 0.3,
      releaseS: releaseS,
    );

/// Fully visible car whose ground contact and nominal height both say [d]
/// metres from the camera (camera 1.3 m high, horizon at mid-frame).
Rect _carAt(double d, {double cx = .5}) {
  final bottom = .5 + 1.3 * _f / d / 720;
  final h = _f * 1.5 / d / 720;
  final w = _f * 1.8 / d / 1280;
  return Rect.fromLTRB(cx - w / 2, bottom - h, cx + w / 2, bottom);
}

ParkingAssessment _eval(
  ParkingProximity m,
  List<TrackedObject> tracks, [
  double t = 0,
]) => m.evaluate(tracks, frameSize: _size, hfovDeg: _hfov, tsS: t);

void main() {
  group('zones', () {
    test('nothing → nothing close, silent, no nearest', () {
      final a = _eval(_model(), const []);
      expect(a.zone, ParkingZone.nothingClose);
      expect(a.toneLevel, 0);
      expect(a.nearest, isNull);
      expect(a.sectors.values.toSet(), {ParkingZone.nothingClose});
    });

    test('zone level is the audio.proximity level', () {
      expect(ParkingZone.stop.level, 3); // continuous
      expect(ParkingZone.veryClose.level, 2); // fast beeps
      expect(ParkingZone.close.level, 1); // slow beeps
      expect(ParkingZone.nothingClose.level, 0);
      for (final z in ParkingZone.values) {
        expect(ParkingZoneX.ofLevel(z.level), z);
      }
    });

    test('fully visible car: close within ~3 m of the front', () {
      final m = _model();
      expect(
        m.cameraDistance(
          cls: ObjectClass.car,
          box: _carAt(4),
          frameSize: _size,
          hfovDeg: _hfov,
        ),
        closeTo(4, .05),
      );
      final a = _eval(m, [track(box: _carAt(4))]);
      expect(a.zone, ParkingZone.close); // clearance ≈ 2.5 m
      expect(a.toneLevel, 1);
      expect(a.nearest!.clearanceM, closeTo(2.5, .1));
    });

    test('farther objects: listed up to 5 m clearance, then ignored', () {
      final a = _eval(_model(), [
        track(id: 1, box: _carAt(6)),
        track(id: 2, box: _carAt(9)),
      ]);
      expect(a.zone, ParkingZone.nothingClose);
      expect(a.objects.map((o) => o.track.id), [1]);
    });

    test('signals and tentative tracks are ignored', () {
      final a = _eval(_model(), [
        track(id: 1, cls: ObjectClass.stopSign, box: _carAt(3)),
        track(id: 2, state: TrackState.tentative, box: _carAt(3)),
      ]);
      expect(a.objects, isEmpty);
      expect(a.toneLevel, 0);
    });

    test('nearest = most severe, then smallest clearance', () {
      final a = _eval(_model(), [
        track(id: 1, box: _carAt(5.5)),
        track(id: 2, box: _carAt(3.6)),
        track(id: 3, box: _carAt(4.2)),
      ]);
      expect(a.nearest!.track.id, 2);
      expect(a.objects.first.track.id, 2);
    });
  });

  group('bottom edge', () {
    test('a box touching the bottom edge is at least very close', () {
      // Narrow, far-looking width; bottom cut → bottom-edge rule.
      final a = _eval(_model(), [
        track(
          cls: ObjectClass.person,
          box: const Rect.fromLTRB(.45, .75, .52, 1),
        ),
      ]);
      expect(a.zone, ParkingZone.veryClose);
      expect(a.nearest!.bottomEdge, isTrue);
      expect(a.toneLevel, 2);
    });

    test('the bound alone never reaches stop (side-cut, width unusable)', () {
      final a = _eval(_model(), [
        track(box: const Rect.fromLTRB(0, .35, .5, 1)),
      ]);
      expect(a.zone, ParkingZone.veryClose);
    });

    test('width cue: wide, fully-wide-visible bottom-cut car → stop', () {
      // f · 1.65 m / (0.75 · 1280 px) ≈ 1.6 m from the camera.
      final a = _eval(_model(), [
        track(box: const Rect.fromLTRB(.12, .3, .87, 1)),
      ]);
      expect(a.zone, ParkingZone.stop);
      expect(a.toneLevel, 3);
    });

    test('big-box rule: object filling the view → stop', () {
      final a = _eval(_model(), [
        track(box: const Rect.fromLTRB(0, .25, .95, 1)),
      ]);
      expect(a.zone, ParkingZone.stop);
    });

    test('tiny slivers at the bottom are ignored', () {
      final a = _eval(_model(), [
        track(box: const Rect.fromLTRB(.4, .98, .6, 1)),
      ]);
      expect(a.objects, isEmpty);
    });
  });

  group('own bonnet', () {
    test('wide vehicle box below the horizon at the bottom is ignored', () {
      final a = _eval(_model(), [
        track(id: 7, box: const Rect.fromLTRB(0, .74, .98, 1)),
      ]);
      expect(a.objects, isEmpty);
      expect(a.ownVehicleIds, {7});
      expect(a.zone, ParkingZone.nothingClose);
    });

    test('a real car right in front (top above the horizon) is kept', () {
      final a = _eval(_model(), [
        track(box: const Rect.fromLTRB(.05, .3, .95, 1)),
      ]);
      expect(a.ownVehicleIds, isEmpty);
      expect(a.zone, ParkingZone.stop);
    });

    test('a person at the bottom is never taken for the bonnet', () {
      final a = _eval(_model(), [
        track(cls: ObjectClass.person, box: const Rect.fromLTRB(.1, .7, .6, 1)),
      ]);
      expect(a.ownVehicleIds, isEmpty);
      expect(a.objects, hasLength(1));
    });
  });

  group('sides', () {
    ParkingSide sideOf(Rect box) =>
        _eval(_model(), [track(box: box)]).nearest!.side;

    test('centred box → centre; off-axis → left / right', () {
      expect(sideOf(_carAt(4)), ParkingSide.centre);
      expect(sideOf(_carAt(4, cx: .12)), ParkingSide.left);
      expect(sideOf(_carAt(4, cx: .88)), ParkingSide.right);
    });

    test('a box overlapping the projected vehicle path is centre', () {
      // At ~4 m the ±1 m path covers about ±18 % of the width.
      expect(sideOf(_carAt(4, cx: .25)), ParkingSide.centre);
    });

    test(
      'edge-hugging boxes are on their side unless they reach the middle',
      () {
        expect(sideOf(const Rect.fromLTRB(0, .4, .35, 1)), ParkingSide.left);
        expect(sideOf(const Rect.fromLTRB(.7, .4, 1, 1)), ParkingSide.right);
        expect(sideOf(const Rect.fromLTRB(0, .4, .55, 1)), ParkingSide.centre);
      },
    );

    test('sectors report the most severe zone per side', () {
      final a = _eval(_model(), [
        track(id: 1, box: const Rect.fromLTRB(0, .4, .3, 1)), // left, v.close
        track(id: 2, box: _carAt(4.2, cx: .85)), // right, close
      ]);
      expect(a.sectors[ParkingSide.left], ParkingZone.veryClose);
      expect(a.sectors[ParkingSide.centre], ParkingZone.nothingClose);
      expect(a.sectors[ParkingSide.right], ParkingZone.close);
      expect(a.zone, ParkingZone.veryClose);
      expect(a.nearest!.side, ParkingSide.left);
    });
  });

  group('hysteresis and filtering', () {
    test('a band is left only beyond threshold × exit factor', () {
      final m = _model(raw: true, releaseS: 0);
      // Clearance 2.9 → close; 3.3 (< 3.6) stays close; 3.9 → leaves.
      expect(_eval(m, [track(box: _carAt(4.4))], 0).zone, ParkingZone.close);
      expect(_eval(m, [track(box: _carAt(4.8))], .1).zone, ParkingZone.close);
      expect(
        _eval(m, [track(box: _carAt(5.4))], .2).zone,
        ParkingZone.nothingClose,
      );
    });

    test('rises immediately, falls only after releaseS', () {
      final m = _model(raw: true, releaseS: 0.6);
      final near = [track(box: const Rect.fromLTRB(0, .25, .95, 1))];
      expect(_eval(m, near, 0).zone, ParkingZone.stop);
      expect(_eval(m, const [], .1).zone, ParkingZone.stop);
      expect(_eval(m, const [], .5).zone, ParkingZone.stop);
      expect(_eval(m, const [], .75).zone, ParkingZone.nothingClose);
      expect(_eval(m, near, .8).zone, ParkingZone.stop);
    });

    test('approach followed fast, recession slowly', () {
      final m = _model();
      _eval(m, [track(box: _carAt(4))], 0);
      final away = _eval(m, [track(box: _carAt(10))], .2).nearest!;
      // log filter: 4 · (10/4)^0.3 ≈ 5.3 m → clearance ≈ 3.8 m (not 8.5).
      expect(away.clearanceM, closeTo(3.8, .1));
      final m2 = _model();
      _eval(m2, [track(box: _carAt(6))], 0);
      final closer = _eval(m2, [track(box: _carAt(3.5))], .2).nearest!;
      // 6 · (3.5/6)^0.7 ≈ 4.1 m → clearance ≈ 2.6 m.
      expect(closer.clearanceM, closeTo(2.6, .1));
    });

    test('a coasting (lost) box keeps its last estimate', () {
      final m = _model();
      _eval(m, [track(box: _carAt(4))], 0);
      final a = _eval(m, [
        track(box: _carAt(10), state: TrackState.lost, missed: 3),
      ], .3);
      expect(a.nearest!.clearanceM, closeTo(2.5, .05));
    });

    test('reset clears memory and held levels', () {
      final m = _model();
      _eval(m, [track(box: const Rect.fromLTRB(0, .25, .95, 1))], 0);
      m.reset();
      expect(_eval(m, const [], .1).zone, ParkingZone.nothingClose);
    });
  });
}
