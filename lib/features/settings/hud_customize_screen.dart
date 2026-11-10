import 'dart:math' as math;

import 'package:corvista/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/common.dart';
import '../../core/widgets/format.dart';
import '../../domain/models/app_settings.dart';
import '../../l10n/l10n.dart';
import 'widgets/settings_labels.dart';
import 'widgets/settings_sections_capture.dart';
import 'widgets/settings_tiles.dart';

/// HUD style, element visibility, size and opacity, with a live preview.
class HudCustomizeScreen extends ConsumerWidget {
  const HudCustomizeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final s = ref.watch(settingsProvider);
    final style = s.hudStyle;

    Widget toggle(
      IconData icon,
      String title,
      bool value,
      AppSettings Function(AppSettings x, bool v) f,
    ) => SettingSwitchTile(
      icon: icon,
      title: title,
      value: value,
      onChanged: (v) => updateSettings(ref, (x) => f(x, v)),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.hudCustomTitle)),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: ListView(
              padding: const EdgeInsetsDirectional.only(bottom: 32),
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HudPreviewCard(settings: s, style: style),
                      const SizedBox(height: 8),
                      Text(
                        l10n.hudCustomPreview,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                CvSection(
                  title: l10n.hudCustomStyle,
                  children: [
                    for (final h in HudStyle.values)
                      ListTile(
                        minTileHeight: 56,
                        title: Text(l10n.hudStyle(h)),
                        subtitle: Text(l10n.hudStyleDesc(h)),
                        trailing: h == style
                            ? const Icon(
                                Icons.check_rounded,
                                color: AppColors.cyan,
                              )
                            : null,
                        onTap: () =>
                            updateSettings(ref, (x) => x.copyWith(hudStyle: h)),
                      ),
                  ],
                ),
                CvSection(
                  title: l10n.hudCustomElements,
                  footer: l10n.hudCustomFooter,
                  children: [
                    toggle(
                      Icons.speed_rounded,
                      l10n.hudCustomSpeed,
                      s.hudShowSpeed,
                      (x, v) => x.copyWith(hudShowSpeed: v),
                    ),
                    toggle(
                      Icons.explore_outlined,
                      l10n.hudCustomHeading,
                      s.hudShowHeading,
                      (x, v) => x.copyWith(hudShowHeading: v),
                    ),
                    toggle(
                      Icons.schedule_rounded,
                      l10n.hudCustomClock,
                      s.hudShowClock,
                      (x, v) => x.copyWith(hudShowClock: v),
                    ),
                    toggle(
                      Icons.battery_std_outlined,
                      l10n.hudCustomBattery,
                      s.hudShowBattery,
                      (x, v) => x.copyWith(hudShowBattery: v),
                    ),
                    toggle(
                      Icons.memory_rounded,
                      l10n.hudCustomDetections,
                      s.hudShowDetections,
                      (x, v) => x.copyWith(hudShowDetections: v),
                    ),
                    toggle(
                      Icons.cloud_outlined,
                      l10n.hudCustomWeather,
                      s.hudShowWeather,
                      (x, v) => x.copyWith(hudShowWeather: v),
                    ),
                  ],
                ),
                CvSection(
                  title: l10n.hudCustomAppearance,
                  children: [
                    SettingSliderTile(
                      icon: Icons.format_size_rounded,
                      title: l10n.hudCustomSize,
                      value: s.hudScale,
                      min: .8,
                      max: 1.4,
                      divisions: 12,
                      format: (v) => Fmt.percent(context, v),
                      onChanged: (v) =>
                          updateSettings(ref, (x) => x.copyWith(hudScale: v)),
                    ),
                    SettingSliderTile(
                      icon: Icons.opacity_rounded,
                      title: l10n.hudCustomOpacity,
                      value: s.hudOpacity,
                      min: .4,
                      max: 1,
                      divisions: 12,
                      format: (v) => Fmt.percent(context, v),
                      onChanged: (v) =>
                          updateSettings(ref, (x) => x.copyWith(hudOpacity: v)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Miniature, static HUD mock-up for the chosen style using sample values.
class HudPreviewCard extends StatelessWidget {
  const HudPreviewCard({
    super.key,
    required this.settings,
    required this.style,
  });

  final AppSettings settings;
  final HudStyle style;

  @override
  Widget build(BuildContext context) {
    final s = settings;
    final night = style == HudStyle.night;
    final hc = style == HudStyle.highContrast;
    final accent = night
        ? const Color(0xFFFF6B5E)
        : hc
        ? const Color(0xFFFFE14D)
        : AppColors.cyan;
    final text = night ? const Color(0xFFE8A39A) : Colors.white;
    final panel = hc
        ? Colors.black
        : (night ? const Color(0xCC1A0806) : AppColors.glass);
    final k = s.hudScale;
    final minimal = style == HudStyle.minimal;
    final unit = context.l10n.speedUnit(s.speedUnit);
    final speed = s.speedUnit == SpeedUnit.kmh ? 62 : 39;

    Widget chip(IconData icon, String label) => Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 7 * k,
        vertical: 4 * k,
      ),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(8 * k),
        border: Border.all(
          color: hc ? Colors.white : AppColors.glassBorder,
          width: hc ? 1 : .5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11 * k, color: accent),
          SizedBox(width: 4 * k),
          Text(
            label,
            style: TextStyle(
              fontSize: 10 * k,
              color: text,
              fontWeight: FontWeight.w600,
              fontFeatures: tabular,
            ),
          ),
        ],
      ),
    );

    final speedText = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$speed',
          style: TextStyle(
            fontSize: 34 * k,
            height: 1,
            fontWeight: FontWeight.w700,
            color: text,
            fontFeatures: tabular,
          ),
        ),
        Text(
          unit,
          style: TextStyle(fontSize: 10 * k, color: text.withValues(alpha: .7)),
        ),
      ],
    );

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(
              painter: _PreviewRoadPainter(
                grid: style == HudStyle.grid,
                night: night,
                hc: hc,
              ),
            ),
            Opacity(
              opacity: s.hudOpacity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    if (style == HudStyle.navigation)
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 10 * k,
                            vertical: 6 * k,
                          ),
                          decoration: BoxDecoration(
                            color: panel,
                            borderRadius: BorderRadius.circular(10 * k),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.turn_right_rounded,
                                color: accent,
                                size: 22 * k,
                              ),
                              SizedBox(width: 6 * k),
                              Text(
                                Fmt.routeDistance(context, 300, s.speedUnit),
                                style: TextStyle(
                                  color: text,
                                  fontSize: 15 * k,
                                  fontWeight: FontWeight.w700,
                                  fontFeatures: tabular,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (!minimal)
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: [
                            if (s.hudShowHeading && s.showCompass)
                              chip(Icons.navigation_rounded, 'NE 42°'),
                            if (s.hudShowClock)
                              chip(Icons.schedule_rounded, '9:41'),
                          ],
                        ),
                      ),
                    if (!minimal)
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          alignment: WrapAlignment.end,
                          children: [
                            if (s.hudShowDetections)
                              chip(Icons.memory_rounded, '3'),
                            if (s.hudShowWeather)
                              chip(Icons.cloud_outlined, '18°'),
                            if (s.hudShowBattery)
                              chip(Icons.battery_5_bar_rounded, '82%'),
                          ],
                        ),
                      ),
                    if (s.hudShowSpeed || minimal)
                      Align(
                        alignment: minimal
                            ? AlignmentDirectional.center
                            : AlignmentDirectional.bottomStart,
                        child: style == HudStyle.performance
                            ? SizedBox.square(
                                dimension: 84 * k,
                                child: CustomPaint(
                                  painter: _ArcPainter(
                                    fraction:
                                        speed /
                                        (s.speedUnit == SpeedUnit.kmh
                                            ? 180
                                            : 110),
                                    color: accent,
                                  ),
                                  child: Center(child: speedText),
                                ),
                              )
                            : Container(
                                padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 12 * k,
                                  vertical: 6 * k,
                                ),
                                decoration: minimal
                                    ? null
                                    : BoxDecoration(
                                        color: panel,
                                        borderRadius: BorderRadius.circular(
                                          12 * k,
                                        ),
                                        border: hc
                                            ? Border.all(color: Colors.white)
                                            : null,
                                      ),
                                child: speedText,
                              ),
                      ),
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

