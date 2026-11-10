import 'dart:math' as math;
import 'dart:ui';

import '../../domain/models/object_class.dart';
import '../../domain/models/tracked_object.dart';
import '../detection/ground_projector.dart';
import '../detection/spatial_estimator.dart';

/// Close-range parking zones, most severe first. Always approximate: a
/// single camera cannot measure distance (docs/ESTIMATION.md › Parking).
/// [nothingClose] never means "clear" — only that no supported object was
/// estimated within the close band.
enum ParkingZone { stop, veryClose, close, nothingClose }

/// Which part of the camera view an object is in, relative to the vehicle's
/// straight-ahead path. Physical sides: never mirrored for RTL.
enum ParkingSide { left, centre, right }

extension ParkingZoneX on ParkingZone {
  /// 3 stop, 2 very close, 1 close, 0 nothing close. Equals the
  /// `audio.proximity` level: 3 continuous, 2 fast beeps, 1 slow beeps.
  int get level => switch (this) {
    ParkingZone.stop => 3,
    ParkingZone.veryClose => 2,
    ParkingZone.close => 1,
    ParkingZone.nothingClose => 0,
  };

  static ParkingZone ofLevel(int l) => switch (l) {
    >= 3 => ParkingZone.stop,
    2 => ParkingZone.veryClose,
    1 => ParkingZone.close,
    _ => ParkingZone.nothingClose,
  };
}

/// One supported object as assessed for parking.
class ParkingObject {
  const ParkingObject({
    required this.track,
    required this.clearanceM,
    required this.zone,
    required this.side,
    required this.bottomEdge,
  });

  final TrackedObject track;

  /// Temporally filtered, very approximate distance from the assumed vehicle
  /// front (m). Used only for zones; never shown as a number.
  final double clearanceM;
  final ParkingZone zone;
  final ParkingSide side;

  /// The box touches the bottom frame edge (object partly below the view).
  final bool bottomEdge;
}

/// Result of one [ParkingProximity.evaluate] call.
class ParkingAssessment {
  const ParkingAssessment({
    required this.zone,
    required this.nearest,
    required this.sectors,
    required this.objects,
    this.ownVehicleIds = const {},
  });

  static const empty = ParkingAssessment(
    zone: ParkingZone.nothingClose,
    nearest: null,
    sectors: {
      ParkingSide.left: ParkingZone.nothingClose,
      ParkingSide.centre: ParkingZone.nothingClose,
      ParkingSide.right: ParkingZone.nothingClose,
    },
    objects: [],
  );

  /// Overall zone (most severe sector, with release hysteresis).
  final ParkingZone zone;

  /// Most severe / nearest object currently assessed (null when none within
  /// the considered range). May lag [zone] briefly while a zone is held.
  final ParkingObject? nearest;

  /// Held zone per side.
  final Map<ParkingSide, ParkingZone> sectors;

  /// Every supported object within the considered range.
  final List<ParkingObject> objects;

  /// Tracks recognised as the user's own bonnet (ignored, not drawn).
  final Set<int> ownVehicleIds;

  /// `audio.proximity` level for [zone].
  int get toneLevel => zone.level;

  ParkingObject? objectFor(int trackId) {
    for (final o in objects) {
      if (o.track.id == trackId) return o;
    }
    return null;
  }
}

class _Memory {
  _Memory(this.logD, this.seenS);
  double logD;
  double seenS;
  int level = 0;
}

class _Hold {
  int level = 0;
  double? lowerSince;

  int update(int raw, double tS, double releaseS) {
    if (raw >= level) {
      level = raw;
      lowerSince = null;
    } else {
      lowerSince ??= tS;
      if (tS - lowerSince! >= releaseS) {
        level = raw;
        lowerSince = null;
      }
    }
    return level;
  }
}

