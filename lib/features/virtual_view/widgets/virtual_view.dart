import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../core/animations/motion.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/glass.dart';
import '../../../domain/models/app_settings.dart';
import '../../../domain/models/object_class.dart';
import '../../../domain/models/tracked_object.dart';
import '../../../l10n/l10n.dart';
import '../../detection/placement_filter.dart';
import '../virtual_placement.dart';
import 'scene_smoother.dart';
import 'scene_camera.dart';
import 'virtual_scene_painter.dart';

/// What feeds the virtual view right now.
enum VirtualStatus { live, testFootage, aiPaused, cameraOff }

/// 2.5D virtual driving view built only from confirmed detections.
class VirtualView extends ConsumerWidget {
  const VirtualView({
    super.key,
    required this.contentPadding,
    this.night = false,
  });

  final EdgeInsets contentPadding;
  final bool night;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(settingsProvider);
    final objects = ref.watch(virtualPlacementProvider);
    final cam = ref.watch(cameraProvider.select((c) => c.status));
    final source = ref.watch(cameraProvider.select((c) => c.source));
    final aiPaused = ref.watch(
      aiModelsProvider.select((a) => a.selectedId == 'none'),
    );
    final status = cam != CameraStatus.running
        ? VirtualStatus.cameraOff
        : aiPaused
        ? VirtualStatus.aiPaused
        : source == 'file'
        ? VirtualStatus.testFootage
        : VirtualStatus.live;
    final side = resolveDrivingSide(
      s.drivingSide,
      WidgetsBinding.instance.platformDispatcher.locale.countryCode,
    );
    return VirtualSceneView(
      objects: objects,
      leftHand: side == DrivingSide.left,
      style: s.virtualStyle,
      night: night,
      reduceMotion: s.reduceMotion,
      contentPadding: contentPadding,
      status: status,
    );
  }
}

/// Provider-free virtual view: scene + overlays for the given placed
/// [objects] (see `PlacementFilter`).
/// [contentPadding] is the area covered by the drive shell (top HUD, bottom
/// controls); overlays and the scene framing stay clear of it.
class VirtualSceneView extends StatelessWidget {
  const VirtualSceneView({
    super.key,
    required this.objects,
    required this.style,
    required this.contentPadding,
    required this.status,
    this.night = false,
    this.reduceMotion = false,
    this.leftHand = false,
  });

  final List<PlacedObject> objects;
  final VirtualStyle style;
  final EdgeInsets contentPadding;
  final VirtualStatus status;
  final bool night;
  final bool reduceMotion;

  /// Left-hand traffic (illustrative road mirrored).
  final bool leftHand;

  static const _barH = 50.0;
  static const _gap = 8.0;
  static const _topRowH = 36.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final confirmed = objects.where((o) => !o.lost).toList();
    final counts = <ObjectClass, int>{};
    for (final t in confirmed) {
      counts[t.cls] = (counts[t.cls] ?? 0) + 1;
    }
    final nearest = _nearest(confirmed);
    final hc = style == VirtualStyle.highContrast;

    final summary = confirmed.isEmpty
        ? l10n.virtualEmpty
        : [
            for (final c in ObjectClass.values)
              if (counts[c] != null)
                l10n.virtualCount(l10n.objectClass(c), counts[c]!),
          ].join(', ');

