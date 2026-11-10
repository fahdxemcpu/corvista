import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Original, subtle animated onboarding illustrations. Each painter takes a
/// looping phase `t` in 0..1 (held constant when motion is reduced).
abstract class _IllustrationPainter extends CustomPainter {
  _IllustrationPainter(this.t) : super(repaint: t);

  final Animation<double> t;

  Paint stroke(Color c, double w) => Paint()
    ..color = c
    ..style = PaintingStyle.stroke
    ..strokeWidth = w
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  void glow(Canvas canvas, Offset c, double r, Color color, double a) {
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..shader = RadialGradient(
          colors: [
            color.withValues(alpha: a),
            color.withValues(alpha: 0),
          ],
        ).createShader(Rect.fromCircle(center: c, radius: r)),
    );
  }

  @override
  bool shouldRepaint(covariant _IllustrationPainter old) => old.t != t;
}

/// 1 — Road in perspective with lane dashes flowing toward the viewer.
class RoadPainter extends _IllustrationPainter {
  RoadPainter(super.t);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final vp = Offset(w / 2, h * .32);
    glow(canvas, vp, w * .55, AppColors.cyan, .22);
    // Horizon arc.
    canvas.drawArc(
      Rect.fromCenter(
        center: vp + Offset(0, w * .9),
        width: w * 2.2,
        height: w * 1.8,
      ),
      math.pi * 1.32,
      math.pi * .36,
      false,
      stroke(AppColors.cyan.withValues(alpha: .35), 1.2),
    );
    final road = Path()
      ..moveTo(vp.dx - 6, vp.dy)
      ..lineTo(vp.dx + 6, vp.dy)
      ..lineTo(w * .98, h)
      ..lineTo(w * .02, h)
      ..close();
    canvas.drawPath(
      road,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0E1A26), Color(0xFF1B2A38)],
        ).createShader(Offset.zero & size),
    );
    canvas.drawLine(
      Offset(vp.dx - 6, vp.dy),
      Offset(w * .02, h),
      stroke(AppColors.cyan.withValues(alpha: .7), 2),
    );
    canvas.drawLine(
      Offset(vp.dx + 6, vp.dy),
      Offset(w * .98, h),
      stroke(AppColors.cyan.withValues(alpha: .7), 2),
    );
    // Flowing centre dashes (perspective spacing).
    for (var i = 0; i < 8; i++) {
      final k = (i + t.value) / 8;
      final d0 = math.pow(k, 2.2).toDouble(),
          d1 = math.pow(math.min(1, k + .055), 2.2).toDouble();
      final y0 = vp.dy + (h - vp.dy) * d0, y1 = vp.dy + (h - vp.dy) * d1;
      canvas.drawLine(
        Offset(vp.dx, y0),
        Offset(vp.dx, y1),
        stroke(
          AppColors.textPrimary.withValues(alpha: .25 + .6 * k),
          1 + 5 * k,
        ),
      );
    }
    // Speed readout capsule.
    final cap = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(w / 2, h * .16),
        width: w * .34,
        height: h * .1,
      ),
      Radius.circular(h * .05),
    );
    canvas.drawRRect(cap, Paint()..color = AppColors.glass);
    canvas.drawRRect(cap, stroke(AppColors.glassBorder, 1));
    for (var i = 0; i < 3; i++) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(w / 2 - w * .07 + i * w * .07, h * .16),
            width: w * .045,
            height: h * .045,
          ),
          const Radius.circular(3),
        ),
        Paint()
          ..color = (i == 1 ? AppColors.cyan : AppColors.textSecondary)
              .withValues(alpha: .8),
      );
    }
  }
}

/// 2 — Scanning frame: corner brackets locking onto shapes, sweeping scan line.
class ScanPainter extends _IllustrationPainter {
  ScanPainter(super.t);