/// Close-range (0–5 m) proximity model for slow manoeuvring with the phone
/// camera facing the direction of travel.
///
/// Per confirmed (or briefly lost) track of a supported class (car, bus,
/// person, bicycle, motorcycle — the COCO classes the detector knows; walls,
/// pillars, poles and kerbs are NOT detected):
///
/// 1. **Camera distance** from the shared [GroundProjector]: box-bottom ground
///    contact blended with the class's nominal height; an upper bound when the
///    box is cut by the bottom edge.
/// 2. **Width cue** when the height is unusable (box cut at top or bottom) but
///    both sides are visible: `f · W_min / w_px` with the class's narrowest
///    plausible footprint (conservative: never farther than reality for a
///    correctly classified object). The smaller of bound and width cue wins.
/// 3. **Big-box rule**: a bottom-cut box covering ≥ [bigBoxWidth] ×
///    [bigBoxHeight] of the frame is treated as touching distance.
/// 4. **Own bonnet**: a vehicle box cut by the bottom edge, at least
///    [bonnetMinWidth] wide, whose top lies well below the horizon is the
///    user's own bonnet seen through the windscreen (a real vehicle is taller
///    than the camera height, so its top is above the horizon) — ignored.
/// 5. `clearance = camera distance − [frontOffsetM]` (phone behind the bonnet).
/// 6. **Temporal filter** in log space: approaches are followed quickly
///    ([approachGain]), recessions slowly ([recedeGain]).
/// 7. **Zones** on clearance: stop < [stopM], very close < [veryCloseM],
///    close < [closeM]; a band is left only beyond its threshold ×
///    [exitFactor]. **Bottom-edge rule**: a box touching the bottom edge is at
///    least very close.
/// 8. **Side**: the box's lateral extent at its distance vs the vehicle path
///    (± [halfPathM]): overlapping → centre, otherwise left / right.
/// 9. Overall and per-side zones rise immediately and fall only after
///    [releaseS] (prevents chattering beeps).
class ParkingProximity {
  ParkingProximity({
    GroundProjector? projector,
    this.frontOffsetM = 1.5,
    this.stopM = 0.6,
    this.veryCloseM = 1.5,
    this.closeM = 3.0,
    this.maxClearanceM = 5.0,
    this.exitFactor = 1.2,
    this.releaseS = 0.6,
    this.approachGain = 0.7,
    this.recedeGain = 0.3,
    this.halfPathM = 1.0,
    this.edgeMargin = 0.01,
    this.minBottomBoxHeight = 0.05,
    this.bigBoxWidth = 0.7,
    this.bigBoxHeight = 0.6,
    this.forgetAfterS = 1.5,
    this.bonnetMinWidth = 0.4,
    this.bonnetBelowHorizon = 0.1,
    this.bonnetMinTop = 0.62,
    this.minCentreHalf = 0.1,
    this.maxCentreHalf = 0.2,
  }) : projector =
           projector ??
           GroundProjector(minRangeM: 0.3, maxRangeM: 40, agreeRatio: 2.2);

  final GroundProjector projector;

  /// Assumed distance from the phone to the vehicle front (bonnet length for
  /// a windscreen mount).
  final double frontOffsetM;
  final double stopM, veryCloseM, closeM;

  /// Objects estimated farther than this from the front are ignored.
  final double maxClearanceM;
  final double exitFactor;
  final double releaseS;
  final double approachGain, recedeGain;
  final double halfPathM;
  final double edgeMargin;
  final double minBottomBoxHeight;
  final double bigBoxWidth, bigBoxHeight;
  final double forgetAfterS;
  final double bonnetMinWidth, bonnetBelowHorizon, bonnetMinTop;
  final double minCentreHalf, maxCentreHalf;

  final Map<int, _Memory> _mem = {};
  final _Hold _overall = _Hold();
  final Map<ParkingSide, _Hold> _sides = {
    for (final s in ParkingSide.values) s: _Hold(),
  };

