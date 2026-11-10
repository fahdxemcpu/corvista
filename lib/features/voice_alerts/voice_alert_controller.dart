import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/app_settings.dart';
import '../../domain/models/tracked_object.dart';
import '../../domain/services/clock.dart';
import '../../domain/services/voice_language.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../maps/location_controller.dart';
import '../settings/settings_controller.dart';
import '../tracking/tracker_controller.dart';
import 'alert_engine.dart';
import 'alert_phrases.dart';
import 'speech_arbiter.dart';

export 'alert_engine.dart';
export 'speech_arbiter.dart';
export 'alert_phrases.dart';
export 'lead_vehicle_monitor.dart';
export 'traffic_light_filter.dart';

class SpokenAlert {
  const SpokenAlert({
    required this.kind,
    required this.text,
    required this.at,
    this.trackId,
  });
  final AlertKind kind;
  final String text;
  final DateTime at;
  final int? trackId;
}

class VoiceAlertState {
  const VoiceAlertState({
    this.enabled = true,
    this.last,
    this.recent = const [],
    this.voices = const [],
  });
  final bool enabled;
  final SpokenAlert? last;
  final List<SpokenAlert> recent;

  /// Installed TTS voices `{id, name, language, quality}`.
  final List<Map> voices;

  VoiceAlertState copyWith({
    bool? enabled,
    SpokenAlert? last,
    List<SpokenAlert>? recent,
    List<Map>? voices,
  }) => VoiceAlertState(
    enabled: enabled ?? this.enabled,
    last: last ?? this.last,
    recent: recent ?? this.recent,
    voices: voices ?? this.voices,
  );
}

/// Listens to tracks + location, runs [AlertEngine] and speaks alerts in the
/// chosen language (falls back to en-US when no voice is installed).
class VoiceAlertController extends Notifier<VoiceAlertState> {
  static const maxRecent = 20;

  final AlertEngine engine = AlertEngine();
  double _egoSpeed = -1;

  @override
  VoiceAlertState build() {
    ref.listen(locationProvider.select((s) => s.fix), (_, fix) {
      _egoSpeed = fix?.speed ?? -1;
    });
    ref.listen(tracksProvider, (_, tracks) => onTracks(tracks));
    ref.listen(settingsProvider.select((s) => s.voiceAlerts), (_, v) {
      state = state.copyWith(enabled: v);
      if (!v) engine.reset();
    });
    Future.microtask(loadVoices);
    return VoiceAlertState(enabled: ref.read(settingsProvider).voiceAlerts);
  }

  Future<void> loadVoices() async {
    try {
      final v = await ref.read(nativeEngineProvider).voices();
      if (ref.mounted) state = state.copyWith(voices: v);
    } catch (_) {}
  }

  List<Map<Object?, Object?>> get _voices => [
    for (final v in state.voices) v.cast<Object?, Object?>(),
  ];

  /// Preferred language tag: voice language setting, else app locale, else en.
  String _preferredTag(AppSettings s) => s.voiceLanguage ?? s.localeTag ?? 'en';

  /// True when an installed voice exists for [lang] (any region).
  bool voiceAvailableFor(String lang) =>
      VoiceLanguage.availableFor(lang, _voices);

  /// (BCP-47 voice language, phrase language code).
  (String, String) resolveLanguage([AppSettings? settings]) {
    final AppSettings s = settings ?? ref.read<AppSettings>(settingsProvider);
    final tag = _preferredTag(s);
    final voiceLang = VoiceLanguage.resolve(tag, _voices);
    final phraseLang =
        AlertPhrases.languageOf(voiceLang) ==
            AlertPhrases.supportedLanguage(tag)
        ? AlertPhrases.supportedLanguage(tag)
        : 'en';
    return (voiceLang, phraseLang);
  }

  /// Feeds tracks (called for every tracker update; public for tests).
  void onTracks(List<TrackedObject> tracks, {double? tsS}) {
    final s = ref.read(settingsProvider);
    if (!s.voiceAlerts) return;
    final now = ref.read(clockProvider)();
    final t = tsS ?? now.millisecondsSinceEpoch / 1000;
    final events = engine.evaluate(
      tracks: tracks,
      egoSpeedMps: _egoSpeed,
      settings: s,
      tsS: t,
    );
    for (final e in events) {
      unawaited(_speak(e.kind, e.trackId, s, now));
    }
  }

  /// Ego speed override (tests / replay).
  void setEgoSpeed(double mps) => _egoSpeed = mps;

  Future<void> _speak(
    AlertKind kind,
    int? trackId,
    AppSettings s,
    DateTime now,
  ) async {
    final (voiceLang, phraseLang) = resolveLanguage(s);
    final text = AlertPhrases.phrase(kind, phraseLang);
    final alert = SpokenAlert(
      kind: kind,
      text: text,
      at: now,
      trackId: trackId,
    );
    state = state.copyWith(
      last: alert,
      recent: [alert, ...state.recent].take(maxRecent).toList(),
    );
    await _say(text, voiceLang, s);
  }

  Future<void> _say(String text, String voiceLang, AppSettings s) async {
    final voiceId = s.voiceId;
    final voiceMatches =
        voiceId != null &&
        _voices.any(
          (v) =>
              v['id'] == voiceId &&
              AlertPhrases.languageOf('${v['language']}') ==
                  AlertPhrases.languageOf(voiceLang),
        );
    // Through the arbiter: skipped while navigation guidance is speaking.
    await ref
        .read(speechArbiterProvider)
        .speak(
          text,
          channel: SpeechChannel.alert,
          language: voiceLang,
          voiceId: voiceMatches ? voiceId : null,
          volume: s.voiceVolume,
        );
  }

  Future<void> testSpeak() async {
    final s = ref.read(settingsProvider);
    final (voiceLang, phraseLang) = resolveLanguage(s);
    await _say(AlertPhrases.testPhrase(phraseLang), voiceLang, s);
  }
}

final voiceAlertsProvider =
    NotifierProvider<VoiceAlertController, VoiceAlertState>(
      VoiceAlertController.new,
    );
