import 'dart:math' as math;

import 'maneuver.dart';
import 'navigation_models.dart';
import 'traffic_side.dart';

/// One GPS sample for [RouteGuidance.updateFix].
class NavFix {
  const NavFix({
    required this.lat,
    required this.lon,
    this.speed = -1,
    this.course = -1,
    this.hAcc = 10,
  });
  final double lat, lon;

  /// m/s, negative = unknown.
  final double speed;

  /// Course over ground in degrees, negative = unknown.
  final double course;

  /// Horizontal accuracy (m), negative = invalid.
  final double hAcc;
}

/// Turn-by-turn tracker along a [RouteInfo] polyline.
///
/// * **Map matching**: each fix is projected onto the route within a window
///   around the current progress; candidates whose segment direction
///   disagrees with the GPS course (wrong direction / crossing / parallel
///   road going elsewhere) are penalised or rejected.
/// * **Smoothing + dead reckoning**: progress along the route is an
///   alpha-beta filter (position + speed); [predict] extrapolates between
///   1 Hz fixes (for a 10–30 Hz puck / camera / distance readout) and holds
///   position by dead reckoning through tunnels / bad accuracy.
/// * **Off route**: cross-track distance > max([offRouteM], 2·hAcc) for
///   ≥ [offRouteHold] with a heading mismatch (or far off / wrong way), never
///   while accuracy is degraded.
/// * Distances to maneuvers are always measured **along the polyline**.
class RouteGuidance {
  RouteGuidance(
    this.route, {
    this.offRouteM = 30,
    this.offRouteHold = const Duration(seconds: 3),
    this.arrivalM = 30,
    this.backtrackM = 150,
    bool? leftHandTraffic,
  }) {
    final p = route.polyline;
    if (p.length < 4) {
      throw ArgumentError('route polyline needs at least 2 points');
    }
    _lat0 = p[0];
    _lon0 = p[1];
    _cosLat0 = math.cos(_lat0 * math.pi / 180);
    for (var i = 0; i + 1 < p.length; i += 2) {
      final (x, y) = _toXY(p[i], p[i + 1]);
      if (_xs.isNotEmpty && _dist(_xs.last, _ys.last, x, y) < 0.05) continue;
      _xs.add(x);
      _ys.add(y);
    }
    if (_xs.length < 2) {
      _xs.add(_xs.first + 0.1);
      _ys.add(_ys.first);
    }
    _cum.add(0);
    for (var i = 1; i < _xs.length; i++) {
      _cum.add(_cum.last + _dist(_xs[i - 1], _ys[i - 1], _xs[i], _ys[i]));
    }
    for (var i = 0; i + 1 < _xs.length; i++) {
      _segBearing.add(
        ManeuverClassifier.bearingXY(_xs[i + 1] - _xs[i], _ys[i + 1] - _ys[i]),
      );
    }
    var from = 0.0;
    for (final s in route.steps) {
      final (x, y) = _toXY(s.lat, s.lon);
      final proj = _projectXY(x, y, from, double.infinity);
      _stepAlong.add(proj.along);
      from = proj.along;
    }
    lht = leftHandTraffic ?? TrafficSide.isLeftHand(p[0], p[1]);
    _maneuvers = [for (var i = 0; i < route.steps.length; i++) _classify(i)];
  }

  static const bearingWindowM = 30.0;

  final RouteInfo route;

  /// Minimum cross-track distance before a fix can count as off route.
  final double offRouteM;
  final Duration offRouteHold;
  final double arrivalM;
  final double backtrackM;

  /// Left-hand traffic (roundabouts clockwise).
  late final bool lht;

  static const _earthR = 6371008.8;

  /// Fixes worse than this are not used for matching (dead reckoning).
  static const badAccuracyM = 50.0;

  /// Dead-reckon at most this long without a usable fix.
  static const maxDeadReckoning = Duration(seconds: 60);

  late final double _lat0, _lon0, _cosLat0;
  final List<double> _xs = [], _ys = [], _cum = [], _segBearing = [];
  final List<double> _stepAlong = [];
  late final List<Maneuver> _maneuvers;

