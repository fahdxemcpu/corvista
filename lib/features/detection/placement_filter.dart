import 'dart:math' as math;
import 'dart:ui';

import '../../domain/models/object_class.dart';
import '../../domain/models/tracked_object.dart';
import 'ground_projector.dart';
import 'spatial_estimator.dart';

/// Illustrative lane model around the ego lane, in "kerb-side" coordinates
/// `u` (metres; + toward the kerb: right in right-hand traffic, left in
/// left-hand traffic). The ego lane is centred at `u = 0`; one lane lies
/// between it and the kerb, one more same-direction lane on the far side,
/// then a centre line and two oncoming lanes. Lane widths ~3.5 m.
class LaneModel {
  const LaneModel({
    this.laneWidthM = 3.5,
    this.kerbLanes = 1,
    this.farSameLanes = 1,
    this.oncomingLanes = 2,
    this.sidewalkM = 2.8,
  });

  final double laneWidthM;
  final int kerbLanes, farSameLanes, oncomingLanes;
  final double sidewalkM;

  double get kerbEdge => laneWidthM * (.5 + kerbLanes);
  double get centreLine => -laneWidthM * (.5 + farSameLanes);
  double get farEdge => -laneWidthM * (.5 + farSameLanes + oncomingLanes);
  int get minLane => -(farSameLanes + oncomingLanes);
  int get maxLane => kerbLanes;
  double get kerbSidewalk => kerbEdge + sidewalkM / 2;
  double get farSidewalk => farEdge - sidewalkM / 2;
}

/// Where an object sits relative to the illustrative road.
enum RoadSlot { lane, kerbSide, farSide }

/// One object as placed in the virtual scene.
class PlacedObject {
  const PlacedObject({
    required this.id,
    required this.cls,
    required this.distanceM,
    required this.lateralM,
    required this.displayX,
    required this.lane,
    required this.slot,
    required this.zone,
    required this.lost,
    this.light = LightState.unknown,
    this.confidence = 1,
  });

  final int id;
  final ObjectClass cls;

  /// Filtered forward distance from the camera (m, stylized use only).
  final double distanceM;

  /// Filtered lateral offset (m, + right), before lane snapping.
  final double lateralM;

  /// Scene x (m, + right): lane centre for vehicles, kerb/sidewalk strip for
  /// roadside people and signals.
  final double displayX;

  /// Lane index in kerb-side coordinates (0 = ego lane).
  final int lane;
  final RoadSlot slot;

  /// Proximity zone with hysteresis.
  final ProximityZone zone;

  /// The track is not currently observed: hold in place and fade.
  final bool lost;
  final LightState light;
  final double confidence;
}

class _State {
  _State(this.ld, this.tan, this.t);
  double ld; // ln(distance)
  double vld = 0; // d ln(distance) / dt
  double tan; // lateral / distance
  double t;
  int lane = 0;
  RoadSlot slot = RoadSlot.lane;
  ProximityZone zone = ProximityZone.far;
  bool shown = false;
  double get d => math.exp(ld);
}

/// Turns tracker output into calm, physically plausible scene placements:
///
/// * distance / lateral from [GroundProjector] (box bottom-centre on the
///   road plane, fused with the nominal-height range);
/// * per-track alpha-beta filter on log-distance and on the lateral ratio,
///   with per-update motion clamped to [maxRelSpeedMps] /
///   [maxLateralSpeedMps]; new tracks start at their measured place, unseen
///   tracks hold their last place (no extrapolated sliding);
/// * lane snapping with hysteresis ([LaneModel], mirrored for left-hand
///   traffic); people / bicycles beyond the kerb go on the sidewalk strip;
///   signals always stand at the roadside of the side they are seen on;
/// * zone hysteresis (a farther zone needs threshold × [zoneHysteresis]);
/// * only confirmed tracks with confidence ≥ [minConfidence], nearer than
///   [maxRangeM], capped to the [maxObjects] nearest.
class PlacementFilter {
  PlacementFilter({
    GroundProjector? projector,
    this.lanes = const LaneModel(),
    this.estimator = const SpatialEstimator(),
    this.leftHand = false,
    this.alpha = .35,
    this.beta = .04,
    this.lateralAlpha = .45,
    this.maxRelSpeedMps = 40,
    this.maxLateralSpeedMps = 8,
    this.laneHysteresisM = .45,
    this.zoneHysteresis = 1.15,
    this.minConfidence = .4,
    this.maxRangeM = 60,
    this.maxObjects = 12,
    this.holdS = .3,
  }) : projector = projector ?? GroundProjector();

