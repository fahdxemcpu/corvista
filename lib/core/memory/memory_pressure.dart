import 'dart:async';

import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../platform/native_bridge/engine_provider.dart';

/// Reacts to native `{type:'memory', event:'warning'}` status events (memory
/// warnings, also the debug-simulated ones) by dropping decoded images. Flutter
/// already clears `imageCache` on real OS warnings; this also frees live images.
final memoryPressureProvider = Provider<void>((ref) {
  final StreamSubscription<Map<Object?, Object?>> sub = ref
      .read(nativeEngineProvider)
      .status
      .listen((m) {
        if (m['type'] == 'memory' && m['event'] == 'warning') {
          PaintingBinding.instance.imageCache
            ..clear()
            ..clearLiveImages();
        }
      }, onError: (_) {});
  ref.onDispose(sub.cancel);
});