  // Filter state.
  bool _locked = false;
  double _s = 0; // along-route position (m)
  double _v = 0; // along-route speed (m/s)
  int _tMs = 0; // time of the last filter update
  int _legacyT = 0;
  double _lastCross = 0;
  bool _lastMatched = false;
  bool _degraded = false;
  int _misses = 0;

  // Off-route state.
  int? _offSinceMs;
  int _offFixes = 0;
  bool _offRoute = false;
  bool _arrived = false;

  // ETA: smoothed ratio of observed to planned speed.
  double _paceEma = 1;

  double get totalM => _cum.last;
  double get progressM => _s;
  double get displayProgressM => _displayAt(_tMs);
  double get speedAlongMps => _v;
  bool get degraded => _degraded;
  List<double> get stepAlong => List.unmodifiable(_stepAlong);
  List<Maneuver> get maneuvers => List.unmodifiable(_maneuvers);

  /// Planned average speed of the route (m/s).
  double get _plannedSpeed =>
      route.expectedTravelTimeS > 0 ? totalM / route.expectedTravelTimeS : 13.9;

  // ------------------------------------------------------------ geometry

  int _segmentAt(double along) {
    if (along <= 0) return 0;
    if (along >= _cum.last) return math.max(0, _cum.length - 2);
    var lo = 0, hi = _cum.length - 1;
    while (hi - lo > 1) {
      final mid = (lo + hi) >> 1;
      if (_cum[mid] <= along) {
        lo = mid;
      } else {
        hi = mid;
      }
    }
    return lo;
  }

  (double, double) _pointAt(double along) {
    final a = along.clamp(0.0, totalM);
    final i = _segmentAt(a);
    final len = _cum[i + 1] - _cum[i];
    final t = len <= 0 ? 0.0 : (a - _cum[i]) / len;
    return (
      _xs[i] + t * (_xs[i + 1] - _xs[i]),
      _ys[i] + t * (_ys[i + 1] - _ys[i]),
    );
  }

  (double, double) _toLatLon(double x, double y) => (
    _lat0 + y / _earthR * 180 / math.pi,
    _lon0 + x / (_earthR * _cosLat0) * 180 / math.pi,
  );

  (double, double) _toXY(double lat, double lon) => (
    (lon - _lon0) * math.pi / 180 * _earthR * _cosLat0,
    (lat - _lat0) * math.pi / 180 * _earthR,
  );

