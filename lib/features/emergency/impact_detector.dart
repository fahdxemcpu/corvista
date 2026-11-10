import 'dart:math' as math;
import 'dart:typed_data';

/// Evidence describing a crash candidate.
class ImpactEvidence {
  const ImpactEvidence({
    required this.peakG,
    required this.durationMs,
    required this.speedBeforeKmh,
    required this.speedAfterKmh,
    required this.rotationPeak,
    required this.score,
  });

  /// Peak user-acceleration magnitude (g).
  final double peakG;

  /// Time |a| stayed ≥ the sustained threshold (ms).
  final double durationMs;
  final double? speedBeforeKmh;
  final double? speedAfterKmh;

  /// Peak rotation-rate magnitude (rad/s) around the impact.
  final double rotationPeak;

  /// 0..1 confidence-like score (not a probability).
  final double score;

  Map<String, Object?> toJson() => {
    'peakG': peakG,
    'durationMs': durationMs,
    'speedBeforeKmh': speedBeforeKmh,
    'speedAfterKmh': speedAfterKmh,
    'rotationPeak': rotationPeak,
    'score': score,
  };

  static ImpactEvidence fromJson(Map<String, Object?> j) {
    double? n(String k) => (j[k] as num?)?.toDouble();
    return ImpactEvidence(
      peakG: n('peakG') ?? 0,
      durationMs: n('durationMs') ?? 0,
      speedBeforeKmh: n('speedBeforeKmh'),
      speedAfterKmh: n('speedAfterKmh'),
      rotationPeak: n('rotationPeak') ?? 0,
      score: n('score') ?? 0,
    );
  }

  @override
  String toString() =>
      'ImpactEvidence(peak ${peakG.toStringAsFixed(1)} g, '
      '${durationMs.toStringAsFixed(0)} ms, v $speedBeforeKmh→$speedAfterKmh km/h, '
      'rot ${rotationPeak.toStringAsFixed(1)}, score ${score.toStringAsFixed(2)})';
}

class _Sample {
  const _Sample(this.t, this.a, this.w);
  final double t; // ms
  final double a; // |user accel| g
  final double w; // |rotation| rad/s
}

class _Peak {
  _Peak(this.t, this.peakG, this.durationMs);
  final double t;
  final double peakG;
  final double durationMs;
}

/// Crash-candidate detector over motion batches (`[t, ax, ay, az, rx, ry, rz]`
/// records, user acceleration in g with gravity removed) plus GPS speed.
///
/// Candidate when
///   peak |a| ≥ [sustainedG] for ≥ [sustainedMs]  **or**  a ≥ [spikeG] spike,
/// **and** corroborated by either
///   * speed before ≥ [speedBeforeMinKmh] and speed after ≤ [speedAfterMaxKmh]
///     within [speedWindowMs], or
///   * rotation peak ≥ [rotationMin] rad/s around the impact (rollover).
///
/// Rejected: isolated phone drops — a free-fall signature (|a| ≈ 1 g, i.e.
/// the device measured no gravity) lasting ≥ [freeFallMinMs] in the
/// [freeFallLookbackMs] before the peak.
class ImpactDetector {
  ImpactDetector({
    this.sustainedG = 4,
    this.sustainedMs = 30,
    this.spikeG = 6,
    this.speedBeforeMinKmh = 20,
    this.speedAfterMaxKmh = 8,
    this.speedWindowMs = 10000,
    this.speedLookbackMs = 5000,
    this.rotationMin = 6,
    this.freeFallMinMs = 120,
    this.freeFallLookbackMs = 600,
    this.freeFallBand = (0.85, 1.15),
    this.cooldownMs = 60000,
  });

  final double sustainedG;
  final double sustainedMs;
  final double spikeG;
  final double speedBeforeMinKmh;
  final double speedAfterMaxKmh;
  final double speedWindowMs;
  final double speedLookbackMs;
  final double rotationMin;
  final double freeFallMinMs;
  final double freeFallLookbackMs;
  final (double, double) freeFallBand;
  final double cooldownMs;

  static const _historyMs = 15000.0;

  final List<_Sample> _samples = [];
  final List<(double, double)> _speeds = []; // (t ms, km/h)
  _Peak? _pending;
  double? _runStart;
  double _runPeak = 0;
  double _runLast = 0;
  double _dtMs = 20;
  double _nowMs = double.negativeInfinity;
  double _cooldownUntil = double.negativeInfinity;

  /// Number of free-fall rejections (diagnostics/tests).
  int droppedAsFreeFall = 0;

  void reset() {
    _samples.clear();
    _speeds.clear();
    _pending = null;
    _runStart = null;
    _runPeak = 0;
    _nowMs = double.negativeInfinity;
    _cooldownUntil = double.negativeInfinity;
  }