  final GroundProjector projector;
  final LaneModel lanes;
  final SpatialEstimator estimator;
  bool leftHand;
  final double alpha, beta, lateralAlpha;
  final double maxRelSpeedMps, maxLateralSpeedMps;
  final double laneHysteresisM, zoneHysteresis;
  final double minConfidence, maxRangeM;
  final int maxObjects;

  /// How long an unseen track keeps its place at full presence before it is
  /// reported lost (bridges brief detector dropouts without blinking).
  final double holdS;

  final Map<int, _State> _states = {};

  void reset() {
    _states.clear();
    projector.reset();
  }

  double get _s => leftHand ? -1.0 : 1.0;

  /// [tS]: frame time in seconds. Returns the objects to draw.
  List<PlacedObject> update(
    List<TrackedObject> tracks, {
    required double tS,
    required Size frameSize,
    required double hfovDeg,
  }) {
    for (final t in tracks) {
      if (t.isConfirmed && t.missedFrames == 0) projector.observe(t.cls, t.box);
    }
    final present = <int>{};
    final riders = _riders(tracks);
    final out = <PlacedObject>[];
    for (final t in tracks) {
      if (t.state == TrackState.tentative) continue;
      present.add(t.id);
      if (riders.contains(t.id)) continue;
      var st = _states[t.id];
      final seen = t.isConfirmed && t.missedFrames == 0;
      if (seen) {
        final fix = projector.project(
          cls: t.cls,
          box: t.box,
          frameSize: frameSize,
          hfovDeg: hfovDeg,
        );
        if (fix != null) {
          if (st == null) {
            st = _State(math.log(fix.distanceM), fix.tanBearing, tS);
            _states[t.id] = st;
            _initSlots(st, t.cls);
          } else {
            _correct(st, fix, tS);
          }
        }
      }
      if (st == null) continue;
      final d = st.d;
      if (!st.shown) {
        if (!seen || t.confidence < minConfidence || d > maxRangeM) continue;
        st.shown = true;
      }
      if (d > maxRangeM * 1.1) {
        st.shown = false;
        continue;
      }
      _updateSlots(st, t.cls);
      _updateZone(st);
      // Unseen: hold in place; after [holdS] it is reported lost (fades).
      final lost = !seen && (t.state == TrackState.lost || tS - st.t > holdS);
      out.add(_placed(t, st, lost: lost));
    }
    _states.removeWhere((id, _) => !present.contains(id));
    out.sort((a, b) => a.distanceM.compareTo(b.distanceM));
    return out.length > maxObjects ? out.sublist(0, maxObjects) : out;
  }

  /// Person tracks that are the rider of a detected bicycle / motorcycle
  /// (the two-wheeler model already includes its rider).
  static Set<int> _riders(List<TrackedObject> tracks) {
    final out = <int>{};
    for (final p in tracks) {
      if (p.cls != ObjectClass.person) continue;
      for (final b in tracks) {
        if (b.cls != ObjectClass.motorcycle && b.cls != ObjectClass.bicycle) {
          continue;
        }
        final pb = p.box, bb = b.box;
        final cx = pb.center.dx;
        final overlapX = cx > bb.left && cx < bb.right;
        // Rider: centred over the vehicle, feet within its upper part.
        if (overlapX &&
            pb.bottom > bb.top &&
            pb.bottom < bb.bottom + bb.height * .1 &&
            pb.width < bb.width * 1.6) {
          out.add(p.id);
          break;
        }
      }
    }
    return out;
  }