  static double _dist(double x1, double y1, double x2, double y2) =>
      math.sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));

  double? _bearing(double from, double to) {
    final (x1, y1) = _pointAt(from);
    final (x2, y2) = _pointAt(to);
    if (_dist(x1, y1, x2, y2) < 1) return null;
    return ManeuverClassifier.bearingXY(x2 - x1, y2 - y1);
  }

  /// Route direction at [along] (deg).
  double bearingAt(double along) => _segBearing[_segmentAt(along)];

  static double _angleDiff(double a, double b) {
    final d = (a - b).abs() % 360;
    return d > 180 ? 360 - d : d;
  }

  /// Closest point of the polyline between [minAlong] and [maxAlong].
  ({double along, double cross, int seg}) _projectXY(
    double px,
    double py,
    double minAlong,
    double maxAlong, {
    double? course,
    double headingWeight = 0,
    double maxHeadingDiff = 180,
  }) {
    var bestCost = double.infinity;
    var best = (along: minAlong, cross: double.infinity, seg: 0);
    for (var i = 0; i + 1 < _xs.length; i++) {
      if (_cum[i + 1] < minAlong) continue;
      if (_cum[i] > maxAlong) break;
      if (course != null &&
          _angleDiff(course, _segBearing[i]) > maxHeadingDiff) {
        continue;
      }
      final ax = _xs[i], ay = _ys[i], bx = _xs[i + 1], by = _ys[i + 1];
      final dx = bx - ax, dy = by - ay;
      final len2 = dx * dx + dy * dy;
      final len = math.sqrt(len2);
      var t = len2 == 0 ? 0.0 : ((px - ax) * dx + (py - ay) * dy) / len2;
      t = t.clamp(0.0, 1.0);
      var along = _cum[i] + t * len;
      if (along < minAlong) {
        along = minAlong;
        t = len == 0 ? 0 : (minAlong - _cum[i]) / len;
      } else if (along > maxAlong) {
        along = maxAlong;
        t = len == 0 ? 0 : (maxAlong - _cum[i]) / len;
      }
      final cross = _dist(px, py, ax + t * dx, ay + t * dy);
      final penalty = course == null
          ? 0.0
          : headingWeight *
                math.max(0.0, _angleDiff(course, _segBearing[i]) - 20);
      final cost = cross + penalty;
      if (cost < bestCost - 1e-9) {
        bestCost = cost;
        best = (along: along, cross: cross, seg: i);
      }
    }
    return best;
  }

  // ------------------------------------------------------- classification

  /// Exit direction and circulation sense of a roundabout entered at [at].
  ({double? exitBearing, bool? clockwise}) _roundabout(double at, double next) {
    final limit = math.min(next, at + 250) - 30;
    var turned = 0.0;
    double? prev;
    for (var d = at + 5; d <= limit; d += 5) {
      final b1 = _bearing(d, d + 10);
      final b2 = _bearing(d + 15, d + 30);
      if (b1 != null && prev != null) {
        turned += ManeuverClassifier.turnAngle(prev, b1);
      }
      if (b1 != null) prev = b1;
      if (d - at >= 20 &&
          b1 != null &&
          b2 != null &&
          ManeuverClassifier.turnAngle(b1, b2).abs() < 6 &&
          turned.abs() > 20) {
        return (
          exitBearing: b2,
          clockwise: turned.abs() > 100 ? turned > 0 : null,
        );
      }
    }
    final fallback = _bearing(math.max(at, next - bearingWindowM), next);
    return (exitBearing: fallback, clockwise: null);
  }

  Maneuver _classify(int i) {
    final steps = route.steps;
    final at = _stepAlong[i];
    final isLast = i == steps.length - 1;
    final next = i + 1 < _stepAlong.length ? _stepAlong[i + 1] : totalM;
    final back = math.min(bearingWindowM, at);
    final fwd = math.min(bearingWindowM, math.max(0.0, (next - at) * .8));
    final inB = back >= 3 ? _bearing(at - back, at) : null;
    final outB = fwd >= 3 ? _bearing(at, at + fwd) : null;
    final angle = inB != null && outB != null
        ? ManeuverClassifier.turnAngle(inB, outB)
        : null;
    double? exitAngle;
    var leftHand = lht;
    if (inB != null &&
        next > at &&
        ManeuverClassifier.isRoundabout(steps[i].instructions)) {
      final r = _roundabout(at, next);
      if (r.exitBearing != null) {
        exitAngle = ManeuverClassifier.turnAngle(inB, r.exitBearing!);
      }
      // Geometry beats the region table when the ring is clearly visible.
      if (r.clockwise != null) leftHand = r.clockwise!;
    }
    final far = math.min(100.0, math.max(0.0, (next - at) * .8));
    final farB = far >= 40 ? _bearing(at + far * .4, at + far) : null;
    return ManeuverClassifier.classify(
      angle: angle,
      instruction: steps[i].instructions,
      isFirst: at < 1,
      isLast: isLast && totalM - at < 80,
      exitAngle: exitAngle,
      leftHandTraffic: leftHand,
      farAngle: inB != null && farB != null
          ? ManeuverClassifier.turnAngle(inB, farB)
          : null,
    );
  }

  // ------------------------------------------------------------- tracking

  /// Legacy entry point (no course / timing): one call = one second.
  Guidance update(double lat, double lon, DateTime now) {
    _legacyT += 1000;
    return updateFix(
      NavFix(lat: lat, lon: lon),
      now,
      tMs: _legacyT,
    );
  }

  /// Feeds a GPS fix received at [now] ([tMs] overrides the timestamp).
  Guidance updateFix(NavFix f, DateTime now, {int? tMs}) {
    final t = tMs ?? now.millisecondsSinceEpoch;
    final (px, py) = _toXY(f.lat, f.lon);
    final moving = f.speed >= 3;
    final course = moving && f.course >= 0 ? f.course : null;
    final acc = f.hAcc < 0 ? 999.0 : f.hAcc;
    _degraded = acc > badAccuracyM;

    // Dead-reckoned prior.
    final dt = _locked ? math.max(0, t - _tMs) / 1000 : 0.0;
    final prior = _locked
        ? (_s + _v * math.min(dt, maxDeadReckoning.inSeconds.toDouble())).clamp(
            0.0,
            totalM,
          )
        : 0.0;
    // Where the display was at this instant (to blend corrections in).
    final shownBefore = _locked ? _displayAt(t) : null;

    // Matching window: a little behind, and as far ahead as we could have
    // driven (+ margin). Unlocked: whole route.
    final minA = _locked ? math.max(0.0, prior - backtrackM) : 0.0;
    final maxA = _locked
        ? prior +
              math.max(250.0, math.max(f.speed, _v) * math.max(dt, 1) * 2 + 150)
        : double.infinity;

    // Heading-aware candidate (rejects segments pointing elsewhere).
    final withHeading = course == null
        ? null
        : _projectXY(
            px,
            py,
            minA,
            maxA,
            course: course,
            headingWeight: 1.2,
            maxHeadingDiff: 70,
          );
    final plain = _projectXY(px, py, minA, maxA);
    final threshold = math.max(offRouteM, 2 * acc);

    var match = withHeading ?? plain;
    var plainBest = plain;
    if (_locked && match.cross > threshold && !_degraded) {
      // Outside the window: GPS resumed after a gap / tunnel? Re-lock on
      // the whole route — forwards at once, backwards only after repeated
      // misses (never on a single noisy fix).
      final global = _projectXY(
        px,
        py,
        0,
        double.infinity,
        course: course,
        headingWeight: course == null ? 0 : 1.2,
        maxHeadingDiff: course == null ? 180 : 70,
      );
      if (global.cross <= threshold && (global.along > prior || _misses >= 2)) {
        match = global;
      }
      final g2 = _projectXY(px, py, 0, double.infinity);
      if (g2.cross < plainBest.cross) plainBest = g2;
    }
    _lastCross = plainBest.cross;
    final matched = !_degraded && match.cross <= threshold;
    _misses = matched || _degraded ? 0 : _misses + 1;
    _lastMatched = matched;

    if (_degraded) {
      // Hold position by dead reckoning; never call off-route on bad fixes.
      if (_locked) {
        _s = prior;
        _tMs = t;
      }
    } else if (matched) {
      final z = match.along;
      if (!_locked || (z - prior).abs() > 120) {
        _s = z;
        _v = f.speed >= 0 ? f.speed : 0;
        _locked = true;
      } else {
        const alpha = .4, beta = .1;
        final r = z - prior;
        _s = prior + alpha * r;
        if (dt > 0.05) _v = math.max(0.0, _v + beta * r / dt);
        if (f.speed >= 0) _v = .5 * _v + .5 * f.speed;
      }
      // Progress never runs backwards by noise (only real U-turns, which
      // are off route anyway).
      _s = _s.clamp(0.0, totalM);
      _tMs = t;
    } else if (_locked) {
      _s = prior;
      _tMs = t;
    }

    // Visual continuity: the jump of the estimate is blended in over ~1 s.
    if (shownBefore != null && _locked) {
      final jump = _s - shownBefore;
      _offset = jump.abs() > 60 ? 0 : -jump;
    }

    // ----- off route
    if (!_degraded) {
      final nearest = plainBest;
      final routeDir = _segBearing[nearest.seg];
      final headingMismatch =
          course != null && _angleDiff(course, routeDir) > 35;
      final wrongWay =
          course != null &&
          nearest.cross <= threshold &&
          _angleDiff(course, routeDir) > 135;
      final far = nearest.cross > threshold * 2.5;
      final off =
          wrongWay ||
          (nearest.cross > threshold &&
              (course == null || headingMismatch || far));
      if (off) {
        _offSinceMs ??= t;
        _offFixes++;
      } else {
        _offSinceMs = null;
        _offFixes = 0;
        _offRoute = false;
      }
      if (_offSinceMs != null &&
          _offFixes >= 3 &&
          t - _offSinceMs! >= offRouteHold.inMilliseconds - 1000) {
        _offRoute = true;
      }
    }

    // ----- ETA pace
    if (matched && f.speed >= 0 && _plannedSpeed > 0) {
      final pace = (f.speed / _plannedSpeed).clamp(0.3, 2.0);
      _paceEma = .97 * _paceEma + .03 * pace;
    }

    // ----- arrival
    final (ex, ey) = (_xs.last, _ys.last);
    // Near the end point *and* near the end of the route (a route can pass
    // close to its destination before looping back to it).
    if ((_dist(px, py, ex, ey) < math.max(arrivalM, math.min(acc, 60)) &&
            totalM - _s < 100) ||
        (matched && totalM - _s < arrivalM)) {
      _arrived = true;
    }
    final shown = _displayAt(t);
    return _guidance(now, shown, _segmentAt(shown));
  }

  double _offset = 0;

  /// Display position at [t]: dead reckoning (up to [maxDeadReckoning]
  /// without fixes — tunnels) plus the decaying correction offset.
  double _displayAt(int t) {
    if (!_locked) return _s;
    final dt = math.max(0, t - _tMs) / 1000;
    final dr = _s + _v * math.min(dt, maxDeadReckoning.inSeconds.toDouble());
    return (dr + _offset * math.exp(-dt / .45)).clamp(0.0, totalM);
  }

  /// Dead-reckoned guidance at [now] (between fixes / in tunnels).
  Guidance predict(DateTime now, {int? tMs}) {
    final t = tMs ?? now.millisecondsSinceEpoch;
    final s = _locked && !_arrived && !_offRoute ? _displayAt(t) : _s;
    return _guidance(now, s, _segmentAt(s));
  }

  Guidance _guidance(DateTime now, double s, int seg) {
    final remainingM = math.max(0.0, totalM - s);
    var stepIndex = _stepAlong.length - 1;
    for (var i = 0; i < _stepAlong.length; i++) {
      // The banner switches as soon as progress passes the maneuver point.
      if (_stepAlong[i] > s + 1) {
        stepIndex = i;
        break;
      }
    }
    final next = stepIndex >= 0 && stepIndex < route.steps.length
        ? route.steps[stepIndex]
        : null;
    final distToNext = stepIndex >= 0 && stepIndex < _stepAlong.length
        ? math.max(0.0, _stepAlong[stepIndex] - s)
        : remainingM;
    final remaining = remainingTime(remainingM);
    final thenIndex = stepIndex + 1;
    final hasThen = stepIndex >= 0 && thenIndex < route.steps.length;
    final (sx, sy) = _pointAt(s);
    final (sLat, sLon) = _toLatLon(sx, sy);
    return Guidance(
      stepIndex: math.max(0, stepIndex),
      nextStep: next,
      distanceToNextM: distToNext,
      remainingM: remainingM,
      remaining: remaining,
      eta: now.add(remaining),
      offRoute: _offRoute,
      arrived: _arrived,
      maneuver: next == null ? null : _maneuvers[stepIndex],
      thenStep: hasThen ? route.steps[thenIndex] : null,
      thenManeuver: hasThen ? _maneuvers[thenIndex] : null,
      thenDistanceM: hasThen
          ? math.max(0.0, _stepAlong[thenIndex] - _stepAlong[stepIndex])
          : null,
      progressM: s,
      totalM: totalM,
      snappedLat: _locked && (_lastMatched || _degraded) ? sLat : null,
      snappedLon: _locked && (_lastMatched || _degraded) ? sLon : null,
      segmentIndex: seg,
      routeBearing: _segBearing[seg],
      speedMps: _v,
      degraded: _degraded,
      crossTrackM: _lastCross,
    );
  }

  /// Remaining time: MapKit's expected time for the remaining fraction,
  /// adjusted (±40 % at most, 30 % weight) by the observed pace.
  Duration remainingTime(double remainingM) {
    final frac = totalM > 0 ? remainingM / totalM : 0.0;
    final planned = route.expectedTravelTimeS * frac;
    final factor = (1 / _paceEma).clamp(0.6, 1.4);
    final s = planned * (.7 + .3 * factor);
    return Duration(milliseconds: (s * 1000).round());
  }
}
