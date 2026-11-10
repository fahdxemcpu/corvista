import 'dart:io';

import 'package:corvista/app/app.dart';
import 'package:corvista/app/providers.dart';
import 'package:corvista/app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Simulates the iOS prompts (the Simulator cannot answer system alerts from
/// a test): each request takes a moment, speech is answered "denied" so the
/// denied state + Open Settings are exercised.
class _SimulatedPrompts extends PermissionsController {
  @override
  Map<AppPermission, PermissionStatus> build() => {
    for (final p in AppPermission.values) p: PermissionStatus.notDetermined,
  };

  @override
  Future<void> refresh() async {}

  @override
  Future<PermissionStatus> request(AppPermission p) async {
    debugPrint('[qa-note] request ${p.name}');
    await Future<void>.delayed(const Duration(milliseconds: 2600));
    final s = p == AppPermission.speech
        ? PermissionStatus.denied
        : PermissionStatus.granted;
    state = {...state, p: s};
    return s;
  }

  @override
  Future<void> openSettings() async => debugPrint('[qa-note] openSettings');
}

/// First launch: onboarding → permissions ("Allow all") → Drive tour, then
/// the tour again in landscape, right-to-left (Arabic) and from Help.
/// Run: tools/qa/run_onboarding_tour.sh UDID OUT_DIR [VIDEO]
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('first launch flow', (tester) async {
    Future<void> wait(int ms) async {
      final end = DateTime.now().add(Duration(milliseconds: ms));
      while (DateTime.now().isBefore(end)) {
        await tester.pump(const Duration(milliseconds: 100));
      }
    }

    var n = 0;
    Future<void> shot(String name) async {
      await wait(700);
      n++;
      debugPrint('[qa-shot] ${n.toString().padLeft(3, '0')}_$name');
      await wait(3200);
    }

    Future<void> tapKey(String key) async {
      final f = find.byKey(ValueKey(key));
      if (f.evaluate().isEmpty) {
        debugPrint('[qa-note] missing key "$key"');
        return;
      }
      await tester.tap(f.first, warnIfMissed: false);
      await wait(600);
    }

    Future<void> walkTour(String prefix, {int? limit}) async {
      for (var i = 0; i < 20; i++) {
        if (find.byKey(const ValueKey('tour-next')).evaluate().isEmpty) {
          debugPrint('[qa-note] $prefix: tour closed after $i steps');
          return;
        }
        if (limit == null || i < limit) await shot('${prefix}_step${i + 1}');
        await tapKey('tour-next');
        await wait(400);
      }
    }

    final overrides = await bootstrap();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          ...overrides,
          permissionsProvider.overrideWith(_SimulatedPrompts.new),
        ],
        child: const CorvistaApp(),
      ),
    );
    await wait(2500);
    final c = ProviderScope.containerOf(
      tester.element(find.byType(CorvistaApp)),
    );
    final settings = c.read(settingsProvider.notifier);
    final router = c.read(routerProvider);

    // ---------------- Onboarding ----------------
    await shot('onboarding_p1');
    for (var i = 0; i < 4; i++) {
      await tapKey('onboarding-next');
    }
    final ack = find.byKey(const ValueKey('onboarding-ack'));
    if (ack.evaluate().isNotEmpty) {
      await tester.ensureVisible(ack);
      await wait(300);
      await tester.tap(ack, warnIfMissed: false);
      await wait(500);
    }
    await shot('onboarding_p5_acknowledged');
    await tapKey('onboarding-next');
    await wait(1200);

    // ---------------- Permissions ----------------
    await shot('permissions_initial');
    await tapKey('permissions-allow-all');
    await wait(1200);
    await shot('permissions_asking_camera');
    await wait(4200);
    await shot('permissions_asking_mid');
    await wait(7000);
    await shot('permissions_result_speech_denied');
    await tapKey('permissions-start');
    await wait(2500);

    // ---------------- Drive + tour (portrait) ----------------
    final docs = await getApplicationDocumentsDirectory();
    final video = p.join(docs.path, 'test_drive.mp4');
    if (File(video).existsSync()) {
      await c.read(cameraProvider.notifier).startTestFile(video);
    }
    await wait(2500);
    await walkTour('tour_portrait');
    await shot('drive_after_tour');
    debugPrint('[qa-note] tourDone=${c.read(settingsProvider).tourDone}');

    // ---------------- Landscape replay ----------------
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    await wait(2000);
    await settings.update((s) => s.copyWith(tourDone: false));
    await wait(1800);
    await walkTour('tour_landscape');
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await wait(2000);

    // ---------------- RTL replay (Arabic) ----------------
    await settings.update((s) => s.copyWith(localeTag: () => 'ar'));
    await wait(1500);
    await settings.update((s) => s.copyWith(tourDone: false));
    await wait(1800);
    await walkTour('tour_rtl', limit: 3);
    await settings.update((s) => s.copyWith(localeTag: () => null));
    await wait(1500);

    // ---------------- Replay from Settings › Help ----------------
    router.push(Routes.settings);
    await wait(1200);
    router.push(Routes.help);
    await wait(1500);
    await shot('help_take_tour');
    await tapKey('help-take-tour');
    await wait(2500);
    await shot('tour_replayed_from_help');
    await tapKey('tour-skip');
    await wait(1000);
    await shot('after_skip');

    debugPrint('[qa-shot] done');
    await wait(1500);
  }, timeout: const Timeout(Duration(minutes: 12)));
}
