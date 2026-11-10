import 'dart:io';
import 'dart:math' as math;

import 'package:corvista/app/app.dart';
import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';

/// Background navigation + Live Activity on the Simulator.
///
/// Driven by `tools/qa/run_background_nav.sh`, which reads the `BGCTL` lines
/// printed here: `SHOT name` (simctl screenshot), `ROUTE speed lat,lon ...`
/// (simulated drive), `BACKGROUND` (opens Settings), `LOCK` (Simulator ›
/// Device › Lock), `FOREGROUND` (re-activates Corvista), `STOP`.
///
/// While backgrounded the Flutter engine draws no frames, so this test waits
/// with plain timers (no `pump`) and only reads provider state.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  void ctl(String s) => debugPrint('BGCTL $s');

  Future<void> wait(WidgetTester t, Duration d) async {
    final end = DateTime.now().add(d);
    while (DateTime.now().isBefore(end)) {
      await t.pump(const Duration(milliseconds: 200));
    }
  }

  Future<bool> until(
    WidgetTester t,
    bool Function() cond, {
    Duration timeout = const Duration(seconds: 25),
  }) async {
    final end = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(end)) {
      if (cond()) return true;
      await t.pump(const Duration(milliseconds: 250));
    }
    return cond();
  }

  /// Waypoints along [poly] from the start to [toM] metres, ~[spacing] apart.
  List<String> waypoints(List<double> poly, double toM, {double spacing = 60}) {
    final out = <String>[];
    var along = 0.0, last = -1e9;
    for (var i = 0; i + 3 < poly.length && along <= toM; i += 2) {
      if (along - last >= spacing) {
        out.add(
          '${poly[i].toStringAsFixed(6)},${poly[i + 1].toStringAsFixed(6)}',
        );
        last = along;
      }
      along += NavigationController.distanceM(
        poly[i],
        poly[i + 1],
        poly[i + 2],
        poly[i + 3],
      );
    }
    return out;
  }

  testWidgets('guidance keeps running in the background', (t) async {
    final overrides = await bootstrap();
    await t.pumpWidget(
      ProviderScope(overrides: overrides, child: const CorvistaApp()),
    );
    await wait(t, const Duration(seconds: 1));
    final c = ProviderScope.containerOf(t.element(find.byType(CorvistaApp)));
    await c
        .read(settingsProvider.notifier)
        .update(
          (s) => s.copyWith(
            onboardingDone: true,
            tourDone: true,
            localeTag: () => 'en',
            navVoice: true,
            liveActivity: true,
          ),
        );
    await wait(t, const Duration(seconds: 2));

    // Test footage stands in for the camera so recording is running.
    final video =
        '${(await getApplicationDocumentsDirectory()).path}/'
        'test_drive.mp4';
    if (File(video).existsSync()) {
      await c.read(cameraProvider.notifier).startTestFile(video);
    }
    c.read(driveSessionProvider.notifier).setView(DriveView.maps);
    await until(t, () => c.read(locationProvider).fix != null);
    await until(
      t,
      () => c.read(recorderProvider).status == RecorderStatus.buffering,
      timeout: const Duration(seconds: 10),
    );
    debugPrint(
      'BGLOG camera=${c.read(cameraProvider).status} '
      'recorder=${c.read(recorderProvider).status}',
    );

    // Casablanca → Morocco Mall.
    final nav = c.read(navigationProvider.notifier);
    await nav.submit('Morocco Mall');
    await until(t, () {
      final s = c.read(navigationProvider);
      return s.submitted && !s.loading;
    });
    final places = c.read(navigationProvider).places;
    expect(places, isNotEmpty, reason: 'Morocco Mall search');
    await nav.chooseDestination(places.first);
    expect(c.read(navigationProvider).phase, NavPhase.choosingRoute);
    await nav.start();
    final route = c.read(navigationProvider).route!;
    debugPrint(
      'BGLOG route ${route.distanceM.round()} m, '
      '${route.steps.length} steps to ${places.first.name}',
    );
    ctl(
      'ROUTE 16 '
      '${waypoints(route.polyline.toList(), math.min(4000, route.distanceM * .7)).join(' ')}',
    );
    await until(t, () => c.read(navigationProvider).guidance != null);
    await wait(t, const Duration(seconds: 6));
    ctl('SHOT 01_nav_foreground');
    await wait(t, const Duration(seconds: 3));

    // ---- Background: keep reading guidance while Settings is in front.
    final notifier = c.read(navigationProvider.notifier);
    var fixes = 0;
    final sub = c.listen(locationProvider.select((s) => s.fix), (_, _) {
      fixes++;
    });
    final spokenBefore = notifier.spoken.length;
    final g0 = c.read(navigationProvider).guidance;
    ctl('BACKGROUND');
    for (var i = 1; i <= 8; i++) {
      await Future<void>.delayed(const Duration(seconds: 5));
      final g = c.read(navigationProvider).guidance;
      debugPrint(
        'BGLOG bg t=${i * 5}s life=${WidgetsBinding.instance.lifecycleState} '
        'fixes=$fixes progress=${g?.progressM.round()} '
        'next=${g?.distanceToNextM.round()} "${g?.nextStep?.instructions}" '
        'spoken=${notifier.spoken.length - spokenBefore} '
        'drive=${c.read(driveSessionProvider).backgroundPaused}',
      );
      if (i == 2) ctl('SHOT 02_dynamic_island_compact');
      if (i == 4) ctl('LOCK');
      if (i == 6) ctl('SHOT 03_lock_screen');
    }
    // Optional manual inspection window (--dart-define=HOLD_S=120).
    const hold = int.fromEnvironment('HOLD_S');
    for (var i = 0; i < hold ~/ 10; i++) {
      await Future<void>.delayed(const Duration(seconds: 10));
      final g = c.read(navigationProvider).guidance;
      debugPrint(
        'BGLOG hold fixes=$fixes next=${g?.distanceToNextM.round()} '
        'spoken=${notifier.spoken.length - spokenBefore}',
      );
    }
    final g1 = c.read(navigationProvider).guidance;
    debugPrint(
      'BGLOG background summary fixes=$fixes '
      'progress ${g0?.progressM.round()} → ${g1?.progressM.round()} '
      'spoken=${notifier.spoken.sublist(spokenBefore)}',
    );
    expect(fixes, greaterThan(10), reason: 'fixes keep arriving in background');
    expect(g1!.progressM, greaterThan((g0?.progressM ?? 0) + 200));

    // ---- Foreground again: recording resumes, banner explains the gap.
    ctl('FOREGROUND');
    await Future<void>.delayed(const Duration(seconds: 4));
    await wait(t, const Duration(seconds: 2));
    final ds = c.read(driveSessionProvider);
    debugPrint(
      'BGLOG foreground life=${WidgetsBinding.instance.lifecycleState} '
      'pausedNotice=${ds.pausedNotice} camera=${c.read(cameraProvider).status}',
    );
    ctl('SHOT 04_back_in_app_banner');
    await wait(t, const Duration(seconds: 3));
    sub.close();

    // ---- End navigation → background location off, activity ended.
    nav.cancel();
    ctl('STOP');
    await wait(t, const Duration(seconds: 3));
    ctl('BACKGROUND');
    await Future<void>.delayed(const Duration(seconds: 4));
    ctl('SHOT 05_after_end_background');
    await Future<void>.delayed(const Duration(seconds: 3));
    ctl('FOREGROUND');
    await Future<void>.delayed(const Duration(seconds: 3));
    await wait(t, const Duration(seconds: 1));
    ctl('DONE');
  });
}
