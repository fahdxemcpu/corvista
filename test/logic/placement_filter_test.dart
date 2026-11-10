import 'package:corvista/domain/models/object_class.dart';
import 'package:corvista/domain/models/tracked_object.dart';
import 'package:corvista/features/detection/ground_projector.dart';
import 'package:corvista/features/detection/placement_filter.dart';
import 'package:corvista/features/detection/spatial_estimator.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';

const _size = Size(1280, 720);
final _f = SpatialEstimator.focalPx(1280, 68);

Rect _box(double d, double x, {double heightM = 1.5}) {
  final yb = 360 + 1.3 * _f / d;
  final hPx = _f * heightM / d;
  final cx = 640 + x * _f / d;
  final wPx = _f * 1.0 / d;
  return Rect.fromLTRB(
    (cx - wPx / 2) / 1280,
    (yb - hPx) / 720,
    (cx + wPx / 2) / 1280,
    yb / 720,
  );
}

TrackedObject _t(
  int id,
  Rect box, {
  ObjectClass cls = ObjectClass.car,
  TrackState state = TrackState.confirmed,
  int missed = 0,
  double conf = .9,
}) => TrackedObject(
  id: id,
  cls: cls,
  box: box,
  confidence: conf,
  state: state,
  ageFrames: 10,
  missedFrames: missed,
  lastSeenTs: 0,
  velocity: (dx: 0, dy: 0, scaleRate: 0),
  light: LightState.unknown,
  bearingDeg: 0,
  approxRangeM: null,
  zone: ProximityZone.unknown,
);

PlacementFilter _filter({bool leftHand = false}) => PlacementFilter(
  projector: GroundProjector(autoHorizon: false),
  leftHand: leftHand,
);

List<PlacedObject> _run(PlacementFilter f, List<TrackedObject> ts, double t) =>
    f.update(ts, tS: t, frameSize: _size, hfovDeg: 68);

void main() {
  test('new track appears at its measured place (no lerp-in)', () {
    final f = _filter();
    final p = _run(f, [_t(1, _box(18, 3.4))], 0).single;
    expect(p.distanceM, closeTo(18, .5));
    expect(p.lane, 1);
    expect(p.displayX, closeTo(3.5, 1e-9));
    expect(p.zone, ProximityZone.medium);
  });

  test('tentative, low-confidence and far tracks are not shown', () {
    final f = _filter();
    final out = _run(f, [
      _t(1, _box(10, 0), state: TrackState.tentative),
      _t(2, _box(10, 0), conf: .2),
      _t(3, _box(80, 0)),
    ], 0);
    expect(out, isEmpty);
  });

  test('caps to the 12 nearest', () {
    final f = _filter();
    final out = _run(f, [
      for (var i = 0; i < 20; i++) _t(i, _box(6.0 + i * 2.5, 0)),
    ], 0);
    expect(out, hasLength(12));
    expect(out.last.distanceM, lessThan(36));
  });

  test('per-update motion is clamped to plausible speeds', () {
    final f = _filter();
    _run(f, [_t(1, _box(20, 0))], 0);
    // Detector glitch: box suddenly says 5 m, 0.1 s later.
    final p = _run(f, [_t(1, _box(5, 0))], .1).single;
    expect(p.distanceM, greaterThan(20 - 40 * .1 - 1e-6));
  });

  test('unseen track holds its place, then is reported lost', () {
    final f = _filter();
    final a = _run(f, [_t(1, _box(15, -3.5))], 0).single;
    final held = _run(f, [_t(1, _box(15, 3.5), missed: 1)], .1).single;
    expect(held.lost, isFalse);
    expect(held.distanceM, a.distanceM);
    expect(held.lateralM, a.lateralM);
    final lost = _run(f, [
      _t(1, _box(15, 3.5), state: TrackState.lost, missed: 6),
    ], .7).single;
    expect(lost.lost, isTrue);
    expect(lost.lateralM, a.lateralM);
  });

  test('lane snapping has hysteresis', () {
    final f = _filter();
    var t = 0.0;
    PlacedObject step(double x) {
      t += .1;
      late PlacedObject p;
      for (var i = 0; i < 15; i++) {
        p = _run(f, [_t(1, _box(15, x))], t += .1).single;
      }
      return p;
    }

    expect(step(0).lane, 0);
    expect(step(2.0).lane, 0, reason: 'just past the lane line: keep lane');
    expect(step(2.6).lane, 1);
    expect(step(1.5).lane, 1, reason: 'drifting back a little: keep lane');
  });

  test('zone colour has hysteresis', () {
    final f = _filter();
    var t = 0.0;
    ProximityZone settle(double d) {
      late PlacedObject p;
      for (var i = 0; i < 30; i++) {
        p = _run(f, [_t(1, _box(d, 0))], t += .1).single;
      }
      return p.zone;
    }

    expect(settle(9), ProximityZone.close);
    expect(settle(10.8), ProximityZone.close, reason: 'within 15 % band');
    expect(settle(12.5), ProximityZone.medium);
  });

  test('people beyond the kerb go on the sidewalk; mirrored for LHT', () {
    final rht = _run(_filter(), [
      _t(1, _box(12, 7, heightM: 1.7), cls: ObjectClass.person),
    ], 0).single;
    expect(rht.slot, RoadSlot.kerbSide);
    expect(rht.displayX, const LaneModel().kerbSidewalk);
    final lht = _run(_filter(leftHand: true), [
      _t(1, _box(12, -7, heightM: 1.7), cls: ObjectClass.person),
    ], 0).single;
    expect(lht.slot, RoadSlot.kerbSide);
    expect(lht.displayX, -const LaneModel().kerbSidewalk);
  });

  test('signals stand at the roadside of the side they are seen on', () {
    final out = _run(_filter(), [
      _t(1, _box(20, -1, heightM: .9), cls: ObjectClass.trafficLight),
      _t(2, _box(20, 2, heightM: .75), cls: ObjectClass.stopSign),
    ], 0);
    final light = out.firstWhere((p) => p.id == 1);
    final stop = out.firstWhere((p) => p.id == 2);
    expect(light.slot, RoadSlot.farSide);
    expect(light.displayX, lessThan(const LaneModel().farEdge));
    expect(stop.slot, RoadSlot.kerbSide);
    expect(stop.displayX, greaterThan(const LaneModel().kerbEdge));
  });

  test('a rider is not drawn twice (person on a two-wheeler)', () {
    final bike = _box(10, 0, heightM: 1.2);
    final rider = Rect.fromLTRB(
      bike.left + bike.width * .1,
      bike.top - bike.height * .5,
      bike.right - bike.width * .1,
      bike.top + bike.height * .6,
    );
    final out = _run(_filter(), [
      _t(1, bike, cls: ObjectClass.motorcycle),
      _t(2, rider, cls: ObjectClass.person),
    ], 0);
    expect(out.map((p) => p.cls), [ObjectClass.motorcycle]);
  });
}
