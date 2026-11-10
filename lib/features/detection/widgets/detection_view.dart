import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import 'camera_layer.dart';

/// Live camera + tracked-object HUD boxes.
class DetectionView extends ConsumerWidget {
  const DetectionView({
    super.key,
    required this.look,
    required this.contentPadding,
  });

  final OverlayLook look;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showFps = ref.watch(settingsProvider.select((s) => s.showFps));
    return Stack(
      fit: StackFit.expand,
      children: [
        CameraLayer(look: look),
        if (showFps)
          PositionedDirectional(
            start: contentPadding.left + 12,
            bottom: contentPadding.bottom + 8,
            child: const PerfLine(),
          ),
      ],
    );
  }
}
