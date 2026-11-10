import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../l10n/l10n.dart';
import '../../detection/widgets/camera_layer.dart';
import '../../detection/widgets/cover_transform.dart';
import 'parking_widgets.dart';

/// Parking view: close-range manoeuvring with the camera facing the
/// direction of travel. Camera (full width, bottom never cropped) with boxes
/// coloured by zone, a bold zone + left/centre/right bar, sector arcs, and
/// beep controls. Front camera only — not a 360° system.
class ParkingView extends ConsumerStatefulWidget {
  const ParkingView({
    super.key,
    required this.contentPadding,
    required this.look,
  });

  final EdgeInsets contentPadding;
  final OverlayLook look;

  @override
  ConsumerState<ParkingView> createState() => _ParkingViewState();
}

class _ParkingViewState extends ConsumerState<ParkingView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      // The drive session also toggles this on view switches; this covers
      // starting directly in the parking view before the session is active.
      ref.read(parkingProvider.notifier).setActive(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final park = ref.watch(parkingProvider);
    final s = ref.watch(settingsProvider);
    final tracks = ref.watch(tracksProvider);
    final cam = ref.watch(cameraProvider);
    final l10n = context.l10n;
    final dir = Directionality.of(context);
    final a = park.assessment;
    final settings = ref.read(settingsProvider.notifier);

    return ParkingLayout(
      contentPadding: widget.contentPadding,
      frameAspect: cam.previewSize.isEmpty
          ? 16 / 9
          : cam.previewSize.width / cam.previewSize.height,
      assessment: a,
      beepsOn: s.parkingBeeps,
      volume: s.beepVolume,
      onBeeps: (v) => settings.update((x) => x.copyWith(parkingBeeps: v)),
      onVolume: (v) => settings.update((x) => x.copyWith(beepVolume: v)),
      onAbout: () => showParkingAbout(context),
      camera: CameraLayer(
        look: widget.look,
        fit: FrameFit.widthBottom,
        showBoxes: false,
        compactStatus: true,
        underlay: (context, tf) => IgnorePointer(
          child: CustomPaint(
            size: Size.infinite,
            painter: ParkingBoxesPainter(
              transform: tf,
              tracks: tracks,
              assessment: a,
              textDirection: dir,
              labelStyle: DefaultTextStyle.of(context).style,
              labelFor: (o) => l10n.parkingObjectSide(
                l10n.objectClass(o.track.cls),
                l10n.parkingSide(o.side),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