    return LayoutBuilder(
      builder: (context, box) {
        final landscape = box.maxWidth > box.maxHeight;
        final rtl = Directionality.of(context) == TextDirection.rtl;
        // Physical insets mapped to start/end for directional positioning.
        final startPad =
            12 + (rtl ? contentPadding.right : contentPadding.left);
        final endPad = 12 + (rtl ? contentPadding.left : contentPadding.right);
        final barBottom = contentPadding.bottom + _gap;
        final sceneInsets = EdgeInsets.fromLTRB(
          contentPadding.left,
          contentPadding.top + (landscape ? 10 : _topRowH),
          contentPadding.right,
          landscape ? barBottom : barBottom + _barH + 12,
        );
        final cam = SceneCamera(box.biggest, sceneInsets);

        final nearestChip = nearest == null
            ? null
            : _NearestChip(track: nearest, hc: hc, night: night);
        // Signals are shown in the scene; counts cover road users only.
        final countPills = [
          for (final c in ObjectClass.values)
            if (counts[c] != null && !c.isSignal)
              _CountPill(cls: c, count: counts[c]!, hc: hc),
        ];
        // The drive HUD already shows a TEST FOOTAGE badge; don't repeat it.
        final showStatus = status != VirtualStatus.testFootage;
        final statusPill = _StatusPill(
          status: status,
          hc: hc,
          animate: Motion.enabled(context, appReduceMotion: reduceMotion),
        );

        return Stack(
          fit: StackFit.expand,
          children: [
            Semantics(
              label: l10n.virtualSceneLabel(summary),
              excludeSemantics: true,
              child: SceneSmootherScope(
                objects: objects,
                reduceMotion: reduceMotion,
                builder: (context, smoother, repaint) => CustomPaint(
                  painter: VirtualScenePainter(
                    smoother: smoother,
                    style: style,
                    night: night,
                    leftHand: leftHand,
                    insets: sceneInsets,
                    repaint: repaint,
                  ),
                ),
              ),
            ),
            if (confirmed.isEmpty) ...[
              if (status != VirtualStatus.cameraOff &&
                  status != VirtualStatus.aiPaused)
                IgnorePointer(
                  child: _ScanLayer(
                    insets: sceneInsets,
                    leftHand: leftHand,
                    style: style,
                    night: night,
                    animate: Motion.enabled(
                      context,
                      appReduceMotion: reduceMotion,
                    ),
                  ),
                ),
              Positioned.fromRect(
                rect: Rect.fromLTRB(
                  cam.viewport.left + 16,
                  cam.horizon,
                  cam.viewport.right - 16,
                  cam.project(0, 1.5, SceneCamera.egoZ + 2).dy,
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: _EmptyCard(
                      status: status,
                      hc: hc,
                      compact: landscape,
                    ),
                  ),
                ),
              ),
            ],
            // Status + illustrative-lanes caption: under the HUD in
            // portrait, in the free bottom-end corner in landscape.
            if (landscape)
              PositionedDirectional(
                end: endPad,
                bottom: barBottom + 4,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: (box.maxWidth / 2 - endPad - 56).clamp(
                      80.0,
                      360.0,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (showStatus) ...[
                        statusPill,
                        const SizedBox(height: 6),
                      ],
                      // Backed: road markings can run under this corner.
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: hc ? Colors.black : const Color(0x990B1219),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          child: _Caption(hc: hc),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              PositionedDirectional(
                top: contentPadding.top + 4,
                start: startPad,
                end: endPad,
                child: Row(
                  children: [
                    if (showStatus) ...[statusPill, const SizedBox(width: 12)],
                    Expanded(child: _Caption(hc: hc)),
                  ],
                ),
              ),
            if (nearestChip != null || countPills.isNotEmpty)
              if (landscape)
                PositionedDirectional(
                  start: startPad,
                  bottom: barBottom,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: (box.maxWidth / 2 - startPad - 56).clamp(
                        80.0,
                        520.0,
                      ),
                    ),
                    child: _Bar(
                      hc: hc,
                      children: [
                        ?nearestChip,
                        if (countPills.isNotEmpty)
                          Flexible(child: _Counts(pills: countPills)),
                      ],
                    ),
                  ),
                )
              else
                PositionedDirectional(
                  start: startPad,
                  end: endPad,
                  bottom: barBottom,
                  height: _barH,
                  child: _Bar(
                    hc: hc,
                    children: [
                      ?nearestChip,
                      Expanded(child: _Counts(pills: countPills)),
                    ],
                  ),
                ),
          ],
        );
      },
    );
  }

  /// Nearest road user by zone (then approximate range); signals only when
  /// nothing else is zoned.
  static PlacedObject? _nearest(List<PlacedObject> ts) {
    PlacedObject? best;
    var bestSignal = true;
    for (final t in ts) {
      final signal = t.cls.isSignal;
      if (best == null ||
          (bestSignal && !signal) ||
          (signal == bestSignal && t.distanceM < best.distanceM)) {
        best = t;
        bestSignal = signal;
      }
    }
    return best;
  }
}

IconData classIcon(ObjectClass c) => switch (c) {
  ObjectClass.person => Icons.directions_walk_rounded,
  ObjectClass.bicycle => Icons.pedal_bike_rounded,
  ObjectClass.motorcycle => Icons.two_wheeler_rounded,
  ObjectClass.car => Icons.directions_car_filled_rounded,
  ObjectClass.bus => Icons.directions_bus_filled_rounded,
  ObjectClass.trafficLight => Icons.traffic_rounded,
  ObjectClass.stopSign => Icons.report_rounded,
};

