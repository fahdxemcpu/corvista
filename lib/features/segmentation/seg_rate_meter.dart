/// Smoothed arrival rate of segmentation maps (for the status chip).
///
/// Pure: the caller passes a monotonic timestamp (e.g. a `Stopwatch`).
class SegRateMeter {
  SegRateMeter({
    this.smoothing = 0.3,
    this.stallAfter = const Duration(seconds: 3),
  });

  /// EMA weight of the newest interval (0..1].
  final double smoothing;

  /// No map for this long → [isStalled].
  final Duration stallAfter;

  Duration? _last;
  double? _emaMs;
  int _count = 0;

  int get count => _count;
  Duration? get last => _last;

  /// Maps per second, `null` until two maps arrived.
  double? get hz {
    final e = _emaMs;
    return e == null || e <= 0 ? null : 1000 / e;
  }

  void tick(Duration now) {
    final prev = _last;
    _last = now;
    _count++;
    if (prev == null) return;
    final dt = (now - prev).inMicroseconds / 1000.0;
    if (dt <= 0) return;
    // A long gap (stall) restarts the average instead of dragging it down.
    if (dt > stallAfter.inMilliseconds) {
      _emaMs = null;
      return;
    }
    final e = _emaMs;
    _emaMs = e == null ? dt : e + (dt - e) * smoothing;
  }

  bool isStalled(Duration now) {
    final l = _last;
    return l != null && now - l > stallAfter;
  }

  void reset() {
    _last = null;
    _emaMs = null;
    _count = 0;
  }
}
