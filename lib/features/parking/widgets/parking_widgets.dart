import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../domain/models/tracked_object.dart';
import '../../../l10n/l10n.dart';
import '../../detection/widgets/cover_transform.dart';
import '../parking_proximity.dart';

/// Zone colours (driving-safe: high saturation, never green — "nothing close
/// seen" is neutral grey because it does not mean clear).
abstract final class ParkingColors {
  static const stop = Color(0xFFFF3B3B);
  static const veryClose = Color(0xFFFF8A2A);
  static const close = Color(0xFFFFD23F);
  static const none = Color(0xFF6B7C8C);

  static Color of(ParkingZone z) => switch (z) {
    ParkingZone.stop => stop,
    ParkingZone.veryClose => veryClose,
    ParkingZone.close => close,
    ParkingZone.nothingClose => none,
  };

  /// Text colour on a solid [of] background.
  static Color onZone(ParkingZone z) =>
      z == ParkingZone.stop ? Colors.white : const Color(0xFF0B0F14);
}

extension ParkingL10n on AppLocalizations {
  String parkingZone(ParkingZone z) => switch (z) {
    ParkingZone.stop => parkingZoneStop,
    ParkingZone.veryClose => parkingZoneVeryClose,
    ParkingZone.close => parkingZoneClose,
    ParkingZone.nothingClose => parkingZoneNothingClose,
  };

  String parkingSide(ParkingSide s) => switch (s) {
    ParkingSide.left => parkingSideLeft,
    ParkingSide.centre => parkingSideCenter,
    ParkingSide.right => parkingSideRight,
  };
}

/// Boxes coloured by parking zone, drawn through the camera's transform.
/// Objects outside the considered range get a thin neutral outline; signals
/// are not drawn. The nearest object gets a label chip placed inside the
/// top of its box (never below it, where the near field is).
class ParkingBoxesPainter extends CustomPainter {
  ParkingBoxesPainter({
    required this.transform,
    required this.tracks,
    required this.assessment,
    required this.labelFor,
    required this.textDirection,
    this.labelStyle = const TextStyle(),
  });

  /// Base style for the label chip (pass the theme's text style so the
  /// chip uses the app font).
  final TextStyle labelStyle;
  final CoverTransform transform;
  final List<TrackedObject> tracks;
  final ParkingAssessment assessment;
  final String Function(ParkingObject o) labelFor;
  final TextDirection textDirection;

