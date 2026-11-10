import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/domain/models/object_class.dart';
import 'package:corvista/data/database/database.dart';
import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/schema_v1.dart';
import '../fixtures/test_container.dart';
import '../fixtures/track_fixtures.dart' as tf;
import '../fixtures/trip_fixtures.dart';

void main() {
  group('migration', () {
    test('v1 database upgrades to v3 keeping existing data', () async {
      driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
      final db = AppDatabase(
        NativeDatabase.memory(
          setup: (raw) {
            for (final s in schemaV1) {
              raw.execute(s);
            }
            raw.execute(
              "INSERT INTO incident_clips (id, path, created_at) VALUES ('old', '/c.mp4', 1700000000)",
            );
            raw.execute(
              "INSERT INTO incident_clips (id, path, created_at, reason) VALUES ('sos', '/e.mp4', 1700000001, 'emergency')",
            );
            raw.execute(
              "INSERT INTO settings (key, value) VALUES ('app', '{\"onboardingDone\":true}')",
            );
            raw.execute('PRAGMA user_version = 1');
          },
        ),
      );
      expect(await db.incidentClips.count().getSingle(), 2);
      // v3: kind backfilled from reason.
      final kinds = {
        for (final r in await db.select(db.incidentClips).get()) r.id: r.kind,
      };
      expect(kinds, {'old': 'incident', 'sos': 'emergency'});
      expect((await loadSettings(db)).onboardingDone, isTrue);
      expect(await db.trips.count().getSingle(), 0);
      final repo = TripRepository(db);
      await repo.create('t1', DateTime(2026));
      await repo.addPoints('t1', [const TripFix(ts: 1, lat: 1, lon: 1)]);
      await repo.addEvent('t1', ts: 1, kind: TripEventKind.alert);
      expect(await db.tripPoints.count().getSingle(), 1);
      final v = await db.customSelect('PRAGMA user_version').getSingle();
      expect(v.data.values.first, 3);
      final idx = await db
          .customSelect(
            "SELECT name FROM sqlite_master WHERE type='index' AND name LIKE 'trip_%'",
          )
          .get();
      expect(
        idx.map((r) => r.read<String>('name')),
        containsAll(['trip_points_trip', 'trip_events_trip']),
      );
      await db.close();
    });
  });

  group('TripRepository', () {
    Future<void> seed(
      TripRepository repo,
      String id,
      DateTime start, {
      double km = 1,
    }) async {
      await repo.create(id, start);
      final b = TraceBuilder(ts: start.millisecondsSinceEpoch.toDouble())
        ..drive(36, km * 100);
      await repo.addPoints(id, b.fixes);
      await repo.saveStats(
        id,
        TripAccumulator.summarize(b.fixes),
        finished: true,
      );
    }

    test(
      'recovered manual parts link to the trip that contains them',
      () async {
        final db = memoryDb();
        final repo = TripRepository(db);
        final start = DateTime(2026, 11, 7, 8);
        await seed(repo, 't', start); // ~100 s drive
        final at = start.add(const Duration(seconds: 30));
        expect(await repo.linkRecoveredRecording('c1', at, part: 2), 't');
        expect(await repo.linkRecoveredRecording('c1', at, part: 2), 't');
        final ev = await repo.events('t');
        expect(
          ev.where((e) => e.kind == TripEventKind.recording),
          hasLength(1),
        );
        expect(ev.single.refId, 'c1');
        expect(ev.single.label, 'part 2');
        // Before any trip / long after the trip ended: not linked.
        expect(await repo.linkRecoveredRecording('c2', DateTime(2025)), isNull);
        expect(
          await repo.linkRecoveredRecording(
            'c3',
            start.add(const Duration(hours: 3)),
          ),
          isNull,
        );
        await db.close();
      },
    );

    test('purge by retention keeps recent trips; 0 = forever', () async {
      final db = memoryDb();
      final repo = TripRepository(db);
      final now = DateTime(2026, 11, 7);
      await seed(repo, 'old', now.subtract(const Duration(days: 100)));
      await seed(repo, 'mid', now.subtract(const Duration(days: 20)));
      await seed(repo, 'new', now.subtract(const Duration(days: 1)));
      expect(await repo.purge(retentionDays: 0, now: now), 0);
      expect(await repo.purge(retentionDays: 90, now: now), 1);
      expect(await repo.trip('old'), isNull);
      expect(await repo.points('old'), isEmpty);
      expect(await repo.purge(retentionDays: 7, now: now), 1);
      expect((await repo.watchTrips().first).map((t) => t.id), ['new']);
      await db.close();
    });

    test(
      'finalizeOpen recomputes interrupted trips and drops short ones',
      () async {
        final db = memoryDb();
        final repo = TripRepository(db);
        await repo.create('long', DateTime(2026));
        final b = TraceBuilder()..drive(36, 60);
        await repo.addPoints('long', b.fixes);
        await repo.create('short', DateTime(2026));
        final c = TraceBuilder()..drive(36, 10);
        await repo.addPoints('short', c.fixes);
        expect(await repo.finalizeOpen(), 1);
        final t = (await repo.trip('long'))!;
        expect(t.isOpen, isFalse);
        expect(t.distanceM, closeTo(590, 10));
        expect(await repo.trip('short'), isNull);
        await db.close();
      },
    );

    test('deleting a trip never deletes incident clips', () async {
      final env = await makeEnv();
      final repo = env.read(tripRepositoryProvider);
      await env.read(clipsRepositoryProvider).add(env.engine.makeResult());
      await seed(repo, 't', DateTime(2026));
      await repo.addEvent(
        't',
        ts: 1,
        kind: TripEventKind.incident,
        refId: 'clip1',
      );
      await repo.delete('t');
      expect(await env.read(clipsRepositoryProvider).count(), 1);
      expect(env.engine.count('media.delete'), 0);
      expect(await repo.events('t'), isEmpty);
    });
  });

  group('GPX', () {
    test('well-formed GPX 1.1 with track points and waypoints', () {
      final b = TraceBuilder()..drive(36, 5);
      final trip = Trip.fromRow(
        TripRow(
          id: 't',
          startedAt: DateTime.utc(2026, 11, 7, 8),
          endedAt: DateTime.utc(2026, 11, 7, 9),
          distanceM: 50,
          movingTimeS: 5,
          avgSpeedMs: 10,
          maxSpeedMs: 10,
          detectionCountsJson: '{}',
          alertsCount: 0,
          incidentCount: 1,
          emergencyCount: 0,
          title: '',
          favorite: false,
        ),
      );
      final gpx = buildGpx(
        trip: trip,
        name: 'Home & <Work>',
        points: [
          for (final f in b.fixes)
            TripPoint(
              ts: f.ts,
              lat: f.lat,
              lon: f.lon,
              speed: f.speed,
              course: 0,
              hAcc: 5,
            ),
        ],
        events: const [
          TripEvent(
            ts: tripT0,
            kind: 'incident',
            label: 'manual',
            refId: 'c1',
            lat: 45.001,
            lon: 7.0,
          ),
          TripEvent(
            ts: tripT0,
            kind: 'alert',
            label: 'pedestrian',
            refId: null,
            lat: null,
            lon: null,
          ),
        ],
      );
      final tags = checkWellFormed(gpx);
      expect(gpx, startsWith('<?xml version="1.0" encoding="UTF-8"?>'));
      expect(tags.first, 'gpx');
      expect(gpx, contains('version="1.1"'));
      expect(gpx, contains('xmlns="http://www.topografix.com/GPX/1/1"'));
      expect(tags.where((t) => t == 'trkpt'), hasLength(5));
      expect(tags.where((t) => t == 'wpt'), hasLength(1));
      final lat = RegExp(r'<trkpt lat="([0-9.\-]+)"')
          .firstMatch(gpx)!
          .group(1)!;
      expect(double.parse(lat), closeTo(b.fixes.first.lat, 1e-6));
      expect(RegExp(r'<time>[0-9T:\-.]+Z</time>').hasMatch(gpx), isTrue);
      expect(gpx, contains('<name>Home &amp; &lt;Work&gt;</name>'));
      expect(tags.indexOf('wpt'), lessThan(tags.indexOf('trk')));
    });
  });

  group('TripController', () {
    Future<TestEnv> env0({AppSettings settings = const AppSettings()}) async {
      final env = await makeEnv(settings: settings);
      env.container.listen(tripProvider, (_, _) {});
      env.container.listen(tripsProvider, (_, _) {});
      return env;
    }

    void feed(TestEnv env, List<TripFix> fixes) {
      final loc = env.read(locationProvider.notifier);
      for (final f in fixes) {
        loc.debugSetFix(
          tf.fix(
            lat: f.lat,
            lon: f.lon,
            speed: f.speed,
            course: f.course,
            hAcc: f.hAcc,
            tsMs: f.ts,
          ),
        );
      }
    }

    test(
      'records a trip during a session with linked incident/alert events',
      () async {
        final env = await env0();
        final trips = env.read(tripProvider.notifier)..sessionStarted();
        final b = TraceBuilder()..drive(36, 30);
        feed(env, b.fixes);
        expect(env.read(tripProvider).recording, isTrue);
        final id = env.read(tripProvider).tripId!;

        final clip = await env.read(recorderProvider.notifier).saveIncident();
        expect(clip, isNotNull);
        env.read(voiceAlertsProvider.notifier)
          ..setEgoSpeed(10)
          ..onTracks([tf.track(cls: ObjectClass.person, range: 6)], tsS: 0);
        for (var i = 0; i < 3; i++) {
          env
              .read(tracksProvider.notifier)
              .onFrame(tf.frame(i * 0.1, [tf.det(ObjectClass.car, 0.5, 0.5)]));
        }
        b.drive(36, 30);
        feed(env, b.fixes.sublist(30));
        await trips.sessionStopped();
        await trips.flush();

        final t = (await env.read(tripRepositoryProvider).trip(id))!;
        expect(t.isOpen, isFalse);
        expect(t.distanceM, closeTo(590, 15));
        expect(t.incidentCount, 1);
        expect(t.alertsCount, 1);
        expect(t.detectionCounts['car'], 1);
        final events = await env.read(tripRepositoryProvider).events(id);
        expect(
          events.map((e) => e.kind),
          containsAll([TripEventKind.incident, TripEventKind.alert]),
        );
        expect(
          events.firstWhere((e) => e.kind == TripEventKind.incident).refId,
          clip!.id,
        );
        expect(env.read(tripProvider).recording, isFalse);
      },
    );

    test('manual recording parts are linked as recording events', () async {
      final env = await env0();
      env.container.listen(recorderProvider, (_, _) {});
      final trips = env.read(tripProvider.notifier)..sessionStarted();
      feed(env, (TraceBuilder()..drive(36, 30)).fixes);
      final id = env.read(tripProvider).tripId!;
      await env.read(recorderProvider.notifier).startManual();
      final part = env.engine.makePart(1);
      env.engine.emitManualPart(part);
      await settle();
      await trips.sessionStopped();
      await trips.flush();
      final events = await env.read(tripRepositoryProvider).events(id);
      final rec = events.where((e) => e.kind == TripEventKind.recording);
      expect(rec.single.refId, part.id);
      expect(rec.single.label, 'part 1');
    });

    test('short trips (< 200 m) are discarded', () async {
      final env = await env0();
      final trips = env.read(tripProvider.notifier)..sessionStarted();
      feed(env, (TraceBuilder()..drive(36, 12)).fixes);
      expect(env.read(tripProvider).recording, isTrue);
      await trips.sessionStopped();
      await trips.flush();
      expect(await env.db.trips.count().getSingle(), 0);
      expect(await env.db.tripPoints.count().getSingle(), 0);
    });

    test('nothing is recorded without a session or when disabled', () async {
      final env = await env0();
      feed(env, (TraceBuilder()..drive(36, 30)).fixes);
      expect(env.read(tripProvider).recording, isFalse);
      final env2 = await env0(
        settings: const AppSettings(tripLogEnabled: false),
      );
      env2.read(tripProvider.notifier).sessionStarted();
      feed(env2, (TraceBuilder()..drive(36, 30)).fixes);
      expect(env2.read(tripProvider).recording, isFalse);
    });

    test('drive session start/stop drives the trip lifecycle', () async {
      final env = await env0();
      final session = env.read(driveSessionProvider.notifier);
      await session.start();
      feed(env, (TraceBuilder()..drive(36, 60)).fixes);
      expect(env.read(tripProvider).recording, isTrue);
      await session.stop();
      await env.read(tripProvider.notifier).flush();
      await settle(10);
      expect(env.read(tripsProvider).value, hasLength(1));
    });
  });
}

