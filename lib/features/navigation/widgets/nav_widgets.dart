import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/format.dart';
import '../../../core/widgets/glass.dart';
import '../../../domain/models/app_settings.dart';
import '../../../l10n/l10n.dart';
import 'maneuver_icon.dart';

/// Localized text for a navigation error code from [NavState.error].
String navErrorText(AppLocalizations l10n, String code) => switch (code) {
  'unavailable' || 'offline' => l10n.navErrorUnavailable,
  'no_location' => l10n.navErrorNoLocation,
  'permission_denied' => l10n.navLocationOff,
  'no_route' => l10n.navErrorNoDirections,
  'no_results' => l10n.navNoResults,
  _ => l10n.navErrorGeneric(code),
};

String travelDuration(AppLocalizations l10n, Duration d) {
  final mins = (d.inSeconds / 60).round();
  if (mins < 60) return l10n.navDurationMin(mins < 1 ? 1 : mins);
  return l10n.navDurationHourMin(mins ~/ 60, mins % 60);
}

const _tabular = [FontFeature.tabularFigures()];

/// Route distance for navigation UI: like [Fmt.routeDistance], but UK
/// conventions (yards for short imperial distances) when the device region
/// is GB.
String navDistance(BuildContext context, double meters, SpeedUnit unit) {
  final region =
      Localizations.maybeLocaleOf(context)?.countryCode ??
      WidgetsBinding.instance.platformDispatcher.locale.countryCode;
  final deviceRegion =
      WidgetsBinding.instance.platformDispatcher.locale.countryCode;
  if (unit == SpeedUnit.mph &&
      (deviceRegion == 'GB' || region == 'GB') &&
      meters / 1609.344 < 0.2) {
    final yd = (meters / .9144 / 10).round() * 10;
    return '$yd yd';
  }
  return Fmt.routeDistance(context, meters, unit);
}

/// Banner colour (deep teal, high contrast with white text in sunlight).
const navBannerColor = Color(0xF20D2A33);

/// Route choice card: destination, alternates (distance · time, Fastest tag,
/// advisories) and a big Go button.
class RoutePreviewCard extends ConsumerWidget {
  const RoutePreviewCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nav = ref.watch(navigationProvider);
    final unit = ref.watch(settingsProvider.select((s) => s.speedUnit));
    final ctl = ref.read(navigationProvider.notifier);
    final l10n = context.l10n;
    final dest = nav.destination;
    if (nav.routes.isEmpty || dest == null) return const SizedBox.shrink();
    final selIdx = nav.selectedRoute.clamp(0, nav.routes.length - 1);
    final sel = nav.routes[selIdx];
    final fastest = nav.fastestRoute;
    final eta = DateTime.now().add(
      Duration(seconds: sel.expectedTravelTimeS.round()),
    );

