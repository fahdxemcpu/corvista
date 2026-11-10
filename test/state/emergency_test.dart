import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/test_container.dart';
import '../fixtures/track_fixtures.dart';

void main() {
  const enabled = AppSettings(
    emergencyEnabled: true,
    emergencyCountdownS: 3,
    emergencyMessage: 'Help',
  );

  setUp(() => FlutterSecureStorage.setMockInitialValues({}));

  Future<TestEnv> armedEnv({AppSettings settings = enabled}) async {
    final env = await makeEnv(settings: settings);
    env.container.listen(emergencyProvider, (_, _) {});
    await settle();
    return env;
  }

  /// Feeds the severe synthetic crash through the armed controller exactly
  /// as native would (motion batches + GPS fixes).
  Future<void> crash(TestEnv env) async {
    final sc = MotionScenario.severeImpact(startMs: baseTsMs);
    var si = 0;
    for (final b in sc.batches) {
      final end = b[b.length - 7];
      while (si < sc.speeds.length && sc.speeds[si].$1 <= end) {
        env
            .read(locationProvider.notifier)
            .debugSetFix(fix(speed: sc.speeds[si].$2, tsMs: sc.speeds[si].$1));
        si++;
      }
      env.read(emergencyProvider.notifier).addMotion(b);
    }
    while (si < sc.speeds.length) {
      env
          .read(locationProvider.notifier)
          .debugSetFix(fix(speed: sc.speeds[si].$2, tsMs: sc.speeds[si].$1));
      si++;
    }
    await settle();
  }

  test(
    'disabled unless settings.emergencyEnabled; toggling arms/disarms',
    () async {
      final env = await armedEnv(settings: const AppSettings());
      expect(env.read(emergencyProvider).phase, EmergencyPhase.disabled);
      await env
          .read(settingsProvider.notifier)
          .update((s) => s.copyWith(emergencyEnabled: true));
      await settle();
      expect(env.read(emergencyProvider).phase, EmergencyPhase.armed);
      await env
          .read(settingsProvider.notifier)
          .update((s) => s.copyWith(emergencyEnabled: false));
      await settle();
      expect(env.read(emergencyProvider).phase, EmergencyPhase.disabled);
    },
  );

  test('normal motion keeps the controller armed', () async {
    final env = await armedEnv();
    final b = MotionTraceBuilder(startMs: baseTsMs)..driving(5000);
    for (final batch in b.batches()) {
      env.read(emergencyProvider.notifier).addMotion(batch);
    }
    expect(env.read(emergencyProvider).phase, EmergencyPhase.armed);
  });

  test('crash → countdown (tone, clip, DB) → cancel', () async {
    final env = await armedEnv(
      settings: enabled.copyWith(emergencyCountdownS: 30),
    );
    await crash(env);
    final st = env.read(emergencyProvider);
    expect(st.phase, EmergencyPhase.countdown);
    expect(st.isTest, isFalse);
    expect(st.secondsLeft, inInclusiveRange(25, 30));
    expect(env.engine.argsOf('audio.alertTone').single['kind'], 'emergency');
    await settle(10);
    expect(
      env.engine.argsOf('recorder.saveIncident').single['reason'],
      'emergency',
    );
    expect(env.read(emergencyProvider).event?.clipId, isNotNull);

    env.read(emergencyProvider.notifier).cancel();
    await settle();
    final c = env.read(emergencyProvider);
    expect(c.phase, EmergencyPhase.cancelled);
    expect(c.event?.cancelled, isTrue);
    expect(c.event?.cancelledBy, 'button');
    expect(env.engine.count('audio.stopAll'), greaterThan(0));
    final rows = await env.db.select(env.db.emergencyEvents).get();
    expect(rows.single.cancelled, isTrue);
    expect(rows.single.clipId, isNotNull);

    // Countdown must not continue after cancel.
    await Future<void>.delayed(const Duration(milliseconds: 60));
    expect(env.read(emergencyProvider).phase, EmergencyPhase.cancelled);
    env.read(emergencyProvider.notifier).dismiss();
    expect(env.read(emergencyProvider).phase, EmergencyPhase.armed);
  });

  test('crash → countdown → escalated: nothing called automatically; user actions work', () async {
    FlutterSecureStorage.setMockInitialValues({
      EmergencyContactsController.storageKey:
          '[{"identifier":"c1","name":"Ana","phone":"+33600000000"}]',
    });
    final env = await armedEnv();
    await crash(env);
    await Future<void>.delayed(const Duration(milliseconds: 80));
    final st = env.read(emergencyProvider);
    expect(st.phase, EmergencyPhase.escalated);
    expect(st.actionsEnabled, isTrue);
    expect(env.engine.count('emergency.call'), 0);
    expect(env.engine.count('emergency.compose'), 0);

    await env.read(emergencyProvider.notifier).callEmergency();
    expect(env.engine.argsOf('emergency.call').single['number'], '112');

    final r = await env.read(emergencyProvider.notifier).messageContacts();
    expect(r, 'sent');
    final args = env.engine.argsOf('emergency.compose').single;
    expect(args['recipients'], ['+33600000000']);
    final body = args['body']! as String;
    expect(body, contains('Help'));
    expect(body, contains('https://maps.apple.com/?ll=48.85660,2.35220'));
    expect(
      env.read(emergencyProvider).event?.actions,
      containsAll(['escalated', 'call', 'message:sent']),
    );
  });

  test('voice "I\'m okay" cancels the countdown', () async {
    final env = await armedEnv(
      settings: enabled.copyWith(
        emergencyVoiceCancel: true,
        emergencyCountdownS: 30,
      ),
    );
    await crash(env);
    final start = env.engine.argsOf('voice.start').single;
    expect(start['phrases'] as List, contains("I'm okay"));
    env.engine.voiceCtl.add({'type': 'matched', 'phrase': "I'm okay"});
    await settle();
    final st = env.read(emergencyProvider);
    expect(st.phase, EmergencyPhase.cancelled);
    expect(st.event?.cancelledBy, 'voice');
  });

  test('simulateForTest: labelled test, no clip/DB, actions disabled after escalation', () async {
    FlutterSecureStorage.setMockInitialValues({
      EmergencyContactsController.storageKey:
          '[{"identifier":"c1","name":"Ana","phone":"+33600000000"}]',
    });
    final env = await armedEnv(
      settings: const AppSettings(emergencyCountdownS: 2),
    );
    await env.read(emergencyProvider.notifier).simulateForTest();
    expect(env.read(emergencyProvider).phase, EmergencyPhase.countdown);
    expect(env.read(emergencyProvider).isTest, isTrue);
    expect(env.read(emergencyProvider).event?.evidence.peakG, greaterThan(6));
    await Future<void>.delayed(const Duration(milliseconds: 60));
    final st = env.read(emergencyProvider);
    expect(st.phase, EmergencyPhase.escalated);
    expect(st.actionsEnabled, isFalse);
    await env.read(emergencyProvider.notifier).callEmergency();
    expect(
      await env.read(emergencyProvider.notifier).messageContacts(),
      'disabled',
    );
    expect(env.engine.count('emergency.call'), 0);
    expect(env.engine.count('emergency.compose'), 0);
    expect(env.engine.count('recorder.saveIncident'), 0);
    expect(await env.db.select(env.db.emergencyEvents).get(), isEmpty);
  });

  group('EmergencyContactsController', () {
    test('pick, dedupe, remove — persisted in secure storage', () async {
      final env = await makeEnv();
      env.engine.contact = {
        'identifier': 'id1',
        'name': 'Ana',
        'phone': '+1555',
      };
      final n = env.read(emergencyContactsProvider.notifier);
      expect(await env.read(emergencyContactsProvider.future), isEmpty);
      expect(await n.pickAndAdd(), isTrue);
      expect(await n.pickAndAdd(), isFalse); // duplicate
      expect(env.read(emergencyContactsProvider).value, hasLength(1));
      final stored = await const FlutterSecureStorage().read(
        key: EmergencyContactsController.storageKey,
      );
      expect(stored, contains('+1555'));
      await n.remove('id1');
      expect(env.read(emergencyContactsProvider).value, isEmpty);
      env.engine.contact = null;
      expect(await n.pickAndAdd(), isFalse); // cancelled picker
    });
  });
}
