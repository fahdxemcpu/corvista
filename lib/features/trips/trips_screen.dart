import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/common.dart';
import '../../core/widgets/format.dart';
import '../../domain/models/app_settings.dart';
import '../../l10n/l10n.dart';
import 'widgets/trip_widgets.dart';

/// Trip log: recorded drives grouped by day.
class TripsScreen extends ConsumerWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final trips = ref.watch(tripsProvider);
    final settings = ref.watch(settingsProvider);
    final live = ref.watch(tripProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.tripsTitle)),
      body: trips.when(
        skipLoadingOnReload: true,
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()),
        error: (e, _) => EmptyState(
          icon: Icons.error_outline_rounded,
          title: l10n.commonError,
          message: e.toString(),
          actionLabel: l10n.commonRetry,
          onAction: () => ref.invalidate(tripsProvider),
        ),
        data: (list) => TripsListView(
          trips: list,
          unit: settings.speedUnit,
          enabled: settings.tripLogEnabled,
          recordingDistanceM: live.recording ? live.distanceM : null,
          onEnable: () => ref
              .read(settingsProvider.notifier)
              .update((s) => s.copyWith(tripLogEnabled: true)),
          onOpen: (t) => context.push(Routes.trip(t.id)),
          thumbnail: (t) => Consumer(
            builder: (_, ref, _) => TrackThumbnail(
              points: ref.watch(tripShapeProvider(t.id)).value ?? const [],
            ),
          ),
        ),
      ),
    );
  }
}

/// Provider-free list (also used by the render harness).
class TripsListView extends StatelessWidget {
  const TripsListView({
    super.key,
    required this.trips,
    required this.unit,
    required this.onOpen,
    required this.thumbnail,
    this.enabled = true,
    this.recordingDistanceM,
    this.onEnable,
    this.now,
  });

  final List<Trip> trips;
  final SpeedUnit unit;
  final bool enabled;

  /// Live distance of the trip being recorded (null = none).
  final double? recordingDistanceM;
  final ValueChanged<Trip> onOpen;
  final Widget Function(Trip) thumbnail;
  final VoidCallback? onEnable;
  final DateTime? now;

  String _dayLabel(BuildContext context, DateTime d) {
    final n = now ?? DateTime.now();
    final today = DateTime(n.year, n.month, n.day);
    final day = DateTime(d.year, d.month, d.day);
    final diff = today.difference(day).inDays;
    if (diff == 0) return context.l10n.tripsToday;
    if (diff == 1) return context.l10n.tripsYesterday;
    return Fmt.date(context, d);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (trips.isEmpty && recordingDistanceM == null) {
      return EmptyState(
        icon: Icons.route_rounded,
        title: l10n.tripsEmptyTitle,
        message: enabled ? l10n.tripsEmptyBody : l10n.tripsDisabledBody,
        actionLabel: enabled ? null : l10n.tripsEnable,
        onAction: enabled ? null : onEnable,
        secondary: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.lock_outline_rounded,
              size: 14,
              color: AppColors.textSecondary,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                l10n.tripsPrivacyNote,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall
                    ?.copyWith(color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
      );
    }

    // Group by local day (list is newest first).
    final groups = <(String, List<Trip>)>[];
    for (final t in trips) {
      final label = _dayLabel(context, t.startedAt.toLocal());
      if (groups.isEmpty || groups.last.$1 != label) {
        groups.add((label, [t]));
      } else {
        groups.last.$2.add(t);
      }
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760),
        child: CustomScrollView(
          slivers: [
            if (recordingDistanceM != null)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 4),
                  child: InfoBanner(
                    icon: Icons.fiber_manual_record_rounded,
                    message: l10n.tripsRecordingNow(
                      Fmt.routeDistance(context, recordingDistanceM!, unit),
                    ),
                  ),
                ),
              ),
            for (final (label, items) in groups) ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 18, 20, 8),
                  child: Semantics(
                    header: true,
                    child: Text(
                      label.toUpperCase(),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.textSecondary,
                        letterSpacing: .8,
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                sliver: SliverList.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (_, i) => TripCard(
                    trip: items[i],
                    unit: unit,
                    thumbnail: thumbnail(items[i]),
                    onTap: () => onOpen(items[i]),
                  ),
                ),
              ),
            ],
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                child: Text(
                  l10n.tripsPrivacyNote,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall
                      ?.copyWith(color: AppColors.textSecondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  const TripCard({
    super.key,
    required this.trip,
    required this.unit,
    required this.thumbnail,
    required this.onTap,
  });

  final Trip trip;
  final SpeedUnit unit;
  final Widget thumbnail;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final t = trip;
    final title = tripTitle(context, t);
    final hasCustomTitle =
        title !=
        l10n.tripsTimeRange(
          Fmt.time(context, t.startedAt),
          Fmt.time(context, t.endedAt ?? t.startedAt),
        );
    final stats = [
      Fmt.routeDistance(context, t.distanceM, unit),
      tripDuration(context, t.duration),
      tripSpeed(context, t.avgSpeedMs, unit),
    ];
    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 8, 12),
          child: Row(
            children: [
              thumbnail,
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontFeatures: tabular,
                            ),
                          ),
                        ),
                        if (t.favorite)
                          const Padding(
                            padding: EdgeInsetsDirectional.only(start: 6),
                            child: Icon(
                              Icons.star_rounded,
                              size: 18,
                              color: AppColors.amber,
                            ),
                          ),
                      ],
                    ),
                    if (hasCustomTitle) ...[
                      const SizedBox(height: 2),
                      Text(
                        l10n.tripsTimeRange(
                          Fmt.time(context, t.startedAt),
                          Fmt.time(context, t.endedAt ?? t.startedAt),
                        ),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                          fontFeatures: tabular,
                        ),
                      ),
                    ],
                    const SizedBox(height: 6),
                    Text(
                      stats.join('  ·  '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textPrimary.withValues(alpha: .85),
                        fontFeatures: tabular,
                      ),
                    ),
                    if (t.incidentCount + t.alertsCount + t.emergencyCount >
                        0) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: [
                          if (t.emergencyCount > 0)
                            TripBadge(
                              icon: Icons.emergency_rounded,
                              color: AppColors.red,
                              label: '${t.emergencyCount}',
                              semanticsLabel: l10n.tripsEventEmergency,
                            ),
                          if (t.incidentCount > 0)
                            TripBadge(
                              icon: Icons.videocam_rounded,
                              color: AppColors.amber,
                              label: '${t.incidentCount}',
                              semanticsLabel: l10n.tripsIncidents(
                                t.incidentCount,
                              ),
                            ),
                          if (t.alertsCount > 0)
                            TripBadge(
                              icon: Icons.record_voice_over_rounded,
                              color: AppColors.cyan,
                              label: '${t.alertsCount}',
                              semanticsLabel: l10n.tripsAlerts(t.alertsCount),
                            ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