    Widget option(int i) {
      final r = nav.routes[i];
      final selected = i == selIdx;
      return Semantics(
        selected: selected,
        button: true,
        label: l10n.navAltRouteLabel(i + 1, r.name),
        child: GestureDetector(
          onTap: () => ctl.selectRoute(i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            constraints: const BoxConstraints(minWidth: 118, minHeight: 64),
            padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
            decoration: BoxDecoration(
              color: selected
                  ? AppColors.cyan.withValues(alpha: .16)
                  : Colors.white.withValues(alpha: .05),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: selected ? AppColors.cyan : AppColors.border,
                width: selected ? 2 : 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  travelDuration(
                    l10n,
                    Duration(seconds: r.expectedTravelTimeS.round()),
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: selected ? AppColors.cyan : AppColors.textPrimary,
                    fontFeatures: _tabular,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      navDistance(context, r.distanceM, unit),
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        fontFeatures: _tabular,
                      ),
                    ),
                    if (i == fastest && nav.routes.length > 1) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.green.withValues(alpha: .18),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          l10n.navFastest,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: AppColors.green,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return GlassPanel(
      color: const Color(0xE60F1820),
      radius: 24,
      padding: const EdgeInsetsDirectional.fromSTEB(16, 14, 16, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dest.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          if (dest.address.isNotEmpty)
            Text(
              dest.address,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i = 0; i < nav.routes.length; i++)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8),
                    child: option(i),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            [
              if (sel.name.isNotEmpty) sel.name,
              l10n.navArriveAt(Fmt.time(context, eta)),
            ].join(' · '),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
          for (final a in sel.advisories.take(2))
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    size: 15,
                    color: AppColors.amber,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      a,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.amber,
                        fontSize: 12.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 14),
          Row(
            children: [
              SizedBox(
                height: 60,
                child: OutlinedButton(
                  onPressed: ctl.cancel,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textPrimary,
                    side: const BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(l10n.commonCancel),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: FilledButton.icon(
                    key: const ValueKey('nav-go'),
                    onPressed: nav.loading
                        ? null
                        : () => unawaited(ctl.start()),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.cyan,
                      foregroundColor: const Color(0xFF04222A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    icon: const Icon(Icons.navigation_rounded, size: 26),
                    label: Text(l10n.navGo),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Top maneuver banner: big arrow, distance to the maneuver, instruction and
/// a "Then" chip when the following maneuver comes right after.
class ManeuverBanner extends ConsumerWidget {
  const ManeuverBanner({super.key});

  static const thenWithinM = 300.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nav = ref.watch(navigationProvider);
    final unit = ref.watch(settingsProvider.select((s) => s.speedUnit));
    // Smooth (dead-reckoned) frame for the live distance; flags come from
    // the last fix.
    final g = ref.watch(navFrameProvider) ?? nav.guidance;
    final l10n = context.l10n;
    final scale = MediaQuery.textScalerOf(context).clamp(maxScaleFactor: 1.3);

    if (g == null || g.arrived) return const SizedBox.shrink();
    final rerouting = nav.rerouting || (nav.guidance?.offRoute ?? false);
    final m = g.maneuver;
    final step = g.nextStep;
    final instruction = rerouting
        ? l10n.navRerouting
        : (step?.instructions.isNotEmpty ?? false)
        ? step!.instructions
        : '';
    final showThen =
        !rerouting &&
        g.thenManeuver != null &&
        g.thenDistanceM != null &&
        g.thenDistanceM! < thenWithinM &&
        g.maneuver?.type != ManeuverType.arrive;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: scale),
      child: Semantics(
        liveRegion: true,
        label:
            '${navDistance(context, g.distanceToNextM, unit)}, '
            '$instruction',
        excludeSemantics: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(14, 14, 16, 14),
              decoration: BoxDecoration(
                color: rerouting ? const Color(0xF2332A10) : navBannerColor,
                borderRadius: BorderRadius.vertical(
                  top: const Radius.circular(24),
                  bottom: Radius.circular(showThen ? 8 : 24),
                ),
                boxShadow: const [
                  BoxShadow(color: Color(0x66000000), blurRadius: 16),
                ],
              ),
              child: Row(
                children: [
                  SizedBox.square(
                    dimension: 72,
                    child: rerouting
                        ? const Padding(
                            padding: EdgeInsets.all(18),
                            child: CircularProgressIndicator(
                              strokeWidth: 4,
                              color: AppColors.amber,
                            ),
                          )
                        : m == null
                        ? const SizedBox.shrink()
                        : ManeuverIcon(maneuver: m, size: 72),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!rerouting)
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              navDistance(context, g.distanceToNextM, unit),
                              key: const ValueKey('nav-distance'),
                              style: const TextStyle(
                                fontSize: 40,
                                height: 1.05,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                fontFeatures: _tabular,
                              ),
                            ),
                          ),
                        if (instruction.isNotEmpty)
                          Text(
                            instruction,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: rerouting ? 22 : 18,
                              height: 1.2,
                              fontWeight: FontWeight.w600,
                              color: rerouting
                                  ? AppColors.amber
                                  : const Color(0xFFDDF6FA),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (showThen)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Container(
                  margin: const EdgeInsets.only(top: 3),
                  padding: const EdgeInsetsDirectional.fromSTEB(14, 6, 12, 6),
                  decoration: const BoxDecoration(
                    color: Color(0xF2082027),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8),
                      bottom: Radius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.navThen,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFB8D6DC),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ManeuverIcon(maneuver: g.thenManeuver!, size: 30),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Bottom trip bar: ETA, time and distance left. Tap to expand into
/// overview / mute / end controls.
class TripBar extends ConsumerStatefulWidget {
  const TripBar({super.key, required this.onOverview});

  final VoidCallback onOverview;

  @override
  ConsumerState<TripBar> createState() => _TripBarState();
}

class _TripBarState extends ConsumerState<TripBar> {
  bool _expanded = false;

  Future<void> _confirmEnd() async {
    final l10n = context.l10n;
    final dest = ref.read(navigationProvider).destination?.name ?? '';
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.navEndConfirm),
        content: dest.isEmpty ? null : Text(l10n.navEndConfirmBody(dest)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            key: const ValueKey('nav-end-confirm'),
            style: FilledButton.styleFrom(backgroundColor: AppColors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.navEnd),
          ),
        ],
      ),
    );
    if (ok == true && mounted) {
      ref.read(navigationProvider.notifier).cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    final nav = ref.watch(navigationProvider);
    final s = ref.watch(settingsProvider);
    final g = ref.watch(navFrameProvider) ?? nav.guidance;
    final l10n = context.l10n;
    final route = nav.route;
    final remainingM = g?.remainingM ?? route?.distanceM ?? 0;
    final remaining =
        g?.remaining ??
        Duration(seconds: (route?.expectedTravelTimeS ?? 0).round());
    final eta = g?.eta ?? DateTime.now().add(remaining);

    Widget metric(String value, String label, {Color? color}) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            maxLines: 1,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: color ?? AppColors.textPrimary,
              fontFeatures: _tabular,
            ),
          ),
        ),
        Text(
          label,
          maxLines: 1,
          style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
        ),
      ],
    );

    Widget action(
      IconData icon,
      String label,
      VoidCallback onTap, {
      Color? color,
      Key? key,
    }) => Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: SizedBox(
          height: 64,
          child: TextButton(
            key: key,
            onPressed: onTap,
            style: TextButton.styleFrom(
              foregroundColor: color ?? AppColors.textPrimary,
              backgroundColor: (color ?? Colors.white).withValues(alpha: .08),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 24),
                const SizedBox(height: 2),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return GlassPanel(
      color: const Color(0xEB0F1820),
      radius: 24,
      padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 8, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            button: true,
            expanded: _expanded,
            child: InkWell(
              key: const ValueKey('nav-trip-bar'),
              borderRadius: BorderRadius.circular(16),
              onTap: () => setState(() => _expanded = !_expanded),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: metric(
                        Fmt.time(context, eta),
                        l10n.navEtaLabel,
                        color: AppColors.green,
                      ),
                    ),
                    Expanded(
                      child: metric(
                        travelDuration(l10n, remaining),
                        l10n.navTimeLeftLabel,
                      ),
                    ),
                    Expanded(
                      child: metric(
                        navDistance(context, remainingM, s.speedUnit),
                        nav.destination?.name ?? '',
                      ),
                    ),
                    Icon(
                      _expanded
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up_rounded,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 180),
            child: !_expanded
                ? const SizedBox(width: double.infinity)
                : Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        action(Icons.route_rounded, l10n.navOverview, () {
                          setState(() => _expanded = false);
                          widget.onOverview();
                        }),
                        action(
                          s.navVoice
                              ? Icons.volume_up_rounded
                              : Icons.volume_off_rounded,
                          s.navVoice ? l10n.navMute : l10n.navUnmute,
                          () => unawaited(
                            ref
                                .read(navigationProvider.notifier)
                                .setVoice(!s.navVoice),
                          ),
                          color: s.navVoice ? null : AppColors.amber,
                        ),
                        action(
                          Icons.close_rounded,
                          l10n.navEnd,
                          () => unawaited(_confirmEnd()),
                          color: AppColors.red,
                          key: const ValueKey('nav-end'),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

/// Current GPS speed. Shows nothing when the speed is unknown.
class SpeedBubble extends ConsumerWidget {
  const SpeedBubble({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fix = ref.watch(locationProvider.select((s) => s.fix));
    final unit = ref.watch(settingsProvider.select((s) => s.speedUnit));
    final v = Fmt.speed(fix?.speed, unit);
    if (fix == null || !fix.hasSpeed || v == null) {
      return const SizedBox.shrink();
    }
    final l10n = context.l10n;
    final unitLabel = unit == SpeedUnit.mph ? l10n.unitMph : l10n.unitKmh;
    return Semantics(
      label: '$v $unitLabel',
      excludeSemantics: true,
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xF20F1820),
          border: Border.all(color: AppColors.border, width: 2),
          boxShadow: const [
            BoxShadow(color: Color(0x55000000), blurRadius: 10),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$v',
              style: const TextStyle(
                fontSize: 26,
                height: 1,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
                fontFeatures: _tabular,
              ),
            ),
            Text(
              unitLabel,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shown at the destination; Done ends navigation.
class ArrivalCard extends ConsumerWidget {
  const ArrivalCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nav = ref.watch(navigationProvider);
    final l10n = context.l10n;
    final dest = nav.destination;
    return GlassPanel(
      color: const Color(0xF00F1820),
      radius: 24,
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.green.withValues(alpha: .16),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.sports_score_rounded,
              color: AppColors.green,
              size: 32,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  dest == null ? l10n.navArrived : l10n.navArrivedAt(dest.name),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (dest != null && dest.address.isNotEmpty)
                  Text(
                    dest.address,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 56,
            child: FilledButton(
              key: const ValueKey('nav-arrived-done'),
              onPressed: ref.read(navigationProvider.notifier).cancel,
              child: Text(l10n.navDone),
            ),
          ),
        ],
      ),
    );
  }
}

/// Kept for callers that still embed the old banner.
class NavBanner extends StatelessWidget {
  const NavBanner({super.key});

  @override
  Widget build(BuildContext context) => const ManeuverBanner();
}