  void brackets(Canvas canvas, Rect r, Color c, double lock) {
    final len = r.shortestSide * .26;
    final inset = (1 - lock) * 10;
    final rr = r.inflate(inset);
    final p = stroke(c, 2.4);
    for (final (corner, dx, dy) in [
      (rr.topLeft, 1.0, 1.0),
      (rr.topRight, -1.0, 1.0),
      (rr.bottomLeft, 1.0, -1.0),
      (rr.bottomRight, -1.0, -1.0),
    ]) {
      canvas.drawLine(corner, corner + Offset(len * dx, 0), p);
      canvas.drawLine(corner, corner + Offset(0, len * dy), p);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final frame = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * .06, h * .1, w * .88, h * .8),
      const Radius.circular(22),
    );
    canvas.drawRRect(frame, Paint()..color = const Color(0xFF0C141D));
    canvas.drawRRect(frame, stroke(AppColors.border, 1));
    canvas.save();
    canvas.clipRRect(frame);
    // Ground line + simple silhouettes.
    canvas.drawLine(
      Offset(w * .06, h * .7),
      Offset(w * .94, h * .7),
      stroke(AppColors.border, 1),
    );
    final car = Rect.fromLTWH(w * .2, h * .44, w * .34, h * .26);
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        car,
        topLeft: const Radius.circular(18),
        topRight: const Radius.circular(18),
      ),
      Paint()..color = AppColors.cyan.withValues(alpha: .18),
    );
    canvas.drawCircle(
      Offset(car.left + car.width * .22, car.bottom),
      h * .04,
      Paint()..color = AppColors.elevated,
    );
    canvas.drawCircle(
      Offset(car.right - car.width * .22, car.bottom),
      h * .04,
      Paint()..color = AppColors.elevated,
    );
    final person = Rect.fromLTWH(w * .66, h * .38, w * .1, h * .32);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          person.left + 4,
          person.top + person.height * .25,
          person.right - 4,
          person.bottom,
        ),
        const Radius.circular(10),
      ),
      Paint()..color = AppColors.amber.withValues(alpha: .22),
    );
    canvas.drawCircle(
      Offset(person.center.dx, person.top + person.height * .12),
      person.width * .26,
      Paint()..color = AppColors.amber.withValues(alpha: .22),
    );
    // Scan line.
    final y = h * .1 + h * .8 * t.value;
    canvas.drawRect(
      Rect.fromLTWH(0, y - 24, w, 24),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.cyan.withValues(alpha: 0),
            AppColors.cyan.withValues(alpha: .22),
          ],
        ).createShader(Rect.fromLTWH(0, y - 24, w, 24)),
    );
    canvas.drawLine(
      Offset(0, y),
      Offset(w, y),
      stroke(AppColors.cyan.withValues(alpha: .8), 1.2),
    );
    canvas.restore();
    final lockCar = ((t.value - .25) * 4).clamp(0.0, 1.0);
    final lockPerson = ((t.value - .1) * 4).clamp(0.0, 1.0);
    brackets(
      canvas,
      car.inflate(6),
      AppColors.cyan,
      Curves.easeOut.transform(lockCar),
    );
    brackets(
      canvas,
      person.inflate(6),
      AppColors.amber,
      Curves.easeOut.transform(lockPerson),
    );
  }
}

/// 3 — Three layered perspectives (camera, virtual, map) floating gently.
class LayersPainter extends _IllustrationPainter {
  LayersPainter(super.t);

  Path _card(Offset c, double w, double h) {
    // Isometric parallelogram.
    final dx = w / 2, dy = h / 2;
    return Path()
      ..moveTo(c.dx, c.dy - dy)
      ..lineTo(c.dx + dx, c.dy)
      ..lineTo(c.dx, c.dy + dy)
      ..lineTo(c.dx - dx, c.dy)
      ..close();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final colors = [AppColors.blue, AppColors.green, AppColors.cyan];
    final cw = w * .78, ch = h * .36;
    for (var i = 0; i < 3; i++) {
      final phase = math.sin((t.value + i / 3) * 2 * math.pi);
      final c = Offset(w / 2, h * (.72 - i * .2) + phase * 4);
      final path = _card(c, cw, ch);
      canvas.drawPath(
        path.shift(const Offset(0, 8)),
        Paint()..color = Colors.black.withValues(alpha: .35),
      );
      canvas.drawPath(
        path,
        Paint()..color = Color.lerp(AppColors.surface, colors[i], .16)!,
      );
      canvas.drawPath(path, stroke(colors[i].withValues(alpha: .85), 1.6));
      canvas.save();
      canvas.clipPath(path);
      if (i == 0) {
        // Map: grid + route.
        for (var k = -6; k <= 6; k++) {
          canvas.drawLine(
            c + Offset(k * cw / 12 - cw / 2, -ch),
            c + Offset(k * cw / 12 + cw / 2, ch),
            stroke(colors[i].withValues(alpha: .18), 1),
          );
        }
        final route = Path()
          ..moveTo(c.dx - cw * .3, c.dy + ch * .05)
          ..quadraticBezierTo(
            c.dx,
            c.dy - ch * .35,
            c.dx + cw * .25,
            c.dy - ch * .02,
          );
        canvas.drawPath(route, stroke(AppColors.cyan, 3));
      } else if (i == 1) {
        // Virtual: little extruded blocks.
        for (final o in [const Offset(-.12, .02), const Offset(.1, -.06)]) {
          final p = c + Offset(o.dx * cw, o.dy * ch);
          canvas.drawRect(
            Rect.fromCenter(center: p, width: cw * .08, height: ch * .16),
            Paint()..color = colors[i],
          );
          canvas.drawRect(
            Rect.fromCenter(
              center: p - Offset(0, ch * .1),
              width: cw * .08,
              height: ch * .05,
            ),
            Paint()..color = Color.lerp(colors[i], Colors.white, .4)!,
          );
        }
      } else {
        // Camera: brackets.
        final r = Rect.fromCenter(center: c, width: cw * .22, height: ch * .3);
        canvas.drawRect(r, stroke(AppColors.cyan, 2));
      }
      canvas.restore();
    }
  }
}

