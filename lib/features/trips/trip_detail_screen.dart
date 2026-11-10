import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/common.dart';
import '../../core/widgets/format.dart';
import '../../domain/models/app_settings.dart';
import '../../domain/models/object_class.dart';
import '../../l10n/l10n.dart';
import 'widgets/trip_widgets.dart';

/// One recorded trip: map/track, stats, detections, event timeline.
class TripDetailScreen extends ConsumerStatefulWidget {
  const TripDetailScreen({super.key, required this.tripId});
  final String tripId;

  @override
  ConsumerState<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends ConsumerState<TripDetailScreen> {
  final _menuKey = GlobalKey();

  TripRepository get _repo => ref.read(tripRepositoryProvider);

  Future<void> _rename(Trip t) async {
    final l10n = context.l10n;
    final ctrl = TextEditingController(text: tripTitle(context, t));
    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.tripsRenameTitle),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          maxLength: 60,
          decoration: InputDecoration(hintText: l10n.tripsRenameHint),
          onSubmitted: (v) => Navigator.of(ctx).pop(v),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(l10n.commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(ctrl.text),
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
    ctrl.dispose();
    if (name != null) await _repo.rename(t.id, name);
  }

  Future<void> _share(TripDetail d) async {
    final l10n = context.l10n;
    final box = _menuKey.currentContext?.findRenderObject() as RenderBox?;
    final origin = box != null && box.hasSize
        ? box.localToGlobal(Offset.zero) & box.size
        : null;
    try {
      final name = l10n.tripsGpxName(Fmt.dateTime(context, d.trip.startedAt));
      final gpx = buildGpx(
        trip: d.trip,
        points: d.points,
        events: d.events,
        name: name,
      );
      final dir = await getTemporaryDirectory();
      final stamp = d.trip.startedAt
          .toIso8601String()
          .substring(0, 16)
          .replaceAll(RegExp('[^0-9]'), '');
      final file = File('${dir.path}/corvista-trip-$stamp.gpx');
      await file.writeAsString(gpx, flush: true);
      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path, mimeType: 'application/gpx+xml')],
          title: name,
          sharePositionOrigin: origin,
        ),
      );
    } catch (_) {
      if (mounted) showSnack(context, l10n.tripsShareFailed);
    }
  }

  Future<void> _delete(Trip t) async {
    final l10n = context.l10n;
    final ok = await confirmDialog(
      context,
      title: l10n.tripsDeleteConfirmTitle,
      message: l10n.tripsDeleteConfirmBody,
      confirmLabel: l10n.commonDelete,
    );
    if (!ok || !mounted) return;
    final messenger = ScaffoldMessenger.maybeOf(context);
    await _repo.delete(t.id);
    if (!mounted) return;
    context.pop();
    messenger?.showSnackBar(SnackBar(content: Text(l10n.tripsDeleted)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final detail = ref.watch(tripDetailProvider(widget.tripId));
    final unit = ref.watch(settingsProvider.select((s) => s.speedUnit));
    final d = detail.value;
    return Scaffold(
      appBar: AppBar(
        title: Text(d == null ? l10n.tripsTitle : tripTitle(context, d.trip)),
        actions: [
          if (d != null) ...[
            IconButton(
              tooltip: d.trip.favorite
                  ? l10n.tripsUnfavorite
                  : l10n.tripsFavorite,
              icon: Icon(
                d.trip.favorite
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                color: d.trip.favorite ? AppColors.amber : null,
              ),
              onPressed: () => _repo.setFavorite(d.trip.id, !d.trip.favorite),
            ),
            PopupMenuButton<String>(
              key: _menuKey,
              tooltip: MaterialLocalizations.of(context).showMenuTooltip,
              onSelected: (v) => switch (v) {
                'rename' => _rename(d.trip),
                'gpx' => _share(d),
                'delete' => _delete(d.trip),
                _ => null,
              },
              itemBuilder: (_) => [
                PopupMenuItem(
                  value: 'rename',
                  child: ListTile(
                    leading: const Icon(Icons.edit_outlined),
                    title: Text(l10n.commonRename),
                  ),
                ),
                PopupMenuItem(
                  value: 'gpx',
                  enabled: d.points.length >= 2,
                  child: ListTile(
                    leading: const Icon(Icons.ios_share_rounded),
                    title: Text(l10n.tripsShareGpx),
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: ListTile(
                    leading: const Icon(
                      Icons.delete_outline_rounded,
                      color: AppColors.red,
                    ),
                    title: Text(
                      l10n.tripsDelete,
                      style: const TextStyle(color: AppColors.red),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
      body: detail.when(
        skipLoadingOnReload: true,
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()),
        error: (e, _) => EmptyState(
          icon: Icons.error_outline_rounded,
          title: l10n.commonError,
          message: e.toString(),
        ),
        data: (d) => d == null
            ? EmptyState(icon: Icons.route_rounded, title: l10n.tripsNotFound)
            : TripDetailView(
                detail: d,
                unit: unit,
                onOpenClip: (id) => context.push(Routes.clip(id)),
              ),
      ),
    );
  }
}

/// Provider-free trip detail body (also used by the render harness).
class TripDetailView extends StatelessWidget {
  const TripDetailView({
    super.key,
    required this.detail,
    required this.unit,
    required this.onOpenClip,
    this.useNativeMap,
  });

  final TripDetail detail;
  final SpeedUnit unit;
  final ValueChanged<String> onOpenClip;

  /// Defaults to true on iOS (MapKit platform view), else the track painter.
  final bool? useNativeMap;

  @override
  Widget build(BuildContext context) {
    final native =
        useNativeMap ??
        (defaultTargetPlatform == TargetPlatform.iOS && !kIsWeb);
    return LayoutBuilder(
      builder: (context, c) {
        final wide = c.maxWidth > c.maxHeight && c.maxWidth >= 640;
        final map = _TripMap(detail: detail, native: native);
        final info = _TripInfo(
          detail: detail,
          unit: unit,
          onOpenClip: onOpenClip,
        );
        if (wide) {
          return SafeArea(
            top: false,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 8, 16),
                    child: map,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: ListView(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 16, 24),
                    children: [info],
                  ),
                ),
              ],
            ),
          );
        }
        return SafeArea(
          top: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                children: [
                  SizedBox(
                    height: c.maxHeight * .38 < 220 ? 220 : c.maxHeight * .38,
                    child: map,
                  ),
                  const SizedBox(height: 16),
                  info,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TripMap extends StatefulWidget {
  const _TripMap({required this.detail, required this.native});
  final TripDetail detail;
  final bool native;

  @override
  State<_TripMap> createState() => _TripMapState();
}

class _TripMapState extends State<_TripMap> {
  MapViewController? _map;

  @override
  void dispose() {
    _map?.dispose();
    super.dispose();
  }

  Future<void> _onCreated(int id) async {
    final m = _map = MapViewController(id);
    final pts = widget.detail.points;
    if (pts.length < 2) return;
    final poly = Float64List(pts.length * 2);
    for (var i = 0; i < pts.length; i++) {
      poly[i * 2] = pts[i].lat;
      poly[i * 2 + 1] = pts[i].lon;
    }
    try {
      await m.setRoute(
        poly,
        lat: pts.last.lat,
        lon: pts.last.lon,
        name: widget.detail.trip.endPlace ?? '',
      );
      await m.setCameraMode('overview');
    } catch (_) {
      // Map is decorative here; the stats remain available.
    }
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.detail;
    final markers = [
      for (final e in d.events)
        if (e.lat != null && e.lon != null && _markerColor(e.kind) != null)
          (e.lat!, e.lon!, _markerColor(e.kind)!),
    ];
    final track = CustomPaint(
      painter: TrackShapePainter(
        points: [for (final p in d.points) (p.lat, p.lon)],
        markers: markers,
        strokeWidth: 3.5,
        padding: 28,
        topInset: 24,
        grid: true,
      ),
      child: const SizedBox.expand(),
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (widget.native)
              UiKitView(
                viewType: 'corvista/map',
                creationParams: const {
                  'pitch': 0,
                  'showsBuildings': false,
                  'elevation': 'flat',
                  'dark': true,
                  'followUser': false,
                  'showsTraffic': false,
                },
                creationParamsCodec: const StandardMessageCodec(),
                onPlatformViewCreated: _onCreated,
              )
            else ...[
              track,
              PositionedDirectional(
                top: 12,
                start: 12,
                child: _MapChip(label: context.l10n.tripsTrackPreview),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

Color? _markerColor(String kind) => switch (kind) {
  TripEventKind.incident => AppColors.amber,
  TripEventKind.emergency => AppColors.red,
  _ => null,
};

class _MapChip extends StatelessWidget {
  const _MapChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: AppColors.glass,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.glassBorder),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.route_rounded, size: 14, color: AppColors.cyan),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

class _TripInfo extends StatelessWidget {
  const _TripInfo({
    required this.detail,
    required this.unit,
    required this.onOpenClip,
  });

  final TripDetail detail;
  final SpeedUnit unit;
  final ValueChanged<String> onOpenClip;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final t = detail.trip;
    final cards = [
      TripStatCard(
        icon: Icons.straighten_rounded,
        label: l10n.tripsStatDistance,
        value: Fmt.routeDistance(context, t.distanceM, unit),
      ),
      TripStatCard(
        icon: Icons.schedule_rounded,
        label: l10n.tripsStatDuration,
        value: tripDuration(context, t.duration),
      ),
      TripStatCard(
        icon: Icons.timelapse_rounded,
        label: l10n.tripsStatMoving,
        compact: true,
        value: tripDuration(context, Duration(seconds: t.movingTimeS.round())),
        accent: AppColors.green,
      ),
      TripStatCard(
        icon: Icons.speed_rounded,
        label: l10n.tripsStatAvgSpeed,
        compact: true,
        value: tripSpeed(context, t.avgSpeedMs, unit),
        accent: AppColors.blue,
      ),
      TripStatCard(
        icon: Icons.bolt_rounded,
        label: l10n.tripsStatMaxSpeed,
        compact: true,
        value: tripSpeed(context, t.maxSpeedMs, unit),
        accent: AppColors.amber,
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          Fmt.date(context, t.startedAt),
          style: theme.textTheme.labelLarge?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          l10n.tripsTimeRange(
            Fmt.time(context, t.startedAt),
            Fmt.time(context, t.endedAt ?? t.startedAt),
          ),
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            fontFeatures: tabular,
          ),
        ),
        if (t.startPlace != null && t.endPlace != null)
          Text(
            l10n.tripsPlaceRange(t.startPlace!, t.endPlace!),
            style: theme.textTheme.bodyMedium,
          ),
        const SizedBox(height: 14),
        // Primary stats (2 wide) above secondary stats (3 narrower).
        LayoutBuilder(
          builder: (context, c) {
            const gap = 10.0;
            final w2 = (c.maxWidth - gap) / 2;
            final w3 = (c.maxWidth - gap * 2) / 3;
            return Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: w2, child: cards[0]),
                    const SizedBox(width: gap),
                    SizedBox(width: w2, child: cards[1]),
                  ],
                ),
                const SizedBox(height: gap),
                Row(
                  children: [
                    for (var i = 2; i < cards.length; i++) ...[
                      if (i > 2) const SizedBox(width: gap),
                      SizedBox(width: w3, child: cards[i]),
                    ],
                  ],
                ),
              ],
            );
          },
        ),
        _SectionTitle(l10n.tripsDetections),
        _Detections(counts: t.detectionCounts),
        _SectionTitle(l10n.tripsTimeline),
        _Timeline(detail: detail, onOpenClip: onOpenClip),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(4, 24, 4, 10),
    child: Semantics(
      header: true,
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall
            ?.copyWith(color: AppColors.textSecondary, letterSpacing: .8),
      ),
    ),
  );
}

class _Detections extends StatelessWidget {
  const _Detections({required this.counts});
  final Map<String, int> counts;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final entries = [
      for (final c in ObjectClass.values)
        if ((counts[c.name] ?? 0) > 0) (c, counts[c.name]!),
    ]..sort((a, b) => b.$2.compareTo(a.$2));
    if (entries.isEmpty) {
      return Text(
        l10n.tripsNoDetections,
        style: Theme.of(context).textTheme.bodyMedium
            ?.copyWith(color: AppColors.textSecondary),
      );
    }
    final max = entries.first.$2;
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          for (final (cls, n) in entries)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Semantics(
                label: '${l10n.objectClass(cls)}: $n',
                excludeSemantics: true,
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: cls.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 110,
                      child: Text(
                        l10n.objectClass(cls),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: n / max,
                          minHeight: 6,
                          color: cls.color,
                          backgroundColor: AppColors.elevated,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 44,
                      child: Text(
                        Fmt.number(context, n),
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFeatures: tabular,
                        ),
                      ),
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

class _Timeline extends StatelessWidget {
  const _Timeline({required this.detail, required this.onOpenClip});
  final TripDetail detail;
  final ValueChanged<String> onOpenClip;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final lang = Localizations.localeOf(context).languageCode;
    final t = detail.trip;
    final items =
        <
          ({
            DateTime at,
            IconData icon,
            Color color,
            String title,
            String? subtitle,
            String? clipId,
          })
        >[
          (
            at: t.startedAt,
            icon: Icons.trip_origin_rounded,
            color: AppColors.green,
            title: l10n.tripsEventStart,
            subtitle: t.startPlace,
            clipId: null,
          ),
          for (final e in detail.events)
            switch (e.kind) {
              TripEventKind.incident => (
                at: e.time,
                icon: Icons.videocam_rounded,
                color: AppColors.amber,
                title: l10n.tripsEventIncident,
                subtitle: null,
                clipId: e.refId,
              ),
              TripEventKind.recording => (
                at: e.time,
                icon: Icons.fiber_manual_record_rounded,
                color: AppColors.red,
                title: l10n.tripsEventRecording,
                subtitle: e.label.isEmpty ? null : e.label,
                clipId: e.refId,
              ),
              TripEventKind.emergency => (
                at: e.time,
                icon: Icons.emergency_rounded,
                color: AppColors.red,
                title: l10n.tripsEventEmergency,
                subtitle: null,
                clipId: null,
              ),
              TripEventKind.alert => (
                at: e.time,
                icon: Icons.record_voice_over_rounded,
                color: AppColors.cyan,
                title: l10n.tripsEventAlert,
                subtitle: _alertText(e.label, lang),
                clipId: null,
              ),
              TripEventKind.navStart => (
                at: e.time,
                icon: Icons.navigation_rounded,
                color: AppColors.blue,
                title: l10n.tripsEventNavStart,
                subtitle: e.label.isEmpty ? null : e.label,
                clipId: null,
              ),
              TripEventKind.navArrive => (
                at: e.time,
                icon: Icons.flag_rounded,
                color: AppColors.green,
                title: l10n.tripsEventArrive,
                subtitle: e.label.isEmpty ? null : e.label,
                clipId: null,
              ),
              _ => (
                at: e.time,
                icon: Icons.alt_route_rounded,
                color: AppColors.blue,
                title: l10n.tripsEventReroute,
                subtitle: null,
                clipId: null,
              ),
            },
          if (t.endedAt != null)
            (
              at: t.endedAt!,
              icon: Icons.sports_score_rounded,
              color: AppColors.textPrimary,
              title: l10n.tripsEventEnd,
              subtitle: t.endPlace,
              clipId: null,
            ),
        ];
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++)
            _TimelineRow(
              time: Fmt.time(context, items[i].at),
              icon: items[i].icon,
              color: items[i].color,
              title: items[i].title,
              subtitle: items[i].subtitle,
              first: i == 0,
              last: i == items.length - 1,
              onTap: items[i].clipId == null
                  ? null
                  : () => onOpenClip(items[i].clipId!),
              hint: items[i].clipId == null ? null : l10n.tripsOpenClip,
            ),
        ],
      ),
    );
  }

  static String _alertText(String label, String lang) {
    final kind = AlertKind.values.where((k) => k.name == label).firstOrNull;
    return kind == null ? label : AlertPhrases.phrase(kind, lang);
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({
    required this.time,
    required this.icon,
    required this.color,
    required this.title,
    required this.first,
    required this.last,
    this.subtitle,
    this.onTap,
    this.hint,
  });

  final String time;
  final IconData icon;
  final Color color;
  final String title;
  final String? subtitle;
  final bool first, last;
  final VoidCallback? onTap;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      button: onTap != null,
      hint: hint,
      child: InkWell(
        onTap: onTap,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 64,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 14, top: 14),
                  child: Text(
                    time,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      fontFeatures: tabular,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 36,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: first ? 22 : 0,
                      bottom: last ? null : 0,
                      height: last ? 22 : null,
                      child: Container(width: 2, color: AppColors.border),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: .15),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: color.withValues(alpha: .6),
                          ),
                        ),
                        child: Icon(icon, size: 14, color: color),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (onTap != null)
                const Padding(
                  padding: EdgeInsetsDirectional.only(end: 8),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.textSecondary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
