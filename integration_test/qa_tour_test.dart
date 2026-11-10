import 'dart:io';

import 'package:corvista/app/app.dart';
import 'package:corvista/app/providers.dart';
import 'package:corvista/app/router.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// QA tour: walks every screen, view and major option of the real app on a
/// simulator. At each step it logs `[qa-shot] <name>` and pauses; a host
/// script (tools/qa/capture_shots.sh) captures a real simulator screenshot.
///
/// Run: `tools/qa/run_tour.sh UDID OUT_DIR VIDEO`
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('qa tour', (tester) async {
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
      // Host capture follows the test log, which lags ~1-2 s.
      await wait(3200);
    }

    Future<void> tapText(String text) async {
      final f = find.text(text);
      if (f.evaluate().isEmpty) {
        debugPrint('[qa-note] missing text "$text"');
        return;
      }
      await tester.tap(f.first, warnIfMissed: false);
      await wait(600);
    }

    Future<void> scrollShots(String base, {int pages = 6}) async {
      for (var i = 0; i < pages; i++) {
        await shot('${base}_$i');
        final s = find.byType(Scrollable);
        if (s.evaluate().isEmpty) return;
        final before = tester.state<ScrollableState>(s.first).position.pixels;
        await tester.drag(s.first, const Offset(0, -560), warnIfMissed: false);
        await wait(500);
        final after = tester.state<ScrollableState>(s.first).position.pixels;
        if ((after - before).abs() < 4) return;
      }
    }

    final overrides = await bootstrap();
    await tester.pumpWidget(
      ProviderScope(overrides: overrides, child: const CorvistaApp()),
    );
    await wait(2500);
    final c = ProviderScope.containerOf(
      tester.element(find.byType(CorvistaApp)),
    );
    final router = c.read(routerProvider);
    final settings = c.read(settingsProvider.notifier);
    final session = c.read(driveSessionProvider.notifier);

    // ---------------- Onboarding ----------------
    if (!c.read(settingsProvider).onboardingDone) {
      for (var i = 1; i <= 4; i++) {
        await shot('onboarding_p$i');
        await tapText('Next');
      }
      await shot('onboarding_p5_safety');
      final ack = find.byKey(const ValueKey('onboarding-ack'));
      if (ack.evaluate().isNotEmpty) {
        await tester.ensureVisible(ack);
        await wait(300);
        await tester.tap(ack, warnIfMissed: false);
        await wait(500);
      }
      await shot('onboarding_p5_acknowledged');
      await tapText('Continue');
      await wait(1000);
      await shot('permissions');
      await scrollShots('permissions_scroll', pages: 2);
      // Speech recognition can't be pre-granted on the simulator, so the
      // screen may still offer "Allow all"; continue with "Not now".
      if (find.text('Start driving').evaluate().isNotEmpty) {
        await tapText('Start driving');
      } else {
        await tapText('Not now');
      }
      await wait(2500);
      // Guided coach-mark tour (shown once after onboarding).
      for (var i = 1; i <= 12; i++) {
        await shot('guided_tour_$i');
        if (find.text('Next').evaluate().isNotEmpty) {
          await tapText('Next');
        } else {
          await tapText('Start driving');
          break;
        }
      }
      await wait(1500);
    }

    // ---------------- Drive: no camera ----------------
    await shot('drive_camera_unavailable');

    // ---------------- Test footage ----------------
    final docs = await getApplicationDocumentsDirectory();
    // Prefer a host path passed via --dart-define (simulator apps can read
    // host files); fall back to the copy in the app's Documents folder.
    const hostVideo = String.fromEnvironment('VIDEO');
    final video = hostVideo.isNotEmpty
        ? hostVideo
        : p.join(docs.path, 'test_drive.mp4');
    debugPrint('[qa-note] test video exists=${File(video).existsSync()}');
    await c.read(cameraProvider.notifier).startTestFile(video);
    await wait(3000);
    for (var i = 0; i < 4; i++) {
      await shot('detection_footage_$i');
      await wait(1200);
    }

    // ---------------- Views ----------------
    for (final v in DriveView.values) {
      session.setView(v);
      await wait(2500);
      await shot('view_${v.name}_a');
      await wait(2500);
      await shot('view_${v.name}_b');
    }

    // Virtual styles
    session.setView(DriveView.virtual);
    for (final st in VirtualStyle.values) {
      await settings.update((s) => s.copyWith(virtualStyle: st));
      await wait(1500);
      await shot('virtual_style_${st.name}');
    }

    // Perception modes
    session.setView(DriveView.segmentation);
    for (final m in SegmentationMode.values) {
      await settings.update((s) => s.copyWith(segmentationMode: m));
      await wait(2500);
      await shot('perception_${m.name}');
    }

    // HUD styles on detection view
    session.setView(DriveView.detection);
    for (final h in HudStyle.values) {
      await settings.update((s) => s.copyWith(hudStyle: h));
      await wait(1500);
      await shot('hud_${h.name}');
    }
    await settings.update((s) => s.copyWith(hudStyle: HudStyle.classic));

    // Units + confidence labels off
    await settings.update(
      (s) => s.copyWith(speedUnit: SpeedUnit.mph, showConfidence: false),
    );
    await shot('detection_mph_noconf');
    await settings.update(
      (s) => s.copyWith(speedUnit: SpeedUnit.kmh, showConfidence: true),
    );

    // Landscape
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    await wait(2500);
    for (final v in [
      DriveView.detection,
      DriveView.virtual,
      DriveView.maps,
      DriveView.parking,
      DriveView.segmentation,
    ]) {
      session.setView(v);
      await wait(2500);
      await shot('landscape_${v.name}');
    }
    // Stay in portrait for the rest of the tour.
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await wait(2500);
    session.setView(DriveView.detection);
    await wait(1500);

    // Save incident (test footage: recorder is not buffering)
    await tapText('Save');
    await wait(2500);
    await shot('save_incident_on_test_footage');

    // ---------------- Pushed screens ----------------
    Future<void> visit(String route, String name, {int pages = 6}) async {
      router.push(route);
      await wait(1800);
      await scrollShots(name, pages: pages);
      router.pop();
      await wait(1200);
    }

    await visit(Routes.clips, 'clips');
    await visit(Routes.trips, 'trips', pages: 2);
    await visit(Routes.models, 'models');
    await visit(Routes.settings, 'settings', pages: 12);
    await visit(Routes.settingsHud, 'settings_hud');
    await visit(Routes.settingsLanguage, 'settings_language', pages: 3);
    await visit(Routes.settingsDiagnostics, 'diagnostics');
    await visit(Routes.safety, 'safety');
    await visit(Routes.privacy, 'privacy', pages: 3);
    await visit(Routes.terms, 'terms', pages: 2);
    await visit(Routes.help, 'help', pages: 3);
    await visit(Routes.emergencySetup, 'emergency_setup');

    // Destination sheet
    router.push(Routes.destination);
    await wait(1500);
    final tf = find.byType(TextField);
    if (tf.evaluate().isNotEmpty) {
      await tester.enterText(tf.first, 'Morocco Mall');
      await wait(5000);
      await shot('destination_search');
    }
    router.pop();
    await wait(1200);

    // Emergency test countdown (never calls)
    await settings.update((s) => s.copyWith(emergencyEnabled: true));
    await wait(800);
    await c.read(emergencyProvider.notifier).simulateForTest();
    await wait(2500);
    await shot('emergency_countdown_test');
    await wait(4000);
    await shot('emergency_countdown_test_later');
    c.read(emergencyProvider.notifier).cancel();
    await wait(1500);
    await shot('emergency_cancelled');
    c.read(emergencyProvider.notifier).dismiss();
    await settings.update((s) => s.copyWith(emergencyEnabled: false));
    await wait(1500);

    // ---------------- Light theme ----------------
    await settings.update((s) => s.copyWith(themePref: ThemePref.light));
    await wait(1500);
    await shot('light_drive');
    await visit(Routes.settings, 'light_settings', pages: 2);
    await settings.update((s) => s.copyWith(themePref: ThemePref.dark));

    // ---------------- Locales ----------------
    for (final loc in ['ar', 'de', 'ja']) {
      await settings.update((s) => s.copyWith(localeTag: () => loc));
      await wait(2000);
      session.setView(DriveView.detection);
      await wait(1200);
      await shot('${loc}_drive');
      session.setView(DriveView.virtual);
      await wait(1500);
      await shot('${loc}_virtual');
      await visit(Routes.settings, '${loc}_settings', pages: 2);
    }
    await settings.update((s) => s.copyWith(localeTag: () => null));
    await wait(1500);
    debugPrint('[qa-shot] done');
    await wait(1500);
  }, timeout: const Timeout(Duration(minutes: 20)));
}
