import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/format.dart';
import '../../../domain/models/app_settings.dart';
import '../../../domain/repositories/trip_repository.dart';
import '../../../l10n/l10n.dart';

/// Localized trip duration ("1 h 05 min" / "42 min").
String tripDuration(BuildContext context, Duration d) {
  final l10n = context.l10n;
  final mins = (d.inSeconds / 60).round();
  if (mins >= 60) return l10n.tripsDurationHM(mins ~/ 60, mins % 60);
  return l10n.tripsDurationM(math.max(mins, d.inSeconds > 0 ? 1 : 0));
}

String tripSpeed(BuildContext context, double mps, SpeedUnit unit) =>
    '${Fmt.speed(mps, unit) ?? 0} ${context.l10n.speedUnit(unit)}';

/// Title shown for a trip: user title, else "start → end" places, else the
/// time range.
String tripTitle(BuildContext context, Trip t) {
  if (t.title.trim().isNotEmpty) return t.title.trim();
  final l10n = context.l10n;
  if (t.startPlace != null && t.endPlace != null) {
    return l10n.tripsPlaceRange(t.startPlace!, t.endPlace!);
  }
  return l10n.tripsTimeRange(
    Fmt.time(context, t.startedAt),
    Fmt.time(context, t.endedAt ?? t.startedAt),
  );
}

/// Draws a GPS polyline scaled to fit (equirectangular, aspect preserved,
/// no basemap). Start = green dot, end = chequered-flag style ring, optional
/// event markers.
class TrackShapePainter extends CustomPainter {
  TrackShapePainter({
    required this.points,
    this.markers = const [],
    this.color = AppColors.cyan,
    this.strokeWidth = 2.5,
    this.padding = 8,
    this.topInset = 0,
    this.grid = false,
  });

  /// (lat, lon) pairs.
  final List<(double, double)> points;

  /// (lat, lon, color) event markers.
  final List<(double, double, Color)> markers;
  final Color color;
  final double strokeWidth;
  final double padding;

  /// Extra space reserved at the top (e.g. for an overlaid chip).
  final double topInset;
  final bool grid;

  @override
  void paint(Canvas canvas, Size size) {
    if (grid) _paintGrid(canvas, size);
    if (points.length < 2) {
      final p = Paint()..color = color.withValues(alpha: .5);
      canvas.drawCircle(size.center(Offset.zero), 3, p);
      return;
    }
    var minLat = double.infinity, maxLat = -double.infinity;
    var minLon = double.infinity, maxLon = -double.infinity;
    for (final (la, lo) in points) {
      minLat = math.min(minLat, la);
      maxLat = math.max(maxLat, la);
      minLon = math.min(minLon, lo);
      maxLon = math.max(maxLon, lo);
    }
    final k = math.cos((minLat + maxLat) / 2 * math.pi / 180);
    final w = math.max((maxLon - minLon) * k, 1e-9);
    final h = math.max(maxLat - minLat, 1e-9);
    final avail = Size(
      size.width - 2 * padding,
      size.height - 2 * padding - topInset,
    );
    final scale = math.min(avail.width / w, avail.height / h);
    final ox = padding + (avail.width - w * scale) / 2;
    final oy = padding + topInset + (avail.height - h * scale) / 2;
    Offset map(double la, double lo) =>
        Offset(ox + (lo - minLon) * k * scale, oy + (maxLat - la) * scale);

    final path = Path();
    for (var i = 0; i < points.length; i++) {
      final o = map(points[i].$1, points[i].$2);
      i == 0 ? path.moveTo(o.dx, o.dy) : path.lineTo(o.dx, o.dy);
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = color.withValues(alpha: .22)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth * 3
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
    for (final (la, lo, c) in markers) {
      final o = map(la, lo);
      canvas.drawCircle(
        o,
        strokeWidth * 2.4,
        Paint()..color = AppColors.background,
      );
      canvas.drawCircle(o, strokeWidth * 1.7, Paint()..color = c);
    }
    final start = map(points.first.$1, points.first.$2);
    final end = map(points.last.$1, points.last.$2);
    final r = math.max(3.0, strokeWidth * 1.6);
    canvas
      ..drawCircle(start, r + 1.5, Paint()..color = AppColors.background)
      ..drawCircle(start, r, Paint()..color = AppColors.green)
      ..drawCircle(end, r + 1.5, Paint()..color = AppColors.background)
      ..drawCircle(
        end,
        r,
        Paint()
          ..color = AppColors.textPrimary
          ..style = PaintingStyle.stroke
          ..strokeWidth = math.max(1.5, strokeWidth * .8),
      );
  }

  void _paintGrid(Canvas canvas, Size size) {
    final p = Paint()
      ..color = AppColors.border.withValues(alpha: .35)
      ..strokeWidth = 1;
    const step = 28.0;
    for (var x = step; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), p);
    }
    for (var y = step; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), p);
    }
  }

  @override
  bool shouldRepaint(TrackShapePainter old) =>
      old.points != points ||
      old.markers != markers ||
      old.color != color ||
      old.strokeWidth != strokeWidth;
}

/// Small rounded track-shape thumbnail.
class TrackThumbnail extends StatelessWidget {
  const TrackThumbnail({super.key, required this.points, this.size = 76});

  final List<(double, double)> points;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: AppColors.background,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: AppColors.border),
    ),
    child: CustomPaint(
      painter: TrackShapePainter(points: points, strokeWidth: 2, padding: 10),
    ),
  );
}

/// Icon + count pill (incidents / alerts / emergencies).
class TripBadge extends StatelessWidget {
  const TripBadge({
    super.key,
    required this.icon,
    required this.color,
    required this.label,
    this.semanticsLabel,
  });

  final IconData icon;
  final Color color;
  final String label;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) => Semantics(
    label: semanticsLabel,
    excludeSemantics: semanticsLabel != null,
    child: Container(
      padding: const EdgeInsetsDirectional.fromSTEB(6, 3, 8, 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              fontFeatures: tabular,
            ),
          ),
        ],
      ),
    ),
  );
}

/// Labelled stat value card.
class TripStatCard extends StatelessWidget {
  const TripStatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.accent = AppColors.cyan,
    this.compact = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color accent;

  /// Smaller value text for 3-up rows.
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      label: '$label: $value',
      excludeSemantics: true,
      child: Container(
        padding: EdgeInsetsDirectional.fromSTEB(
          compact ? 12 : 14,
          12,
          compact ? 10 : 14,
          14,
        ),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (compact)
                  Container(
                    width: 3,
                    height: 12,
                    decoration: BoxDecoration(
                      color: accent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  )
                else
                  Icon(icon, size: 16, color: accent),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    label.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppColors.textSecondary,
                      letterSpacing: .6,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                value,
                style:
                    (compact
                            ? theme.textTheme.titleLarge
                            : theme.textTheme.headlineSmall)
                        ?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                          fontFeatures: tabular,
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