  @override
  void paint(Canvas canvas, Size size) {
    if (!transform.isValid) return;
    canvas.save();
    canvas.clipRect(Offset.zero & size);
    final nearestId = assessment.nearest?.track.id;
    // Far / neutral first, then by severity so the nearest is on top.
    final ordered = [...tracks]
      ..removeWhere(
        (t) =>
            !ParkingProximity.supports(t.cls) ||
            assessment.ownVehicleIds.contains(t.id),
      )
      ..sort((a, b) {
        final la = assessment.objectFor(a.id)?.zone.level ?? -1;
        final lb = assessment.objectFor(b.id)?.zone.level ?? -1;
        return la.compareTo(lb);
      });
    for (final t in ordered) {
      final r = transform.mapRect(t.box).intersect(Offset.zero & size);
      if (r.width < 4 || r.height < 4) continue;
      final o = assessment.objectFor(t.id);
      final lost = t.state == TrackState.lost;
      if (o == null) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(r, const Radius.circular(4)),
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.2
            ..color = Colors.white.withValues(alpha: lost ? .12 : .28),
        );
        continue;
      }
      final c = ParkingColors.of(o.zone);
      final a = lost ? .5 : 1.0;
      final stroke = switch (o.zone) {
        ParkingZone.stop => 5.0,
        ParkingZone.veryClose => 4.0,
        ParkingZone.close => 3.0,
        ParkingZone.nothingClose => 2.0,
      };
      final rr = RRect.fromRectAndRadius(r, const Radius.circular(6));
      canvas.drawRRect(
        rr,
        Paint()
          ..color = c.withValues(
            alpha: (o.zone == ParkingZone.nothingClose ? .06 : .16) * a,
          ),
      );
      // Dark under-stroke keeps the outline visible on bright scenes.
      canvas.drawRRect(
        rr,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = stroke + 2
          ..color = Colors.black.withValues(alpha: .35 * a),
      );
      canvas.drawRRect(
        rr,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = stroke
          ..color = c.withValues(alpha: a),
      );
      if (o.bottomEdge) {
        // Chevron at the bottom edge: object continues below the view.
        final y = r.bottom - 4;
        final p = Path()
          ..moveTo(r.center.dx - 14, y - 10)
          ..lineTo(r.center.dx, y)
          ..lineTo(r.center.dx + 14, y - 10);
        canvas.drawPath(
          p,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 4
            ..strokeCap = StrokeCap.round
            ..color = c.withValues(alpha: a),
        );
      }
      if (t.id == nearestId && o.zone != ParkingZone.nothingClose) {
        _label(canvas, size, r, labelFor(o), c, ParkingColors.onZone(o.zone));
      }
    }
    canvas.restore();
  }

  void _label(
    Canvas canvas,
    Size size,
    Rect r,
    String text,
    Color bg,
    Color fg,
  ) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: labelStyle.copyWith(
          color: fg,
          fontSize: 13,
          fontWeight: FontWeight.w800,
        ),
      ),
      textDirection: textDirection,
      maxLines: 1,
      ellipsis: '…',
    )..layout(maxWidth: math.max(40, size.width - 16));
    final w = tp.width + 12, h = tp.height + 6;
    // Inside the top of the box (never below it, where the near field is);
    // may overhang a narrow box but stays on screen.
    final left = math.max(4.0, math.min(r.left + 4, size.width - w - 4));
    final top = r.top + 4;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(left, top, w, h),
        const Radius.circular(6),
      ),
      Paint()..color = bg,
    );
    tp.paint(canvas, Offset(left + 6, top + 3));
  }

  @override
  bool shouldRepaint(ParkingBoxesPainter old) =>
      old.transform != transform ||
      old.tracks != tracks ||
      old.assessment != assessment;
}

/// Headline zone + bold left / centre / right bar. The bar is physical
/// (left is the vehicle's left), so it is never mirrored in RTL.
class ParkingStatusCard extends StatelessWidget {
  const ParkingStatusCard({
    super.key,
    required this.assessment,
    this.compact = false,
  });

  final ParkingAssessment assessment;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final zone = assessment.zone;
    final n = assessment.nearest;
    final c = ParkingColors.of(zone);
    final alarm = zone == ParkingZone.stop;
    final headline = alarm
        ? l10n.parkingZone(zone).toUpperCase()
        : l10n.parkingZone(zone);
    final detail = n == null || zone == ParkingZone.nothingClose
        ? null
        : l10n.parkingObjectSide(
            l10n.objectClass(n.track.cls),
            l10n.parkingSide(n.side),
          );
    final sem = [
      l10n.parkingZone(zone),
      l10n.parkingApprox,
      detail ?? l10n.parkingNotDetected,
    ].join(', ');
    return Semantics(
      liveRegion: true,
      label: sem,
      excludeSemantics: true,
      child: Container(
        padding: EdgeInsets.fromLTRB(12, compact ? 6 : 8, 12, compact ? 8 : 10),
        decoration: BoxDecoration(
          color: alarm
              ? ParkingColors.stop
              : Color.alphaBlend(
                  c.withValues(
                    alpha: zone == ParkingZone.nothingClose ? .10 : .22,
                  ),
                  AppColors.surface,
                ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: c.withValues(alpha: .9), width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      headline,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: compact ? 24 : 30,
                        height: 1.05,
                        fontWeight: FontWeight.w900,
                        color: alarm
                            ? Colors.white
                            : zone == ParkingZone.nothingClose
                            ? AppColors.textPrimary
                            : c,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: alarm ? Colors.white70 : AppColors.textSecondary,
                    ),
                  ),
                  child: Text(
                    l10n.parkingApprox,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: alarm ? Colors.white : AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            if (detail == null)
              Text(
                l10n.parkingNotDetected,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: compact ? 12 : 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.amber,
                ),
              )
            else
              Text(
                detail,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: compact ? 13 : 15,
                  fontWeight: FontWeight.w700,
                  color: alarm ? Colors.white : AppColors.textPrimary,
                ),
              ),
            SizedBox(height: compact ? 5 : 7),
            ParkingSectorBar(
              sectors: assessment.sectors,
              nearestSide: zone == ParkingZone.nothingClose ? null : n?.side,
              height: compact ? 22 : 28,
            ),
          ],
        ),
      ),
    );
  }
}

