import 'dart:math' as math;
import 'dart:ui';

import '../../domain/models/detection.dart';
import '../../domain/models/object_class.dart';
import '../../domain/models/tracked_object.dart';
import '../detection/spatial_estimator.dart';
import '../voice_alerts/traffic_light_filter.dart';

/// Intersection-over-union of two rects (0 when disjoint or degenerate).
double iou(Rect a, Rect b) {
  final ix = math.max(
    0.0,
    math.min(a.right, b.right) - math.max(a.left, b.left),
  );
  final iy = math.max(
    0.0,
    math.min(a.bottom, b.bottom) - math.max(a.top, b.top),
  );
  final inter = ix * iy;
  if (inter <= 0) return 0;
  final union = a.width * a.height + b.width * b.height - inter;
  return union <= 0 ? 0 : inter / union;
}

class _Track {
  _Track(this.id, this.cls, Detection d, double tS)
    : cx = d.box.center.dx,
      cy = d.box.center.dy,
      w = d.box.width,
      h = d.box.height,
      conf = d.confidence,
      lastSeenS = tS;

  final int id;
  final ObjectClass cls;

  // Filtered state at [lastSeenS].
  double cx, cy, w, h;
  double vx = 0, vy = 0, vw = 0, vh = 0;
  double conf;
  int hits = 1;
  int age = 1;
  int missed = 0;
  double lastSeenS;
  TrackState state = TrackState.tentative;
  LightState light = LightState.unknown;

  /// Constant-velocity prediction at [tS]; extrapolation never exceeds
  /// [maxExtrapolateS] past the last observation.
  Rect predict(double tS, double maxExtrapolateS) {
    final dt = (tS - lastSeenS).clamp(0.0, maxExtrapolateS);
    final pw = math.max(1e-4, w + vw * dt);
    final ph = math.max(1e-4, h + vh * dt);
    return Rect.fromCenter(
      center: Offset(cx + vx * dt, cy + vy * dt),
      width: pw,
      height: ph,
    );
  }
}

class _Pair {
  const _Pair(this.track, this.det, this.score);
  final int track;
  final int det;
  final double score;
}

/// ByteTrack-style multi-object tracker for normalized detection boxes.
///
/// 1. Predict every track with its constant-velocity (alpha-beta) state.
/// 2. Associate **high-confidence** detections (≥ [highThreshold]) with all
///    tracks by IoU (same class only).
/// 3. Associate remaining **low-confidence** detections
///    ([lowThreshold] … [highThreshold]) with remaining confirmed/lost tracks
///    at a stricter IoU. Low detections never spawn tracks.
/// 4. Unmatched high detections spawn tentative tracks; a tentative track
///    becomes confirmed after [confirmHits] consecutive hits and is dropped on
///    its first miss (flicker suppression).
/// 5. Confirmed tracks unseen for [lostAfterS] become `lost`, and are
///    removed after [removeAfterS]. A coasting box is extrapolated at most
///    [maxExtrapolateS] beyond its last observation.
class ObjectTracker {
  ObjectTracker({
    this.highThreshold = 0.5,
    this.lowThreshold = 0.15,
    this.highMatchIou = 0.25,
    this.lowMatchIou = 0.45,
    this.confirmHits = 3,
    this.lostAfterS = 0.6,
    this.removeAfterS = 1.0,
    this.maxExtrapolateS = 0.3,
    this.alpha = 0.6,
    this.beta = 0.25,
    this.includeTentative = false,
    SpatialEstimator? estimator,
    TrafficLightFilter? lightFilter,
  }) : estimator = estimator ?? const SpatialEstimator(),
       lightFilter = lightFilter ?? TrafficLightFilter();

  final double highThreshold;
  final double lowThreshold;
  final double highMatchIou;
  final double lowMatchIou;
  final int confirmHits;
  final double lostAfterS;
  final double removeAfterS;
  final double maxExtrapolateS;
  final double alpha;
  final double beta;

  /// Whether tentative tracks are included in the output (default: only
  /// confirmed and lost tracks are returned).
  final bool includeTentative;
  final SpatialEstimator estimator;
  final TrafficLightFilter lightFilter;

