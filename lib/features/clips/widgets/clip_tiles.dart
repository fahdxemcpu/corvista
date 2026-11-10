import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:corvista/app/providers.dart';
import 'package:corvista/core/theme/app_colors.dart';
import 'package:corvista/core/theme/app_theme.dart';
import 'package:corvista/core/widgets/format.dart';
import 'package:corvista/l10n/l10n.dart';

/// Display helpers shared by gallery tiles and the player.
extension ClipDisplay on IncidentClip {
  /// "1080p" / "720p" from the shorter side of the upright video.
  String get resolutionLabel {
    final short = math.min(width, height);
    if (short <= 0) return '—';
    if (short >= 1000) return '1080p';
    if (short >= 700) return '720p';
    return '${short}p';
  }

  bool get isFullHd => math.min(width, height) >= 1000;

  bool get hasLocation => lat != null && lon != null;

  ClipKind get clipKind => ClipKind.of(this);

  String displayTitle(BuildContext context) => title.trim().isNotEmpty
      ? title.trim()
      : context.l10n.clipsUntitled(Fmt.dateTime(context, createdAt));

  String locationLabel() =>
      '${lat!.toStringAsFixed(4)}, ${lon!.toStringAsFixed(4)}';
}

extension ClipKindStyle on ClipKind {
  String label(BuildContext context) {
    final l10n = context.l10n;
    return switch (this) {
      ClipKind.manual => l10n.clipsKindRecording,
      ClipKind.incident => l10n.clipsKindIncident,
      ClipKind.emergency => l10n.clipsKindEmergency,
      ClipKind.test => l10n.clipsKindTest,
    };
  }

  Color get color => switch (this) {
    ClipKind.manual => AppColors.blue,
    ClipKind.incident => AppColors.cyan,
    ClipKind.emergency => AppColors.red,
    ClipKind.test => AppColors.amber,
  };

  IconData get icon => switch (this) {
    ClipKind.manual => Icons.fiber_manual_record_rounded,
    ClipKind.incident => Icons.bookmark_rounded,
    ClipKind.emergency => Icons.car_crash_rounded,
    ClipKind.test => Icons.science_outlined,
  };
}

/// Thumbnail with graceful fallback (missing / undecodable image).
class ClipThumbnail extends StatelessWidget {
  const ClipThumbnail({super.key, required this.clip, this.cacheWidth = 480});

  final IncidentClip clip;
  final int cacheWidth;

  @override
  Widget build(BuildContext context) {
    final placeholder = ColoredBox(
      color: AppColors.elevated,
      child: Center(
        child: Icon(
          clip.missingFile ? Icons.videocam_off_outlined : Icons.movie_outlined,
          color: AppColors.textSecondary,
          size: 28,
        ),
      ),
    );
    final t = clip.thumbnailPath;
    if (t == null || clip.missingFile) return placeholder;
    return Image.file(
      File(t),
      fit: BoxFit.cover,
      cacheWidth: cacheWidth,
      gaplessPlayback: true,
      errorBuilder: (_, _, _) => placeholder,
    );
  }
}

/// Small dark pill drawn over thumbnails.
class ThumbBadge extends StatelessWidget {
  const ThumbBadge({
    super.key,
    required this.child,
    this.color,
    this.textColor,
  });

  final Widget child;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsetsDirectional.symmetric(
      horizontal: 6,
      vertical: 2.5,
    ),
    decoration: BoxDecoration(
      color: color ?? Colors.black.withValues(alpha: .62),
      borderRadius: BorderRadius.circular(6),
    ),
    child: DefaultTextStyle.merge(
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: textColor ?? Colors.white,
        fontFeatures: tabular,
      ),
      child: IconTheme.merge(
        data: IconThemeData(size: 12, color: textColor ?? Colors.white),
        child: child,
      ),
    ),
  );
}

/// Kind pill: colored dot + label on a dark glass background.
class ClipKindBadge extends StatelessWidget {
  const ClipKindBadge({super.key, required this.kind});

  final ClipKind kind;

  @override
  Widget build(BuildContext context) => ThumbBadge(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(kind.icon, color: kind.color, size: 11),
        const SizedBox(width: 4),
        Text(kind.label(context)),
      ],
    ),
  );
}

class _SelectionMark extends StatelessWidget {
  const _SelectionMark({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: const Duration(milliseconds: 140),
    width: 26,
    height: 26,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: selected ? AppColors.cyan : Colors.black.withValues(alpha: .35),
      border: Border.all(color: Colors.white, width: 1.6),
    ),
    child: selected
        ? const Icon(Icons.check_rounded, size: 17, color: AppColors.background)
        : null,
  );
}

/// Overlay badges on a thumbnail: kind, favorite/selection, resolution,
/// duration, missing file.
class _ThumbOverlay extends StatelessWidget {
  const _ThumbOverlay({
    required this.clip,
    required this.selecting,
    required this.selected,
  });

