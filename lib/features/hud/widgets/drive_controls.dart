import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../core/widgets/common.dart';
import '../../../domain/models/app_settings.dart';
import '../../../l10n/l10n.dart';
import 'hud_palette.dart';
import 'hud_strip.dart';

/// Compact bottom view switcher (≥ 56 pt targets).
class ViewSwitcher extends StatelessWidget {
  const ViewSwitcher({
    super.key,
    required this.current,
    required this.onSelect,
    required this.palette,
    this.compact = false,
    this.segmentKeys = const {},
  });

  final DriveView current;
  final ValueChanged<DriveView> onSelect;
  final HudPalette palette;
  final bool compact;

  /// Optional keys per segment (used by the coach-mark tour to find them).
  final Map<DriveView, Key> segmentKeys;

  static IconData icon(DriveView v) => switch (v) {
    DriveView.detection => Icons.center_focus_strong_rounded,
    DriveView.virtual => Icons.view_in_ar_rounded,
    DriveView.maps => Icons.map_rounded,
    DriveView.parking => Icons.local_parking_rounded,
    DriveView.segmentation => Icons.layers_rounded,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Semantics(
      label: l10n.driveViewSwitcher,
      container: true,
      child: HudPanel(
        palette: palette,
        radius: 22,
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final v in DriveView.values)
              _Segment(
                key: segmentKeys[v],
                label: l10n.driveView(v),
                icon: icon(v),
                selected: v == current,
                palette: palette,
                compact: compact,
                onTap: () => onSelect(v),
              ),
          ],
        ),
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.palette,
    required this.compact,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected, compact;
  final HudPalette palette;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? palette.accent : palette.text2;
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          constraints: BoxConstraints(
            minWidth: compact ? 56 : 62,
            minHeight: 56,
          ),
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: selected
                ? palette.accent.withValues(alpha: .16)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
            border: palette.highContrast && selected
                ? Border.all(color: palette.accent, width: 2)
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 22),
              if (!compact) ...[
                const SizedBox(height: 3),
                Text(
                  label,
                  maxLines: 1,
                  style: TextStyle(
                    color: color,
                    fontSize: 11,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Contextual banners: permissions, recorder fallback, power notices.
class DriveBanners extends ConsumerStatefulWidget {
  const DriveBanners({super.key, required this.view});

  final DriveView view;

  @override
  ConsumerState<DriveBanners> createState() => _DriveBannersState();
}

class _DriveBannersState extends ConsumerState<DriveBanners> {
  final Set<String> _dismissed = {};

  @override
  Widget build(BuildContext context) {
    final perms = ref.watch(permissionsProvider);
    final loc = ref.watch(locationProvider);
    final rec = ref.watch(recorderProvider);
    final notice = ref.watch(powerProvider.select((p) => p.notice));
    final pausedNotice = ref.watch(
      driveSessionProvider.select((s) => s.pausedNotice),
    );
    final l10n = context.l10n;
    final openSettings = ref.read(permissionsProvider.notifier).openSettings;

    bool denied(AppPermission p) {
      final s = perms[p];
      return s == PermissionStatus.denied || s == PermissionStatus.restricted;
    }

    final banners = <(String, Widget)>[];
    final cameraView =
        widget.view != DriveView.maps && widget.view != DriveView.virtual;
    if (denied(AppPermission.camera) && !cameraView) {
      banners.add((
        'camera',
        _banner(
          'camera',
          l10n.driveCameraDenied,
          BannerTone.warning,
          l10n.commonOpenSettings,
          openSettings,
        ),
      ));
    }
    if (denied(AppPermission.locationWhenInUse) ||
        (loc.error == BridgeErrorCode.permissionDenied &&
            !loc.permissionGranted)) {
      banners.add((
        'location',
        _banner(
          'location',
          l10n.driveLocationDenied,
          BannerTone.warning,
          l10n.commonOpenSettings,
          openSettings,
        ),
      ));
    }
    if (pausedNotice != null) {
      // iOS stops the camera in the background; recording resumed on return.
      // Shown first: it is transient (cleared after a few seconds).
      banners.insert(0, (
        'bgpause:$pausedNotice',
        _banner(
          'bgpause:$pausedNotice',
          l10n.driveRecordingPausedBackground,
          BannerTone.info,
          null,
          null,
        ),
      ));
    }
    if (rec.fallbackReason != null) {
      final msg = rec.fallbackReason == 'microphone_permission'
          ? l10n.driveRecorderFallback
          : l10n.driveRecorderFallbackGeneric(rec.fallbackReason!);
      banners.add((
        'rec:${rec.fallbackReason}',
        _banner('rec:${rec.fallbackReason}', msg, BannerTone.info, null, null),
      ));
    }
    if (notice != null) {
      final msg = switch (notice) {
        PowerNotice.thermalSerious => l10n.drivePowerThermalSerious,
        PowerNotice.thermalCritical => l10n.drivePowerThermalCritical,
        PowerNotice.lowPowerMode => l10n.drivePowerLowPower,
        PowerNotice.batteryLow => l10n.drivePowerBatteryLow,
        _ => null,
      };
      if (msg != null) {
        final tone = notice == PowerNotice.thermalCritical
            ? BannerTone.error
            : BannerTone.warning;
        banners.add((
          'power:$notice',
          _banner('power:$notice', msg, tone, null, null),
        ));
      }
    }
    final visible = banners
        .where((b) => !_dismissed.contains(b.$1))
        .map((b) => b.$2)
        .toList();
    if (visible.isEmpty) return const SizedBox.shrink();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final b in visible.take(2))
          Padding(padding: const EdgeInsets.only(top: 6), child: b),
      ],
    );
  }

  Widget _banner(
    String key,
    String message,
    BannerTone tone,
    String? action,
    Future<void> Function()? onAction,
  ) => InfoBanner(
    glass: true,
    tone: tone,
    message: message,
    actionLabel: action,
    onAction: onAction == null ? null : () => unawaited(onAction()),
    onDismiss: () => setState(() => _dismissed.add(key)),
  );
}
