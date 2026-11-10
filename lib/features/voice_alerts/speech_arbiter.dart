import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/services/clock.dart';
import '../../platform/native_bridge/engine_provider.dart';

/// Who is talking: turn-by-turn guidance or a hazard alert.
enum SpeechChannel { guidance, alert }

/// Shared gate in front of `speech.speak` so navigation guidance and hazard
/// alerts never talk over each other.
///
/// * Guidance has priority: it is queued behind an alert that is already
///   speaking (alerts are short) but never dropped.
/// * A hazard alert requested while guidance is speaking waits only if the
///   guidance ends within [maxAlertWait]; otherwise it is skipped (a stale
///   hazard warning is worse than none).
///
/// `speech.speak` returns as soon as the utterance is queued, so the end of
/// an utterance is estimated from its length.
class SpeechArbiter {
  SpeechArbiter(this._ref);

  final Ref _ref;

  static const maxAlertWait = Duration(milliseconds: 1500);

  DateTime? _guidanceUntil;
  DateTime? _alertUntil;

  DateTime _now() => _ref.read(clockProvider)();

  /// Rough speaking time at the default rate (~14 chars/s) plus padding.
  static Duration estimate(String text) =>
      Duration(milliseconds: 500 + text.length * 70);

  bool get guidanceSpeaking {
    final u = _guidanceUntil;
    return u != null && _now().isBefore(u);
  }

  /// Speaks [text]. Returns false when the request was skipped.
  Future<bool> speak(
    String text, {
    required SpeechChannel channel,
    required String language,
    String? voiceId,
    double volume = 1,
  }) async {
    final now = _now();
    if (channel == SpeechChannel.alert) {
      final g = _guidanceUntil;
      if (g != null && g.difference(now) > maxAlertWait) return false;
    }
    // Starts after whatever is already queued.
    final busyUntil = [
      _guidanceUntil,
      _alertUntil,
    ].whereType<DateTime>().fold<DateTime>(now, (a, b) => b.isAfter(a) ? b : a);
    final end = busyUntil.add(estimate(text));
    if (channel == SpeechChannel.guidance) {
      _guidanceUntil = end;
    } else {
      _alertUntil = end;
    }
    try {
      await _ref
          .read(nativeEngineProvider)
          .speak(text, language: language, voiceId: voiceId, volume: volume);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Stops all speech (e.g. guidance muted or navigation ended).
  Future<void> stop() async {
    _guidanceUntil = null;
    _alertUntil = null;
    try {
      await _ref.read(nativeEngineProvider).stopSpeech();
    } catch (_) {}
  }
}

final speechArbiterProvider = Provider<SpeechArbiter>(SpeechArbiter.new);