const _yellow = Color(0xFFFFE600);

class _Bar extends StatelessWidget {
  const _Bar({required this.hc, required this.children});

  final bool hc;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => GlassPanel(
    radius: 25,
    padding: const EdgeInsetsDirectional.all(7),
    color: hc ? Colors.black : const Color(0xC70B1219),
    borderColor: hc ? Colors.white : null,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) const SizedBox(width: 6),
          children[i],
        ],
      ],
    ),
  );
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.child,
    this.color,
    this.border,
    this.hc = false,
    this.height = 36,
  });

  final Widget child;
  final Color? color;
  final Color? border;
  final bool hc;
  final double height;

  @override
  Widget build(BuildContext context) => Container(
    height: height,
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 11),
    decoration: BoxDecoration(
      color: color ?? (hc ? Colors.black : const Color(0x14FFFFFF)),
      borderRadius: BorderRadius.circular(height / 2),
      border: border == null
          ? (hc ? Border.all(color: Colors.white, width: 1.2) : null)
          : Border.all(color: border!, width: hc ? 2 : 1),
    ),
    child: Row(mainAxisSize: MainAxisSize.min, children: [child]),
  );
}

class _NearestChip extends StatelessWidget {
  const _NearestChip({
    required this.track,
    required this.hc,
    required this.night,
  });

  final PlacedObject track;
  final bool hc;
  final bool night;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final zone = track.zone;
    final alert =
        zone == ProximityZone.veryClose || zone == ProximityZone.close;
    final Color fg;
    final Color? bg;
    final Color? border;
    if (hc) {
      fg = alert ? Colors.black : Colors.white;
      bg = alert ? _yellow : Colors.black;
      border = alert ? _yellow : Colors.white;
    } else {
      final c = switch (zone) {
        ProximityZone.veryClose =>
          night ? const Color(0xFFFF4A3D) : AppColors.red,
        ProximityZone.close =>
          night ? const Color(0xFFFFA347) : AppColors.amber,
        _ => null,
      };
      fg = c ?? AppColors.textPrimary;
      bg = c?.withValues(alpha: .16);
      border = c?.withValues(alpha: .55);
    }
    return Semantics(
      label:
          '${l10n.objectClass(track.cls)}, ${l10n.virtualNearest(l10n.zone(zone))}',
      excludeSemantics: true,
      child: _Pill(
        hc: hc,
        color: bg,
        border: border,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(classIcon(track.cls), size: 19, color: fg),
            const SizedBox(width: 7),
            Text(
              l10n.zone(zone),
              maxLines: 1,
              style: TextStyle(
                color: fg,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Counts extends StatelessWidget {
  const _Counts({required this.pills});

  final List<Widget> pills;

  @override
  Widget build(BuildContext context) => Align(
    alignment: AlignmentDirectional.centerStart,
    widthFactor: 1,
    child: FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < pills.length; i++) ...[
            if (i > 0) const SizedBox(width: 4),
            pills[i],
          ],
        ],
      ),
    ),
  );
}

class _CountPill extends StatelessWidget {
  const _CountPill({required this.cls, required this.count, required this.hc});

