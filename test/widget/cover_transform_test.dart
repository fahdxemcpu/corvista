import 'dart:ui';

import 'package:corvista/features/detection/widgets/cover_transform.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const eps = 1e-9;

  void expectRect(Rect a, Rect b) {
    expect(a.left, closeTo(b.left, 1e-6));
    expect(a.top, closeTo(b.top, 1e-6));
    expect(a.right, closeTo(b.right, 1e-6));
    expect(a.bottom, closeTo(b.bottom, 1e-6));
  }

  group('CoverTransform (BoxFit.cover)', () {
    test('portrait 1080x1920 frame in a 390x844 view crops the sides', () {
      final tf = CoverTransform(
        frameSize: const Size(1080, 1920),
        viewSize: const Size(390, 844),
      );
      // scale = max(390/1080, 844/1920) = 844/1920 (height-limited).
      expect(tf.scale, closeTo(844 / 1920, eps));
      final w = 1080 * 844 / 1920;
      expectRect(tf.frameRect, Rect.fromLTWH((390 - w) / 2, 0, w, 844));
      // Full-frame normalized rect maps to the frame rect.
      expectRect(tf.mapRect(const Rect.fromLTWH(0, 0, 1, 1)), tf.frameRect);
      // Centre box stays centred.
      final r = tf.mapRect(const Rect.fromLTWH(.4, .4, .2, .2));
      expect(r.center.dx, closeTo(195, 1e-6));
      expect(r.center.dy, closeTo(422, 1e-6));
      expect(r.width, closeTo(.2 * w, 1e-6));
      expect(r.height, closeTo(.2 * 844, 1e-6));
    });

    test('landscape 1920x1080 frame in an 844x390 view crops top/bottom', () {
      final tf = CoverTransform(
        frameSize: const Size(1920, 1080),
        viewSize: const Size(844, 390),
      );
      expect(tf.scale, closeTo(844 / 1920, eps));
      final h = 1080 * 844 / 1920;
      expectRect(tf.frameRect, Rect.fromLTWH(0, (390 - h) / 2, 844, h));
      final r = tf.mapRect(const Rect.fromLTWH(0, 0, .5, .5));
      expectRect(r, Rect.fromLTWH(0, (390 - h) / 2, 422, h / 2));
    });

    test(
      'landscape frame in a portrait view (rotation mismatch) is width-cropped',
      () {
        final tf = CoverTransform(
          frameSize: const Size(1280, 720),
          viewSize: const Size(390, 844),
        );
        expect(tf.scale, closeTo(844 / 720, eps));
        expect(tf.frameRect.height, closeTo(844, 1e-6));
        expect(tf.frameRect.left, lessThan(0));
        expect(tf.frameRect.center.dx, closeTo(195, 1e-6));
      },
    );

    test('toNormalized inverts mapPoint and clamps outside the frame', () {
      final tf = CoverTransform(
        frameSize: const Size(1080, 1920),
        viewSize: const Size(390, 844),
      );
      const p = Offset(.3, .7);
      final v = tf.mapPoint(p);
      final back = tf.toNormalized(v);
      expect(back.dx, closeTo(p.dx, 1e-9));
      expect(back.dy, closeTo(p.dy, 1e-9));
      expect(tf.toNormalized(const Offset(-1000, -1000)), Offset.zero);
      expect(tf.toNormalized(const Offset(5000, 5000)), const Offset(1, 1));
    });

    test('visible region of a cropped frame is symmetric', () {
      final tf = CoverTransform(
        frameSize: const Size(1080, 1920),
        viewSize: const Size(390, 844),
      );
      final vis = tf.visibleNormalized;
      expect(vis.top, closeTo(0, 1e-9));
      expect(vis.bottom, closeTo(1, 1e-9));
      expect(vis.left, closeTo(1 - vis.right, 1e-9));
      expect(vis.left, greaterThan(0));
    });

    test('empty sizes are reported invalid', () {
      expect(
        CoverTransform(
          frameSize: Size.zero,
          viewSize: const Size(390, 844),
        ).isValid,
        isFalse,
      );
    });
    test('widthBottom keeps the full width and the bottom edge', () {
      // Wider pane than the frame aspect → letterbox at the top.
      final a = CoverTransform(
        frameSize: const Size(1280, 720),
        viewSize: const Size(400, 300),
        fit: FrameFit.widthBottom,
      );
      expect(a.frameRect.left, 0);
      expect(a.frameRect.width, 400);
      expect(a.frameRect.bottom, closeTo(300, 1e-9));
      // Taller frame (portrait phone) → the top is cropped, bottom kept.
      final b = CoverTransform(
        frameSize: const Size(720, 1280),
        viewSize: const Size(400, 300),
        fit: FrameFit.widthBottom,
      );
      expect(b.frameRect.width, 400);
      expect(b.frameRect.bottom, closeTo(300, 1e-9));
      expect(b.visibleNormalized.bottom, closeTo(1, 1e-9));
      expect(b.visibleNormalized.top, greaterThan(.5));
      expect(a == b, isFalse);
    });
  });
}
