import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../maneuver.dart';

/// Custom-drawn maneuver arrow. Always drawn in real-world orientation (a
/// left turn points left even in right-to-left layouts).
class ManeuverIcon extends StatelessWidget {
  const ManeuverIcon({
    super.key,
    required this.maneuver,
    this.size = 64,
    this.color = Colors.white,
    this.dimColor,
    this.semanticLabel,
  });

  final Maneuver maneuver;
  final double size;
  final Color color;

  /// Colour of secondary strokes (other branch of a fork, roundabout ring).
  final Color? dimColor;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) => Semantics(
    label: semanticLabel,
    image: true,
    excludeSemantics: true,
    child: SizedBox.square(
      dimension: size,
      child: CustomPaint(
        painter: ManeuverPainter(
          maneuver,
          color: color,
          dim: dimColor ?? color.withValues(alpha: .32),
          textDirection: TextDirection.ltr,
        ),
      ),
    ),
  );
}

class ManeuverPainter extends CustomPainter {
  ManeuverPainter(
    this.m, {
    required this.color,
    required this.dim,
    required this.textDirection,
  });

  final Maneuver m;
  final Color color, dim;
  final TextDirection textDirection;

  static Offset _dir(double deg) {
    final r = deg * math.pi / 180;
    return Offset(math.sin(r), -math.cos(r));
  }

  Paint _stroke(double w, Color c) => Paint()
    ..color = c
    ..style = PaintingStyle.stroke
    ..strokeWidth = w
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  void _head(Canvas c, Offset tip, Offset dir, double s, Color col) {
    final perp = Offset(-dir.dy, dir.dx);
    final base = tip - dir * (s * .2);
    final p = Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(base.dx + perp.dx * s * .15, base.dy + perp.dy * s * .15)
      ..lineTo(base.dx - perp.dx * s * .15, base.dy - perp.dy * s * .15)
      ..close();
    c.drawPath(
      p,
      Paint()
        ..color = col
        ..style = PaintingStyle.fill,
    );
    c.drawPath(p, _stroke(s * .03, col)..strokeJoin = StrokeJoin.round);
  }