  static const _maxSpeed = 3.0; // normalized units / s

  final List<_Track> _tracks = [];
  int _nextId = 1;
  double? _lastTs;
  Size _frameSize = const Size(1280, 720);
  double _hfov = 68;

  int get activeTrackCount => _tracks.length;

  void reset() {
    _tracks.clear();
    lightFilter.reset();
    _lastTs = null;
  }

  /// Advances time without detections (e.g. AI paused / no frames) so tracks
  /// expire. [tsMs] in epoch milliseconds.
  List<TrackedObject> expire(double tsMs) => _step(tsMs / 1000, const []);

  List<TrackedObject> update(DetectionFrame f, {required double hfovDeg}) {
    if (f.frameSize.width > 0 && f.frameSize.height > 0) {
      _frameSize = f.frameSize;
    }
    _hfov = hfovDeg;
    return _step(f.frameTs / 1000, f.detections);
  }

  List<TrackedObject> _step(double t, List<Detection> detections) {
    final last = _lastTs;
    if (last != null && t < last - 1.0) {
      // Clock went backwards (new source) — start over.
      reset();
    }
    _lastTs = t;

    final high = <int>[];
    final low = <int>[];
    for (var i = 0; i < detections.length; i++) {
      final c = detections[i].confidence;
      if (c >= highThreshold) {
        high.add(i);
      } else if (c >= lowThreshold) {
        low.add(i);
      }
    }

    final predicted = [
      for (final tr in _tracks) tr.predict(t, maxExtrapolateS),
    ];
    final trackMatched = List<int?>.filled(_tracks.length, null);
    final detUsed = List<bool>.filled(detections.length, false);

    // Stage 1: high-confidence detections vs all tracks.
    _associate(
      trackIdx: [for (var i = 0; i < _tracks.length; i++) i],
      detIdx: high,
      detections: detections,
      predicted: predicted,
      minIou: highMatchIou,
      trackMatched: trackMatched,
      detUsed: detUsed,
    );
    // Stage 2: low-confidence detections vs remaining non-tentative tracks.
    _associate(
      trackIdx: [
        for (var i = 0; i < _tracks.length; i++)
          if (trackMatched[i] == null &&
              _tracks[i].state != TrackState.tentative)
            i,
      ],
      detIdx: low,
      detections: detections,
      predicted: predicted,
      minIou: lowMatchIou,
      trackMatched: trackMatched,
      detUsed: detUsed,
    );

    final seenThisFrame = <int>{};
    final survivors = <_Track>[];
    for (var i = 0; i < _tracks.length; i++) {
      final tr = _tracks[i];
      tr.age++;
      final di = trackMatched[i];
      if (di != null) {
        _correct(tr, detections[di], t);
        seenThisFrame.add(tr.id);
        survivors.add(tr);
        continue;
      }
      tr.missed++;
      if (tr.state == TrackState.tentative) {
        lightFilter.forget(tr.id);
        continue; // flicker: drop on first miss
      }
      final unseen = t - tr.lastSeenS;
      if (unseen > removeAfterS) {
        lightFilter.forget(tr.id);
        continue;
      }
      if (unseen > lostAfterS) tr.state = TrackState.lost;
      survivors.add(tr);
    }

    for (final di in high) {
      if (detUsed[di]) continue;
      final d = detections[di];
      final tr = _Track(_nextId++, d.cls, d, t);
      if (confirmHits <= 1) tr.state = TrackState.confirmed;
      _updateLight(tr, d, t);
      seenThisFrame.add(tr.id);
      survivors.add(tr);
    }

    _tracks
      ..clear()
      ..addAll(survivors);
    lightFilter.prune(t);

    final out = <TrackedObject>[];
    for (final tr in _tracks) {
      if (tr.state == TrackState.tentative && !includeTentative) continue;
      final box = seenThisFrame.contains(tr.id)
          ? Rect.fromCenter(
              center: Offset(tr.cx, tr.cy),
              width: tr.w,
              height: tr.h,
            )
          : tr.predict(t, maxExtrapolateS);
      final est = estimator.estimate(
        cls: tr.cls,
        box: box,
        frameSize: _frameSize,
        hfovDeg: _hfov,
      );
      out.add(
        TrackedObject(
          id: tr.id,
          cls: tr.cls,
          box: box,
          confidence: tr.conf,
          state: tr.state,
          ageFrames: tr.age,
          missedFrames: tr.missed,
          lastSeenTs: tr.lastSeenS * 1000,
          velocity: (
            dx: tr.vx,
            dy: tr.vy,
            scaleRate: tr.h > 0 ? tr.vh / tr.h : 0,
          ),
          light: tr.light,
          bearingDeg: est.bearingDeg,
          approxRangeM: est.rangeM,
          zone: est.zone,
        ),
      );
    }
    out.sort((a, b) => a.id.compareTo(b.id));
    return out;
  }