  /// Narrowest plausible visible width (m) per class, for the width cue.
  static double minWidthM(ObjectClass c) => switch (c) {
    ObjectClass.person => 0.45,
    ObjectClass.bicycle => 0.5,
    ObjectClass.motorcycle => 0.7,
    ObjectClass.car => 1.65,
    ObjectClass.bus => 2.3,
    ObjectClass.trafficLight || ObjectClass.stopSign => 0.3,
  };

  static bool supports(ObjectClass c) => !c.isSignal;

  /// Whether [box] looks like the user's own bonnet (see class doc, step 4).
  /// The top must be below the horizon by [bonnetBelowHorizon], or in any
  /// case below [bonnetMinTop] (guards a badly calibrated horizon).
  bool isOwnBonnet(ObjectClass cls, Rect box) =>
      cls.isVehicle &&
      box.bottom >= 1 - edgeMargin &&
      box.width >= bonnetMinWidth &&
      box.top >= math.min(projector.horizon + bonnetBelowHorizon, bonnetMinTop);

  void reset() {
    _mem.clear();
    projector.reset();
    _overall
      ..level = 0
      ..lowerSince = null;
    for (final h in _sides.values) {
      h
        ..level = 0
        ..lowerSince = null;
    }
  }

  /// Raw (unfiltered) camera distance in metres for one box, or null when
  /// not estimable / not a supported class. Public for tests and tools.
  double? cameraDistance({
    required ObjectClass cls,
    required Rect box,
    required Size frameSize,
    required double hfovDeg,
  }) {
    if (!supports(cls)) return null;
    final w = frameSize.width > 0 ? frameSize.width : 1280.0;
    final h = frameSize.height > 0 ? frameSize.height : 720.0;
    final f = SpatialEstimator.focalPx(w, hfovDeg);
    final bottomCut = box.bottom >= 1 - edgeMargin;
    final topCut = box.top <= edgeMargin;
    final sideCut = box.left <= edgeMargin || box.right >= 1 - edgeMargin;
    if (bottomCut && box.height < minBottomBoxHeight) return null;

    final fix = projector.project(
      cls: cls,
      box: box,
      frameSize: frameSize,
      hfovDeg: hfovDeg,
    );
    double? d = fix?.distanceM;
    if (bottomCut) {
      // Contact point below the frame: nearer than the frame-bottom ray
      // (same formula as GroundSource.bound; the projector skips short
      // bottom-cut boxes). The bound alone never reaches "stop": that needs
      // the width cue or the big-box rule.
      final bound =
          projector.cameraHeightM *
          f /
          math.max(2.0, (1 - projector.horizon) * h) *
          .85;
      d = math.max(
        math.min(d ?? bound, bound),
        frontOffsetM + stopM * exitFactor + .05,
      );
    }
    if ((bottomCut || topCut) && !sideCut && box.width * w >= 4) {
      final dw = f * minWidthM(cls) / (box.width * w);
      d = d == null ? dw : math.min(d, dw);
    }
    if (bottomCut && box.width >= bigBoxWidth && box.height >= bigBoxHeight) {
      d = math.min(d ?? frontOffsetM, frontOffsetM + stopM * .5);
    }
    return d;
  }

  /// Side of the vehicle path the box is on, for a camera distance [d]: the
  /// vehicle path (± [halfPathM]) projected at [d] gives a central image band
  /// (capped to [minCentreHalf]…[maxCentreHalf] of the width, so an object
  /// hugging an image edge is always on that side); a box overlapping the
  /// band is centre. A box cut by a side edge uses the narrowest band.
  ParkingSide sideOf(Rect box, double d, Size frameSize, double hfovDeg) {
    final w = frameSize.width > 0 ? frameSize.width : 1280.0;
    final f = SpatialEstimator.focalPx(w, hfovDeg);
    // A box cut by a side edge is beside the vehicle (its forward distance is
    // small but unknown): centre only if it reaches the middle of the view.
    final edge = box.left <= edgeMargin || box.right >= 1 - edgeMargin;
    final half = edge
        ? minCentreHalf
        : (f * halfPathM / math.max(.3, d) / w).clamp(
            minCentreHalf,
            maxCentreHalf,
          );
    if (box.right <= .5 - half) return ParkingSide.left;
    if (box.left >= .5 + half) return ParkingSide.right;
    return ParkingSide.centre;
  }

