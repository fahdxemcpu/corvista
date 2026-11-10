import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/detection.dart';
import '../../platform/native_bridge/engine_provider.dart';

export 'spatial_estimator.dart';

/// Raw per-frame detections from native (prefer `tracksProvider` for UI).
final detectionFrameProvider = StreamProvider<DetectionFrame>(
  (ref) => ref.watch(nativeEngineProvider).detections,
);
