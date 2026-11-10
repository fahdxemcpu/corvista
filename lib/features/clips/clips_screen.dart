import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:corvista/app/providers.dart';
import 'package:corvista/app/router.dart';
import 'package:corvista/core/theme/app_colors.dart';
import 'package:corvista/core/theme/app_theme.dart';
import 'package:corvista/core/widgets/common.dart';
import 'package:corvista/core/widgets/format.dart';
import 'package:corvista/l10n/l10n.dart';

import 'clip_ui_actions.dart';
import 'widgets/clip_tiles.dart';
import 'widgets/storage_bar.dart';

/// Recordings library: every saved clip (Record button recordings, Save
/// Incident clips, emergency clips) with category filter, sort, date groups,
/// trip links, storage header and multi-select share / Photos / favorite /
/// delete. Everything is free: all saved clips are shown.
class ClipsScreen extends ConsumerStatefulWidget {
  const ClipsScreen({super.key});

  @override
  ConsumerState<ClipsScreen> createState() => _ClipsScreenState();
}

class _ClipsScreenState extends ConsumerState<ClipsScreen> {
  bool _grid = true;
  bool _selecting = false;
  final Set<String> _selected = {};
  ClipFilter _filter = ClipFilter.all;
  ClipSort _sort = ClipSort.newest;
  final _shareKey = GlobalKey();

  void _toggle(String id) => setState(() {
    if (!_selected.remove(id)) _selected.add(id);
  });

  void _exitSelection() => setState(() {
    _selecting = false;
    _selected.clear();
  });

  List<IncidentClip> _selectedClips(List<IncidentClip> visible) => [
    for (final c in visible)
      if (_selected.contains(c.id)) c,
  ];

  Future<void> _shareSelected(List<IncidentClip> clips) =>
      shareClips(context, clips, origin: shareOriginOf(_shareKey));

  Future<void> _photosSelected(List<IncidentClip> clips) async {
    final r = await saveClipsToPhotos(context, ref, clips);
    if (mounted && !r.denied && r.failed == 0) _exitSelection();
  }

  Future<void> _favoriteSelected(List<IncidentClip> clips) async {
    final l10n = context.l10n;
    final makeFavorite = clips.any((c) => !c.favorite);
    try {
      final repo = ref.read(clipsRepositoryProvider);
      for (final c in clips) {
        if (c.favorite != makeFavorite) {
          await repo.setFavorite(c.id, makeFavorite);
        }
      }
      if (!mounted) return;
      showSnack(
        context,
        makeFavorite
            ? l10n.clipsFavoritedMany(clips.length)
            : l10n.clipsUnfavoritedMany(clips.length),
      );
    } catch (e) {
      if (mounted) showSnack(context, l10n.commonErrorDetail(e.toString()));
    }
  }