  int _levelFor(double clearance, int held, bool bottomEdge) {
    var lvl = 0;
    final thresholds = [closeM, veryCloseM, stopM]; // levels 1, 2, 3
    for (var i = 0; i < 3; i++) {
      final l = i + 1;
      final limit = held >= l ? thresholds[i] * exitFactor : thresholds[i];
      if (clearance < limit) lvl = l;
    }
    if (bottomEdge) lvl = math.max(lvl, 2);
    return lvl;
  }

  /// Assesses one tracker output. [tsS] in seconds (monotonic).
  ParkingAssessment evaluate(
    List<TrackedObject> tracks, {
    required Size frameSize,
    required double hfovDeg,
    required double tsS,
  }) {
    final objects = <ParkingObject>[];
    final own = <int>{};
    for (final t in tracks) {
      if (!supports(t.cls) || t.state == TrackState.tentative) continue;
      if (isOwnBonnet(t.cls, t.box)) {
        own.add(t.id);
        _mem.remove(t.id);
        continue;
      }
      if (t.isConfirmed && t.missedFrames == 0) {
        projector.observe(t.cls, t.box);
      }
      final raw = cameraDistance(
        cls: t.cls,
        box: t.box,
        frameSize: frameSize,
        hfovDeg: hfovDeg,
      );
      if (raw == null) {
        _mem.remove(t.id);
        continue;
      }
      final logRaw = math.log(math.max(.05, raw));
      final m = _mem[t.id];
      final double logD;
      if (m == null) {
        _mem[t.id] = _Memory(logRaw, tsS);
        logD = logRaw;
      } else {
        // Only fresh observations move the filter; a coasting (lost) box
        // keeps its last estimate.
        if (t.missedFrames == 0) {
          final g = logRaw < m.logD ? approachGain : recedeGain;
          m.logD += g * (logRaw - m.logD);
        }
        m.seenS = tsS;
        logD = m.logD;
      }
      final d = math.exp(logD);
      final clearance = math.max(0.0, d - frontOffsetM);
      final bottomEdge = t.box.bottom >= 1 - edgeMargin;
      if (clearance > maxClearanceM && !bottomEdge) {
        _mem[t.id]?.level = 0;
        continue;
      }
      final mem = _mem[t.id]!;
      mem.level = _levelFor(clearance, mem.level, bottomEdge);
      objects.add(
        ParkingObject(
          track: t,
          clearanceM: clearance,
          zone: ParkingZoneX.ofLevel(mem.level),
          side: sideOf(t.box, d, frameSize, hfovDeg),
          bottomEdge: bottomEdge,
        ),
      );
    }
    _mem.removeWhere((_, m) => tsS - m.seenS > forgetAfterS);

    ParkingObject? nearest;
    final rawSide = {for (final s in ParkingSide.values) s: 0};
    for (final o in objects) {
      final l = o.zone.level;
      if (l > rawSide[o.side]!) rawSide[o.side] = l;
      if (nearest == null ||
          l > nearest.zone.level ||
          (l == nearest.zone.level && o.clearanceM < nearest.clearanceM)) {
        nearest = o;
      }
    }
    final best = rawSide.values.fold(0, math.max);
    final level = _overall.update(best, tsS, releaseS);
    final sectors = {
      for (final s in ParkingSide.values)
        s: ParkingZoneX.ofLevel(_sides[s]!.update(rawSide[s]!, tsS, releaseS)),
    };
    objects.sort((a, b) => a.clearanceM.compareTo(b.clearanceM));
    return ParkingAssessment(
      zone: ParkingZoneX.ofLevel(level),
      nearest: nearest,
      sectors: sectors,
      objects: objects,
      ownVehicleIds: own,
    );
  }
}
