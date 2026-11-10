import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/fake_engine.dart';
import '../fixtures/test_container.dart';

void main() {
  group('SettingsController', () {
    test('update persists to Drift and reloads in a new container', () async {
      final db = memoryDb();
      final env = await makeEnv(db: db);
      await env
          .read(settingsProvider.notifier)
          .update((s) => s.copyWith(voiceVolume: 0.3, hudStyle: HudStyle.grid));
      expect(env.read(settingsProvider).voiceVolume, 0.3);

      final loaded = await loadSettings(db);
      expect(loaded.voiceVolume, 0.3);
      expect(loaded.hudStyle, HudStyle.grid);

      final env2 = await makeEnv(db: db, settings: loaded);
      expect(env2.read(settingsProvider).voiceVolume, 0.3);
      await db.close();
    });

    test(
      'loadSettings returns defaults for empty or corrupt storage',
      () async {
        final db = memoryDb();
        expect((await loadSettings(db)).modelId, 'efficient');
        await db.writeSetting(settingsKey, '{not json');
        expect((await loadSettings(db)).modelId, 'efficient');
        await db.close();
      },
    );

    test(
      'bootstrap returns overrides, loads settings and imports recovered clips',
      () async {
        final db = memoryDb();
        await saveSettings(db, const AppSettings(onboardingDone: true));
        final engine = FakeNativeEngine();
        engine.recovered = [engine.makeResult()];
        final overrides = await bootstrap(
          engine: engine,
          database: db,
          deferMaintenance: false,
        );
        expect(overrides, hasLength(3));
        expect(engine.count('recorder.recover'), 1);
        expect(
          await ClipsRepository(
            db,
            engine,
            fileExists: (_) async => true,
          ).count(),
          1,
        );
        await db.close();
      },
    );
  });

  group('Every feature is free', () {
    const fullChoices = AppSettings(
      modelId: 'enhanced',
      recordingProfile: RecordingProfile.premium,
      hudStyle: HudStyle.night,
      bufferSeconds: 30,
      recordAudio: true,
      watermark: false,
    );

    test('stored choices are sent to native unchanged', () async {
      final env = await makeEnv(settings: fullChoices);
      await env.read(recorderProvider.notifier).applyConfig();
      final cfg = env.engine.argsOf('recorder.configure').last;
      expect(cfg['profile'], 'premium');
      expect(cfg['bufferSeconds'], 30);
      expect(cfg['audio'], isTrue);
      expect(cfg['watermark'], isFalse);
    });

    test('any model can be selected and is persisted', () async {
      final env = await makeEnv();
      env.container.listen(aiModelsProvider, (_, _) {});
      await settle();
      await env.read(aiModelsProvider.notifier).select('enhanced');
      expect(env.read(aiModelsProvider).error, isNull);
      expect(env.engine.argsOf('ai.setModel').last['id'], 'enhanced');
      expect(env.read(settingsProvider).modelId, 'enhanced');
    });
  });
}