  Future<void> _deleteSelected(List<IncidentClip> clips) async {
    if (await confirmAndDeleteClips(context, ref, clips) && mounted) {
      _exitSelection();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final clipsAsync = ref.watch(clipsProvider);
    final trips = ref.watch(tripsProvider).value ?? const <Trip>[];
    final library = clipsAsync.value ?? const <IncidentClip>[];
    final visible = filterAndSort(library, _filter, _sort);
    final groups = groupByDay(visible, _sort);
    // Drop selections that disappeared (deleted elsewhere / filtered out).
    _selected.removeWhere((id) => !visible.any((c) => c.id == id));
    final selectedClips = _selectedClips(visible);
    final allSelected =
        visible.isNotEmpty && _selected.length == visible.length;

    return PopScope(
      canPop: !_selecting,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && _selecting) _exitSelection();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _selecting
                ? l10n.clipsSelectedCount(_selected.length)
                : l10n.clipsTitle,
          ),
          leading: _selecting
              ? IconButton(
                  tooltip: l10n.commonCancel,
                  icon: const Icon(Icons.close_rounded),
                  onPressed: _exitSelection,
                )
              : null,
          actions: _selecting
              ? [
                  IconButton(
                    tooltip: allSelected
                        ? l10n.clipsDeselectAll
                        : l10n.clipsSelectAll,
                    icon: Icon(
                      allSelected
                          ? Icons.deselect_rounded
                          : Icons.select_all_rounded,
                    ),
                    onPressed: () => setState(() {
                      if (allSelected) {
                        _selected.clear();
                      } else {
                        _selected
                          ..clear()
                          ..addAll(visible.map((c) => c.id));
                      }
                    }),
                  ),
                ]
              : [
                  IconButton(
                    tooltip: l10n.tripsOpen,
                    icon: const Icon(Icons.route_rounded),
                    onPressed: () => context.push(Routes.trips),
                  ),
                  if (library.isNotEmpty) ...[
                    _SortButton(
                      sort: _sort,
                      onSelected: (s) => setState(() => _sort = s),
                    ),
                    IconButton(
                      tooltip: _grid ? l10n.clipsListView : l10n.clipsGridView,
                      icon: Icon(
                        _grid
                            ? Icons.view_list_rounded
                            : Icons.grid_view_rounded,
                      ),
                      onPressed: () => setState(() => _grid = !_grid),
                    ),
                    if (visible.isNotEmpty)
                      TextButton(
                        onPressed: () => setState(() => _selecting = true),
                        child: Text(l10n.clipsSelect),
                      ),
                  ],
                ],
        ),
        bottomNavigationBar: _selecting
            ? _SelectionBar(
                clips: selectedClips,
                shareKey: _shareKey,
                onShare: () => _shareSelected(selectedClips),
                onPhotos: () => _photosSelected(selectedClips),
                onFavorite: () => _favoriteSelected(selectedClips),
                onDelete: () => _deleteSelected(selectedClips),
              )
            : null,
        body: clipsAsync.when(
          skipLoadingOnReload: true,
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
          error: (e, _) => EmptyState(
            icon: Icons.error_outline_rounded,
            title: l10n.clipsLoadError,
            message: e.toString(),
            actionLabel: l10n.commonRetry,
            onAction: () => ref.invalidate(clipsProvider),
          ),
          data: (_) {
            if (library.isEmpty) {
              return EmptyState(
                icon: Icons.video_library_outlined,
                title: l10n.clipsEmptyTitle,
                message: l10n.clipsEmptyBody,
              );
            }
            return RefreshIndicator.adaptive(
              onRefresh: () async {
                await ref.read(clipsRepositoryProvider).reconcile();
                ref.invalidate(storageInfoProvider);
              },
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: StorageBar()),
                  PinnedHeaderSliver(
                    child: _FilterBar(
                      filter: _filter,
                      library: library,
                      onChanged: (f) => setState(() => _filter = f),
                    ),
                  ),
                  if (visible.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: EmptyState(
                        icon: _filter == ClipFilter.favorites
                            ? Icons.star_outline_rounded
                            : Icons.video_library_outlined,
                        title: _filter == ClipFilter.favorites
                            ? l10n.clipsFavoritesEmpty
                            : l10n.clipsFilterEmpty,
                      ),
                    )
                  else
                    for (final g in groups) ...[
                      if (g.day != null)
                        SliverToBoxAdapter(child: _DayHeader(group: g)),
                      if (_grid)
                        _gridSliver(g, trips)
                      else
                        SliverList.separated(
                          itemCount: g.clips.length,
                          separatorBuilder: (_, _) =>
                              const Divider(indent: 166, height: 1),
                          itemBuilder: (_, i) => _tile(
                            g.clips[i],
                            trips,
                            grid: false,
                            timeOnly: g.day != null,
                          ),
                        ),
                    ],
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _gridSliver(ClipDayGroup g, List<Trip> trips) {
    const maxExtent = 280.0, spacing = 12.0;
    return SliverPadding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
      sliver: SliverLayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.crossAxisExtent;
          final columns = (w / (maxExtent + spacing)).ceil().clamp(1, 12);
          final itemW = (w - spacing * (columns - 1)) / columns;
          final ts = MediaQuery.textScalerOf(context).scale(1);
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
              mainAxisExtent: itemW * 10 / 16 + 66 * ts + 26,
            ),
            itemCount: g.clips.length,
            itemBuilder: (_, i) =>
                _tile(g.clips[i], trips, grid: true, timeOnly: g.day != null),
          );
        },
      ),
    );
  }

  Widget _tile(
    IncidentClip clip,
    List<Trip> trips, {
    required bool grid,
    required bool timeOnly,
  }) {
    void onTap() =>
        _selecting ? _toggle(clip.id) : context.push(Routes.clip(clip.id));
    void onLongPress() => setState(() {
      _selecting = true;
      _selected.add(clip.id);
    });
    final trip = tripForClip(clip, trips);
    void openTrip() => context.push(Routes.trip(trip!.id));
    final selected = _selected.contains(clip.id);
    return grid
        ? ClipGridTile(
            key: ValueKey(clip.id),
            clip: clip,
            selecting: _selecting,
            selected: selected,
            onTap: onTap,
            onLongPress: onLongPress,
            trip: trip,
            onOpenTrip: trip == null ? null : openTrip,
            timeOnly: timeOnly,
          )
        : ClipListTile(
            key: ValueKey(clip.id),
            clip: clip,
            selecting: _selecting,
            selected: selected,
            onTap: onTap,
            onLongPress: onLongPress,
            trip: trip,
            onOpenTrip: trip == null ? null : openTrip,
            timeOnly: timeOnly,
          );
  }
}

