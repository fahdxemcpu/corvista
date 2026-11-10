import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../core/animations/motion.dart';
import '../../../core/widgets/format.dart';
import '../../../core/widgets/glass.dart';
import '../../../domain/models/app_settings.dart';
import '../../../l10n/l10n.dart';
import '../../ai_models/ai_models_screen.dart' show modelDisplayName;
import '../../weather/widgets/weather_widgets.dart';
import 'hud_palette.dart';

/// HUD panel honouring the palette (blur / solid / outline).
class HudPanel extends StatelessWidget {
  const HudPanel({
    super.key,
    required this.palette,
    required this.child,
    this.padding,
    this.radius = 16,
  });

  final HudPalette palette;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double radius;

  @override
  Widget build(BuildContext context) => GlassPanel(
    radius: radius,
    blur: palette.blur ? 18 : 0,
    color: palette.panel,
    borderColor: palette.border,
    padding:
        padding ??
        const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 8),
    child: child,
  );
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.palette,
    required this.child,
    this.leading,
    this.onTap,
    this.label,
  });

  final HudPalette palette;
  final Widget child;
  final Widget? leading;
  final VoidCallback? onTap;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final w = HudPanel(
      palette: palette,
      radius: 13,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[leading!, const SizedBox(width: 6)],
          Flexible(
            child: DefaultTextStyle.merge(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: palette.text,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
    return Semantics(
      label: label,
      button: onTap != null,
      excludeSemantics: label != null,
      child: onTap == null
          ? w
          : GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 44),
                child: Center(child: w),
              ),
            ),
    );
  }
}

/// Big tabular GPS speed + unit.
class SpeedReadout extends ConsumerWidget {
  const SpeedReadout({super.key, required this.palette, this.size = 52});

