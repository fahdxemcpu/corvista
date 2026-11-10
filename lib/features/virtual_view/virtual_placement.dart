import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../domain/models/app_settings.dart';
import '../../domain/models/tracked_object.dart';
import '../detection/placement_filter.dart';

/// Scene placements for the virtual view: [tracksProvider] run through a
/// [PlacementFilter] (ground-plane projection, per-track filtering, lane
/// snapping). Lives only while the virtual view watches it.
class VirtualPlacementController extends Notifier<List<PlacedObject>> {
  final _filter = PlacementFilter();

  @override
  List<PlacedObject> build() {
    ref.listen(tracksProvider, (_, next) => state = _compute(next));
    return _compute(ref.read(tracksProvider));
  }

  List<PlacedObject> _compute(List<TrackedObject> tracks) {
    final s = ref.read(settingsProvider);
    final cam = ref.read(cameraProvider);
    _filter.leftHand =
        resolveDrivingSide(
          s.drivingSide,
          WidgetsBinding.instance.platformDispatcher.locale.countryCode,
        ) ==
        DrivingSide.left;
    if (tracks.isEmpty) {
      // Keeps filter state bounded when the scene empties.
      _filter.update(
        const [],
        tS: 0,
        frameSize: cam.previewSize,
        hfovDeg: s.cameraFov,
      );
      return const [];
    }
    final now = ref.read(clockProvider)().microsecondsSinceEpoch / 1e6;
    return _filter.update(
      tracks,
      tS: now,
      frameSize: cam.previewSize,
      hfovDeg: cam.hfovDeg > 0 ? cam.hfovDeg : s.cameraFov,
    );
  }
}

final virtualPlacementProvider =
    NotifierProvider.autoDispose<
      VirtualPlacementController,
      List<PlacedObject>
    >(VirtualPlacementController.new);
