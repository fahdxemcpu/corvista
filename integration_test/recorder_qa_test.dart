import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// Dashcam recording QA on a simulator, driving the native engine directly with
/// TEST footage (camera.startFile feeds the rolling recorder).
///
/// Phases (`--dart-define=QA_PHASE=`):
/// * `matrix`  – profiles, audio, watermark/timestamp, short buffer, double save,
///               save during rotation, low storage, background/foreground.
/// * `kill`    – starts a save that pauses before the atomic rename; the host
///               kills the app on `[qa] HOST kill`.
/// * `recover` – relaunch: recorder.recover() must finalize the orphaned .partial.
///
/// Lines `[qa] RESULT {json}` are parsed by the host script
/// (tools/model_eval/recorder_qa.sh), which also probes the clips with ffmpeg.
const _ch = MethodChannel('corvista/engine');
const _status = EventChannel('corvista/status');
const _phase = String.fromEnvironment('QA_PHASE', defaultValue: 'matrix');
const _v720 = String.fromEnvironment('V720'); // 1280x720 + audio
const _v1080 = String.fromEnvironment('V1080'); // 1920x1080 + audio
const _vNoAudio = String.fromEnvironment('VNOAUDIO'); // 1280x720, no audio

void qa(String s) => debugPrint('[qa] $s');

Future<Object?> call(String m, [Map<String, Object?> a = const {}]) =>
    _ch.invokeMethod<Object?>(m, a);

Future<Map<String, Object?>> tryCall(
  String m, [
  Map<String, Object?> a = const {},
]) async {
  try {
    final r = await call(m, a);
    return {'ok': true, 'value': r};
  } on PlatformException catch (e) {
    return {'ok': false, 'code': e.code, 'message': e.message};
  }
}

Object? _jsonable(Object? v) {
  if (v is Map) return v.map((k, v) => MapEntry('$k', _jsonable(v)));
  if (v is List) return v.map(_jsonable).toList();
  if (v is num || v is String || v is bool || v == null) return v;
  return '$v';
}

void result(String name, Map<String, Object?> m) =>
    qa('RESULT ${jsonEncode(_jsonable({'case': name, ...m}))}');

Future<void> sleep(int ms) => Future<void>.delayed(Duration(milliseconds: ms));

Future<double> bufferedMs() async =>
    (((await call('recorder.status')) as Map)['bufferedMs'] as num).toDouble();

Future<void> configure(Map<String, Object?> c) async {
  final r = await call('recorder.configure', c);
  qa('configure $c -> $r');
}

Future<void> startFile(String path) async {
  final r = await call('camera.startFile', {'path': path, 'loop': true});
  qa('startFile ${path.split('/').last} -> $r');
}