class _SortButton extends StatelessWidget {
  const _SortButton({required this.sort, required this.onSelected});

  final ClipSort sort;
  final ValueChanged<ClipSort> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    String label(ClipSort s) => switch (s) {
      ClipSort.newest => l10n.clipsSortNewest,
      ClipSort.oldest => l10n.clipsSortOldest,
      ClipSort.longest => l10n.clipsSortLongest,
      ClipSort.largest => l10n.clipsSortLargest,
    };
    return PopupMenuButton<ClipSort>(
      tooltip: '${l10n.clipsSort}: ${label(sort)}',
      icon: const Icon(Icons.sort_rounded),
      initialValue: sort,
      onSelected: onSelected,
      itemBuilder: (_) => [
        for (final s in ClipSort.values)
          CheckedPopupMenuItem(
            value: s,
            checked: s == sort,
            child: Text(label(s)),
          ),
      ],
    );
  }
}

/// Segmented category filter (scrolls horizontally on narrow screens).
class _FilterBar extends StatelessWidget {
  const _FilterBar({
    required this.filter,
    required this.library,
    required this.onChanged,
  });

  final ClipFilter filter;
  final List<IncidentClip> library;
  final ValueChanged<ClipFilter> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    String label(ClipFilter f) => switch (f) {
      ClipFilter.all => l10n.clipsFilterAll,
      ClipFilter.recordings => l10n.clipsFilterRecordings,
      ClipFilter.incidents => l10n.clipsFilterIncidents,
      ClipFilter.emergency => l10n.clipsFilterEmergency,
      ClipFilter.favorites => l10n.clipsFilterFavorites,
    };
    IconData? icon(ClipFilter f) => switch (f) {
      ClipFilter.all => null,
      ClipFilter.recordings => Icons.fiber_manual_record_rounded,
      ClipFilter.incidents => Icons.bookmark_rounded,
      ClipFilter.emergency => Icons.car_crash_rounded,
      ClipFilter.favorites => Icons.star_rounded,
    };
    Color accent(ClipFilter f) => switch (f) {
      ClipFilter.recordings => AppColors.blue,
      ClipFilter.emergency => AppColors.red,
      ClipFilter.favorites => AppColors.amber,
      _ => AppColors.cyan,
    };
    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: Semantics(
        container: true,
        label: l10n.clipsFilterLabel,
        child: SizedBox(
          height: 56,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
            children: [
              for (final f in ClipFilter.values) ...[
                _FilterPill(
                  key: ValueKey('clips-filter-${f.name}'),
                  label: label(f),
                  count: library.where(f.matches).length,
                  icon: icon(f),
                  accent: accent(f),
                  selected: f == filter,
                  onTap: () => onChanged(f),
                ),
                const SizedBox(width: 8),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterPill extends StatelessWidget {
  const _FilterPill({
    super.key,
    required this.label,
    required this.count,
    required this.icon,
    required this.accent,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final int count;
  final IconData? icon;
  final Color accent;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fg = selected ? AppColors.background : theme.colorScheme.onSurface;
    return Semantics(
      selected: selected,
      button: true,
      inMutuallyExclusiveGroup: true,
      child: Material(
        color: selected ? accent : theme.colorScheme.surfaceContainerHigh,
        shape: StadiumBorder(
          side: BorderSide(
            color: selected ? accent : theme.colorScheme.outline,
            width: .8,
          ),
        ),
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 14),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 14, color: selected ? fg : accent),
                  const SizedBox(width: 6),
                ],
                Text(
                  label,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: fg,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '$count',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: fg.withValues(alpha: .7),
                    fontFeatures: tabular,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DayHeader extends StatelessWidget {
  const _DayHeader({required this.group});

  final ClipDayGroup group;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final day = group.day!;
    final label = day == today
        ? l10n.clipsToday
        : day == today.subtract(const Duration(days: 1))
        ? l10n.clipsYesterday
        : Fmt.date(context, day);
    return Semantics(
      header: true,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 14, 20, 6),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: .2,
                ),
              ),
            ),
            Text(
              l10n.clipsGroupSummary(
                group.clips.length,
                Fmt.bytes(context, group.totalBytes),
              ),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontFeatures: tabular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Bottom bar in selection mode: summary + Share / Photos / Favorite / Delete.
class _SelectionBar extends StatelessWidget {
  const _SelectionBar({
    required this.clips,
    required this.shareKey,
    required this.onShare,
    required this.onPhotos,
    required this.onFavorite,
    required this.onDelete,
  });

  final List<IncidentClip> clips;
  final GlobalKey shareKey;
  final VoidCallback onShare, onPhotos, onFavorite, onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final enabled = clips.isNotEmpty;
    final allFavorite = enabled && clips.every((c) => c.favorite);
    final size = clips.fold<int>(0, (a, c) => a + c.sizeBytes);
    return Material(
      color: theme.colorScheme.surfaceContainer,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(height: 1),
            if (enabled)
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 8),
                child: Text(
                  l10n.clipsSelectionSummary(
                    clips.length,
                    Fmt.bytes(context, size),
                  ),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontFeatures: tabular,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 6),
              child: Row(
                children: [
                  _BarAction(
                    key: shareKey,
                    icon: Icons.ios_share_rounded,
                    label: l10n.commonShare,
                    onTap: enabled ? onShare : null,
                  ),
                  _BarAction(
                    icon: Icons.photo_library_outlined,
                    label: l10n.clipsSaveToPhotos,
                    onTap: enabled ? onPhotos : null,
                  ),
                  _BarAction(
                    icon: allFavorite
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    label: allFavorite
                        ? l10n.clipsUnfavorite
                        : l10n.clipsFavorite,
                    color: allFavorite ? AppColors.amber : null,
                    onTap: enabled ? onFavorite : null,
                  ),
                  _BarAction(
                    icon: Icons.delete_outline_rounded,
                    label: l10n.commonDelete,
                    color: AppColors.red,
                    onTap: enabled ? onDelete : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BarAction extends StatelessWidget {
  const _BarAction({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final c = onTap == null
        ? theme.disabledColor
        : color ?? theme.colorScheme.onSurface;
    return Expanded(
      child: Semantics(
        button: true,
        enabled: onTap != null,
        label: label,
        excludeSemantics: true,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 52),
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: c, size: 22),
                  const SizedBox(height: 3),
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelSmall?.copyWith(color: c),
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