/// Three bold cells, physical left → right.
class ParkingSectorBar extends StatelessWidget {
  const ParkingSectorBar({
    super.key,
    required this.sectors,
    this.nearestSide,
    this.height = 28,
  });

  final Map<ParkingSide, ParkingZone> sectors;
  final ParkingSide? nearestSide;
  final double height;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          for (final s in ParkingSide.values) ...[
            if (s != ParkingSide.left) const SizedBox(width: 4),
            Expanded(
              flex: s == ParkingSide.centre ? 4 : 3,
              child: _cell(l10n, s, sectors[s] ?? ParkingZone.nothingClose),
            ),
          ],
        ],
      ),
    );
  }

  Widget _cell(AppLocalizations l10n, ParkingSide s, ParkingZone z) {
    final c = ParkingColors.of(z);
    final lit = z != ParkingZone.nothingClose;
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: lit ? c : AppColors.elevated,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: s == nearestSide ? Colors.white : Colors.transparent,
          width: 2,
        ),
      ),
      child: Text(
        l10n.parkingSide(s),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: lit ? ParkingColors.onZone(z) : AppColors.textSecondary,
        ),
      ),
    );
  }
}

/// Simplified top-down: the vehicle front at the bottom and, in front of it,
/// three angular sectors (left / centre / right) of three bands each (stop,
/// very close, close). A sector lights up to its zone. No road, no scale.
class ParkingSectorArcsPainter extends CustomPainter {
  ParkingSectorArcsPainter({required this.sectors, this.nearestSide});

  final Map<ParkingSide, ParkingZone> sectors;
  final ParkingSide? nearestSide;

  static const _bands = [
    ParkingZone.stop,
    ParkingZone.veryClose,
    ParkingZone.close,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final carW = math.min(size.width * .42, 120.0);
    final carH = math.min(size.height * .2, 30.0);
    final origin = Offset(size.width / 2, size.height - carH - 2);
    final maxR = math.min(size.height - carH - 8, size.width * .62);
    if (maxR < 20) return;
    const up = -math.pi / 2;
    // Physical sectors over a 120° fan: left, centre (narrower), right.
    const spans = {
      ParkingSide.left: (-60.0, -18.0),
      ParkingSide.centre: (-17.0, 17.0),
      ParkingSide.right: (18.0, 60.0),
    };
    final inner = maxR * .22;
    final bandW = (maxR - inner) / 3;
    for (final e in spans.entries) {
      final z = sectors[e.key] ?? ParkingZone.nothingClose;
      final a0 = up + e.value.$1 * math.pi / 180;
      final sweep = (e.value.$2 - e.value.$1) * math.pi / 180;
      for (var i = 0; i < 3; i++) {
        final band = _bands[i];
        final r0 = inner + bandW * i + 1.5, r1 = inner + bandW * (i + 1) - 1.5;
        // A sector at zone Z lights Z's band and every band beyond it, in
        // Z's colour (the obstacle "fills" the space up to the vehicle).
        final lit = z != ParkingZone.nothingClose && band.level <= z.level;
        final c = lit ? ParkingColors.of(z) : AppColors.elevated;
        final path = Path()
          ..arcTo(Rect.fromCircle(center: origin, radius: r1), a0, sweep, true)
          ..arcTo(
            Rect.fromCircle(center: origin, radius: r0),
            a0 + sweep,
            -sweep,
            false,
          )
          ..close();
        canvas.drawPath(
          path,
          Paint()..color = c.withValues(alpha: lit ? 1 : .9),
        );
        if (lit && e.key == nearestSide) {
          canvas.drawPath(
            path,
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = Colors.white,
          );
        }
      }
    }
    // Vehicle front (bumper outline).
    final car = RRect.fromRectAndCorners(
      Rect.fromCenter(
        center: Offset(origin.dx, origin.dy + carH / 2 + 2),
        width: carW,
        height: carH,
      ),
      topLeft: Radius.circular(carH * .7),
      topRight: Radius.circular(carH * .7),
      bottomLeft: const Radius.circular(3),
      bottomRight: const Radius.circular(3),
    );
    canvas.drawRRect(car, Paint()..color = AppColors.textSecondary);
    canvas.drawCircle(origin, 3.5, Paint()..color = AppColors.cyan);
  }

