import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../platform/native_bridge/engine_provider.dart';
import 'power_controller.dart';

class PerfStats {
  const PerfStats({
    this.inferenceMs = 0,
    this.detectHz = 0,
    this.cameraFps = 0,
    this.memoryMB = 0,
    this.droppedFrames = 0,
    this.segmentationMs,
  });

  final double inferenceMs, detectHz, cameraFps, memoryMB;
  final int droppedFrames;
  final double? segmentationMs;

  PerfStats copyWith({
    double? inferenceMs,
    double? detectHz,
    double? cameraFps,
    double? memoryMB,
    int? droppedFrames,
    double? Function()? segmentationMs,
  }) => PerfStats(
    inferenceMs: inferenceMs ?? this.inferenceMs,
    detectHz: detectHz ?? this.detectHz,
    cameraFps: cameraFps ?? this.cameraFps,
    memoryMB: memoryMB ?? this.memoryMB,
    droppedFrames: droppedFrames ?? this.droppedFrames,
    segmentationMs: segmentationMs != null
        ? segmentationMs()
        : this.segmentationMs,
  );
}

/// Live performance numbers from `perf`/`camera` status events plus memory
/// from the 10 s `system.info` poll.
class PerfController extends Notifier<PerfStats> {
  StreamSubscription<Map<Object?, Object?>>? _sub;

  @override
  PerfStats build() {
    _sub = ref.read(nativeEngineProvider).status.listen((m) {
      double? n(String k) => (m[k] as num?)?.toDouble();
      switch (m['type']) {
        case 'perf':
          state = state.copyWith(
            inferenceMs: n('inferenceMs'),
            detectHz: n('detectHz'),
            memoryMB: n('memoryMB'),
            droppedFrames: (m['droppedFrames'] as num?)?.toInt(),
            segmentationMs: m.containsKey('segmentationMs')
                ? () => n('segmentationMs')
                : null,
          );
        case 'camera':
          state = state.copyWith(
            cameraFps: n('fps'),
            droppedFrames: (m['droppedFrames'] as num?)?.toInt(),
          );
      }
    }, onError: (_) {});
    ref.listen(systemInfoProvider, (_, next) {
      final mem = (next.value?['memoryMB'] as num?)?.toDouble();
      if (mem != null) state = state.copyWith(memoryMB: mem);
    });
    ref.onDispose(() => _sub?.cancel());
    return const PerfStats();
  }
}

final perfProvider = NotifierProvider<PerfController, PerfStats>(
  PerfController.new,
);
