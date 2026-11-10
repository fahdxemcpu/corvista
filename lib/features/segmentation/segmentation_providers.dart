import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/detection.dart';
import '../../platform/native_bridge/engine_provider.dart';

export 'mask_rasterizer.dart';

final segmentationFrameProvider = StreamProvider<SegmentationFrame>(
  (ref) => ref.watch(nativeEngineProvider).segmentation,
);