  /// GPS speed sample. [speedMps] < 0 (invalid) is ignored.
  ImpactEvidence? addSpeed(double tsMs, double speedMps) {
    if (speedMps >= 0) {
      _speeds.add((tsMs, speedMps * 3.6));
      _speeds.removeWhere((s) => tsMs - s.$1 > _historyMs + speedWindowMs);
    }
    _nowMs = math.max(_nowMs, tsMs);
    return _evaluatePending();
  }

  /// One motion batch (flat 7-value records).
  ImpactEvidence? addMotion(Float64List samples) {
    ImpactEvidence? result;
    for (var i = 0; i + 6 < samples.length; i += 7) {
      final t = samples[i];
      final a = _mag(samples[i + 1], samples[i + 2], samples[i + 3]);
      final w = _mag(samples[i + 4], samples[i + 5], samples[i + 6]);
      if (_samples.isNotEmpty) {
        final dt = t - _samples.last.t;
        if (dt > 0 && dt < 200) _dtMs = _dtMs * 0.9 + dt * 0.1;
      }
      _samples.add(_Sample(t, a, w));
      _nowMs = math.max(_nowMs, t);
      _trackRun(t, a);
    }
    final cutoff = _nowMs - _historyMs;
    var drop = 0;
    while (drop < _samples.length && _samples[drop].t < cutoff) {
      drop++;
    }
    if (drop > 0) _samples.removeRange(0, drop);
    result = _evaluatePending();
    return result;
  }

  static double _mag(double x, double y, double z) =>
      math.sqrt(x * x + y * y + z * z);

  void _trackRun(double t, double a) {
    if (a >= sustainedG) {
      if (_runStart == null) {
        _runStart = t;
        _runPeak = a;
      } else {
        _runPeak = math.max(_runPeak, a);
      }
      _runLast = t;
      return;
    }
    final start = _runStart;
    if (start == null) return;
    _runStart = null;
    final duration = _runLast - start + _dtMs;
    if (duration < sustainedMs && _runPeak < spikeG) return; // pothole / bump
    if (t < _cooldownUntil) return;
    if (_hasFreeFallBefore(start)) {
      droppedAsFreeFall++;
      return;
    }
    final p = _Peak(start, _runPeak, duration);
    if (_pending == null || p.peakG > _pending!.peakG) _pending = p;
  }

  bool _hasFreeFallBefore(double tPeak) {
    final from = tPeak - freeFallLookbackMs;
    double? stretchStart;
    var longest = 0.0;
    var lastT = from;
    for (final s in _samples) {
      if (s.t < from) continue;
      if (s.t >= tPeak) break;
      final inBand = s.a >= freeFallBand.$1 && s.a <= freeFallBand.$2;
      if (inBand) {
        stretchStart ??= s.t;
        longest = math.max(longest, s.t - stretchStart + _dtMs);
      } else {
        stretchStart = null;
      }
      lastT = s.t;
    }
    return lastT > from && longest >= freeFallMinMs;
  }

  ImpactEvidence? _evaluatePending() {
    final p = _pending;
    if (p == null) return null;

    double? before;
    double? after;
    for (final (t, kmh) in _speeds) {
      if (t >= p.t - speedLookbackMs && t <= p.t) {
        before = before == null ? kmh : math.max(before, kmh);
      } else if (t > p.t && t <= p.t + speedWindowMs) {
        after = after == null ? kmh : math.min(after, kmh);
      }
    }
    var rot = 0.0;
    for (final s in _samples) {
      if (s.t >= p.t - 500 && s.t <= p.t + 1500) rot = math.max(rot, s.w);
    }

    final speedOk =
        before != null &&
        after != null &&
        before >= speedBeforeMinKmh &&
        after <= speedAfterMaxKmh;
    final rotOk = rot >= rotationMin;

    if (speedOk || rotOk) {
      _pending = null;
      _cooldownUntil = p.t + cooldownMs;
      final gScore = (p.peakG / 10).clamp(0.0, 1.0);
      final sScore = speedOk ? ((before - after) / 50).clamp(0.5, 1.0) : 0.0;
      final rScore = (rot / 12).clamp(0.0, 1.0);
      return ImpactEvidence(
        peakG: p.peakG,
        durationMs: p.durationMs,
        speedBeforeKmh: before,
        speedAfterKmh: after,
        rotationPeak: rot,
        score: (0.45 * gScore + 0.35 * sScore + 0.2 * rScore).clamp(0.0, 1.0),
      );
    }
    if (_nowMs > p.t + speedWindowMs) _pending = null; // never corroborated
    return null;
  }
}

