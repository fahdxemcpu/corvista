import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../domain/models/object_class.dart';
import 'cover_transform.dart';
import 'smoothed_tracks.dart';

/// Corner-bracket HUD boxes for tracked objects, mapped through the same
/// cover transform as the camera texture.
class DetectionOverlayPainter extends CustomPainter {
  DetectionOverlayPainter({
    required this.smoother,
    required this.frameSize,
    required this.labelFor,
    required this.showLabels,
    required this.showConfidence,
    this.opacity = 1,
    this.highContrast = false,
    this.tint,
    this.highlightId,
    super.repaint,
  });

  final TrackSmoother smoother;
  final Size frameSize;
  final String Function(ObjectClass cls) labelFor;
  final bool showLabels;
  final bool showConfidence;
  final double opacity;
  final bool highContrast;

  /// Overrides class colours (night HUD style).
  final Color? tint;

  /// Track drawn with an emphasised outline (e.g. nearest in parking view).
  final int? highlightId;

  @override
  void paint(Canvas canvas, Size size) {
    final tf = CoverTransform(frameSize: frameSize, viewSize: size);
    if (!tf.isValid) return;
    canvas.save();
    canvas.clipRect(Offset.zero & size);
    for (final s in smoother.items) {
      final r = tf.mapRect(s.box);
      if (r.width < 2 || r.height < 2) continue;
      // Objects in the part of the frame cropped away by the cover fit are
      // not drawn (a clamped label for an invisible box would be misleading).
      final visible = r.intersect(Offset.zero & size);
      if (visible.width < 6 || visible.height < 6) continue;
      final a = (s.opacity * opacity).clamp(0.0, 1.0);
      final base =
          tint ??
          (highContrast ? _contrastColor(s.track.cls) : s.track.cls.color);
      final color = base.withValues(alpha: a);
      final emphasised = s.track.id == highlightId;
      _brackets(
        canvas,
        r,
        color,
        emphasised ? 3.2 : (highContrast ? 2.8 : 2.0),
      );
      if (!highContrast) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(r, const Radius.circular(6)),
          Paint()..color = base.withValues(alpha: a * (emphasised ? .16 : .07)),
        );
      }
      // Track id dot.
      canvas.drawCircle(
        r.topLeft + const Offset(7, 7),
        3,
        Paint()..color = color,
      );
      if (showLabels) _label(canvas, r, s, base, a, size);
    }
    canvas.restore();
  }

  Color _contrastColor(ObjectClass c) => switch (c) {
    ObjectClass.person ||
    ObjectClass.bicycle ||
    ObjectClass.motorcycle => const Color(0xFFFFE600),
    ObjectClass.stopSign || ObjectClass.trafficLight => const Color(0xFFFF4040),
    _ => Colors.white,
  };

  void _brackets(Canvas canvas, Rect r, Color color, double stroke) {
    final len = math.min(22.0, math.min(r.width, r.height) * .28);
    final p = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    final path = Path()
      ..moveTo(r.left, r.top + len)
      ..lineTo(r.left, r.top)
      ..lineTo(r.left + len, r.top)
      ..moveTo(r.right - len, r.top)
      ..lineTo(r.right, r.top)
      ..lineTo(r.right, r.top + len)
      ..moveTo(r.right, r.bottom - len)
      ..lineTo(r.right, r.bottom)
      ..lineTo(r.right - len, r.bottom)
      ..moveTo(r.left + len, r.bottom)
      ..lineTo(r.left, r.bottom)
      ..lineTo(r.left, r.bottom - len);
    canvas.drawPath(path, p);
  }

  void _label(
    Canvas canvas,
    Rect r,
    SmoothedTrack s,
    Color base,
    double a,
    Size size,
  ) {
    final conf = showConfidence
        ? '  ${(s.track.confidence.clamp(0.0, 1.0) * 100).round()}%'
        : '';
    final tp = TextPainter(
      text: TextSpan(
        text: '${labelFor(s.track.cls)}$conf',
        style: TextStyle(
          color: (highContrast ? Colors.black : const Color(0xFF080C12))
              .withValues(alpha: a),
          fontSize: 11.5,
          fontWeight: FontWeight.w700,
          fontFeatures: const [FontFeature.tabularFigures()],
        ),
      ),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout(maxWidth: math.max(40, size.width * .6));
    const padH = 6.0, padV = 3.0;
    final w = tp.width + padH * 2, h = tp.height + padV * 2;
    var top = r.top - h - 3;
    if (top < 2) top = r.top + 3;
    final left = r.left
        .clamp(2.0, math.max(2.0, size.width - w - 2))
        .toDouble();
    final bg = RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, w, h),
      const Radius.circular(5),
    );
    canvas.drawRRect(bg, Paint()..color = base.withValues(alpha: a * .92));
    tp.paint(canvas, Offset(left + padH, top + padV));
  }

  @override
  bool shouldRepaint(DetectionOverlayPainter old) =>
      old.frameSize != frameSize ||
      old.showLabels != showLabels ||
      old.showConfidence != showConfidence ||
      old.opacity != opacity ||
      old.highContrast != highContrast ||
      old.tint != tint ||
      old.highlightId != highlightId;
}