  @override
  bool shouldRepaint(ParkingSectorArcsPainter old) =>
      old.nearestSide != nearestSide || !_same(old.sectors, sectors);

  static bool _same(
    Map<ParkingSide, ParkingZone> a,
    Map<ParkingSide, ParkingZone> b,
  ) => ParkingSide.values.every((s) => a[s] == b[s]);
}

class ParkingSectorArcs extends StatelessWidget {
  const ParkingSectorArcs({super.key, required this.assessment});
  final ParkingAssessment assessment;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    String z(ParkingSide s) =>
        l10n.parkingZone(assessment.sectors[s] ?? ParkingZone.nothingClose);
    return Semantics(
      label: l10n.parkingSectorsLabel(
        z(ParkingSide.left),
        z(ParkingSide.centre),
        z(ParkingSide.right),
      ),
      excludeSemantics: true,
      child: CustomPaint(
        size: Size.infinite,
        painter: ParkingSectorArcsPainter(
          sectors: assessment.sectors,
          nearestSide: assessment.zone == ParkingZone.nothingClose
              ? null
              : assessment.nearest?.side,
        ),
      ),
    );
  }
}

/// Mute toggle, volume and the About button.
class ParkingSoundControls extends StatelessWidget {
  const ParkingSoundControls({
    super.key,
    required this.beepsOn,
    required this.volume,
    required this.onBeeps,
    required this.onVolume,
    required this.onAbout,
  });

  final bool beepsOn;
  final double volume;
  final ValueChanged<bool> onBeeps;
  final ValueChanged<double> onVolume;
  final VoidCallback onAbout;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      children: [
        Tooltip(
          message: beepsOn ? l10n.parkingMuteBeeps : l10n.parkingUnmuteBeeps,
          child: IconButton.filled(
            iconSize: 26,
            style: IconButton.styleFrom(
              minimumSize: const Size(48, 48),
              backgroundColor: beepsOn
                  ? AppColors.elevated
                  : ParkingColors.veryClose,
              foregroundColor: beepsOn ? AppColors.textPrimary : Colors.black,
            ),
            onPressed: () => onBeeps(!beepsOn),
            icon: Icon(
              beepsOn ? Icons.volume_up_rounded : Icons.volume_off_rounded,
              semanticLabel: beepsOn
                  ? l10n.parkingMuteBeeps
                  : l10n.parkingUnmuteBeeps,
            ),
          ),
        ),
        Expanded(
          child: Slider(
            value: volume.clamp(0.0, 1.0),
            label: l10n.parkingVolume,
            semanticFormatterCallback: (v) =>
                '${l10n.parkingVolume} ${(v * 100).round()}%',
            onChanged: beepsOn ? onVolume : null,
          ),
        ),
        Tooltip(
          message: l10n.parkingAbout,
          child: IconButton(
            iconSize: 26,
            style: IconButton.styleFrom(minimumSize: const Size(48, 48)),
            color: AppColors.textSecondary,
            onPressed: onAbout,
            icon: Icon(
              Icons.info_outline_rounded,
              semanticLabel: l10n.parkingAbout,
            ),
          ),
        ),
      ],
    );
  }
}