/// Deterministic synthetic motion traces (used by the in-app TEST simulation
/// and by unit-test fixtures). 7-value records `[t, ax, ay, az, rx, ry, rz]`.
class MotionTraceBuilder {
  MotionTraceBuilder({this.hz = 100, double startMs = 0, int seed = 7})
    : _t = startMs,
      _rnd = math.Random(seed);

  final double hz;
  double _t;
  final math.Random _rnd;
  final List<double> _data = [];

  double get nowMs => _t;
  double get _dt => 1000 / hz;

  double _noise(double amp) => (_rnd.nextDouble() * 2 - 1) * amp;

  void _emit(double ax, double ay, double az, double rx, double ry, double rz) {
    _data.addAll([_t, ax, ay, az, rx, ry, rz]);
    _t += _dt;
  }

  /// Road vibration around zero.
  void driving(
    double ms, {
    double vibrationG = 0.08,
    double rot = 0.05,
    double ax = 0,
  }) {
    final n = (ms / _dt).round();
    for (var i = 0; i < n; i++) {
      _emit(
        ax + _noise(vibrationG),
        _noise(vibrationG),
        _noise(vibrationG),
        _noise(rot),
        _noise(rot),
        _noise(rot),
      );
    }
  }

  /// Half-sine acceleration pulse with peak [peakG], optional rotation.
  void pulse(double ms, double peakG, {double rotation = 0}) {
    final n = math.max(1, (ms / _dt).round());
    for (var i = 0; i < n; i++) {
      final s = math.sin(math.pi * (i + 0.5) / n);
      _emit(
        -peakG * s,
        0.3 * peakG * s * 0.2,
        0.1 * peakG * s,
        rotation * s,
        _noise(0.1),
        rotation * 0.3 * s,
      );
    }
  }

  /// Free fall: user acceleration ≈ −gravity (≈ 1 g magnitude), tumbling.
  void freeFall(double ms, {double tumble = 3}) {
    final n = (ms / _dt).round();
    for (var i = 0; i < n; i++) {
      _emit(
        _noise(0.03),
        _noise(0.03),
        -1 + _noise(0.03),
        tumble,
        tumble * 0.5,
        0,
      );
    }
  }

  /// Sustained rotation (rollover) with moderate accelerations.
  void roll(double ms, double radPerS, {double accelG = 1.5}) {
    final n = (ms / _dt).round();
    for (var i = 0; i < n; i++) {
      _emit(
        _noise(accelG),
        accelG + _noise(0.3),
        _noise(accelG),
        radPerS + _noise(0.3),
        _noise(0.5),
        _noise(0.5),
      );
    }
  }

  Float64List build() => Float64List.fromList(_data);

  /// Splits into ~200 ms batches like the native stream.
  List<Float64List> batches({double batchMs = 200}) {
    final all = build();
    final perBatch = math.max(1, (batchMs / _dt).round()) * 7;
    return [
      for (var i = 0; i < all.length; i += perBatch)
        Float64List.sublistView(all, i, math.min(all.length, i + perBatch)),
    ];
  }
}

/// A complete synthetic scenario: motion batches interleaved with speed fixes.
class MotionScenario {
  const MotionScenario({
    required this.name,
    required this.batches,
    required this.speeds,
  });
  final String name;
  final List<Float64List> batches;

  /// (t ms, speed m/s)
  final List<(double, double)> speeds;

  /// Feeds the scenario through [d] in timestamp order; returns all evidence.
  List<ImpactEvidence> runThrough(ImpactDetector d) {
    final out = <ImpactEvidence>[];
    var si = 0;
    for (final b in batches) {
      final batchEnd = b.isEmpty ? 0.0 : b[b.length - 7];
      while (si < speeds.length && speeds[si].$1 <= batchEnd) {
        final e = d.addSpeed(speeds[si].$1, speeds[si].$2);
        if (e != null) out.add(e);
        si++;
      }
      final e = d.addMotion(b);
      if (e != null) out.add(e);
    }
    while (si < speeds.length) {
      final e = d.addSpeed(speeds[si].$1, speeds[si].$2);
      if (e != null) out.add(e);
      si++;
    }
    return out;
  }

  /// Severe frontal impact at ~55 km/h ending stationary.
  static MotionScenario severeImpact({double startMs = 0}) {
    final b = MotionTraceBuilder(startMs: startMs)
      ..driving(4000)
      ..pulse(80, 12, rotation: 2)
      ..driving(8000, vibrationG: 0.02, rot: 0.02);
    final speeds = <(double, double)>[
      for (var t = 0.0; t <= 4000; t += 1000) (startMs + t, 55 / 3.6),
      for (var t = 5000.0; t <= 12000; t += 1000) (startMs + t, 0.0),
    ];
    return MotionScenario(
      name: 'severe_impact',
      batches: b.batches(),
      speeds: speeds,
    );
  }
}
