import '../../features/voice_alerts/alert_phrases.dart';

/// Picks the BCP-47 language for TTS.
///
/// * [preferredTag] (voice language setting, else app locale) → language.
/// * If an installed voice matches the full tag (e.g. `fr-CA`), use it.
/// * Else the default region for that language (`fr` → `fr-FR`) if a voice
///   for it exists, else any installed voice of that language.
/// * Otherwise fall back to `en-US` (and English phrases).
abstract final class VoiceLanguage {
  static const fallback = 'en-US';

  static String _norm(String t) => t.replaceAll('_', '-').toLowerCase();

  static bool _has(List<Map<Object?, Object?>> voices, String tag) =>
      voices.any((v) => _norm('${v['language']}') == _norm(tag));

  /// True when at least one installed voice speaks [lang] (any region).
  static bool availableFor(String lang, List<Map<Object?, Object?>> voices) {
    final l = AlertPhrases.languageOf(lang);
    return voices.any((v) => AlertPhrases.languageOf('${v['language']}') == l);
  }

  static String resolve(
    String? preferredTag,
    List<Map<Object?, Object?>> voices,
  ) {
    final lang = AlertPhrases.supportedLanguage(preferredTag);
    if (voices.isEmpty) {
      // Voice list unknown yet: trust the default mapping.
      return AlertPhrases.defaultVoiceLanguage[lang] ?? fallback;
    }
    if (preferredTag != null &&
        preferredTag.contains(RegExp('[-_]')) &&
        AlertPhrases.languageOf(preferredTag) == lang &&
        _has(voices, preferredTag)) {
      return preferredTag.replaceAll('_', '-');
    }
    final def = AlertPhrases.defaultVoiceLanguage[lang];
    if (def != null && _has(voices, def)) return def;
    for (final v in voices) {
      final tag = '${v['language']}';
      if (AlertPhrases.languageOf(tag) == lang) return tag.replaceAll('_', '-');
    }
    return fallback;
  }
}