/// 4 — Clip timeline: frame strip, saved incident window, moving playhead.
class TimelinePainter extends _IllustrationPainter {
  TimelinePainter(super.t);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final strip = Rect.fromLTWH(w * .05, h * .32, w * .9, h * .32);
    const n = 6;
    final fw = strip.width / n;
    for (var i = 0; i < n; i++) {
      final r = Rect.fromLTWH(
        strip.left + i * fw + 3,
        strip.top,
        fw - 6,
        strip.height,
      );
      final rr = RRect.fromRectAndRadius(r, const Radius.circular(10));
      canvas.drawRRect(
        rr,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF13202D),
              Color.lerp(
                const Color(0xFF13202D),
                AppColors.blue,
                .25 + .1 * (i % 3),
              )!,
            ],
          ).createShader(r),
      );
      // Tiny road in each frame.
      canvas.drawLine(
        Offset(r.center.dx, r.top + r.height * .4),
        Offset(r.left + 6, r.bottom - 6),
        stroke(AppColors.textSecondary.withValues(alpha: .35), 1),
      );
      canvas.drawLine(
        Offset(r.center.dx, r.top + r.height * .4),
        Offset(r.right - 6, r.bottom - 6),
        stroke(AppColors.textSecondary.withValues(alpha: .35), 1),
      );
    }
    // Saved window (last part of buffer).
    final saved = Rect.fromLTRB(
      strip.left + fw * 3.0,
      strip.top - 10,
      strip.right,
      strip.bottom + 10,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(saved, const Radius.circular(14)),
      stroke(AppColors.red, 2.2),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(saved, const Radius.circular(14)),
      Paint()..color = AppColors.red.withValues(alpha: .08),
    );
    // Track + playhead.
    final ty = h * .8;
    canvas.drawLine(
      Offset(strip.left, ty),
      Offset(strip.right, ty),
      stroke(AppColors.border, 4),
    );
    final px = strip.left + strip.width * t.value;
    canvas.drawLine(
      Offset(strip.left, ty),
      Offset(px, ty),
      stroke(AppColors.cyan, 4),
    );
    canvas.drawCircle(Offset(px, ty), 8, Paint()..color = AppColors.cyan);
    canvas.drawLine(
      Offset(px, strip.top - 16),
      Offset(px, ty),
      stroke(AppColors.cyan.withValues(alpha: .5), 1.2),
    );
    // REC dot.
    final pulse = .5 + .5 * math.sin(t.value * 2 * math.pi * 2);
    canvas.drawCircle(
      Offset(strip.left + 10, h * .18),
      6,
      Paint()..color = AppColors.red.withValues(alpha: .5 + .5 * pulse),
    );
  }
}

/// 5 — Shield with check and slow concentric pulses.
class ShieldPainter extends _IllustrationPainter {
  ShieldPainter(super.t);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final c = Offset(w / 2, h * .5);
    final s = math.min(w, h) * .62;
    for (var i = 0; i < 3; i++) {
      final k = (t.value + i / 3) % 1;
      canvas.drawCircle(
        c,
        s * (.45 + k * .5),
        stroke(AppColors.green.withValues(alpha: (1 - k) * .35), 1.4),
      );
    }
    glow(canvas, c, s * .6, AppColors.green, .2);
    final shield = Path()
      ..moveTo(c.dx, c.dy - s * .5)
      ..cubicTo(
        c.dx + s * .2,
        c.dy - s * .38,
        c.dx + s * .36,
        c.dy - s * .38,
        c.dx + s * .4,
        c.dy - s * .4,
      )
      ..cubicTo(
        c.dx + s * .42,
        c.dy,
        c.dx + s * .3,
        c.dy + s * .34,
        c.dx,
        c.dy + s * .52,
      )
      ..cubicTo(
        c.dx - s * .3,
        c.dy + s * .34,
        c.dx - s * .42,
        c.dy,
        c.dx - s * .4,
        c.dy - s * .4,
      )
      ..cubicTo(
        c.dx - s * .36,
        c.dy - s * .38,
        c.dx - s * .2,
        c.dy - s * .38,
        c.dx,
        c.dy - s * .5,
      )
      ..close();
    canvas.drawPath(
      shield,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.green.withValues(alpha: .25),
            AppColors.cyan.withValues(alpha: .08),
          ],
        ).createShader(shield.getBounds()),
    );
    canvas.drawPath(shield, stroke(AppColors.green, 2.4));
    final check = Path()
      ..moveTo(c.dx - s * .16, c.dy)
      ..lineTo(c.dx - s * .03, c.dy + s * .13)
      ..lineTo(c.dx + s * .19, c.dy - s * .12);
    canvas.drawPath(check, stroke(AppColors.textPrimary, 4));
  }
}
