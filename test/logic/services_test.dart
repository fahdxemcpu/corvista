import 'package:corvista/domain/services/emergency_message.dart';
import 'package:corvista/domain/services/voice_language.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VoiceLanguage', () {
    final voices = <Map<Object?, Object?>>[
      {'id': 'a', 'language': 'en-US'},
      {'id': 'b', 'language': 'fr-CA'},
      {'id': 'c', 'language': 'de-DE'},
    ];

    test('resolves exact, default-region and any-region voices', () {
      expect(VoiceLanguage.resolve('de', voices), 'de-DE');
      expect(VoiceLanguage.resolve('fr', voices), 'fr-CA');
      expect(VoiceLanguage.resolve('fr-CA', voices), 'fr-CA');
      expect(VoiceLanguage.resolve('fr_FR', voices), 'fr-CA');
    });

    test('falls back to en-US when no voice exists', () {
      expect(VoiceLanguage.resolve('ja', voices), 'en-US');
      expect(VoiceLanguage.resolve('xx', voices), 'en-US');
      expect(VoiceLanguage.availableFor('ja', voices), isFalse);
      expect(VoiceLanguage.availableFor('fr', voices), isTrue);
    });

    test('empty voice list trusts default mapping', () {
      expect(VoiceLanguage.resolve('ar', const []), 'ar-SA');
    });
  });

  group('composeEmergencyMessage', () {
    test('includes user message, time, coordinates and Apple Maps link', () {
      final body = composeEmergencyMessage(
        userMessage: 'Please call me',
        at: DateTime(2026, 11, 7, 14, 3),
        lat: 48.856614,
        lon: 2.352222,
      );
      expect(body, contains('Please call me'));
      expect(body, contains('2026-11-07 14:03'));
      expect(body, contains('48.85661, 2.35222'));
      expect(body, contains('https://maps.apple.com/?ll=48.85661,2.35222'));
    });

    test('default text and missing location', () {
      final body = composeEmergencyMessage(
        userMessage: ' ',
        at: DateTime(2026),
      );
      expect(body, contains('need help'));
      expect(body, contains('Location: unavailable'));
      expect(body, isNot(contains('maps.apple.com')));
    });
  });
}
