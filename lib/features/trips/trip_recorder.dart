import 'dart:math' as math;

/// One GPS sample as seen by the trip log.
class TripFix {
  const TripFix({
    required this.ts,
    required this.lat,
    required this.lon,
    this.speed = -1,
    this.course = -1,
    this.hAcc = 5,
  });

  /// Epoch milliseconds.
  final double ts;
  final double lat, lon;

  /// m/s; negative = unknown.
  final double speed;
  final double course;
  final double hAcc;

  bool get hasSpeed => speed >= 0;
}

/// Great-circle distance in metres.
double haversineM(double lat1, double lon1, double lat2, double lon2) {
  const r = 6371008.8;
  final p1 = lat1 * math.pi / 180, p2 = lat2 * math.pi / 180;
  final dp = p2 - p1, dl = (lon2 - lon1) * math.pi / 180;
  final h =
      math.sin(dp / 2) * math.sin(dp / 2) +
      math.cos(p1) * math.cos(p2) * math.sin(dl / 2) * math.sin(dl / 2);
  return 2 * r * math.asin(math.min(1, math.sqrt(h)));
}

/// Summary statistics of a trip.
class TripStats {
  const TripStats({
    required this.startTs,
    required this.endTs,
    required this.distanceM,
    required this.movingTimeS,
    required this.maxSpeedMs,
    required this.pointCount,
    this.startLat,
    this.startLon,
    this.endLat,
    this.endLon,
  });

  static const empty = TripStats(
    startTs: 0,
    endTs: 0,
    distanceM: 0,
    movingTimeS: 0,
    maxSpeedMs: 0,
    pointCount: 0,
  );

  final double startTs, endTs;
  final double distanceM;
  final double movingTimeS;
  final double maxSpeedMs;
  final int pointCount;
  final double? startLat, startLon, endLat, endLon;

  /// Average speed while moving (m/s).
  double get avgSpeedMs => movingTimeS > 0 ? distanceM / movingTimeS : 0;
  double get durationS => math.max(0, (endTs - startTs) / 1000);
}

/// Accumulates distance / moving time / max speed over accepted points.
///
/// * Distance = Σ haversine between consecutive points.
/// * A point implying > [maxJumpKmh] from the previous one is rejected as a
///   GPS jump. After [relocateAfter] consecutive rejections the anchor moves
///   to the newest point without adding distance (persistent relocation).
/// * Moving time = Σ Δt of segments whose average speed ≥ [movingMs]
///   (each segment capped at [maxSegmentS] to ignore gaps).
class TripAccumulator {
  TripAccumulator({
    this.maxJumpKmh = 250,
    this.movingMs = 1.0,
    this.maxSegmentS = 60,
    this.relocateAfter = 5,
  });

  final double maxJumpKmh;
  final double movingMs;
  final double maxSegmentS;
  final int relocateAfter;

  TripFix? _first, _last;
  double _distance = 0, _moving = 0, _max = 0;
  int _count = 0, _rejected = 0;

  TripFix? get last => _last;
  int get pointCount => _count;

  /// Adds [p]; returns false when it was rejected as a jump.
  bool add(TripFix p) {
    final prev = _last;
    if (prev == null) {
      _first = _last = p;
      _count = 1;
      if (p.hasSpeed) _max = math.max(_max, p.speed);
      return true;
    }
    final dt = (p.ts - prev.ts) / 1000;
    if (dt <= 0) return false;
    final d = haversineM(prev.lat, prev.lon, p.lat, p.lon);
    final implied = d / dt;
    if (implied * 3.6 > maxJumpKmh) {
      _rejected++;
      if (_rejected >= relocateAfter) {
        _last = p;
        _rejected = 0;
        _count++;
      }
      return false;
    }
    _rejected = 0;
    _distance += d;
    if (implied >= movingMs) _moving += math.min(dt, maxSegmentS);
    final reported = p.hasSpeed && p.speed * 3.6 <= maxJumpKmh ? p.speed : 0.0;
    _max = math.max(_max, math.max(reported, implied));
    _last = p;
    _count++;
    return true;
  }

  TripStats stats({double? endTs}) {
    final f = _first, l = _last;
    if (f == null || l == null) return TripStats.empty;
    return TripStats(
      startTs: f.ts,
      endTs: endTs ?? l.ts,
      distanceM: _distance,
      movingTimeS: _moving,
      maxSpeedMs: _max,
      pointCount: _count,
      startLat: f.lat,
      startLon: f.lon,
      endLat: l.lat,
      endLon: l.lon,
    );
  }

  /// Replays stored points (e.g. to finalize a trip after app termination).
  static TripStats summarize(
    Iterable<TripFix> points, {
    double maxJumpKmh = 250,
  }) {
    final a = TripAccumulator(maxJumpKmh: maxJumpKmh);
    for (final p in points) {
      a.add(p);
    }
    return a.stats();
  }
}

/// What a fix did to the recorder.
class TripUpdate {
  const TripUpdate({this.started = false, this.points = const [], this.ended});

  static const none = TripUpdate();

  final bool started;

  /// Points to persist (accepted by sampling + jump rejection).
  final List<TripFix> points;

  /// Non-null when the trip ended with this fix (stationary timeout).
  final TripStats? ended;
}