  final ObjectClass cls;
  final int count;
  final bool hc;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final fg = hc ? Colors.white : AppColors.textPrimary;
    return Semantics(
      label: l10n.virtualCount(l10n.objectClass(cls), count),
      excludeSemantics: true,
      child: Container(
        height: 36,
        padding: const EdgeInsetsDirectional.only(start: 8, end: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: hc ? Colors.black : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              classIcon(cls),
              size: 18,
              color: hc ? Colors.white : AppColors.textSecondary,
            ),
            const SizedBox(width: 4),
            Text(
              '$count',
              style: TextStyle(
                color: fg,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusPill extends StatefulWidget {
  const _StatusPill({
    required this.status,
    required this.hc,
    required this.animate,
  });

  final VirtualStatus status;
  final bool hc;
  final bool animate;

  @override
  State<_StatusPill> createState() => _StatusPillState();
}

class _StatusPillState extends State<_StatusPill>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  );

  bool get _pulsing =>
      widget.animate &&
      (widget.status == VirtualStatus.live ||
          widget.status == VirtualStatus.testFootage);

  @override
  void initState() {
    super.initState();
    if (_pulsing) _pulse.repeat();
  }

  @override
  void didUpdateWidget(_StatusPill old) {
    super.didUpdateWidget(old);
    if (_pulsing && !_pulse.isAnimating) {
      _pulse.repeat();
    } else if (!_pulsing && _pulse.isAnimating) {
      _pulse
        ..stop()
        ..value = 0;
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final hc = widget.hc;
    final (label, color) = switch (widget.status) {
      VirtualStatus.live => (
        l10n.virtualStatusAi(l10n.virtualStatusLive),
        AppColors.green,
      ),
      VirtualStatus.testFootage => (
        l10n.virtualStatusTestFootage,
        AppColors.amber,
      ),
      VirtualStatus.aiPaused => (
        l10n.virtualStatusAi(l10n.virtualStatusPaused),
        AppColors.amber,
      ),
      VirtualStatus.cameraOff => (l10n.virtualStatusCameraOff, AppColors.red),
    };
    final dotColor = hc && widget.status != VirtualStatus.live
        ? _yellow
        : color;
    return _Pill(
      hc: hc,
      height: 28,
      color: hc ? Colors.black : const Color(0x990B1219),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: 14,
            child: AnimatedBuilder(
              animation: _pulse,
              builder: (context, _) => CustomPaint(
                painter: _DotPainter(dotColor, _pulsing ? _pulse.value : -1),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            maxLines: 1,
            style: TextStyle(
              color: hc ? Colors.white : AppColors.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _DotPainter extends CustomPainter {
  _DotPainter(this.color, this.t);

  final Color color;

  /// Pulse phase 0..1, or < 0 for a static dot.
  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    if (t >= 0) {
      canvas.drawCircle(
        c,
        4 + 3 * t,
        Paint()..color = color.withValues(alpha: .45 * (1 - t)),
      );
    }
    canvas.drawCircle(c, 4, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_DotPainter old) => old.t != t || old.color != color;
}

class _Caption extends StatelessWidget {
  const _Caption({required this.hc});

  final bool hc;

  @override
  Widget build(BuildContext context) {
    final color = hc
        ? Colors.white
        : AppColors.textSecondary.withValues(alpha: .75);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(Icons.info_outline_rounded, size: 12, color: color),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            context.l10n.virtualLaneDisclaimer,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 11, color: color, height: 1.2),
          ),
        ),
      ],
    );
  }
}

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({
    required this.status,
    required this.hc,
    this.compact = false,
  });

  final VirtualStatus status;
  final bool hc;

  /// Title only (short landscape viewports).
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final off =
        status == VirtualStatus.cameraOff || status == VirtualStatus.aiPaused;
    final accent = hc ? _yellow : (off ? AppColors.amber : AppColors.cyan);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 320),
      child: GlassPanel(
        radius: 20,
        color: hc ? Colors.black : const Color(0xB30B1219),
        borderColor: hc ? Colors.white : null,
        padding: const EdgeInsetsDirectional.fromSTEB(14, 12, 16, 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              off ? Icons.videocam_off_rounded : Icons.radar_rounded,
              size: 24,
              color: accent,
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    off ? l10n.virtualEmptyCameraOff : l10n.virtualEmpty,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: hc ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                  if (!off && !compact) ...[
                    const SizedBox(height: 2),
                    Text(
                      l10n.virtualEmptyHint,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.3,
                        color: hc ? Colors.white : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScanLayer extends StatefulWidget {
  const _ScanLayer({
    required this.insets,
    required this.style,
    required this.night,
    required this.animate,
    this.leftHand = false,
  });

  final EdgeInsets insets;
  final bool leftHand;
  final VirtualStyle style;
  final bool night;
  final bool animate;

  @override
  State<_ScanLayer> createState() => _ScanLayerState();
}

class _ScanLayerState extends State<_ScanLayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3200),
    value: .3,
  );

  @override
  void initState() {
    super.initState();
    if (widget.animate) _c.repeat();
  }

  @override
  void didUpdateWidget(_ScanLayer old) {
    super.didUpdateWidget(old);
    if (widget.animate && !_c.isAnimating) {
      _c.repeat();
    } else if (!widget.animate && _c.isAnimating) {
      _c
        ..stop()
        ..value = .3;
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: ScanPainter(
      insets: widget.insets,
      style: widget.style,
      night: widget.night,
      leftHand: widget.leftHand,
      t: _c,
    ),
  );
}
