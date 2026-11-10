import 'dart:io';

import 'package:corvista/app/providers.dart';
import 'package:corvista/data/database/database.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/test_container.dart';

void main() {
  late Directory tmp;
  late ErrorLog log;

  setUp(() {
    tmp = Directory.systemTemp.createTempSync('corvista_erase_');
    log = ErrorLog(Directory('${tmp.path}/logs'));
    FlutterSecureStorage.setMockInitialValues({
      EmergencyContactsController.storageKey:
          '[{"identifier":"c1","name":"Ana","phone":"+33600000000"}]',
      'unrelated': 'kept',
    });
  });
  tearDown(() => tmp.deleteSync(recursive: true));

  /// Env with every kind of user data present and a drive session running.
  Future<TestEnv> populated() async {
    final env = await makeEnv(
      settings: const AppSettings(
        onboardingDone: true,
        tourDone: true,
        speedUnit: SpeedUnit.kmh,
        emergencyNumber: '112',
        emergencyEnabled: true,
      ),
      overrides: [
        errorLogProvider.overrideWithValue(log),
        dataEraserProvider.overrideWith(
          (ref) => DataEraser(ref, region: () => 'US'),
        ),
      ],
    );
    final db = env.db;
    final clips = env.read(clipsRepositoryProvider);
    await clips.add(env.engine.makeResult());
    await clips.add(env.engine.makeResult());

    final trips = TripRepository(db);
    await trips.create('t1', DateTime(2026, 11));
    await trips.addPoints('t1', [
      const TripFix(ts: 1, lat: 48.8566, lon: 2.3522),
      const TripFix(ts: 2, lat: 48.8567, lon: 2.3523),
    ]);
    await trips.addEvent('t1', ts: 1, kind: TripEventKind.alert);

    await db.upsertEmergencyEvent(
      EmergencyEventsCompanion.insert(
        id: 'e1',
        triggeredAt: DateTime(2026, 11),
        evidenceJson: '{}',
      ),
    );
    await db.logDetections([
      DetectionsCompanion.insert(
        ts: 1,
        cls: 0,
        conf: .9,
        x: 0,
        y: 0,
        w: 1,
        h: 1,
      ),
    ]);
    env.container.listen(recentDestinationsProvider, (_, _) {});
    await env.read(recentDestinationsProvider.notifier).ready();
    await env
        .read(recentDestinationsProvider.notifier)
        .add(const Place(name: 'Home', address: 'x', lat: 1, lon: 2));
    expect(await env.read(emergencyContactsProvider.future), hasLength(1));

    await log.record(StateError('boom'), StackTrace.current);
    expect(await log.size(), greaterThan(0));

    env.container.listen(driveSessionProvider, (_, _) {});
    await env.read(driveSessionProvider.notifier).start();
    expect(env.read(driveSessionProvider).active, isTrue);
    env.engine.calls.clear();
    return env;
  }

  Future<int> rows(AppDatabase db, TableInfo<Table, Object?> t) =>
      db.select(t).get().then((r) => r.length);

  test('erases clips, buffer, every table, contacts, recents and log; '
      'resets settings to region defaults', () async {
    final env = await populated();
    env.engine.cleanupResult = {
      'bytesFreed': 10,
      'filesDeleted': 1,
      'recovered': [
        {
          'id': 'rec',
          'path': '/clips/recovered.mp4',
          'durationMs': 1000,
          'width': 1280,
          'height': 720,
          'sizeBytes': 1,
          'hasAudio': false,
          'createdAt': DateTime(2026).millisecondsSinceEpoch,
          'reason': 'manual',
        },
      ],
    };

    final report = await env.read(dataEraserProvider).eraseAll();

    expect(report.complete, isTrue, reason: '${report.failedSteps}');
    expect(report.clipsDeleted, 2);

    // Order: session/camera stopped → clips → buffer → cleanup.
    final m = env.engine.methods;
    expect(env.read(driveSessionProvider).active, isFalse);
    expect(m, containsAllInOrder(['camera.stop', 'media.delete']));
    final deletes = env.engine
        .argsOf('media.delete')
        .map((a) => a['path'])
        .toList();
    expect(
      deletes,
      containsAll([
        '/clips/clip1.mp4',
        '/clips/clip2.mp4',
        '/clips/recovered.mp4',
      ]),
    );
    final lastClipDelete = m.lastIndexOf('media.delete');
    expect(
      m.indexOf('recorder.clearBuffer'),
      greaterThan(m.indexOf('media.delete')),
    );
    expect(
      m.indexOf('media.cleanup'),
      greaterThan(m.indexOf('recorder.clearBuffer')),
    );
    expect(lastClipDelete, greaterThan(m.indexOf('media.cleanup')));

    // Every table empty except the freshly written settings row.
    final db = env.db;
    for (final t in db.allTables) {
      if (t.actualTableName == 'settings') continue;
      expect(await rows(db, t), 0, reason: t.actualTableName);
    }
    final settingRows = await db.select(db.settings).get();
    expect(settingRows.map((r) => r.key), [settingsKey]);

    // Settings: region defaults, onboarding again.
    final s = env.read(settingsProvider);
    expect(s.onboardingDone, isFalse);
    expect(s.tourDone, isFalse);
    expect(s.emergencyEnabled, isFalse);
    expect(s.speedUnit, SpeedUnit.mph);
    expect(s.emergencyNumber, '911');
    expect((await loadSettings(db)).onboardingDone, isFalse);

    // Keychain contacts gone (other keys untouched), recents and log empty.
    const storage = FlutterSecureStorage();
    expect(
      await storage.read(key: EmergencyContactsController.storageKey),
      isNull,
    );
    expect(await storage.read(key: 'unrelated'), 'kept');
    expect(await env.read(emergencyContactsProvider.future), isEmpty);
    await settle();
    expect(env.read(recentDestinationsProvider), isEmpty);
    expect(await log.size(), 0);
  });

  test(
    'a failing clip delete is reported but everything else is erased',
    () async {
      final env = await populated();
      env.engine.failures['media.delete'] = PlatformException(code: 'io_error');

      final report = await env.read(dataEraserProvider).eraseAll();

      expect(report.complete, isFalse);
      expect(report.clipFailures, 2);
      expect(await rows(env.db, env.db.incidentClips), 0);
      expect(await rows(env.db, env.db.tripPoints), 0);
      expect(env.engine.count('recorder.clearBuffer'), 1);
      expect(env.read(settingsProvider).onboardingDone, isFalse);
    },
  );

  test('works with nothing to delete and no session running', () async {
    final env = await makeEnv(
      overrides: [errorLogProvider.overrideWithValue(null)],
    );
    final report = await env.read(dataEraserProvider).eraseAll();
    expect(report.complete, isTrue, reason: '${report.failedSteps}');
    expect(env.engine.count('media.delete'), 0);
    expect(env.engine.count('recorder.clearBuffer'), 1);
    expect(env.engine.count('media.cleanup'), 1);
  });
}
