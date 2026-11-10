import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/providers.dart';
import '../../../app/router.dart';
import '../../../core/animations/motion.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/glass.dart';
import '../../../domain/models/app_settings.dart';
import '../../../domain/models/object_class.dart';
import '../../../l10n/l10n.dart';
import '../../detection/widgets/camera_layer.dart';
import 'mask_layer.dart';

export 'mask_layer.dart' show MaskLayer, PerceptionStatus;

/// Perception view: full-bleed camera + smoothed segmentation masks + optional
/// boxes. All controls live in a slim strip under the HUD so the lower half of
/// the frame (the road) stays clear; the shell's bottom controls are respected
/// through [contentPadding].
class PerceptionView extends ConsumerStatefulWidget {
  const PerceptionView({
    super.key,
    required this.contentPadding,
    required this.look,
  });

  final EdgeInsets contentPadding;
  final OverlayLook look;

  /// How long the legend stays open on its own.
  static const legendAutoHide = Duration(seconds: 6);

  /// How long the opacity popover stays open after the last touch.
  static const opacityAutoHide = Duration(seconds: 3);

  @override
  ConsumerState<PerceptionView> createState() => _PerceptionViewState();
}

class _PerceptionViewState extends ConsumerState<PerceptionView> {
  final _status = ValueNotifier(const PerceptionStatus());
  bool _legendOpen = false;
  bool _legendShownOnce = false;
  bool _opacityOpen = false;
  double? _dragOpacity;
  Timer? _legendTimer;
  Timer? _opacityTimer;

  @override
  void initState() {
    super.initState();
    _status.addListener(_onStatus);
  }

  @override
  void dispose() {
    _legendTimer?.cancel();
    _opacityTimer?.cancel();
    _status
      ..removeListener(_onStatus)
      ..dispose();
    super.dispose();
  }

  /// Show the legend (with the road disclaimer) once when masks first appear
  /// — in portrait only, where it sits over the sky; in landscape the strip
  /// above the road is too short, so it opens on tap only.
  void _onStatus() {
    if (!_legendShownOnce && _status.value.hasMap && mounted) {
      _legendShownOnce = true;
      if (MediaQuery.orientationOf(context) == Orientation.portrait) {
        _setLegend(true);
      }
    }
  }

  void _setLegend(bool open) {
    _legendTimer?.cancel();
    if (open) {
      _legendTimer = Timer(PerceptionView.legendAutoHide, () {
        if (mounted) setState(() => _legendOpen = false);
      });
    }
    setState(() => _legendOpen = open);
  }

  void _setOpacityOpen(bool open) {
    _opacityTimer?.cancel();
    if (open) {
      if (_legendOpen) {
        _legendTimer?.cancel();
        _legendOpen = false;
      }
      _opacityTimer = Timer(PerceptionView.opacityAutoHide, () {
        if (mounted) setState(() => _opacityOpen = false);
      });
    }
    setState(() => _opacityOpen = open);
  }

  void _select(SegmentationMode m) {
    unawaited(HapticFeedback.selectionClick());
    unawaited(
      ref
          .read(settingsProvider.notifier)
          .update((x) => x.copyWith(segmentationMode: m)),
    );
    if (!_masks(m) && _opacityOpen) _setOpacityOpen(false);
  }

  static bool _masks(SegmentationMode m) =>
      m == SegmentationMode.masks ||
      m == SegmentationMode.road ||
      m == SegmentationMode.combined;

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(settingsProvider);
    final ai = ref.watch(aiModelsProvider);
    final supportsSeg = ai.selected?.supportsSegmentation ?? false;
    final mode = s.segmentationMode;
    final showBoxes =
        mode == SegmentationMode.boxes || mode == SegmentationMode.combined;
    final showMasks = _masks(mode);
    final showObjects =
        mode == SegmentationMode.masks || mode == SegmentationMode.combined;
    final showRoad =
        mode == SegmentationMode.road || mode == SegmentationMode.combined;
    final opacity = _dragOpacity ?? s.segmentationOpacity;
    final pad = widget.contentPadding;
    final landscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    final anim = Motion.duration(
      context,
      Motion.fast,
      appReduceMotion: s.reduceMotion,
    );

    final pill = _ModePill(
      mode: mode,
      onSelect: _select,
      showOpacity: showMasks && supportsSeg,
      opacityOpen: _opacityOpen,
      onOpacity: () => _setOpacityOpen(!_opacityOpen),
    );

