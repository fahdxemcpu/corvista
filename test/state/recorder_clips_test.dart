import 'package:corvista/app/providers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/fake_engine.dart';
import '../fixtures/test_container.dart';
import '../fixtures/track_fixtures.dart';

void main() {
  group('RecorderController saves', () {
    test('saves while stationary and the clip is catalogued', () async {
      final env = await makeEnv();
      env.read(locationProvider.notifier).debugSetFix(fix(speed: 0));
      final r = await env.read(recorderProvider.notifier).saveIncident();
      expect(r, isNotNull);
      expect(env.read(recorderProvider).lastSaved?.id, r!.id);
      expect(await env.read(clipsRepositoryProvider).count(), 1);
    });

    test('saves without a GPS fix', () async {
      final env = await makeEnv();
      expect(
        await env.read(recorderProvider.notifier).saveIncident(),
        isNotNull,
      );
    });

    test('emergency saves are always allowed', () async {
      final env = await makeEnv();
      final r = await env
          .read(recorderProvider.notifier)
          .saveIncident(reason: 'emergency');
      expect(r?.reason, 'emergency');
    });

    test('native failure returns null with error code', () async {
      final env = await makeEnv();
      env.engine.failures['recorder.saveIncident'] = PlatformException(
        code: 'storage_full',
      );
      expect(await env.read(recorderProvider.notifier).saveIncident(), isNull);
      expect(env.read(recorderProvider).error, 'storage_full');
    });
  });

  group('Clips', () {
    Future<TestEnv> withClips(int n) async {
      final env = await makeEnv();
      final repo = env.read(clipsRepositoryProvider);
      for (var i = 0; i < n; i++) {
        await repo.add(env.engine.makeResult());
      }
      return env;
    }

    test('the library shows every saved clip, newest first', () async {
      final env = await withClips(7);
      env.container.listen(clipsProvider, (_, _) {});
      await settle(10);
      final visible = env.read(clipsProvider).value!;
      expect(visible, hasLength(7));
      expect(visible.first.id, 'clip7');
      expect(await env.read(clipsRepositoryProvider).count(), 7);
    });

    test('delete removes media via native then the row; bulk delete', () async {
      final env = await withClips(4);
      final repo = env.read(clipsRepositoryProvider);
      await repo.delete('clip1');
      expect(
        env.engine.argsOf('media.delete').single['path'],
        '/clips/clip1.mp4',
      );
      expect(await repo.count(), 3);
      await repo.deleteMany(['clip2', 'clip3']);
      expect(await repo.count(), 1);
      expect(env.engine.count('media.delete'), 3);
    });

    test('rename and favourite', () async {
      final env = await withClips(1);
      final repo = env.read(clipsRepositoryProvider);
      await repo.rename('clip1', '  Near miss ');
      await repo.setFavorite('clip1', true);
      final c = (await repo.all()).single;
      expect(c.title, 'Near miss');
      expect(c.favorite, isTrue);
    });

    test('reconcile marks missing files and imports recovered clips', () async {
      final db = memoryDb();
      final engine = FakeNativeEngine();
      final present = <String>{'/clips/clip1.mp4'};
      final repo = ClipsRepository(
        db,
        engine,
        fileExists: (p) async => present.contains(p),
      );
      await repo.add(engine.makeResult()); // clip1 present
      await repo.add(engine.makeResult()); // clip2 missing
      final changed = await repo.reconcile(recovered: [engine.makeResult()]);
      expect(changed, 2);
      final all = {for (final c in await repo.all()) c.id: c};
      expect(all['clip1']!.missingFile, isFalse);
      expect(all['clip2']!.missingFile, isTrue);
      expect(all.containsKey('clip3'), isTrue);
      present.add('/clips/clip2.mp4');
      present.add('/clips/clip3.mp4');
      expect(await repo.reconcile(), 1);
      await db.close();
    });

    test('storage info combines native storage and clip count', () async {
      final env = await withClips(2);
      final s = await env.read(storageInfoProvider.future);
      expect(s.freeBytes, 100);
      expect(s.clipCount, 2);
    });
  });
}