  void _correct(_State st, GroundFix fix, double tS) {
    final dt = (tS - st.t).clamp(1e-3, .5);
    st.t = tS;
    final pred = st.ld + st.vld * dt;
    final r = math.log(fix.distanceM) - pred;
    var ld = pred + alpha * r;
    st.vld = (st.vld + beta / dt * r).clamp(-3.0, 3.0);
    // Physically plausible relative motion only.
    final d0 = st.d;
    final maxStep = maxRelSpeedMps * dt;
    final d1 = math.exp(ld).clamp(d0 - maxStep, d0 + maxStep);
    ld = math.log(math.max(.5, d1));
    st.ld = ld;
    final x0 = st.tan * d0;
    var tan = st.tan + lateralAlpha * (fix.tanBearing - st.tan);
    final d = math.exp(ld);
    final maxLat = maxLateralSpeedMps * dt;
    final x1 = (tan * d).clamp(x0 - maxLat, x0 + maxLat);
    tan = x1 / d;
    st.tan = tan;
  }

  void _initSlots(_State st, ObjectClass cls) {
    final u = _s * st.tan * st.d;
    st.lane = (u / lanes.laneWidthM).round().clamp(
      lanes.minLane,
      lanes.maxLane,
    );
    st.slot = _roadside(cls, u, null);
    st.zone = estimator.zoneFor(st.d);
  }

  RoadSlot _roadside(ObjectClass cls, double u, RoadSlot? cur) {
    if (cls.isSignal) {
      // Signals stand at the roadside of the side they are seen on.
      if (cur == RoadSlot.farSide) return u > 1 ? RoadSlot.kerbSide : cur!;
      if (cur == RoadSlot.kerbSide) return u < -1 ? RoadSlot.farSide : cur!;
      return u >= 0 ? RoadSlot.kerbSide : RoadSlot.farSide;
    }
    if (cls != ObjectClass.person && cls != ObjectClass.bicycle) {
      return RoadSlot.lane;
    }
    const h = .3;
    final kerbIn = cur == RoadSlot.kerbSide
        ? lanes.kerbEdge - h
        : lanes.kerbEdge + h;
    final farIn = cur == RoadSlot.farSide
        ? lanes.farEdge + h
        : lanes.farEdge - h;
    if (u > kerbIn) return RoadSlot.kerbSide;
    if (u < farIn) return RoadSlot.farSide;
    return RoadSlot.lane;
  }

  void _updateSlots(_State st, ObjectClass cls) {
    final u = _s * st.tan * st.d;
    final w = lanes.laneWidthM;
    if ((u - st.lane * w).abs() > w / 2 + laneHysteresisM) {
      st.lane = (u / w).round().clamp(lanes.minLane, lanes.maxLane);
    }
    st.slot = _roadside(cls, u, st.slot);
  }

  void _updateZone(_State st) {
    final d = st.d;
    final cand = estimator.zoneFor(d);
    if (cand.index < st.zone.index) {
      st.zone = cand; // nearer: immediately
    } else if (cand.index > st.zone.index) {
      final bound = switch (st.zone) {
        ProximityZone.veryClose => estimator.veryCloseM,
        ProximityZone.close => estimator.closeM,
        ProximityZone.medium => estimator.mediumM,
        _ => double.infinity,
      };
      if (d > bound * zoneHysteresis) {
        st.zone = estimator.zoneFor(d / zoneHysteresis);
      }
    }
  }

  PlacedObject _placed(TrackedObject t, _State st, {required bool lost}) {
    final d = st.d;
    final x = st.tan * d;
    final u = _s * x;
    final w = lanes.laneWidthM;
    final double du;
    switch (st.slot) {
      case RoadSlot.kerbSide:
        du = t.cls.isSignal ? lanes.kerbEdge + .6 : lanes.kerbSidewalk;
      case RoadSlot.farSide:
        du = t.cls.isSignal ? lanes.farEdge - .6 : lanes.farSidewalk;
      case RoadSlot.lane:
        du = t.cls == ObjectClass.person || t.cls == ObjectClass.bicycle
            ? u.clamp(lanes.farEdge + .5, lanes.kerbEdge - .5)
            : st.lane * w;
    }
    return PlacedObject(
      id: t.id,
      cls: t.cls,
      distanceM: d,
      lateralM: x,
      displayX: _s * du,
      lane: st.lane,
      slot: st.slot,
      zone: st.zone,
      lost: lost,
      light: t.light,
      confidence: t.confidence,
    );
  }
}