  final IncidentClip clip;
  final bool selecting;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(child: ClipThumbnail(clip: clip)),
        if (selected) ColoredBox(color: AppColors.cyan.withValues(alpha: .18)),
        PositionedDirectional(
          top: 6,
          start: 6,
          child: ClipKindBadge(kind: clip.clipKind),
        ),
        PositionedDirectional(
          top: 6,
          end: 6,
          child: selecting
              ? _SelectionMark(selected: selected)
              : clip.favorite
              ? Icon(
                  Icons.star_rounded,
                  color: AppColors.amber,
                  size: 22,
                  semanticLabel: l10n.clipsFavorite,
                  shadows: const [Shadow(blurRadius: 6)],
                )
              : const SizedBox.shrink(),
        ),
        PositionedDirectional(
          bottom: 6,
          start: 6,
          child: clip.missingFile
              ? ThumbBadge(
                  color: AppColors.amber.withValues(alpha: .92),
                  textColor: AppColors.background,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.warning_amber_rounded),
                      const SizedBox(width: 3),
                      Text(l10n.clipsMissingFile),
                    ],
                  ),
                )
              : ThumbBadge(
                  color: clip.isFullHd
                      ? AppColors.cyan.withValues(alpha: .9)
                      : null,
                  textColor: clip.isFullHd ? AppColors.background : null,
                  child: Text(clip.resolutionLabel),
                ),
        ),
        PositionedDirectional(
          bottom: 6,
          end: 6,
          child: ThumbBadge(
            child: Text(Fmt.clock(Duration(milliseconds: clip.durationMs))),
          ),
        ),
      ],
    );
  }
}

/// Size · audio · location icons row.
class _MetaIcons extends StatelessWidget {
  const _MetaIcons({required this.clip});

  final IncidentClip clip;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final style = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
      fontFeatures: tabular,
    );
    final iconColor = Theme.of(context).colorScheme.onSurfaceVariant;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(Fmt.bytes(context, clip.sizeBytes), style: style),
        if (clip.hasAudio) ...[
          const SizedBox(width: 6),
          Icon(
            Icons.mic_rounded,
            size: 14,
            color: iconColor,
            semanticLabel: l10n.clipsAudio,
          ),
        ],
        if (clip.hasLocation) ...[
          const SizedBox(width: 6),
          Icon(
            Icons.place_outlined,
            size: 14,
            color: iconColor,
            semanticLabel: l10n.clipsLocation,
          ),
        ],
      ],
    );
  }
}

/// Link to the trip a clip was recorded in.
class ClipTripChip extends StatelessWidget {
  const ClipTripChip({super.key, required this.trip, required this.onTap});

  final Trip trip;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Semantics(
      button: true,
      hint: l10n.clipsOpenTrip,
      excludeSemantics: false,
      child: Material(
        color: AppColors.blue.withValues(alpha: .14),
        shape: StadiumBorder(
          side: BorderSide(color: AppColors.blue.withValues(alpha: .4)),
        ),
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 30),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 10, 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.route_rounded,
                    size: 14,
                    color: AppColors.blue,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      l10n.clipsTripChip(Fmt.time(context, trip.startedAt)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                        fontFeatures: tabular,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Shared tile parameters.
abstract class _ClipTileBase extends StatelessWidget {
  const _ClipTileBase({
    super.key,
    required this.clip,
    required this.selecting,
    required this.selected,
    required this.onTap,
    required this.onLongPress,
    this.trip,
    this.onOpenTrip,
    this.timeOnly = false,
  });

  final IncidentClip clip;
  final bool selecting;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  /// Trip the clip was recorded in (shows a chip that opens it).
  final Trip? trip;
  final VoidCallback? onOpenTrip;

  /// Show only the time (the list is grouped under a date header).
  final bool timeOnly;

  String when(BuildContext context) => timeOnly
      ? Fmt.time(context, clip.createdAt)
      : Fmt.dateTime(context, clip.createdAt);
}

class ClipGridTile extends _ClipTileBase {
  const ClipGridTile({
    super.key,
    required super.clip,
    required super.selecting,
    required super.selected,
    required super.onTap,
    required super.onLongPress,
    super.trip,
    super.onOpenTrip,
    super.timeOnly,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = clip.displayTitle(context);
    final secondary = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
      fontFeatures: tabular,
    );
    return Semantics(
      button: true,
      selected: selecting ? selected : null,
      label: context.l10n.clipsOpenClip(title),
      excludeSemantics: false,
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: selected ? AppColors.cyan : theme.colorScheme.outline,
            width: selected ? 1.6 : .8,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 16 / 10,
                child: _ThumbOverlay(
                  clip: clip,
                  selecting: selecting,
                  selected: selected,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 8, 10, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              when(context),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: secondary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          _MetaIcons(clip: clip),
                        ],
                      ),
                      const Spacer(),
                      if (trip != null)
                        ClipTripChip(
                          trip: trip!,
                          onTap: selecting ? null : onOpenTrip,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClipListTile extends _ClipTileBase {
  const ClipListTile({
    super.key,
    required super.clip,
    required super.selecting,
    required super.selected,
    required super.onTap,
    required super.onLongPress,
    super.trip,
    super.onOpenTrip,
    super.timeOnly,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = clip.displayTitle(context);
    final secondary = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
      fontFeatures: tabular,
    );
    return Semantics(
      button: true,
      selected: selecting ? selected : null,
      label: context.l10n.clipsOpenClip(title),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Container(
          color: selected ? AppColors.cyan.withValues(alpha: .08) : null,
          padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 136,
                  height: 84,
                  child: _ThumbOverlay(
                    clip: clip,
                    selecting: selecting,
                    selected: selected,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(when(context), style: secondary),
                    if (clip.hasLocation) ...[
                      const SizedBox(height: 2),
                      Text(
                        clip.locationLabel(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: secondary,
                      ),
                    ],
                    const SizedBox(height: 4),
                    _MetaIcons(clip: clip),
                    if (trip != null) ...[
                      const SizedBox(height: 6),
                      ClipTripChip(
                        trip: trip!,
                        onTap: selecting ? null : onOpenTrip,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
