import 'dart:convert';

import 'package:corvista/app/app.dart';
import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/domain/models/detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// Driving simulation on a simulator: real road footage (TEST FOOTAGE mode)
/// + a moving simulated GPS route (driven by the host, see
/// tools/qa/run_drive.sh). Cycles every view, captures screenshots via
/// `[qa-shot]` markers and prints measured statistics as `[drive] {json}`.
///
/// Defines: VIDEO (host path of the .mp4), SCENARIO (name).
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('drive simulation', (tester) async {
    const video = String.fromEnvironment('VIDEO');
    const scenario = String.fromEnvironment('SCENARIO', defaultValue: 'drive');

    Future<void> wait(int ms) async {
      final end = DateTime.now().add(Duration(milliseconds: ms));
      while (DateTime.now().isBefore(end)) {
        await tester.pump(const Duration(milliseconds: 100));
      }
    }

    var n = 0;
    Future<void> shot(String name) async {
      n++;
      debugPrint('[qa-shot] ${n.toString().padLeft(2, '0')}_${scenario}_$name');
      await wait(3200);
    }

    final overrides = await bootstrap();
    await tester.pumpWidget(
      ProviderScope(overrides: overrides, child: const CorvistaApp()),
    );
    await wait(2500);
    final c = ProviderScope.containerOf(
      tester.element(find.byType(CorvistaApp)),
    );
    // Skip onboarding / guided tour (fields may vary between versions).
    await c
        .read(settingsProvider.notifier)
        .update(
          (s) => AppSettings.fromJson({
            ...s.toJson(),
            'onboardingDone': true,
            'tourDone': true,
            'voiceAlerts': true,
          }),
        );
    await wait(2500);
    final session = c.read(driveSessionProvider.notifier);
    final engine = c.read(nativeEngineProvider);

    // ---- statistics ----
    final perClassFrames = <String, int>{};
    final perClassMax = <String, int>{};
    var frames = 0, emptyFrames = 0;
    var infSum = 0.0;
    final sub = engine.detections.listen((DetectionFrame f) {
      frames++;
      infSum += f.inferenceMs;
      if (f.detections.isEmpty) emptyFrames++;
      final counts = <String, int>{};
      for (final d in f.detections) {
        counts[d.cls.name] = (counts[d.cls.name] ?? 0) + 1;
      }
      counts.forEach((k, v) {
        perClassFrames[k] = (perClassFrames[k] ?? 0) + 1;
        if (v > (perClassMax[k] ?? 0)) perClassMax[k] = v;
      });
    });

    await c.read(cameraProvider.notifier).startTestFile(video);
    await wait(3000);

    session.setView(DriveView.detection);
    await shot('detection_1');
    await wait(4000);
    await shot('detection_2');
    session.setView(DriveView.virtual);
    await wait(2500);
    await shot('virtual_1');
    await wait(4000);
    await shot('virtual_2');
    session.setView(DriveView.maps);
    await wait(3500);
    await shot('map');
    session.setView(DriveView.parking);
    await wait(2500);
    await shot('parking');
    session.setView(DriveView.detection);
    await wait(3000);
    await shot('detection_3');

    // Save an incident from the rolling buffer (test footage feeds the
    // recorder when supported; otherwise the app explains why not).
    String saveResult;
    try {
      final r = await c.read(recorderProvider.notifier).saveIncident();
      saveResult = r == null
          ? 'null:${c.read(recorderProvider).error}'
          : 'saved ${r.durationMs}ms ${r.width}x${r.height} '
                '${r.sizeBytes}B audio=${r.hasAudio}';
    } catch (e) {
      saveResult = 'error:$e';
    }
    await wait(1500);
    await shot('after_save');

    final perf = c.read(perfProvider);
    final loc = c.read(locationProvider).fix;
    final alerts = c.read(voiceAlertsProvider).recent;
    await sub.cancel();
    debugPrint(
      '[drive] ${jsonEncode({
        'scenario': scenario,
        'frames': frames,
        'emptyFrames': emptyFrames,
        'avgInferenceMs': frames == 0 ? 0 : (infSum / frames).toStringAsFixed(1),
        'detectHz': perf.detectHz.toStringAsFixed(1),
        'cameraFps': perf.cameraFps.toStringAsFixed(1),
        'memoryMB': perf.memoryMB.toStringAsFixed(0),
        'framesWithClass': perClassFrames,
        'maxPerFrame': perClassMax,
        'speedMs': loc?.speed,
        'course': loc?.course,
        'alerts': [for (final a in alerts) '${a.kind.name}: ${a.text}'],
        'save': saveResult,
      })}',
    );
    debugPrint('[qa-shot] done');
    await wait(1500);
  }, timeout: const Timeout(Duration(minutes: 6)));
}