    final status = showMasks && (supportsSeg || ai.loading)
        ? ValueListenableBuilder<PerceptionStatus>(
            valueListenable: _status,
            builder: (context, st, _) => _StatusChip(
              status: st,
              loadingModel: ai.loading,
              supported: supportsSeg,
            ),
          )
        : null;

    final legendChip = showMasks && supportsSeg
        ? ValueListenableBuilder<PerceptionStatus>(
            valueListenable: _status,
            builder: (context, st, _) {
              final mask = _visibleMask(st.presentMask, showObjects, showRoad);
              if (mask == 0) return const SizedBox.shrink();
              return _LegendChip(
                presentMask: mask,
                open: _legendOpen,
                onTap: () => _setLegend(!_legendOpen),
              );
            },
          )
        : null;

    final popover = AnimatedSwitcher(
      duration: anim,
      child: _opacityOpen && showMasks && supportsSeg
          ? _OpacityPopover(
              key: const ValueKey('opacity'),
              value: opacity,
              onChanged: (v) {
                _setOpacityOpen(true); // restart auto-hide
                setState(() => _dragOpacity = v);
              },
              onChangeEnd: (v) {
                unawaited(
                  ref
                      .read(settingsProvider.notifier)
                      .update((x) => x.copyWith(segmentationOpacity: v))
                      .whenComplete(() {
                        if (mounted) setState(() => _dragOpacity = null);
                      }),
                );
              },
            )
          : const SizedBox.shrink(),
    );

    final legendCard = AnimatedSwitcher(
      duration: anim,
      child: _legendOpen && showMasks && supportsSeg
          ? ValueListenableBuilder<PerceptionStatus>(
              key: const ValueKey('legend'),
              valueListenable: _status,
              builder: (context, st, _) => _LegendCard(
                presentMask: _visibleMask(
                  st.presentMask,
                  showObjects,
                  showRoad,
                ),
                showRoad: showRoad,
                maxWidth: landscape ? 420 : 340,
              ),
            )
          : const SizedBox.shrink(),
    );

    final unsupported = showMasks && !supportsSeg && !ai.loading
        ? const _UnsupportedCard()
        : null;

    // Top strip: [status] [pill] [legend] in landscape (one row);
    // pill, then [status … legend] in portrait.
    final Widget controls = landscape
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  pill,
                  if (status != null)
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: status,
                    ),
                  if (legendChip != null)
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: legendChip,
                    ),
                ],
              ),
              Center(child: popover),
              const SizedBox(height: 6),
              Align(alignment: AlignmentDirectional.topEnd, child: legendCard),
              ?unsupported,
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: pill),
              Center(child: popover),
              const SizedBox(height: 6),
              Row(children: [?status, const Spacer(), ?legendChip]),
              const SizedBox(height: 6),
              Align(alignment: AlignmentDirectional.topEnd, child: legendCard),
              ?unsupported,
            ],
          );

    return Stack(
      fit: StackFit.expand,
      children: [
        CameraLayer(
          look: widget.look,
          showBoxes: showBoxes,
          underlay: supportsSeg
              ? (context, tf) => MaskLayer(
                  transform: tf,
                  showObjects: showObjects,
                  showRoad: showRoad,
                  opacity: opacity,
                  status: _status,
                )
              : null,
        ),
        PositionedDirectional(
          top: pad.top + 6,
          start: pad.left + 12,
          end: pad.right + 12,
          child: controls,
        ),
      ],
    );
  }

  static int _visibleMask(int mask, bool objects, bool road) {
    var m = mask;
    if (!objects) m &= 1 << MaskRasterizer.road;
    if (!road) m &= ~(1 << MaskRasterizer.road);
    return m;
  }
}

// ---------------------------------------------------------------------------
// Mode pill

class _ModePill extends StatelessWidget {
  const _ModePill({
    required this.mode,
    required this.onSelect,
    required this.showOpacity,
    required this.opacityOpen,
    required this.onOpacity,
  });

  final SegmentationMode mode;
  final ValueChanged<SegmentationMode> onSelect;
  final bool showOpacity;
  final bool opacityOpen;
  final VoidCallback onOpacity;

  static IconData icon(SegmentationMode m) => switch (m) {
    SegmentationMode.original => Icons.videocam_outlined,
    SegmentationMode.boxes => Icons.crop_free_rounded,
    SegmentationMode.masks => Icons.directions_car_filled_outlined,
    SegmentationMode.road => Icons.add_road_rounded,
    SegmentationMode.combined => Icons.layers_outlined,
  };

