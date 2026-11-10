import 'package:corvista/app/providers.dart';
import 'package:corvista/features/clips/clip_trim_screen.dart';
import 'package:corvista/features/clips/widgets/trim_range_control.dart';
import 'package:corvista/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/clip_fixtures.dart';
import '../fixtures/fake_engine.dart';

/// Hosts the control at a known width and keeps its range in state.
class _Host extends StatefulWidget {
  const _Host({required this.log, this.rtl = false});

  final List<(int, int)> log;
  final bool rtl;

  @override
  State<_Host> createState() => _HostState();
}

class _HostState extends State<_Host> {
  int start = 0, end = 20000;

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Directionality(
      textDirection: widget.rtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        body: Center(
          child: SizedBox(
            // Track = 436 - 2 * 18 = 400 px → 50 ms per px for 20 s.
            width: 436,
            child: TrimRangeControl(
              durationMs: 20000,
              startMs: start,
              endMs: end,
              startLabel: 'Trim start',
              endLabel: 'Trim end',
              onChanged: (s, e) {
                widget.log.add((s, e));
                setState(() {
                  start = s;
                  end = e;
                });
              },
            ),
          ),
        ),
      ),
    ),
  );
}

const _start = ValueKey('trim-start-handle');
const _end = ValueKey('trim-end-handle');

void main() {
  testWidgets('dragging the handles trims start and end', (tester) async {
    final log = <(int, int)>[];
    await tester.pumpWidget(_Host(log: log));

    await tester.drag(find.byKey(_start), const Offset(100, 0));
    await tester.pumpAndSettle();
    final (s, e) = log.last;
    expect(s, closeTo(5000, 400));
    expect(e, 20000);

    await tester.drag(find.byKey(_end), const Offset(-80, 0));
    await tester.pumpAndSettle();
    expect(log.last.$1, s);
    expect(log.last.$2, closeTo(16000, 400));
  });

  testWidgets('handles keep at least one second apart', (tester) async {
    final log = <(int, int)>[];
    await tester.pumpWidget(_Host(log: log));

    await tester.drag(find.byKey(_start), const Offset(600, 0));
    await tester.pumpAndSettle();
    expect(log.last, (19000, 20000));

    await tester.drag(find.byKey(_end), const Offset(-600, 0));
    await tester.pumpAndSettle();
    expect(log.last, (19000, 20000));
  });

  testWidgets('timeline is mirrored in RTL', (tester) async {
    final log = <(int, int)>[];
    await tester.pumpWidget(_Host(log: log, rtl: true));

    // The start handle is on the right; dragging it left moves it later.
    expect(
      tester.getCenter(find.byKey(_start)).dx,
      greaterThan(tester.getCenter(find.byKey(_end)).dx),
    );
    await tester.drag(find.byKey(_start), const Offset(-100, 0));
    await tester.pumpAndSettle();
    expect(log.last.$1, closeTo(5000, 400));
  });

  testWidgets('handles are accessible sliders', (tester) async {
    final semantics = tester.ensureSemantics();
    final log = <(int, int)>[];
    await tester.pumpWidget(_Host(log: log));

    expect(
      tester.getSemantics(find.bySemanticsLabel('Trim start')),
      matchesSemantics(
        label: 'Trim start',
        value: '0:00.0',
        increasedValue: '0:00.5',
        decreasedValue: '0:00.0',
        isSlider: true,
        hasIncreaseAction: true,
        hasDecreaseAction: true,
        hasScrollLeftAction: true,
        hasScrollRightAction: true,
      ),
    );
    tester.semantics.increase(find.semantics.byLabel('Trim start'));
    await tester.pumpAndSettle();
    expect(log.last, (500, 20000));
    tester.semantics.decrease(find.semantics.byLabel('Trim end'));
    await tester.pumpAndSettle();
    expect(log.last, (500, 19500));
    semantics.dispose();
  });

  test('clampRange enforces bounds and the minimum gap', () {
    expect(
      TrimRangeControl.clampRange(-5, 10000, 20000, 1000, movingStart: true),
      (0, 10000),
    );
    expect(
      TrimRangeControl.clampRange(9800, 10000, 20000, 1000, movingStart: true),
      (9000, 10000),
    );
    expect(
      TrimRangeControl.clampRange(0, 25000, 20000, 1000, movingStart: false),
      (0, 20000),
    );
    expect(
      TrimRangeControl.clampRange(5000, 5200, 20000, 1000, movingStart: false),
      (5000, 6000),
    );
    expect(TrimRangeControl.formatMs(65432), '1:05.4');
  });

  testWidgets('trim screen exports the selected range as a new clip', (
    tester,
  ) async {
    final engine = FakeNativeEngine();
    final repo = FakeClipsRepository();
    String? popped;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          nativeEngineProvider.overrideWithValue(engine),
          clipsRepositoryProvider.overrideWithValue(repo),
          storageInfoProvider.overrideWith(
            (ref) async => const StorageInfo(
              freeBytes: 1,
              totalBytes: 2,
              clipsBytes: 0,
              bufferBytes: 0,
              clipCount: 0,
            ),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) => TextButton(
              onPressed: () async =>
                  popped = await Navigator.of(context).push<String>(
                    MaterialPageRoute(
                      builder: (_) => ClipTrimScreen(
                        clip: clipFixture('src', title: 'Drive'),
                        preview: false,
                      ),
                    ),
                  ),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    // Frame strip thumbnails come from media.thumbnail.
    expect(engine.count('media.thumbnail'), ClipTrimScreen.frameCount);
    expect(find.text('0:20.0 selected'), findsOneWidget);

    await tester.drag(find.byKey(_start), const Offset(120, 0));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('trim-save')));
    await tester.pumpAndSettle();

    final args = engine.argsOf('media.trim').single;
    expect(args['startMs'] as int, greaterThan(0));
    expect(args['endMs'], 20000);
    expect(repo.added.single.$2, 'Drive (trimmed)');
    expect(popped, repo.added.single.$1.id);
  });
}