/// Pure trip state machine fed with GPS fixes.
///
/// * **Start**: speed ≥ [startSpeedKmh] continuously for ≥ [startHoldS]
///   (or [forceStart], e.g. when navigation begins). The trip starts at the
///   first fix of that run.
/// * **Sampling**: fixes with hAcc > [maxHAccM] are dropped. A point is kept
///   when ≥ [minIntervalS] passed or ≥ [minDistanceM] were covered since the
///   last point — except while stationary (speed < [stationaryKmh]) with
///   less than [minDistanceM] of movement (GPS jitter at a red light).
/// * **End**: after ≥ [stopAfterS] stationary (end time = when the stop
///   began), or explicitly via [end] (drive session stopped).
class TripRecorder {
  TripRecorder({
    this.startSpeedKmh = 8,
    this.startHoldS = 5,
    this.stopAfterS = 300,
    this.minIntervalS = 2,
    this.minDistanceM = 15,
    this.maxHAccM = 50,
    this.stationaryKmh = 5,
    this.maxJumpKmh = 250,
    this.minTripM = 200,
  });

  final double startSpeedKmh;
  final double startHoldS;
  final double stopAfterS;
  final double minIntervalS;
  final double minDistanceM;
  final double maxHAccM;
  final double stationaryKmh;
  final double maxJumpKmh;

  /// Trips shorter than this should be discarded by the caller.
  final double minTripM;

  bool _active = false;
  TripFix? _candidate;
  final List<TripFix> _run = [];
  TripFix? _lastPoint;
  TripFix? _stillAnchor;
  double? _stationarySince;
  bool _forced = false;
  TripAccumulator _acc = TripAccumulator();

  bool get active => _active;
  TripStats get stats => _acc.stats();

  void reset() {
    _active = false;
    _forced = false;
    _candidate = null;
    _run.clear();
    _lastPoint = null;
    _stillAnchor = null;
    _stationarySince = null;
    _acc = TripAccumulator(maxJumpKmh: maxJumpKmh);
  }

  /// Starts immediately (navigation started). [at] = optional first fix.
  TripUpdate forceStart({TripFix? at}) {
    if (_active) return TripUpdate.none;
    reset();
    _active = true;
    _forced = true;
    if (at != null && at.hAcc <= maxHAccM) {
      _accept(at);
      return TripUpdate(started: true, points: [at]);
    }
    return const TripUpdate(started: true);
  }

  bool _isMoving(TripFix f) {
    if (f.hasSpeed) return f.speed * 3.6 >= stationaryKmh;
    final a = _stillAnchor;
    return a == null || haversineM(a.lat, a.lon, f.lat, f.lon) >= minDistanceM;
  }

  void _accept(TripFix f) {
    if (_acc.add(f)) _lastPoint = f;
  }

  TripUpdate onFix(TripFix f) {
    if (f.hAcc < 0 || f.hAcc > maxHAccM) return TripUpdate.none;

    if (!_active) {
      final fast = f.hasSpeed && f.speed * 3.6 >= startSpeedKmh;
      if (!fast) {
        _candidate = null;
        _run.clear();
        return TripUpdate.none;
      }
      final c = _candidate ??= f;
      _run.add(f);
      if ((f.ts - c.ts) / 1000 < startHoldS) return TripUpdate.none;
      final run = List<TripFix>.of(_run);
      reset();
      _active = true;
      // Keep the whole qualifying run (thinned by the sampling rule).
      final pts = <TripFix>[];
      for (final p in run) {
        final last = _lastPoint;
        if (last != null &&
            (p.ts - last.ts) / 1000 < minIntervalS &&
            haversineM(last.lat, last.lon, p.lat, p.lon) < minDistanceM) {
          continue;
        }
        _accept(p);
        if (identical(_lastPoint, p)) pts.add(p);
      }
      return TripUpdate(started: true, points: pts);
    }

    // --- active trip ---
    final moving = _isMoving(f);
    if (moving) {
      _stationarySince = null;
      _stillAnchor = null;
    } else {
      _stationarySince ??= f.ts;
      _stillAnchor ??= f;
      if ((f.ts - _stationarySince!) / 1000 >= stopAfterS) {
        final s = _acc.stats(endTs: _stationarySince);
        _active = false;
        _candidate = null;
        _run.clear();
        return TripUpdate(ended: s);
      }
    }

    final last = _lastPoint;
    if (last == null) {
      _accept(f);
      return TripUpdate(points: identical(_lastPoint, f) ? [f] : const []);
    }
    final dt = (f.ts - last.ts) / 1000;
    final d = haversineM(last.lat, last.lon, f.lat, f.lon);
    final due = dt >= minIntervalS || d >= minDistanceM;
    if (!due) return TripUpdate.none;
    if (!moving && d < minDistanceM) return TripUpdate.none; // jitter
    _accept(f);
    return TripUpdate(points: identical(_lastPoint, f) ? [f] : const []);
  }

  /// Ends the trip now (drive session stopped). Trailing stationary time is
  /// excluded from the end time. Returns null when no trip is active.
  TripStats? end({double? nowTs}) {
    if (!_active) return null;
    final s = _acc.stats(endTs: _stationarySince ?? _acc.last?.ts ?? nowTs);
    _active = false;
    _candidate = null;
    _run.clear();
    return s;
  }

  bool get wasForced => _forced;
}