/// Small always-visible disclaimer chip, placed over the top of the camera
/// image (ceiling / sky — the least important part for parking).
class ParkingFrontOnlyChip extends StatelessWidget {
  const ParkingFrontOnlyChip({super.key});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.black.withValues(alpha: .62),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.videocam_outlined,
          size: 14,
          color: AppColors.textPrimary,
        ),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            context.l10n.parkingFrontOnly,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}

/// Provider-free parking layout (camera pane + status, sector arcs and
/// sound controls) for portrait and landscape. Used by `ParkingView` and the
/// render harness.
class ParkingLayout extends StatelessWidget {
  const ParkingLayout({
    super.key,
    required this.camera,
    required this.frameAspect,
    required this.assessment,
    required this.beepsOn,
    required this.volume,
    required this.onBeeps,
    required this.onVolume,
    required this.onAbout,
    this.contentPadding = EdgeInsets.zero,
  });

  /// Camera pane content (texture or image + boxes), fitted with
  /// [FrameFit.widthBottom].
  final Widget camera;

  /// Frame width / height (upright).
  final double frameAspect;
  final ParkingAssessment assessment;
  final bool beepsOn;
  final double volume;
  final ValueChanged<bool> onBeeps;
  final ValueChanged<double> onVolume;
  final VoidCallback onAbout;
  final EdgeInsets contentPadding;

  Widget _cameraPane() => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Stack(
      fit: StackFit.expand,
      children: [
        camera,
        const PositionedDirectional(
          top: 6,
          start: 6,
          end: 6,
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: ParkingFrontOnlyChip(),
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final controls = ParkingSoundControls(
      beepsOn: beepsOn,
      volume: volume,
      onBeeps: onBeeps,
      onVolume: onVolume,
      onAbout: onAbout,
    );
    final pad = contentPadding;
    return ColoredBox(
      color: AppColors.background,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          pad.left + 8,
          pad.top + 4,
          pad.right + 8,
          pad.bottom + 4,
        ),
        child: LayoutBuilder(
          builder: (context, c) {
            final aspect = frameAspect > 0 ? frameAspect : 16 / 9;
            if (c.maxWidth > c.maxHeight * 1.4) {
              // Landscape: camera at its full-width aspect on the start side.
              final camW = math.min(c.maxWidth * .52, c.maxHeight * aspect);
              return Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(width: camW, child: _cameraPane()),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ParkingStatusCard(
                          assessment: assessment,
                          compact: true,
                        ),
                        const SizedBox(height: 4),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: ParkingSectorArcs(
                                  assessment: assessment,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: SizedBox(
                                      width: 200,
                                      child: controls,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            // Portrait: camera on top (whole width, bottom never cropped),
            // then status, arcs and controls.
            final camH = (c.maxWidth / aspect).clamp(
              c.maxHeight * .36,
              c.maxHeight * .56,
            );
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: camH, child: _cameraPane()),
                const SizedBox(height: 8),
                ParkingStatusCard(assessment: assessment),
                const SizedBox(height: 4),
                Expanded(child: ParkingSectorArcs(assessment: assessment)),
                controls,
              ],
            );
          },
        ),
      ),
    );
  }
}

/// About dialog with the full limitations.
Future<void> showParkingAbout(BuildContext context) {
  final l10n = context.l10n;
  return showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(l10n.parkingAbout),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.parkingFrontOnly,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(l10n.parkingLimitationsDetail),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: Text(l10n.commonClose),
        ),
      ],
    ),
  );
}