class _PreviewRoadPainter extends CustomPainter {
  _PreviewRoadPainter({
    required this.grid,
    required this.night,
    required this.hc,
  });

  final bool grid, night, hc;

  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: hc
            ? const [Color(0xFF000000), Color(0xFF111111)]
            : night
            ? const [Color(0xFF0B0505), Color(0xFF1A0D0B)]
            : const [Color(0xFF0E1824), Color(0xFF16222E)],
      ).createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, bg);
    final horizon = size.height * .42;
    final cx = size.width / 2;
    final road = Path()
      ..moveTo(cx - size.width * .04, horizon)
      ..lineTo(cx + size.width * .04, horizon)
      ..lineTo(cx + size.width * .55, size.height)
      ..lineTo(cx - size.width * .55, size.height)
      ..close();
    canvas.drawPath(
      road,
      Paint()
        ..color = (night ? const Color(0xFF241210) : const Color(0xFF1F2B38)),
    );
    final lane = Paint()
      ..color = (hc ? Colors.white : Colors.white24)
      ..strokeWidth = 2;
    for (var i = 0; i < 5; i++) {
      final t0 = i / 5, t1 = t0 + .1;
      double y(double t) => horizon + (size.height - horizon) * t * t;
      canvas.drawLine(Offset(cx, y(t0)), Offset(cx, y(t1)), lane);
    }
    if (grid) {
      final g = Paint()
        ..color = AppColors.cyan.withValues(alpha: .25)
        ..strokeWidth = 1;
      for (var i = -6; i <= 6; i++) {
        canvas.drawLine(
          Offset(cx + i * size.width * .015, horizon),
          Offset(cx + i * size.width * .18, size.height),
          g,
        );
      }
      for (var j = 1; j <= 6; j++) {
        final t = j / 6;
        final yy = horizon + (size.height - horizon) * t * t;
        canvas.drawLine(Offset(0, yy), Offset(size.width, yy), g);
      }
    }
  }

  @override
  bool shouldRepaint(_PreviewRoadPainter old) =>
      old.grid != grid || old.night != night || old.hc != hc;
}

class _ArcPainter extends CustomPainter {
  _ArcPainter({required this.fraction, required this.color});

  final double fraction;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final r = Rect.fromLTWH(4, 4, size.width - 8, size.height - 8);
    const start = math.pi * .75, sweep = math.pi * 1.5;
    final base = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..color = Colors.white12;
    canvas.drawArc(r, start, sweep, false, base);
    canvas.drawArc(
      r,
      start,
      sweep * fraction.clamp(0.0, 1.0),
      false,
      base..color = color,
    );
  }

  @override
  bool shouldRepaint(_ArcPainter old) =>
      old.fraction != fraction || old.color != color;
}
