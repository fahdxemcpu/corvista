import 'package:corvista/app/providers.dart';
import 'package:corvista/features/clips/clips_screen.dart';
import 'package:corvista/features/clips/widgets/clip_tiles.dart';
import 'package:corvista/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/clip_fixtures.dart';
import '../fixtures/fake_engine.dart';

final _base = DateTime(2026, 3, 4, 10);

final _clips = [
  clipFixture('inc', kind: 'incident', at: _base, sizeBytes: 40000000),
  clipFixture(
    'rec',
    kind: 'manual',
    reason: 'recording',
    at: _base.subtract(const Duration(hours: 1)),
    durationMs: 300000,
    sizeBytes: 600000000,
  ),
  clipFixture(
    'emg',
    kind: 'emergency',
    reason: 'emergency',
    at: _base.subtract(const Duration(days: 1)),
  ),
  clipFixture(
    'fav',
    favorite: true,
    at: _base.subtract(const Duration(days: 2)),
  ),
];

class _Harness {
  final repo = FakeClipsRepository();
  final engine = FakeNativeEngine();

  Future<void> pump(WidgetTester tester, {List<IncidentClip>? clips}) async {
    final list = clips ?? _clips;
    await tester.binding.setSurfaceSize(const Size(900, 1400));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          nativeEngineProvider.overrideWithValue(engine),
          clipsRepositoryProvider.overrideWithValue(repo),
          clipsProvider.overrideWith((ref) => Stream.value(list)),
          tripsProvider.overrideWith(
            (ref) => Stream.value([
              tripFixture(
                't1',
                _base.subtract(const Duration(minutes: 70)),
                const Duration(minutes: 100),
              ),
            ]),
          ),
          storageInfoProvider.overrideWith(
            (ref) async => const StorageInfo(
              freeBytes: 1500000000,
              totalBytes: 128000000000,
              clipsBytes: 700000000,
              bufferBytes: 0,
              clipCount: 4,
            ),
          ),
        ],
        child: const MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: ClipsScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }
}

Iterable<String> _visibleIds(WidgetTester tester) => tester
    .widgetList<ClipGridTile>(find.byType(ClipGridTile))
    .map((t) => t.clip.id);

Future<void> _filter(WidgetTester tester, String name) async {
  await tester.tap(find.byKey(ValueKey('clips-filter-$name')));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('category filters use the clip kind and favorites', (
    tester,
  ) async {
    await _Harness().pump(tester);
    expect(_visibleIds(tester), ['inc', 'rec', 'emg', 'fav']);

    await _filter(tester, 'recordings');
    expect(_visibleIds(tester), ['rec']);

    await _filter(tester, 'incidents');
    expect(_visibleIds(tester), ['inc', 'fav']);

    await _filter(tester, 'emergency');
    expect(_visibleIds(tester), ['emg']);

    await _filter(tester, 'favorites');
    expect(_visibleIds(tester), ['fav']);

    await _filter(tester, 'all');
    expect(_visibleIds(tester), hasLength(4));
  });

  testWidgets('header shows per-kind counts, low-space note and trip chip', (
    tester,
  ) async {
    await _Harness().pump(tester);
    expect(find.text('1 recording'), findsOneWidget);
    expect(find.text('2 incidents'), findsOneWidget);
    expect(find.text('1 emergency'), findsOneWidget);
    expect(find.text('Free up space'), findsOneWidget);
    expect(find.textContaining('Less than 2 GB free'), findsOneWidget);
    // 'inc' (10:00) and 'rec' (08:55–09:00) overlap the 08:50–10:30 trip.
    expect(find.byType(ClipTripChip), findsNWidgets(2));
  });

  testWidgets('sort by size puts the largest clip first, ungrouped', (
    tester,
  ) async {
    await _Harness().pump(tester);
    await tester.tap(find.byIcon(Icons.sort_rounded));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Largest first'));
    await tester.pumpAndSettle();
    expect(_visibleIds(tester).first, 'rec');
  });

  testWidgets('multi-select deletes with count and total size', (tester) async {
    final h = _Harness();
    await h.pump(tester);

    await tester.longPress(find.byKey(const ValueKey('inc')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('rec')));
    await tester.pumpAndSettle();
    expect(find.text('2 selected'), findsOneWidget);
    // Selection bar summary (the day header shows the same totals).
    expect(find.text('2 clips · 640 MB'), findsNWidgets(2));

    await tester.tap(find.bySemanticsLabel('Delete'));
    await tester.pumpAndSettle();
    expect(find.text('Delete 2 clips (640 MB)?'), findsOneWidget);
    await tester.tap(find.widgetWithText(TextButton, 'Delete'));
    await tester.pumpAndSettle();

    expect(h.repo.deleted, unorderedEquals(['inc', 'rec']));
    expect(find.text('Clips'), findsOneWidget); // selection mode left
  });

  testWidgets('multi-select favorites and saves to Photos with a summary', (
    tester,
  ) async {
    final h = _Harness();
    h.engine.photosResults['/clips/emg.mp4'] = 'failed';
    await h.pump(tester);

    await tester.tap(find.text('Select'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('inc')));
    await tester.tap(find.byKey(const ValueKey('emg')));
    await tester.pumpAndSettle();

    await tester.tap(find.bySemanticsLabel('Favorite'));
    await tester.pumpAndSettle();
    expect(h.repo.favorites, {'inc': true, 'emg': true});

    await tester.tap(find.bySemanticsLabel('Save to Photos'));
    await tester.pumpAndSettle();
    expect(h.engine.count('media.saveToPhotos'), 2);
    expect(
      find.text("1 saved to Photos · 1 couldn't be saved"),
      findsOneWidget,
    );
    // Failures keep the selection so the user can retry.
    expect(find.text('2 selected'), findsOneWidget);
  });

  testWidgets('denied Photos access stops the batch and offers Settings', (
    tester,
  ) async {
    final h = _Harness();
    h.engine.photosResults['/clips/inc.mp4'] = 'denied';
    await h.pump(tester);

    await tester.tap(find.text('Select'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Select all'));
    await tester.pumpAndSettle();
    await tester.tap(find.bySemanticsLabel('Save to Photos'));
    await tester.pumpAndSettle();
    expect(h.engine.count('media.saveToPhotos'), 1);
    expect(find.textContaining("isn't allowed to add videos"), findsOneWidget);
    expect(find.text('Open Settings'), findsOneWidget);
  });
}
