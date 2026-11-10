import 'dart:math' as math;
import 'dart:ui';

/// How the frame is fitted into the view.
enum FrameFit {
  /// `BoxFit.cover`, centred (default).
  cover,

  /// Full frame width visible, frame bottom aligned with the view bottom
  /// (the top is cropped or letterboxed). Parking: the near field at the
  /// bottom and both sides must never be cropped away.
  widthBottom,
}

/// Maps between normalized frame coordinates (0..1, top-left origin, upright
/// frame — see docs/BRIDGE.md) and view coordinates when a frame of
/// [frameSize] is drawn into [viewSize] with `BoxFit.cover` (centred).
///
/// Pure value type so it can be unit-tested and shared by the camera texture,
/// the detection overlay, the parking split view and the mask layer.
class CoverTransform {
  CoverTransform({
    required this.frameSize,
    required this.viewSize,
    this.fit = FrameFit.cover,
  }) : scale = (frameSize.isEmpty || viewSize.isEmpty)
           ? 1
           : fit == FrameFit.widthBottom
           ? viewSize.width / frameSize.width
           : math.max(
               viewSize.width / frameSize.width,
               viewSize.height / frameSize.height,
             ) {
    final w = frameSize.width * scale, h = frameSize.height * scale;
    frameRect = Rect.fromLTWH(
      (viewSize.width - w) / 2,
      fit == FrameFit.widthBottom
          ? viewSize.height - h
          : (viewSize.height - h) / 2,
      w,
      h,
    );
  }

  final FrameFit fit;

  final Size frameSize;
  final Size viewSize;

  /// Frame-pixel → view-point scale factor.
  final double scale;

  /// Where the whole frame lands in view coordinates (may exceed the view).
  late final Rect frameRect;

  bool get isValid => !frameSize.isEmpty && !viewSize.isEmpty;

  Offset mapPoint(Offset normalized) => Offset(
    frameRect.left + normalized.dx * frameRect.width,
    frameRect.top + normalized.dy * frameRect.height,
  );

  /// Normalized box → view rect (unclipped).
  Rect mapRect(Rect normalized) => Rect.fromLTRB(
    frameRect.left + normalized.left * frameRect.width,
    frameRect.top + normalized.top * frameRect.height,
    frameRect.left + normalized.right * frameRect.width,
    frameRect.top + normalized.bottom * frameRect.height,
  );

  /// View point → normalized frame point, clamped to 0..1.
  Offset toNormalized(Offset view) => Offset(
    ((view.dx - frameRect.left) / frameRect.width).clamp(0.0, 1.0),
    ((view.dy - frameRect.top) / frameRect.height).clamp(0.0, 1.0),
  );

  /// The visible part of the frame in normalized coordinates.
  Rect get visibleNormalized => Rect.fromLTRB(
    toNormalized(Offset.zero).dx,
    toNormalized(Offset.zero).dy,
    toNormalized(Offset(viewSize.width, viewSize.height)).dx,
    toNormalized(Offset(viewSize.width, viewSize.height)).dy,
  );

  @override
  bool operator ==(Object other) =>
      other is CoverTransform &&
      other.frameSize == frameSize &&
      other.viewSize == viewSize &&
      other.fit == fit;

  @override
  int get hashCode => Object.hash(frameSize, viewSize, fit);
}
