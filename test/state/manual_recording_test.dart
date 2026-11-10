import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/test_container.dart';

void main() {
  group('Manual (continuous) recording', () {
    Future<TestEnv> env0({AppSettings settings = const AppSettings()}) async {
      final env = await makeEnv(settings: settings);
      env.container.listen(recorderProvider, (_, _) {});
      return env;
    }

    test('free users can start; native gets pre-roll, split and the max '
        'length from settings', () async {
      final env = await env0();
      final ok = await env.read(recorderProvider.notifier).startManual();
      expect(ok, isTrue);
      final args = env.engine.argsOf('recorder.startManual').single;
      expect(args['preRollSeconds'], 5.0);
      expect(args['splitMinutes'], 5.0);
      expect(args['maxMinutes'], 30); // default setting
      final s = env.read(recorderProvider);
      expect(s.manualActive, isTrue);
      expect(s.manualBusy, isFalse);
      expect(s.manualStartedAt, isNotNull);
    });

    test('unlimited max length is sent as 0', () async {
      final env = await env0(settings: const AppSettings(manualMaxMinutes: 0));
      await env.read(recorderProvider.notifier).startManual();
      expect(env.engine.argsOf('recorder.startManual').single['maxMinutes'], 0);
    });

    test('a second start while active is a no-op', () async {
      final env = await env0();
      final n = env.read(recorderProvider.notifier);
      await n.startManual();
      await n.startManual();
      expect(env.engine.count('recorder.startManual'), 1);
    });

    test('part events are catalogued once as kind manual', () async {
      final env = await env0();
      final n = env.read(recorderProvider.notifier);
      await n.startManual();
      final p1 = env.engine.makePart(1);
      env.engine.emitManualPart(p1);
      env.engine.emitManualPart(p1); // duplicate delivery
      await settle();
      final clips = await env.read(clipsRepositoryProvider).all();
      expect(clips, hasLength(1));
      expect(clips.single.kind, 'manual');
      expect(clips.single.isManualRecording, isTrue);
      expect(env.read(recorderProvider).lastManualPart?.id, p1.id);
      expect(env.read(recorderProvider).lastManualPart?.part, 1);
    });

    test(
      'stop waits for the final part, catalogues it and reports user stop',
      () async {
        final env = await env0();
        final n = env.read(recorderProvider.notifier);
        await n.startManual();
        final p1 = env.engine.makePart(1);
        env.engine.emitManualPart(p1);
        await settle();
        final p2 = env.engine.makePart(2);
        // Native returns only the part written by the stop (and may also emit it).
        env.engine.manualStopParts = [p2];
        env.engine.emitManualPart(p2);
        final parts = await n.stopManual();
        await settle();
        expect(parts.map((p) => p.id), [p2.id]);
        final s = env.read(recorderProvider);
        expect(s.manualActive, isFalse);
        expect(s.lastStopReason, 'user');
        final clips = await env.read(clipsRepositoryProvider).all();
        expect(clips.map((c) => c.id).toSet(), {p1.id, p2.id});
        expect(clips.every((c) => c.kind == 'manual'), isTrue);
      },
    );

    test(
      'native auto-stop (storage) ends the session with its reason',
      () async {
        final env = await env0();
        await env.read(recorderProvider.notifier).startManual();
        env.engine.emitManualStopped('storage', files: 2);
        await settle();
        final s = env.read(recorderProvider);
        expect(s.manualActive, isFalse);
        expect(s.lastStopReason, 'storage');
        expect(s.manualParts, 2);
        // Stop after an auto-stop does not call native.
        await env.read(recorderProvider.notifier).stopManual();
        expect(env.engine.count('recorder.stopManual'), 0);
      },
    );

    test('start failure surfaces the bridge error code', () async {
      final env = await env0();
      env.engine.failures['recorder.startManual'] = PlatformException(
        code: 'storage_full',
      );
      final ok = await env.read(recorderProvider.notifier).startManual();
      expect(ok, isFalse);
      final s = env.read(recorderProvider);
      expect(s.manualActive, isFalse);
      expect(s.manualBusy, isFalse);
      expect(s.error, 'storage_full');
    });

    test('Save Incident still works during manual recording', () async {
      final env = await env0();
      final n = env.read(recorderProvider.notifier);
      await n.startManual();
      final r = await n.saveIncident();
      expect(r, isNotNull);
      expect(env.read(recorderProvider).manualActive, isTrue);
      final clips = await env.read(clipsRepositoryProvider).all();
      expect(clips.single.kind, 'incident');
    });

    test('emergency saves are catalogued as kind emergency', () async {
      final env = await env0();
      await env
          .read(recorderProvider.notifier)
          .saveIncident(reason: 'emergency');
      final clips = await env.read(clipsRepositoryProvider).all();
      expect(clips.single.kind, 'emergency');
    });
  });

  group('AppSettings.manualMaxMinutes', () {
    test('round-trips and rejects unsupported values', () {
      const s = AppSettings(manualMaxMinutes: 60);
      expect(AppSettings.fromJson(s.toJson()).manualMaxMinutes, 60);
      expect(
        AppSettings.fromJson({...s.toJson(), 'manualMaxMinutes': 7})
            .manualMaxMinutes,
        30,
      );
      expect(
        const AppSettings().copyWith(manualMaxMinutes: 0).manualMaxMinutes,
        0,
      );
    });
  });
}