  /// Stem from the bottom to a pivot, then an arm at [angle]; returns tip.
  void _turn(
    Canvas c,
    Size sz,
    double angle, {
    double pivotY = .55,
    double arm = .3,
    Color? col,
    double width = .11,
    bool head = true,
  }) {
    final s = sz.width;
    final k = col ?? color;
    final d = _dir(angle);
    // Keep the arm inside the box horizontally.
    final pivot = Offset(.5 - d.dx * .1, pivotY) * s;
    final start = Offset(pivot.dx, s * .94);
    final armLen = arm * s;
    final end = pivot + d * armLen;
    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(pivot.dx, pivot.dy + s * .1)
      ..quadraticBezierTo(
        pivot.dx,
        pivot.dy,
        pivot.dx + d.dx * s * .1,
        pivot.dy + d.dy * s * .1,
      )
      ..lineTo(end.dx, end.dy);
    c.drawPath(path, _stroke(s * width, k));
    if (head) _head(c, end + d * s * .12, d, s, k);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width;
    switch (m.type) {
      case ManeuverType.depart:
      case ManeuverType.straight:
        _turn(canvas, size, 0, pivotY: .35, arm: .1);
      case ManeuverType.slightLeft:
        _turn(canvas, size, -40, pivotY: .5);
      case ManeuverType.slightRight:
        _turn(canvas, size, 40, pivotY: .5);
      case ManeuverType.left:
        _turn(canvas, size, -90, pivotY: .42, arm: .26);
      case ManeuverType.right:
        _turn(canvas, size, 90, pivotY: .42, arm: .26);
      case ManeuverType.sharpLeft:
        _turn(canvas, size, -140, pivotY: .3, arm: .26);
      case ManeuverType.sharpRight:
        _turn(canvas, size, 140, pivotY: .3, arm: .26);
      case ManeuverType.keepLeft:
      case ManeuverType.keepRight:
        final left = m.type == ManeuverType.keepLeft;
        _turn(canvas, size, left ? 25 : -25, col: dim, head: false, width: .08);
        _turn(canvas, size, left ? -25 : 25);
      case ManeuverType.mergeLeft:
      case ManeuverType.mergeRight:
        final fromRight = m.type == ManeuverType.mergeLeft;
        final side = Path()
          ..moveTo(s * (fromRight ? .82 : .18), s * .94)
          ..quadraticBezierTo(
            s * (fromRight ? .78 : .22),
            s * .6,
            s * .52,
            s * .45,
          );
        canvas.drawPath(side, _stroke(s * .11, color));
        canvas.drawLine(
          Offset(s * .42, s * .94),
          Offset(s * .42, s * .3),
          _stroke(s * .08, dim),
        );
        _head(canvas, Offset(s * .5, s * .1), const Offset(0, -1), s, color);
        canvas.drawLine(
          Offset(s * .52, s * .45),
          Offset(s * .5, s * .26),
          _stroke(s * .11, color),
        );
      case ManeuverType.uTurnLeft:
      case ManeuverType.uTurnRight:
        final left = m.type == ManeuverType.uTurnLeft;
        final x1 = s * (left ? .68 : .32), x2 = s * (left ? .3 : .7);
        final r = (x1 - x2).abs() / 2;
        final p = Path()
          ..moveTo(x1, s * .94)
          ..lineTo(x1, s * .42)
          ..arcToPoint(
            Offset(x2, s * .42),
            radius: Radius.circular(r),
            clockwise: !left,
          )
          ..lineTo(x2, s * .6);
        canvas.drawPath(p, _stroke(s * .11, color));
        _head(canvas, Offset(x2, s * .78), const Offset(0, 1), s, color);
      case ManeuverType.roundabout:
        final center = Offset(s * .5, s * .44);
        final r = s * .17;
        canvas.drawCircle(center, r, _stroke(s * .07, dim));
        // Entry from the bottom.
        canvas.drawLine(
          Offset(s * .5, s * .95),
          Offset(s * .5, center.dy + r),
          _stroke(s * .11, color),
        );
        // Exit arm: overall direction change; straight on when unknown.
        final a = (m.exitAngle ?? m.angle).clamp(-170.0, 170.0);
        final d = _dir(a);
        final from = center + d * r;
        final tip = center + d * (r + s * .2);
        // Travel (counter-clockwise for right-hand traffic) from the entry
        // to the exit along the ring.
        final startA = math.pi / 2; // bottom
        final exitA = math.atan2(d.dy, d.dx);
        var sweep = exitA - startA;
        if (m.leftHandTraffic) {
          // Left-hand traffic: clockwise circulation.
          while (sweep < 0) {
            sweep += 2 * math.pi;
          }
        } else {
          while (sweep > 0) {
            sweep -= 2 * math.pi;
          }
        }
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: r),
          startA,
          sweep,
          false,
          _stroke(s * .09, color),
        );
        canvas.drawLine(from, tip, _stroke(s * .11, color));
        _head(canvas, tip + d * s * .1, d, s, color);
        if (m.exit != null) {
          final tp = TextPainter(
            text: TextSpan(
              text: '${m.exit}',
              style: TextStyle(
                color: color,
                fontSize: s * .2,
                fontWeight: FontWeight.w800,
              ),
            ),
            textDirection: textDirection,
          )..layout();
          tp.paint(canvas, center - Offset(tp.width / 2, tp.height / 2));
        }
      case ManeuverType.arrive:
        // Pin with a dot.
        final c = Offset(s * .5, s * .38);
        final pin = Path()
          ..moveTo(s * .5, s * .92)
          ..cubicTo(s * .2, s * .62, s * .2, s * .14, s * .5, s * .14)
          ..cubicTo(s * .8, s * .14, s * .8, s * .62, s * .5, s * .92)
          ..close();
        canvas.drawPath(pin, Paint()..color = color);
        canvas.drawCircle(c, s * .1, Paint()..color = const Color(0xFF0E1A22));
    }
  }

  @override
  bool shouldRepaint(ManeuverPainter old) =>
      old.m != m || old.color != color || old.dim != dim;
}