  static String short(AppLocalizations l10n, SegmentationMode m) => switch (m) {
    SegmentationMode.original => l10n.perceptionShortCamera,
    SegmentationMode.boxes => l10n.perceptionShortBoxes,
    SegmentationMode.masks => l10n.perceptionShortObjects,
    SegmentationMode.road => l10n.perceptionShortRoad,
    SegmentationMode.combined => l10n.perceptionShortAll,
  };

  static String long(AppLocalizations l10n, SegmentationMode m) => switch (m) {
    SegmentationMode.original => l10n.perceptionModeOriginal,
    SegmentationMode.boxes => l10n.perceptionModeBoxes,
    SegmentationMode.masks => l10n.perceptionModeMasks,
    SegmentationMode.road => l10n.perceptionModeRoad,
    SegmentationMode.combined => l10n.perceptionModeCombined,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Semantics(
      container: true,
      label: l10n.perceptionModesLabel,
      child: GestureDetector(
        // Long-press anywhere on the pill opens the opacity popover too.
        onLongPress: showOpacity ? onOpacity : null,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: GlassPanel(
            radius: 16,
            blur: 14,
            padding: const EdgeInsets.all(3),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final m in SegmentationMode.values)
                  _Segment(
                    icon: icon(m),
                    label: short(l10n, m),
                    semanticLabel: long(l10n, m),
                    selected: m == mode,
                    onTap: () => onSelect(m),
                  ),
                if (showOpacity) ...[
                  Container(
                    width: 1,
                    height: 26,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    color: AppColors.glassBorder,
                  ),
                  _Segment(
                    icon: Icons.opacity_rounded,
                    label: null,
                    semanticLabel: l10n.perceptionOpacity,
                    selected: opacityOpen,
                    onTap: onOpacity,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.icon,
    required this.label,
    required this.semanticLabel,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String? label;
  final String semanticLabel;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final fg = selected ? AppColors.cyan : AppColors.textPrimary;
    return Semantics(
      button: true,
      selected: selected,
      label: semanticLabel,
      excludeSemantics: true,
      child: Tooltip(
        message: semanticLabel,
        excludeFromSemantics: true,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: AnimatedContainer(
            duration: Motion.fast,
            curve: Motion.curve,
            constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
            decoration: BoxDecoration(
              color: selected
                  ? AppColors.cyan.withValues(alpha: .18)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: selected
                    ? AppColors.cyan.withValues(alpha: .55)
                    : Colors.transparent,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: fg.withValues(alpha: selected ? 1 : .85),
                ),
                if (label != null) ...[
                  const SizedBox(height: 1),
                  Text(
                    label!,
                    maxLines: 1,
                    style: TextStyle(
                      color: selected
                          ? AppColors.cyan
                          : AppColors.textSecondary,
                      fontSize: 10.5,
                      height: 1.15,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                      letterSpacing: .1,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Status / legend / popovers

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.status,
    required this.loadingModel,
    required this.supported,
  });

  final PerceptionStatus status;
  final bool loadingModel;
  final bool supported;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final (Widget lead, String text) = switch ((
      loadingModel,
      supported,
      status.hasMap,
      status.stalled,
    )) {
      (true, _, _, _) => (const _Spinner(), l10n.perceptionStatusLoadingModel),
      (_, false, _, _) => (
        const _Dot(color: AppColors.amber),
        l10n.perceptionUnavailable,
      ),
      (_, _, false, _) => (const _Spinner(), l10n.perceptionStatusWarmingUp),
      (_, _, _, true) => (
        const _Dot(color: AppColors.amber),
        l10n.perceptionStatusPaused,
      ),
      _ => (
        const _Dot(color: AppColors.green),
        status.hz == null
            ? l10n.perceptionStatusWarmingUp
            : l10n.perceptionStatusLive(status.hz!.toStringAsFixed(1)),
      ),
    };
    return Semantics(
      liveRegion: true,
      child: GlassPanel(
        radius: 12,
        blur: 12,
        padding: const EdgeInsetsDirectional.fromSTEB(9, 6, 11, 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            lead,
            const SizedBox(width: 7),
            Text(
              text,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFeatures: [FontFeature.tabularFigures()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color, this.size = 8});
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      border: Border.all(color: Colors.black.withValues(alpha: .35), width: .5),
    ),
  );
}

class _Spinner extends StatelessWidget {
  const _Spinner();

  @override
  Widget build(BuildContext context) => const SizedBox.square(
    dimension: 10,
    child: CircularProgressIndicator(strokeWidth: 1.6, color: AppColors.cyan),
  );
}

/// Small horizontal gradient swatch for the road layer (matches its fade).
class _RoadSwatch extends StatelessWidget {
  const _RoadSwatch();
  static const width = 16.0, height = 9.0;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      border: Border.all(color: MaskRasterizer.roadEdgeColor, width: .8),
      gradient: LinearGradient(
        colors: [
          MaskRasterizer.roadColor.withValues(alpha: .15),
          MaskRasterizer.roadColor.withValues(alpha: .85),
        ],
      ),
    ),
  );
}

class _LegendChip extends StatelessWidget {
  const _LegendChip({
    required this.presentMask,
    required this.open,
    required this.onTap,
  });

  final int presentMask;
  final bool open;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final classes = [
      for (final c in ObjectClass.values)
        if (presentMask & (1 << (c.index + 1)) != 0) c,
    ];
    final road = presentMask & (1 << MaskRasterizer.road) != 0;
    return Semantics(
      button: true,
      expanded: open,
      label: context.l10n.perceptionLegend,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 32, minWidth: 44),
          child: GlassPanel(
            radius: 12,
            blur: 12,
            padding: const EdgeInsetsDirectional.fromSTEB(9, 7, 7, 7),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final c in classes) ...[
                  _Dot(color: c.color),
                  const SizedBox(width: 4),
                ],
                if (road) ...[const _RoadSwatch(), const SizedBox(width: 4)],
                Icon(
                  open ? Icons.expand_less_rounded : Icons.info_outline_rounded,
                  size: 15,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LegendCard extends StatelessWidget {
  const _LegendCard({
    required this.presentMask,
    required this.showRoad,
    required this.maxWidth,
  });

  final int presentMask;
  final bool showRoad;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const label = TextStyle(
      color: AppColors.textPrimary,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
    Widget item(Widget swatch, String text) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        swatch,
        const SizedBox(width: 5),
        Text(text, style: label),
      ],
    );
    final classes = [
      for (final c in ObjectClass.values)
        if (presentMask & (1 << (c.index + 1)) != 0) c,
    ];
    final road = presentMask & (1 << MaskRasterizer.road) != 0;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: GlassPanel(
        radius: 14,
        blur: 14,
        padding: const EdgeInsetsDirectional.fromSTEB(12, 9, 12, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (classes.isNotEmpty || road)
              Wrap(
                spacing: 12,
                runSpacing: 6,
                children: [
                  for (final c in classes)
                    item(_Dot(color: c.color, size: 9), l10n.objectClass(c)),
                  if (road) item(const _RoadSwatch(), l10n.perceptionModeRoad),
                ],
              ),
            if (showRoad) ...[
              if (classes.isNotEmpty || road) const SizedBox(height: 7),
              Text(
                l10n.perceptionDisclaimer,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                  height: 1.3,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _OpacityPopover extends StatelessWidget {
  const _OpacityPopover({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onChangeEnd,
  });

  final double value;
  final ValueChanged<double> onChanged;
  final ValueChanged<double> onChangeEnd;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final v = value.clamp(0.1, 1.0);
    final panel = GlassPanel(
      radius: 14,
      blur: 14,
      padding: const EdgeInsetsDirectional.fromSTEB(12, 2, 12, 2),
      child: SizedBox(
        width: 250,
        child: Row(
          children: [
            const Icon(
              Icons.opacity_rounded,
              size: 16,
              color: AppColors.textSecondary,
            ),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 3,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 8,
                  ),
                  overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 16,
                  ),
                  activeTrackColor: AppColors.cyan,
                  thumbColor: AppColors.cyan,
                  inactiveTrackColor: AppColors.glassBorder,
                ),
                child: Slider(
                  value: v,
                  min: .1,
                  semanticFormatterCallback: (x) =>
                      '${l10n.perceptionOpacity} ${(x * 100).round()}%',
                  onChanged: onChanged,
                  onChangeEnd: onChangeEnd,
                ),
              ),
            ),
            SizedBox(
              width: 36,
              child: Text(
                '${(v * 100).round()}%',
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFeatures: [FontFeature.tabularFigures()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Padding(padding: const EdgeInsets.only(top: 6), child: panel);
  }
}

class _UnsupportedCard extends StatelessWidget {
  const _UnsupportedCard();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 340),
          child: GlassPanel(
            radius: 16,
            padding: const EdgeInsetsDirectional.fromSTEB(14, 12, 8, 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.layers_clear_outlined,
                      size: 18,
                      color: AppColors.amber,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.perceptionUnavailable,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 6),
                  child: Text(
                    l10n.perceptionNeedsModel,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      height: 1.3,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () => context.push(Routes.models),
                    child: Text(l10n.perceptionChooseModel),
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