  final HudPalette palette;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(settingsProvider.select((s) => s.speedUnit));
    final fix = ref.watch(locationProvider.select((l) => l.fix));
    final v = Fmt.speed(fix?.hasSpeed == true ? fix!.speed : null, unit);
    final l10n = context.l10n;
    return Semantics(
      label: v == null
          ? l10n.hudSpeedUnavailable
          : l10n.hudSpeedLabel('$v', l10n.speedUnit(unit)),
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            v == null ? '--' : '$v',
            style: TextStyle(
              color: v == null ? palette.text2 : palette.text,
              fontSize: size,
              height: 1,
              fontWeight: FontWeight.w700,
              letterSpacing: -1.5,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
          const SizedBox(width: 5),
          Text(
            l10n.speedUnit(unit),
            style: TextStyle(
              color: palette.text2,
              fontSize: size * .26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

/// Speed arc gauge (performance style) — real GPS speed only, no fabricated
/// acceleration data.
class SpeedArcGauge extends ConsumerWidget {
  const SpeedArcGauge({super.key, required this.palette, this.diameter = 132});

  final HudPalette palette;
  final double diameter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(settingsProvider.select((s) => s.speedUnit));
    final fix = ref.watch(locationProvider.select((l) => l.fix));
    final v = Fmt.speed(fix?.hasSpeed == true ? fix!.speed : null, unit);
    final max = unit == SpeedUnit.kmh ? 200.0 : 130.0;
    return SizedBox.square(
      dimension: diameter,
      child: CustomPaint(
        painter: _ArcPainter(
          fraction: ((v ?? 0) / max).clamp(0.0, 1.0),
          palette: palette,
          valid: v != null,
        ),
        child: Center(
          child: SpeedReadout(palette: palette, size: diameter * .3),
        ),
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  _ArcPainter({
    required this.fraction,
    required this.palette,
    required this.valid,
  });

  final double fraction;
  final HudPalette palette;
  final bool valid;

  static const _start = math.pi * .75, _sweep = math.pi * 1.5;

  @override
  void paint(Canvas canvas, Size size) {
    final r = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: size.width / 2 - 8,
    );
    canvas.drawArc(
      r,
      _start,
      _sweep,
      false,
      Paint()
        ..color = palette.panel
        ..style = PaintingStyle.stroke
        ..strokeWidth = 16
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawArc(
      r,
      _start,
      _sweep,
      false,
      Paint()
        ..color = palette.text2.withValues(alpha: .25)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..strokeCap = StrokeCap.round,
    );
    if (valid && fraction > 0) {
      canvas.drawArc(
        r,
        _start,
        _sweep * fraction,
        false,
        Paint()
          ..shader = SweepGradient(
            startAngle: _start,
            endAngle: _start + _sweep,
            colors: [
              palette.accent,
              palette.style == HudStyle.performance
                  ? const Color(0xFF4C80FF)
                  : palette.accent,
            ],
            transform: const GradientRotation(0),
          ).createShader(r)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6
          ..strokeCap = StrokeCap.round,
      );
    }
    // Ticks every 10 %.
    final tick = Paint()
      ..color = palette.text2.withValues(alpha: .6)
      ..strokeWidth = 1.5;
    for (var i = 0; i <= 10; i++) {
      final a = _start + _sweep * i / 10;
      final o = r.center + Offset(math.cos(a), math.sin(a)) * (r.width / 2 + 7);
      final inner =
          r.center +
          Offset(math.cos(a), math.sin(a)) *
              (r.width / 2 + (i % 5 == 0 ? 1 : 3));
      canvas.drawLine(inner, o, tick);
    }
  }

  @override
  bool shouldRepaint(_ArcPainter o) =>
      o.fraction != fraction || o.palette != palette || o.valid != valid;
}

class HeadingChip extends ConsumerWidget {
  const HeadingChip({super.key, required this.palette});

  final HudPalette palette;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dir = ref.watch(locationProvider.select((l) => l.fix?.bestDirection));
    if (dir == null) return const SizedBox.shrink();
    final point = Fmt.compassPoint(dir);
    return _Chip(
      palette: palette,
      label: context.l10n.hudHeading(point, '${dir.round()}'),
      leading: Transform.rotate(
        angle: dir * math.pi / 180,
        child: Icon(Icons.navigation_rounded, size: 15, color: palette.accent),
      ),
      child: Text('$point ${dir.round()}°'),
    );
  }
}

class RecChip extends ConsumerStatefulWidget {
  const RecChip({super.key, required this.palette});

  final HudPalette palette;

  @override
  ConsumerState<RecChip> createState() => _RecChipState();
}

class _RecChipState extends ConsumerState<RecChip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  );

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rec = ref.watch(recorderProvider);
    final reduce = ref.watch(settingsProvider.select((s) => s.reduceMotion));
    final p = widget.palette;
    final l10n = context.l10n;
    final buffering = rec.status == RecorderStatus.buffering;
    final manual = rec.manualActive;
    final animate =
        (buffering || manual) &&
        Motion.enabled(context, appReduceMotion: reduce);
    if (animate && !_pulse.isAnimating) {
      _pulse.repeat(reverse: true);
    } else if (!animate && _pulse.isAnimating) {
      _pulse.stop();
      _pulse.value = 1;
    }
    final secs = (rec.bufferedMs / 1000).floor();
    final target = (rec.targetBufferMs / 1000).round();
    final (Color color, String text) = manual
        // Manual recording badge: "REC ● 03:12".
        ? (
            p.danger,
            'REC ● ${Fmt.clock(Duration(milliseconds: rec.manualElapsedMs))}',
          )
        : switch (rec.status) {
            RecorderStatus.buffering => (p.danger, l10n.hudRecBuffer(secs)),
            RecorderStatus.saving => (p.warn, l10n.hudRecSaving),
            RecorderStatus.error => (p.warn, l10n.hudRecError),
            RecorderStatus.idle => (p.text2, l10n.hudRecIdle),
          };
    return _Chip(
      palette: p,
      label: manual
          ? l10n.hudRecManualLabel(
              Fmt.clock(Duration(milliseconds: rec.manualElapsedMs)),
            )
          : buffering
          ? l10n.hudRecBufferLabel(secs, target)
          : text,
      leading: FadeTransition(
        opacity: animate
            ? Tween(begin: .35, end: 1.0).animate(_pulse)
            : const AlwaysStoppedAnimation(1),
        child: Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
      child: Text(text),
    );
  }
}

class AiChip extends ConsumerWidget {
  const AiChip({super.key, required this.palette, this.compact = false});

  final HudPalette palette;
  final bool compact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ai = ref.watch(aiModelsProvider);
    final cam = ref.watch(cameraProvider.select((c) => c.status));
    final count = ref.watch(
      tracksProvider.select((t) => t.where((x) => x.isConfirmed).length),
    );
    final power = ref.watch(powerProvider.select((p) => p.thermal));
    final l10n = context.l10n;
    final paused = ai.selectedId == 'none';
    final name = paused
        ? l10n.hudAiPaused
        : (ai.selected != null
              ? modelDisplayName(l10n, ai.selected!)
              : l10n.modelsEfficientName);
    final Color dot;
    if (ai.error != null || cam == CameraStatus.error) {
      dot = palette.danger;
    } else if (paused ||
        cam != CameraStatus.running ||
        ai.loading ||
        power.index >= ThermalLevel.serious.index) {
      dot = palette.warn;
    } else {
      dot = const Color(0xFF65DBAA);
    }
    return _Chip(
      palette: palette,
      label: l10n.hudAiStatusLabel(name, count),
      leading: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
      ),
      child: Text(
        compact
            ? l10n.hudAiObjects(count)
            : '$name · ${l10n.hudAiObjects(count)}',
      ),
    );
  }
}

/// Thermal / battery / low-power warnings — only rendered when relevant.
class PowerChips extends ConsumerWidget {
  const PowerChips({
    super.key,
    required this.palette,
    required this.showBattery,
  });

  final HudPalette palette;
  final bool showBattery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pw = ref.watch(powerProvider);
    final l10n = context.l10n;
    final chips = <Widget>[
      if (pw.thermal == ThermalLevel.critical)
        _Chip(
          palette: palette,
          leading: Icon(
            Icons.device_thermostat_rounded,
            size: 15,
            color: palette.danger,
          ),
          child: Text(l10n.hudThermalCritical),
        )
      else if (pw.thermal == ThermalLevel.serious)
        _Chip(
          palette: palette,
          leading: Icon(
            Icons.device_thermostat_rounded,
            size: 15,
            color: palette.warn,
          ),
          child: Text(l10n.hudThermalSerious),
        ),
      if (showBattery && pw.battery >= 0 && pw.battery < .2 && !pw.charging)
        _Chip(
          palette: palette,
          leading: Icon(
            Icons.battery_alert_rounded,
            size: 15,
            color: palette.warn,
          ),
          child: Text(l10n.hudBatteryLow(Fmt.percent(context, pw.battery))),
        ),
      if (pw.lowPowerMode)
        _Chip(
          palette: palette,
          leading: Icon(
            Icons.battery_saver_rounded,
            size: 15,
            color: palette.warn,
          ),
          child: Text(l10n.hudLowPower),
        ),
    ];
    if (chips.isEmpty) return const SizedBox.shrink();
    return Wrap(spacing: 6, runSpacing: 6, children: chips);
  }
}

class HudWeatherChip extends ConsumerWidget {
  const HudWeatherChip({super.key, required this.palette});