/// Minimal XML well-formedness check (balanced tags, valid entities).
/// Returns opening tag names in document order.
List<String> checkWellFormed(String xml) {
  final body = xml.replaceFirst(RegExp(r'^<\?xml[^>]*\?>\s*'), '');
  final stack = <String>[];
  final opened = <String>[];
  final tag = RegExp(r'<(/?)([A-Za-z_][\w:.-]*)([^>]*?)(/?)>');
  var pos = 0;
  for (final m in tag.allMatches(body)) {
    final text = body.substring(pos, m.start);
    expect(text.contains('<'), isFalse, reason: 'stray < in "$text"');
    expect(
      RegExp(r'&(?!amp;|lt;|gt;|quot;|apos;)').hasMatch(text),
      isFalse,
      reason: 'bad entity in "$text"',
    );
    pos = m.end;
    final closing = m.group(1) == '/',
        name = m.group(2)!,
        self = m.group(4) == '/';
    if (closing) {
      expect(
        stack.isNotEmpty && stack.last == name,
        isTrue,
        reason: 'unbalanced </$name>',
      );
      stack.removeLast();
    } else {
      opened.add(name);
      if (!self) stack.add(name);
    }
  }
  expect(stack, isEmpty, reason: 'unclosed: $stack');
  return opened;
}
