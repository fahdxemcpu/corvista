import 'package:flutter/material.dart';

import '../../domain/models/app_settings.dart';
import '../../l10n/l10n.dart';
import '../hud/widgets/drive_controls.dart';
import 'coach_tour.dart';

/// GlobalKeys on the real Drive-screen elements the tour spotlights.
/// Owned by the Drive screen state (one instance per screen).
class DriveTourKeys {
  final hud = GlobalKey(debugLabel: 'tour-hud');
  final save = GlobalKey(debugLabel: 'tour-save');
  final record = GlobalKey(debugLabel: 'tour-record');
  final switcher = GlobalKey(debugLabel: 'tour-switcher');
  final mapTab = GlobalKey(debugLabel: 'tour-map-tab');
  final clips = GlobalKey(debugLabel: 'tour-clips');
  final settings = GlobalKey(debugLabel: 'tour-settings');
}

/// The Drive-screen tour content, in order.
List<TourStep> driveTourSteps(
  AppLocalizations l10n,
  DriveTourKeys keys, {
  required int bufferSeconds,
}) => [
  TourStep(
    id: 'welcome',
    icon: Icons.waving_hand_rounded,
    title: l10n.tourWelcomeTitle,
    body: l10n.tourWelcomeBody,
  ),
  TourStep(
    id: 'hud',
    target: keys.hud,
    icon: Icons.speed_rounded,
    title: l10n.tourHudTitle,
    bullets: [
      (Icons.speed_rounded, null, l10n.tourHudSpeed),
      (Icons.fiber_manual_record_rounded, null, l10n.tourHudRec),
      (Icons.memory_rounded, null, l10n.tourHudAi),
    ],
  ),
  TourStep(
    id: 'save',
    target: keys.save,
    icon: Icons.save_alt_rounded,
    title: l10n.tourSaveTitle,
    body: l10n.tourSaveBody(bufferSeconds),
  ),
  TourStep(
    id: 'record',
    target: keys.record,
    icon: Icons.fiber_manual_record_rounded,
    title: l10n.tourRecordTitle,
    body: l10n.tourRecordBody,
  ),
  TourStep(
    id: 'views',
    target: keys.switcher,
    icon: Icons.view_carousel_rounded,
    title: l10n.tourViewsTitle,
    bullets: [
      for (final (v, text) in [
        (DriveView.detection, l10n.tourViewDetection),
        (DriveView.virtual, l10n.tourViewVirtual),
        (DriveView.maps, l10n.tourViewMap),
        (DriveView.parking, l10n.tourViewParking),
        (DriveView.segmentation, l10n.tourViewPerception),
      ])
        (ViewSwitcher.icon(v), l10n.driveView(v), text),
    ],
  ),
  TourStep(
    id: 'map',
    target: keys.mapTab,
    icon: Icons.alt_route_rounded,
    title: l10n.tourMapTitle,
    body: l10n.tourMapBody,
  ),
  TourStep(
    id: 'clips',
    target: keys.clips,
    icon: Icons.video_library_rounded,
    title: l10n.tourClipsTitle,
    body: l10n.tourClipsBody,
  ),
  TourStep(
    id: 'settings',
    target: keys.settings,
    icon: Icons.tune_rounded,
    title: l10n.tourSettingsTitle,
    body: l10n.tourSettingsBody,
  ),
  TourStep(
    id: 'safety',
    icon: Icons.health_and_safety_rounded,
    title: l10n.tourSafetyTitle,
    bullets: [
      (Icons.push_pin_rounded, null, l10n.tourSafety1),
      (Icons.do_not_touch_rounded, null, l10n.tourSafety2),
      (Icons.report_gmailerrorred_rounded, null, l10n.tourSafety3),
      (Icons.verified_user_rounded, null, l10n.tourSafety4),
    ],
  ),
];