  void _associate({
    required List<int> trackIdx,
    required List<int> detIdx,
    required List<Detection> detections,
    required List<Rect> predicted,
    required double minIou,
    required List<int?> trackMatched,
    required List<bool> detUsed,
  }) {
    if (trackIdx.isEmpty || detIdx.isEmpty) return;
    final pairs = <_Pair>[];
    for (final ti in trackIdx) {
      final tr = _tracks[ti];
      for (final di in detIdx) {
        if (detUsed[di]) continue;
        final d = detections[di];
        if (d.cls != tr.cls) continue; // class gating: never merge classes
        final s = iou(predicted[ti], d.box);
        if (s >= minIou) pairs.add(_Pair(ti, di, s));
      }
    }
    // Greedy max-IoU assignment (stable ordering for determinism).
    pairs.sort((a, b) {
      final c = b.score.compareTo(a.score);
      if (c != 0) return c;
      final t = a.track.compareTo(b.track);
      return t != 0 ? t : a.det.compareTo(b.det);
    });
    for (final p in pairs) {
      if (trackMatched[p.track] != null || detUsed[p.det]) continue;
      trackMatched[p.track] = p.det;
      detUsed[p.det] = true;
    }
  }

  void _correct(_Track tr, Detection d, double t) {
    final zx = d.box.center.dx, zy = d.box.center.dy;
    final zw = d.box.width, zh = d.box.height;
    final dt = math.max(1e-3, t - tr.lastSeenS);
    if (tr.hits == 1) {
      // Second observation: initialise velocity by finite difference.
      tr
        ..vx = (zx - tr.cx) / dt
        ..vy = (zy - tr.cy) / dt
        ..vw = (zw - tr.w) / dt
        ..vh = (zh - tr.h) / dt
        ..cx = zx
        ..cy = zy
        ..w = zw
        ..h = zh;
    } else {
      final px = tr.cx + tr.vx * dt, py = tr.cy + tr.vy * dt;
      final pw = tr.w + tr.vw * dt, ph = tr.h + tr.vh * dt;
      final rx = zx - px, ry = zy - py, rw = zw - pw, rh = zh - ph;
      final g = beta / dt;
      tr
        ..cx = px + alpha * rx
        ..cy = py + alpha * ry
        ..w = math.max(1e-4, pw + alpha * rw)
        ..h = math.max(1e-4, ph + alpha * rh)
        ..vx += g * rx
        ..vy += g * ry
        ..vw += g * rw
        ..vh += g * rh;
    }
    tr
      ..vx = tr.vx.clamp(-_maxSpeed, _maxSpeed)
      ..vy = tr.vy.clamp(-_maxSpeed, _maxSpeed)
      ..vw = tr.vw.clamp(-_maxSpeed, _maxSpeed)
      ..vh = tr.vh.clamp(-_maxSpeed, _maxSpeed)
      ..conf = d.confidence
      ..hits += 1
      ..missed = 0
      ..lastSeenS = t;
    if (tr.state == TrackState.lost ||
        (tr.state == TrackState.tentative && tr.hits >= confirmHits)) {
      tr.state = TrackState.confirmed;
    }
    _updateLight(tr, d, t);
  }

  void _updateLight(_Track tr, Detection d, double t) {
    if (tr.cls != ObjectClass.trafficLight) return;
    tr.light = lightFilter.update(tr.id, d.light, d.lightConfidence, t).state;
  }
}
