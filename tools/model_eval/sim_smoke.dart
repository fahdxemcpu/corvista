// Native smoke test for the camera / ai / recorder / media bridge on the iOS Simulator.
// Talks to `corvista/engine` directly (no app Dart code), plays a real road video
// through camera.startFile and prints results prefixed with [SMOKE].
//
//   flutter run -d <simulator> -t tools/model_eval/sim_smoke.dart \
//     --dart-define=VIDEO=/abs/path/road.mp4 --dart-define=IMAGE=/abs/path/photo.jpg
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const _ch = MethodChannel('corvista/engine');
const _det = EventChannel('corvista/detections');
const _status = EventChannel('corvista/status');
const _video = String.fromEnvironment('VIDEO');
const _image = String.fromEnvironment('IMAGE');

void log(Object? o) => debugPrint('[SMOKE] $o');

String summ(Object? r) {
  final s = '$r';
  return s.length > 600 ? '${s.substring(0, 600)}…' : s;
}

Future<Object?> call(String m, [Map<String, Object?> a = const {}]) async {
  try {
    final r = await _ch.invokeMethod<Object?>(m, a);
    log('$m -> ${summ(r)}');
    return r;
  } on PlatformException catch (e) {
    log('$m !! ${e.code}: ${e.message}');
    return null;
  }
}

final textureId = ValueNotifier<int?>(null);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ValueListenableBuilder<int?>(
    valueListenable: textureId,
    builder: (_, id, _) => Directionality(
      textDirection: TextDirection.ltr,
      child: id == null ? const SizedBox() : Center(child: AspectRatio(aspectRatio: 16 / 9, child: Texture(textureId: id))),
    ),
  ));

  await call('ai.models');
  await call('camera.devices');
  await call('camera.start', {'quality': 'hd720'});
  await call('ai.setModel', {'id': 'enhanced'});
  await call('ai.setModel', {'id': 'segmentation'});
  await call('ai.setModel', {'id': 'efficient'});
  await call('ai.configure', {'confidence': 0.35, 'iou': 0.45, 'maxHz': 15});

  var detections = 0, objects = 0, lights = <String>[], classes = <int, int>{};
  final hz = <double>[], perf = <Map>[], camera = <Map>[];
  final d = _det.receiveBroadcastStream().listen((e) {
    final m = e as Map;
    if (m['type'] == 'detections') {
      detections++;
      final objs = (m['objects'] as List).cast<Map>();
      objects += objs.length;
      for (final o in objs) {
        classes[o['cls'] as int] = (classes[o['cls'] as int] ?? 0) + 1;
        if (o['light'] != null) lights.add('${o['light']}@${(o['lightConf'] as num).toStringAsFixed(2)}');
      }
      hz.add((m['hz'] as num).toDouble());
      if (detections <= 2) log('detections event: ${summ(m)}');
    }
  });
  final s = _status.receiveBroadcastStream().listen((e) {
    final m = e as Map;
    if (m['type'] == 'perf') perf.add(m);
    if (m['type'] == 'camera') camera.add(m);
    if (m['type'] == 'recorder') log('recorder status: $m');
  });

  final r = await call('camera.startFile', {'path': _video, 'loop': true});
  if (r is Map) textureId.value = r['textureId'] as int;
  await Future<void>.delayed(const Duration(seconds: 10));
  log('after 10s @maxHz 15: events=$detections objects=$objects classes=$classes lastHz=${hz.isEmpty ? 0 : hz.last} lights=$lights');
  log('perf events=${perf.length} last=${perf.isEmpty ? null : perf.last}');
  log('camera events=$camera');

  final before = detections;
  await call('ai.configure', {'maxHz': 4});
  await Future<void>.delayed(const Duration(seconds: 5));
  log('maxHz 4 -> ${(detections - before) / 5} events/s, lastHz=${hz.isEmpty ? 0 : hz.last}');
  await call('ai.configure', {'paused': true});
  final p0 = detections;
  await Future<void>.delayed(const Duration(seconds: 2));
  log('paused -> ${detections - p0} events in 2s');
  await call('ai.configure', {'paused': false, 'computeUnits': 'cpuOnly'});

  await call('ai.analyzeImage', {'path': _image});
  await call('ai.benchmark', {'path': _image, 'iterations': 10});

  await call('recorder.configure', {'profile': 'premium', 'bufferSeconds': 30, 'audio': true, 'watermark': false, 'timestamp': true});
  await call('recorder.status');
  await call('recorder.saveIncident', {'reason': 'manual'});
  await call('recorder.recover');
  await call('media.storage');
  await call('media.probe', {'path': _video});
  await call('media.thumbnail', {'path': _video, 'atMs': 2000});
  await call('media.delete', {'path': _video});
  await call('camera.focus', {'x': 0.5, 'y': 0.5});
  await call('camera.stop');
  await call('ai.setModel', {'id': 'none'});
  await d.cancel();
  await s.cancel();
  log('DONE');
}
