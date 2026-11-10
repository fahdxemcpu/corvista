import '../../domain/models/object_class.dart';

/// Result of feeding one lamp observation into [TrafficLightFilter].
class LightUpdate {
  const LightUpdate(this.state, {this.previous = LightState.unknown});

  /// Accepted (debounced) state after this observation.
  final LightState state;

  /// Accepted state before this observation.
  final LightState previous;

  bool get changed => state != previous;
  bool get turnedGreen =>
      changed && previous == LightState.red && state == LightState.green;
  bool get turnedRed =>
      changed &&
      state == LightState.red &&
      (previous == LightState.green || previous == LightState.yellow);
}

class _LampHistory {
  LightState accepted = LightState.unknown;
  LightState candidate = LightState.unknown;
  int count = 0;
  double sinceS = 0;
  double lastSeenS = 0;
}

/// Per-track lamp-state hysteresis. A new state is accepted only after
/// ≥ [minFrames] consistent observations spanning ≥ [minDurationS] with
/// `lightConf ≥ minConfidence`. Weak/unknown observations are ignored (they
/// neither confirm nor reset the candidate).
class TrafficLightFilter {
  TrafficLightFilter({
    this.minFrames = 4,
    this.minDurationS = 0.4,
    this.minConfidence = 0.5,
    this.forgetAfterS = 2.0,
  });

  final int minFrames;
  final double minDurationS;
  final double minConfidence;
  final double forgetAfterS;

  final Map<int, _LampHistory> _tracks = {};

  LightState stateOf(int trackId) =>
      _tracks[trackId]?.accepted ?? LightState.unknown;

  /// [tsS] in seconds.
  LightUpdate update(
    int trackId,
    LightState raw,
    double confidence,
    double tsS,
  ) {
    final h = _tracks.putIfAbsent(trackId, _LampHistory.new);
    final prev = h.accepted;
    h.lastSeenS = tsS;
    if (raw == LightState.unknown || confidence < minConfidence) {
      return LightUpdate(prev, previous: prev);
    }
    if (raw == h.candidate) {
      h.count++;
    } else {
      h.candidate = raw;
      h.count = 1;
      h.sinceS = tsS;
    }
    if (h.candidate != h.accepted &&
        h.count >= minFrames &&
        tsS - h.sinceS >= minDurationS - 1e-9) {
      h.accepted = h.candidate;
    }
    return LightUpdate(h.accepted, previous: prev);
  }

  void forget(int trackId) => _tracks.remove(trackId);

  /// Drops histories not updated for [forgetAfterS].
  void prune(double nowS) =>
      _tracks.removeWhere((_, h) => nowS - h.lastSeenS > forgetAfterS);

  void reset() => _tracks.clear();
}
