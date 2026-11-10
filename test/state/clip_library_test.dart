import 'package:corvista/app/providers.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/clip_fixtures.dart';
import '../fixtures/test_container.dart';

void main() {
  group('ClipKind', () {
    test('uses kind, falling back to reason for default rows', () {
      expect(ClipKind.of(clipFixture('a', kind: 'manual')), ClipKind.manual);
      expect(ClipKind.of(clipFixture('b')), ClipKind.incident);
      expect(
        ClipKind.of(clipFixture('c', reason: 'emergency')),
        ClipKind.emergency,
      );
      expect(
        ClipKind.of(clipFixture('d', reason: 'recording')),
        ClipKind.manual,
      );
      expect(ClipKind.of(clipFixture('e', kind: 'bogus')), ClipKind.incident);
    });
  });

  group('filterAndSort / groupByDay', () {
    final d = DateTime(2026, 5, 10, 12);
    final clips = [
      clipFixture('old', at: d.subtract(const Duration(days: 1))),
      clipFixture('long', at: d, durationMs: 90000, sizeBytes: 10),
      clipFixture('big', at: d.add(const Duration(minutes: 5)), sizeBytes: 99),
    ];

    test('sorts', () {
      List<String> ids(ClipSort s) => [
        for (final c in filterAndSort(clips, ClipFilter.all, s)) c.id,
      ];
      expect(ids(ClipSort.newest), ['big', 'long', 'old']);
      expect(ids(ClipSort.oldest), ['old', 'long', 'big']);
      expect(ids(ClipSort.longest).first, 'long');
      expect(ids(ClipSort.largest).first, 'old'); // 50 MB fixture default
    });

    test('groups by local day only for date sorts', () {
      final byDate = groupByDay(
        filterAndSort(clips, ClipFilter.all, ClipSort.newest),
        ClipSort.newest,
      );
      expect(byDate.map((g) => g.clips.length), [2, 1]);
      expect(byDate.first.day, DateTime(2026, 5, 10));
      final bySize = groupByDay(clips, ClipSort.largest);
      expect(bySize, hasLength(1));
      expect(bySize.single.day, isNull);
    });

    test('tripForClip matches overlapping trips', () {
      final trip = tripFixture(
        't',
        d.subtract(const Duration(minutes: 10)),
        const Duration(minutes: 12),
      );
      expect(tripForClip(clips[1], [trip])?.id, 't');
      expect(tripForClip(clips[0], [trip]), isNull);
      // Clip recorded 3 min after the trip ended.
      expect(tripForClip(clips[2], [trip]), isNull);
    });
  });

  group('ClipActions', () {
    test('trim exports via media.trim and catalogues the new clip', () async {
      final env = await makeEnv();
      final source = clipFixture(
        'src',
        kind: 'manual',
        reason: 'recording',
        at: DateTime(2026, 5, 10, 12),
        durationMs: 60000,
        lat: 45,
        lon: 7,
      );
      final r = await env
          .read(clipActionsProvider)
          .trim(source, startMs: 5000, endMs: 25000, title: 'Cut');

      final args = env.engine.argsOf('media.trim').single;
      expect(args['path'], '/clips/src.mp4');
      expect(args['startMs'], 5000);
      expect(args['endMs'], 25000);
      final meta = args['meta'] as Map<String, Object?>;
      expect(meta['kind'], 'manual');
      expect(meta['reason'], 'recording');
      expect(meta['lat'], 45);
      // Timestamp of the last kept frame: 35 s before the source's end.
      expect(
        meta['createdAt'],
        DateTime(2026, 5, 10, 11, 59, 25).millisecondsSinceEpoch,
      );

      final all = await env.read(clipsRepositoryProvider).all();
      final added = all.singleWhere((c) => c.id == r.id);
      expect(added.title, 'Cut');
      expect(added.durationMs, 20000);
      expect(ClipKind.of(added), ClipKind.manual);
    });

    test('saveToPhotos counts results and stops when denied', () async {
      final env = await makeEnv();
      final clips = [
        clipFixture('a'),
        clipFixture('b'),
        clipFixture('c'),
        clipFixture('d'),
      ];
      env.engine.photosResults['/clips/b.mp4'] = 'failed';
      env.engine.photosResults['/clips/c.mp4'] = 'denied';
      final progress = <int>[];
      final r = await env
          .read(clipActionsProvider)
          .saveToPhotos(clips, onProgress: (done, _) => progress.add(done));
      expect(r.saved, 1);
      expect(r.failed, 1);
      expect(r.denied, isTrue);
      expect(env.engine.count('media.saveToPhotos'), 3);
      expect(progress, [1, 2]);
    });
  });
}