  final HudPalette palette;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final w = ref.watch(weatherProvider);
    final unit = ref.watch(settingsProvider.select((s) => s.speedUnit));
    if (!w.hasData || w.temperatureC == null) return const SizedBox.shrink();
    final temp = Fmt.temperature(w.temperatureC!, unit);
    return _Chip(
      palette: palette,
      label: context.l10n.hudWeatherLabel(temp, w.condition ?? ''),
      onTap: () => showWeatherSheet(context),
      leading: Icon(weatherIcon(w.symbol), size: 16, color: palette.accent),
      child: Text(temp),
    );
  }
}

class ClockChip extends StatefulWidget {
  const ClockChip({super.key, required this.palette});

  final HudPalette palette;

  @override
  State<ClockChip> createState() => _ClockChipState();
}

class _ClockChipState extends State<ClockChip> {
  late Timer _t;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _t = Timer.periodic(
      const Duration(seconds: 10),
      (_) => setState(() => _now = DateTime.now()),
    );
  }

  @override
  void dispose() {
    _t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      _Chip(palette: widget.palette, child: Text(Fmt.time(context, _now)));
}

/// Top HUD strip; layout depends on the HUD style. Never scrolls.
class HudStrip extends ConsumerWidget {
  const HudStrip({
    super.key,
    required this.palette,
    required this.landscape,
    this.showNavigationCard = true,
  });

  final HudPalette palette;
  final bool landscape;

  /// Navigation style shows a maneuver card (suppressed on the Map view,
  /// which has its own navigation banner).
  final bool showNavigationCard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(settingsProvider);
    final style = s.hudStyle;
    final chips = <Widget>[
      if (s.hudShowHeading && s.showCompass && style != HudStyle.minimal)
        HeadingChip(palette: palette),
      RecChip(palette: palette),
      if (s.hudShowDetections)
        AiChip(palette: palette, compact: style == HudStyle.minimal),
      if (s.hudShowWeather && style != HudStyle.minimal)
        HudWeatherChip(palette: palette),
      if (s.hudShowClock && style != HudStyle.minimal)
        ClockChip(palette: palette),
    ];

    Widget speed;
    if (!s.hudShowSpeed) {
      speed = const SizedBox.shrink();
    } else if (style == HudStyle.performance) {
      speed = SpeedArcGauge(palette: palette, diameter: landscape ? 116 : 128);
    } else if (style == HudStyle.minimal) {
      speed = SpeedReadout(palette: palette, size: 40);
    } else {
      speed = HudPanel(
        palette: palette,
        padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
        child: SpeedReadout(
          palette: palette,
          size: style == HudStyle.navigation ? 38 : 50,
        ),
      );
    }