/// Saves and reports the expected duration (buffered at save time, capped).
Future<void> save(
  String name, {
  required double capS,
  Map<String, Object?> expect = const {},
}) async {
  final buf = await bufferedMs();
  final t0 = DateTime.now();
  final r = await tryCall('recorder.saveIncident', {
    'reason': 'test',
    'title': name,
  });
  final ms = DateTime.now().difference(t0).inMilliseconds;
  Map<String, Object?>? probe;
  if (r['ok'] == true) {
    probe = ((await call('media.probe', {
      'path': (r['value'] as Map)['path'],
    })) as Map).cast();
  }
  result(name, {
    'bufferedMsAtSave': buf,
    'expectedMs': (buf < capS * 1000 ? buf : capS * 1000),
    'saveMs': ms,
    'expect': expect,
    'save': r,
    'probe': probe,
  });
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('recorder qa $_phase', (tester) async {
    final statuses = <Map>[];
    final sub = _status.receiveBroadcastStream().listen((e) {
      final m = e as Map;
      if (m['type'] == 'camera' || m['type'] == 'recorder') statuses.add(m);
      if (m['type'] == 'perf') qa('perf $m');
      if (m['type'] == 'recorder') qa('rec $m');
    });
    // Detection running too, as in a real drive.
    if (_phase != 'memory') await call('ai.setModel', {'id': 'efficient'});
    const det = EventChannel('corvista/detections');
    var detections = 0;
    final dsub = det.receiveBroadcastStream().listen((_) => detections++);

    if (_phase == 'matrix') {
      // 1. Standard profile: 720p / 20 s, no audio, watermark forced, no timestamp.
      await configure({
        'profile': 'standard',
        'bufferSeconds': 20,
        'audio': true,
        'watermark': false,
        'timestamp': true,
      });
      await startFile(_v720);
      // Short buffer: save immediately, then after ~1.5 s.
      await save('short_immediate', capS: 20, expect: {'error': 'not_running'});
      await sleep(1500);
      await save(
        'short_1500ms',
        capS: 20,
        expect: {'w': 1280, 'h': 720, 'audio': false, 'wm': true, 'ts': false},
      );
      qa(
        'camera status: ${statuses.where((s) => s['type'] == 'camera').lastOrNull}',
      );
      await sleep(22000);
      await save(
        'standard_720p_20s',
        capS: 20,
        expect: {'w': 1280, 'h': 720, 'audio': false, 'wm': true, 'ts': false},
      );

      // 2. Full HD profile: 1080p / 30 s, audio on, watermark off, timestamp on; then two quick saves.
      await configure({
        'profile': 'premium',
        'bufferSeconds': 30,
        'audio': true,
        'watermark': false,
        'timestamp': true,
      });
      await startFile(_v1080);
      await sleep(33000);
      await save(
        'premium_1080p_30s_audio_ts',
        capS: 30,
        expect: {'w': 1920, 'h': 1080, 'audio': true, 'wm': false, 'ts': true},
      );
      final buf = await bufferedMs();
      final both = await Future.wait([
        tryCall('recorder.saveIncident', {
          'reason': 'test',
          'title': 'double_a',
        }),
        tryCall('recorder.saveIncident', {
          'reason': 'test',
          'title': 'double_b',
        }),
      ]);
      for (final (i, r) in both.indexed) {
        Map? probe;
        if (r['ok'] == true) {
          probe = (await call('media.probe', {
            'path': (r['value'] as Map)['path'],
          })) as Map;
        }
        result('double_save_${i == 0 ? 'a' : 'b'}', {
          'bufferedMsAtSave': buf,
          'expectedMs': buf < 30000 ? buf : 30000,
          'expect': {'w': 1920, 'h': 1080, 'audio': true},
          'save': r,
          'probe': probe,
        });
      }

      // 3. Full HD profile at 720p, audio off, custom watermark, no timestamp; save during rotation.
      await configure({
        'profile': 'premium',
        'bufferSeconds': 30,
        'audio': false,
        'watermark': true,
        'watermarkText': 'QA-WM',
        'timestamp': false,
      });
      await startFile(_v720);
      await sleep(9000);
      unawaited(
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
        ]),
      );
      await save(
        'rotation_during_save',
        capS: 30,
        expect: {'w': 1280, 'h': 720, 'audio': false, 'wm': true, 'ts': false},
      );
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      await sleep(1500);

      // 4. Audio requested but the footage has none → no audio track, no failure.
      await configure({
        'profile': 'premium',
        'bufferSeconds': 30,
        'audio': true,
        'watermark': true,
        'timestamp': true,
        'timestampFormat': 'local',
      });
      await startFile(_vNoAudio);
      await sleep(6000);
      await save(
        'audio_requested_no_track',
        capS: 30,
        expect: {'w': 1280, 'h': 720, 'audio': false, 'wm': true, 'ts': true},
      );

      // 5. Low storage (debug hook).
      await call('recorder.debug', {'freeBytes': 10 * 1024 * 1024});
      await save('low_storage', capS: 30, expect: {'error': 'storage_full'});
      await call('recorder.debug', {'freeBytes': null});

      // 6. Background / foreground while buffering (host sends the app to background).
      var paused = false, resumed = false;
      DateTime? resumedAt;
      final l = AppLifecycleListener(
        onPause: () => paused = true,
        onResume: () {
          if (paused) {
            resumed = true;
            resumedAt = DateTime.now();
          }
        },
      );
      await sleep(4000);
      qa('HOST bg');
      final deadline = DateTime.now().add(const Duration(seconds: 90));
      while (!resumed && DateTime.now().isBefore(deadline)) {
        await sleep(200);
      }
      final bgStatus = statuses
          .where((s) => s['type'] == 'camera' && s['state'] == 'interrupted')
          .lastOrNull;
      qa(
        'background: paused=$paused resumed=$resumed interruptedStatus=$bgStatus',
      );
      await sleep(5000);
      final sinceResume = resumedAt == null
          ? -1
          : DateTime.now().difference(resumedAt!).inMilliseconds;
      await save(
        'after_background',
        capS: 30,
        expect: {
          'w': 1280,
          'h': 720,
          'sinceResumeMs': sinceResume,
          'paused': paused,
          'resumed': resumed,
        },
      );
      l.dispose();

      // 7. Efficiency sample: steady buffering + inference (host samples ps while this runs).
      await configure({
        'profile': 'standard',
        'bufferSeconds': 20,
        'audio': false,
        'watermark': true,
        'timestamp': false,
      });
      await startFile(_v720);
      await sleep(3000);
      qa('HOST cpu start');
      await sleep(20000);
      qa('HOST cpu end');
      qa('detections events total: $detections');
      final st = (await call('camera.status')) as Map;
      qa('final camera status: $st');
      await call('camera.stop');
      qa('MATRIX DONE');
    } else if (_phase == 'probe') {
      // Cost of each recorder configuration (see `rec` lines: appendMs/renderMs).
      for (final c in [
        {
          'profile': 'premium',
          'audio': false,
          'watermark': false,
          'timestamp': false,
          'f': _v720,
        },
        {
          'profile': 'standard',
          'audio': false,
          'watermark': true,
          'timestamp': false,
          'f': _v720,
        },
        {
          'profile': 'premium',
          'audio': true,
          'watermark': false,
          'timestamp': true,
          'f': _v1080,
        },
      ]) {
        final file = c.remove('f')! as String;
        await configure({...c, 'bufferSeconds': 20});
        await startFile(file);
        qa('PROBE $c');
        await sleep(10000);
        await save(
          'probe_${c['profile']}_${c['watermark']}_${c['timestamp']}',
          capS: 20,
        );
      }
      await call('camera.stop');
      qa('PROBE DONE');
    } else if (_phase == 'memory') {
      // Footprint (phys_footprint) at each stage; Simulator numbers, not iPhone.
      Future<void> mem(String label) async {
        final i = (await call('system.info')) as Map;
        qa('MEM $label ${i['memoryMB']}');
        result('mem_$label', {
          'memoryMB': i['memoryMB'],
          'save': {'ok': true},
        });
      }

      await sleep(3000);
      await mem('idle');
      await call('ai.setModel', {'id': 'efficient'});
      await configure({
        'profile': 'standard',
        'bufferSeconds': 20,
        'audio': false,
        'watermark': true,
        'timestamp': false,
      });
      await startFile(_v720);
      await sleep(12000);
      await mem('detection_recording');
      await call('ai.setModel', {'id': 'segmentation'});
      await sleep(12000);
      await mem('segmentation_recording');
      await call('ai.setModel', {'id': 'efficient'});
      await sleep(5000);
      await mem('after_leaving_perception');
      final w = await tryCall('recorder.debug', {'memoryWarning': true});
      qa('memoryWarning hook -> $w');
      await sleep(5000);
      await mem('after_memory_warning');
      await call('camera.stop');
      await sleep(5000);
      await mem('after_drive_stop');
      await call('ai.setModel', {'id': 'none'});
      await sleep(3000);
      await mem('after_model_none');
      qa('MEMORY DONE');
    } else if (_phase == 'kill') {
      await configure({
        'profile': 'standard',
        'bufferSeconds': 20,
        'audio': false,
        'watermark': true,
        'timestamp': false,
      });
      await startFile(_v720);
      await sleep(8000);
      await call('recorder.debug', {'pauseBeforeRenameMs': 60000});
      unawaited(
        tryCall('recorder.saveIncident', {
          'reason': 'test',
          'title': 'killed_mid_save',
        }),
      );
      qa('HOST kill');
      await sleep(120000); // the host terminates the app during this wait
    } else if (_phase == 'recover') {
      final r = await tryCall('recorder.recover');
      final list = (r['value'] as List?) ?? const [];
      Map? probe;
      if (list.isNotEmpty) {
        probe = (await call('media.probe', {
          'path': (list.first as Map)['path'],
        })) as Map;
      }
      result('recover_after_kill', {
        'save': r,
        'probe': probe,
        'expect': {'count': 1},
      });
      final again = await tryCall('recorder.recover');
      result('recover_idempotent', {
        'save': again,
        'expect': {'count': 0},
      });
      qa('RECOVER DONE');
    }
    await dsub.cancel();
    await sub.cancel();
  }, timeout: const Timeout(Duration(minutes: 8)));
}