    final chipWrap = Wrap(spacing: 6, runSpacing: 6, children: chips);
    final power = PowerChips(palette: palette, showBattery: s.hudShowBattery);
    final strip = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (style == HudStyle.navigation && showNavigationCard) ...[
          NavigationHudCard(palette: palette),
          const SizedBox(height: 8),
        ],
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            speed,
            if (s.hudShowSpeed) const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [chipWrap, const SizedBox(height: 6), power],
              ),
            ),
          ],
        ),
      ],
    );
    return Opacity(
      opacity: s.hudOpacity.clamp(.3, 1.0),
      child: MediaQuery.withClampedTextScaling(
        maxScaleFactor: 1.3,
        child: Transform.scale(
          scale: s.hudScale.clamp(.8, 1.3),
          alignment: AlignmentDirectional.topStart.resolve(
            Directionality.of(context),
          ),
          child: strip,
        ),
      ),
    );
  }
}

/// Maneuver-first card used by the navigation HUD style.
class NavigationHudCard extends ConsumerWidget {
  const NavigationHudCard({super.key, required this.palette});

  final HudPalette palette;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nav = ref.watch(navigationProvider);
    final unit = ref.watch(settingsProvider.select((s) => s.speedUnit));
    final g = nav.guidance;
    final l10n = context.l10n;
    if (nav.phase != NavPhase.navigating || g == null) {
      return HudPanel(
        palette: palette,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.alt_route_rounded, color: palette.text2, size: 18),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                l10n.hudNoGuidance,
                style: TextStyle(color: palette.text2, fontSize: 13),
              ),
            ),
          ],
        ),
      );
    }
    return HudPanel(
      palette: palette,
      padding: const EdgeInsetsDirectional.fromSTEB(14, 12, 16, 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            g.arrived
                ? Icons.flag_rounded
                : maneuverIcon(g.nextStep?.instructions),
            color: palette.accent,
            size: 36,
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  g.arrived
                      ? l10n.navArrived
                      : Fmt.routeDistance(context, g.distanceToNextM, unit),
                  style: TextStyle(
                    color: palette.text,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
                if (!g.arrived)
                  Text(
                    g.offRoute
                        ? l10n.navRerouting
                        : (g.nextStep?.instructions ?? ''),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: palette.text,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Best-effort maneuver glyph from the (localized) instruction text; falls
/// back to a neutral straight arrow when nothing is recognised.
IconData maneuverIcon(String? instruction) {
  final t = (instruction ?? '').toLowerCase();
  if (t.contains('roundabout') ||
      t.contains('rond-point') ||
      t.contains('glorieta') ||
      t.contains('kreisverkehr')) {
    return Icons.roundabout_right_rounded;
  }
  if (t.contains('u-turn')) return Icons.u_turn_left_rounded;
  if (t.contains('slight left') || t.contains('keep left')) {
    return Icons.turn_slight_left_rounded;
  }
  if (t.contains('slight right') || t.contains('keep right')) {
    return Icons.turn_slight_right_rounded;
  }
  if (t.contains('left') ||
      t.contains('gauche') ||
      t.contains('izquierda') ||
      t.contains('links')) {
    return Icons.turn_left_rounded;
  }
  if (t.contains('right') ||
      t.contains('droite') ||
      t.contains('derecha') ||
      t.contains('rechts')) {
    return Icons.turn_right_rounded;
  }
  if (t.contains('exit') || t.contains('ramp')) return Icons.ramp_right_rounded;
  if (t.contains('arrive') || t.contains('destination')) {
    return Icons.flag_rounded;
  }
  return Icons.straight_rounded;
}

/// Perspective grid overlay for the "grid" HUD style.
class PerspectiveGridPainter extends CustomPainter {
  PerspectiveGridPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final vp = Offset(size.width / 2, size.height * .42);
    final p = Paint()
      ..strokeWidth = 1.4
      ..style = PaintingStyle.stroke;
    // Converging lines.
    for (var i = -6; i <= 6; i++) {
      final x = size.width / 2 + i * size.width * .18;
      p.color = color.withValues(alpha: i == 0 ? .0 : .34);
      canvas.drawLine(vp, Offset(x, size.height), p);
    }
    // Horizontal lines with perspective spacing.
    for (var k = 1; k <= 9; k++) {
      final t = 1 / (1 + k * .55);
      final y = vp.dy + (size.height - vp.dy) * (1 - t) * 1.0;
      p.color = color.withValues(alpha: .14 + .26 * (k / 9));
      canvas.drawLine(Offset(0, y), Offset(size.width, y), p);
    }
    // Horizon.
    canvas.drawLine(
      Offset(0, vp.dy),
      Offset(size.width, vp.dy),
      p
        ..color = color.withValues(alpha: .5)
        ..strokeWidth = 1.8,
    );
  }

  @override
  bool shouldRepaint(PerspectiveGridPainter old) => old.color != color;
}
