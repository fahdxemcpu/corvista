import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' show Color;

import '../../domain/models/object_class.dart';
import '../../domain/models/tracked_object.dart';

/// One tracked instance used to tint the object pixels inside its box.
/// Plain data so a [MaskInput] can be sent to a background isolate.
class MaskInstance {
  const MaskInstance({
    required this.value,
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
    required this.argb,
  });

  /// Class-map value of the instance's class (class id + 1).
  final int value;

  /// Box in normalized frame coordinates.
  final double left, top, right, bottom;

  /// Opaque instance colour (0xAARRGGBB).
  final int argb;

  double get area => (right - left) * (bottom - top);
}

/// Look of the rasterized mask. Alphas are before the user's opacity.
class MaskStyle {
  const MaskStyle({
    this.objectAlpha = 0.62,
    this.unmatchedAlpha = 0.3,
    this.roadNearAlpha = 0.62,
    this.roadFarAlpha = 0.16,
    this.roadColor = MaskRasterizer.roadColor,
    this.roadEdgeColor = MaskRasterizer.roadEdgeColor,
  });

  final double objectAlpha;

  /// Object pixels not confirmed by any tracked box of the same class (often
  /// DETR false positives, e.g. foliage as "traffic light") recede.
  final double unmatchedAlpha;

  /// Road alpha at the bottom of the frame (nearest to the car)…
  final double roadNearAlpha;

  /// …fading to this at the road's far edge (towards the horizon).
  final double roadFarAlpha;
  final Color roadColor;
  final Color roadEdgeColor;
}

/// Everything the rasterizer needs; sendable to an isolate.
class MaskInput {
  const MaskInput({
    required this.classMap,
    required this.mapWidth,
    required this.mapHeight,
    this.instances = const [],
    this.showObjects = true,
    this.showRoad = true,
    this.style = const MaskStyle(),
  });

  final Uint8List classMap;
  final int mapWidth;
  final int mapHeight;
  final List<MaskInstance> instances;
  final bool showObjects;
  final bool showRoad;
  final MaskStyle style;
}

/// A group of contour line segments drawn in one colour.
class MaskContour {
  const MaskContour({
    required this.argb,
    required this.lines,
    required this.road,
    this.weak = false,
  });

  final int argb;

  /// Flat list of segments in normalized frame coordinates:
  /// `x0, y0, x1, y1, x0, y0, x1, y1, …` (`Canvas.drawRawPoints` lines).
  final Float32List lines;
  final bool road;

  /// Outline of object pixels without a matching tracked box (drawn fainter).
  final bool weak;

  int get segmentCount => lines.length ~/ 4;
}

/// Result of [MaskRasterizer.build].
class MaskRaster {
  const MaskRaster({
    required this.rgba,
    required this.width,
    required this.height,
    required this.contours,
    required this.presentMask,
  });

  /// Premultiplied RGBA8888, row-major, [width]×[height] (= class map size).
  final Uint8List rgba;
  final int width;
  final int height;
  final List<MaskContour> contours;

  /// Bit `v` set when class-map value `v` (1..8) is visibly present in the
  /// drawn layers (used by the legend).
  final int presentMask;

  bool get isEmpty => presentMask == 0;

  /// Object classes visible in this raster, in enum order.
  List<ObjectClass> get presentClasses => [
    for (final c in ObjectClass.values)
      if (presentMask & (1 << (c.index + 1)) != 0) c,
  ];

  bool get hasRoad => presentMask & (1 << MaskRasterizer.road) != 0;
}

/// Pure segmentation-mask rasterizer: coarse class map (+ tracks) → smooth,
/// premultiplied RGBA at map size plus vector contours.
///
/// * **Speckle removal + inward feather**: each layer's binary mask is
///   smoothed with a separable [1 2 1] tent; pixel alpha is scaled by
///   `smoothstep(.35, .85, g)` so isolated single pixels vanish and edges
///   fade over ~1 map pixel. The UI adds bilinear upsampling + a light blur.
/// * **Road** (value 8): translucent vertical gradient, strongest at the
///   bottom of the frame, fading towards the road's far edge (horizon).
/// * **Objects** (1..7): per-class colour; pixels inside a confirmed track's
///   box of the same class get that instance's tint (smallest box wins).
/// * **Contours**: marching squares on the smoothed field at 0.5 with linear
///   interpolation → sub-pixel, smooth outlines per instance and road edge.
///   Samples outside the map are clamped, so no outline runs along the
///   frame border.
abstract final class MaskRasterizer {
  static const roadColor = Color(0xFF7B6CFF);
  static const roadEdgeColor = Color(0xFFB9AEFF);
  static const road = 8;

  /// Converts live tracks into rasterizer instances (confirmed/lost only).
  static List<MaskInstance> instancesFrom(Iterable<TrackedObject> tracks) => [
    for (final t in tracks)
      if (t.state != TrackState.tentative)
        MaskInstance(
          value: t.cls.index + 1,
          left: t.box.left,
          top: t.box.top,
          right: t.box.right,
          bottom: t.box.bottom,
          argb: instanceColor(t.cls, t.id).toARGB32(),
        ),
  ];

  /// Class colour with brightness modulated by the instance id (stable,
  /// distinguishable neighbours).
  static Color instanceColor(ObjectClass cls, int id) {
    final base = cls.color;
    // Golden-ratio sequence in [0.7, 1.15].
    final f = 0.7 + ((id * 0.6180339887) % 1.0) * 0.45;
    int ch(double c) => (c * 255 * f).round().clamp(0, 255);
    return Color.fromARGB(255, ch(base.r), ch(base.g), ch(base.b));
  }

  /// Lighter version of [c] for outlines.
  static int edgeArgb(int argb) {
    int lift(int v) => (v + (255 - v) * 0.45).round().clamp(0, 255);
    return 0xFF000000 |
        lift((argb >> 16) & 0xFF) << 16 |
        lift((argb >> 8) & 0xFF) << 8 |
        lift(argb & 0xFF);
  }

  /// Road alpha per map row: [MaskStyle.roadNearAlpha] at the bottom row,
  /// easing to [MaskStyle.roadFarAlpha] at [horizonRow].
  static double roadAlphaAt(int row, int horizonRow, int height, MaskStyle s) {
    final span = math.max(1, height - 1 - horizonRow);
    final t = ((row - horizonRow) / span).clamp(0.0, 1.0);
    final e = math.pow(t, 1.1).toDouble();
    return s.roadFarAlpha + (s.roadNearAlpha - s.roadFarAlpha) * e;
  }

  /// Top-most row that holds a meaningful amount of road (≥ 1 % of the
  /// width, at least 2 px), or `height` when there is none.
  static int horizonRow(Uint8List map, int w, int h) {
    final need = math.max(2, (w * 0.01).ceil());
    for (var y = 0; y < h; y++) {
      var n = 0;
      final row = y * w;
      for (var x = 0; x < w; x++) {
        if (map[row + x] == road && ++n >= need) return y;
      }
    }
    return h;
  }

  static MaskRaster build(MaskInput i) {
    final w = i.mapWidth, h = i.mapHeight, map = i.classMap;
    if (w <= 0 || h <= 0 || map.length < w * h) {
      throw ArgumentError('classMap shorter than mapWidth*mapHeight');
    }
    final out = Uint8List(w * h * 4);
    final contours = <MaskContour>[];
    var present = 0;
    if (!i.showObjects && !i.showRoad) {
      return MaskRaster(
        rgba: out,
        width: w,
        height: h,
        contours: contours,
        presentMask: 0,
      );
    }

    // Bounding box per value (1..8) in one pass.
    final x0 = List.filled(9, w), y0 = List.filled(9, h);
    final x1 = List.filled(9, -1), y1 = List.filled(9, -1);
    for (var y = 0; y < h; y++) {
      final row = y * w;
      for (var x = 0; x < w; x++) {
        final v = map[row + x];
        if (v == 0 || v > 8) continue;
        if (x < x0[v]) x0[v] = x;
        if (x > x1[v]) x1[v] = x;
        if (y < y0[v]) y0[v] = y;
        if (y > y1[v]) y1[v] = y;
      }
    }

    // Instance ownership: paint boxes largest first so the smallest wins.
    final owner = Int16List(w * h)..fillRange(0, w * h, -1);
    final inst = i.showObjects
        ? (List<MaskInstance>.of(i.instances)
            ..sort((a, b) => b.area.compareTo(a.area)))
        : const <MaskInstance>[];
    for (var k = 0; k < inst.length; k++) {
      final m = inst[k];
      if (m.value < 1 || m.value > 7 || x1[m.value] < 0) continue;
      final bx0 = math.max(0, (m.left * w).floor());
      final by0 = math.max(0, (m.top * h).floor());
      final bx1 = math.min(w, (m.right * w).ceil());
      final by1 = math.min(h, (m.bottom * h).ceil());
      for (var y = by0; y < by1; y++) {
        final row = y * w;
        for (var x = bx0; x < bx1; x++) {
          if (map[row + x] == m.value) owner[row + x] = k;
        }
      }
    }

    // Scratch buffers reused across layers.
    final tmp = Uint8List(w * h);
    final g = Uint8List(w * h); // smoothed field, 0..16

    final horizon = i.showRoad ? horizonRow(map, w, h) : h;
    final roadAlpha = Float32List(h);
    if (i.showRoad) {
      for (var y = 0; y < h; y++) {
        roadAlpha[y] = roadAlphaAt(y, horizon, h, i.style);
      }
    }

    final classArgb = [for (final c in ObjectClass.values) c.color.toARGB32()];

    // Road first, objects drawn over it.
    final layers = <int>[
      if (i.showRoad) road,
      if (i.showObjects)
        for (var v = 1; v <= 7; v++) v,
    ];
    for (final v in layers) {
      if (x1[v] < 0) continue;
      // Work on the bbox grown by 2 (tent radius 1 + marching cell).
      final bx0 = math.max(0, x0[v] - 2), bx1 = math.min(w - 1, x1[v] + 2);
      final by0 = math.max(0, y0[v] - 2), by1 = math.min(h - 1, y1[v] + 2);
      _smooth(map, v, w, h, bx0, by0, bx1, by1, tmp, g);

      var drawn = false;
      final isRoad = v == road;
      final classPx = isRoad ? i.style.roadColor.toARGB32() : classArgb[v - 1];
      for (var y = by0; y <= by1; y++) {
        final row = y * w;
        for (var x = bx0; x <= bx1; x++) {
          final p = row + x;
          if (map[p] != v) continue;
          // smoothstep(.35, .85, g/16)
          final t = ((g[p] / 16.0 - 0.35) / 0.5).clamp(0.0, 1.0);
          final f = t * t * (3 - 2 * t);
          if (f <= 0) continue;
          final int argb;
          final double a;
          if (isRoad) {
            argb = classPx;
            a = roadAlpha[y];
          } else {
            final o = owner[p];
            argb = o >= 0 ? inst[o].argb : classPx;
            a = o >= 0 ? i.style.objectAlpha : i.style.unmatchedAlpha;
          }
          final alpha = a * f;
          if (alpha <= 0.004) continue;
          _over(out, p * 4, argb, alpha);
          drawn = true;
        }
      }
      if (!drawn) continue;
      present |= 1 << v;
      _march(
        g: g,
        map: map,
        value: v,
        owner: owner,
        inst: inst,
        w: w,
        h: h,
        bx0: bx0,
        by0: by0,
        bx1: bx1,
        by1: by1,
        colorFor: isRoad
            ? (_) => i.style.roadEdgeColor.toARGB32()
            : (o) => edgeArgb(o >= 0 ? inst[o].argb : classPx),
        road: isRoad,
        // Where the road meets a drawn object, the object's own outline
        // marks the edge; skip the road's to avoid doubled lines.
        skipObjects: isRoad && i.showObjects,
        sink: contours,
      );
    }

    return MaskRaster(
      rgba: out,
      width: w,
      height: h,
      contours: contours,
      presentMask: present,
    );
  }

  /// Separable [1 2 1] tent of the binary layer `map == v` over the bbox,
  /// clamping samples to the map. Result in 0..16 (16 = fully inside).
  static void _smooth(
    Uint8List map,
    int v,
    int w,
    int h,
    int bx0,
    int by0,
    int bx1,
    int by1,
    Uint8List tmp,
    Uint8List g,
  ) {
    int b(int x, int y) => map[y * w + x] == v ? 1 : 0;
    // Horizontal pass needs one extra row above/below for the vertical pass.
    final ry0 = math.max(0, by0 - 1), ry1 = math.min(h - 1, by1 + 1);
    for (var y = ry0; y <= ry1; y++) {
      for (var x = bx0; x <= bx1; x++) {
        final l = b(math.max(0, x - 1), y), r = b(math.min(w - 1, x + 1), y);
        tmp[y * w + x] = l + 2 * b(x, y) + r; // 0..4
      }
    }
    for (var y = by0; y <= by1; y++) {
      final u = math.max(0, y - 1), d = math.min(h - 1, y + 1);
      for (var x = bx0; x <= bx1; x++) {
        g[y * w + x] = tmp[u * w + x] + 2 * tmp[y * w + x] + tmp[d * w + x];
      }
    }
  }

  /// Premultiplied source-over of colour [argb] at [alpha] into [out] at [o].
  static void _over(Uint8List out, int o, int argb, double alpha) {
    final sa = alpha.clamp(0.0, 1.0);
    final sr = ((argb >> 16) & 0xFF) * sa;
    final sg = ((argb >> 8) & 0xFF) * sa;
    final sb = (argb & 0xFF) * sa;
    final inv = 1 - sa;
    out[o] = (sr + out[o] * inv).round().clamp(0, 255);
    out[o + 1] = (sg + out[o + 1] * inv).round().clamp(0, 255);
    out[o + 2] = (sb + out[o + 2] * inv).round().clamp(0, 255);
    out[o + 3] = (sa * 255 + out[o + 3] * inv).round().clamp(0, 255);
  }

  /// Marching squares at iso 8/16 over cells between pixel centres in the
  /// bbox. Segments are grouped by colour (instance-aware for objects).
  static void _march({
    required Uint8List g,
    required Uint8List map,
    required int value,
    required Int16List owner,
    required List<MaskInstance> inst,
    required int w,
    required int h,
    required int bx0,
    required int by0,
    required int bx1,
    required int by1,
    required int Function(int owner) colorFor,
    required bool road,
    required bool skipObjects,
    required List<MaskContour> sink,
  }) {
    const iso = 8.0;
    final groups = <int, List<double>>{};
    final sx = 1.0 / w, sy = 1.0 / h;
    // Cells span pixel centres (x, x+1); sampling clamped inside the bbox
    // field (outside it the field is 0 by construction of the bbox margin,
    // except at the map border where the clamped value is used).
    double gv(int x, int y) {
      final cx = x.clamp(bx0, bx1), cy = y.clamp(by0, by1);
      return g[cy * w + cx].toDouble();
    }

    for (var y = by0; y < by1; y++) {
      for (var x = bx0; x < bx1; x++) {
        final a = gv(x, y), b = gv(x + 1, y);
        final c = gv(x + 1, y + 1), d = gv(x, y + 1);
        var idx = 0;
        if (a >= iso) idx |= 8;
        if (b >= iso) idx |= 4;
        if (c >= iso) idx |= 2;
        if (d >= iso) idx |= 1;
        if (idx == 0 || idx == 15) continue;

        // Edge crossing points in pixel-centre space (+0.5 → pixel coords).
        double lerp(double p, double q) => (iso - p) / (q - p);
        final top = (x + lerp(a, b), y.toDouble());
        final right = ((x + 1).toDouble(), y + lerp(b, c));
        final bottom = (x + lerp(d, c), (y + 1).toDouble());
        final left = (x.toDouble(), y + lerp(a, d));

        if (skipObjects) {
          bool obj(int px, int py) {
            final v = map[py * w + px];
            return v >= 1 && v <= 7;
          }

          if (obj(x, y) ||
              obj(x + 1, y) ||
              obj(x + 1, y + 1) ||
              obj(x, y + 1)) {
            continue;
          }
        }

        // Colour from an inside corner (prefer one of this class).
        var o = -1;
        for (final (px, py) in [
          (x, y),
          (x + 1, y),
          (x + 1, y + 1),
          (x, y + 1),
        ]) {
          final p = py * w + px;
          if (map[p] == value) {
            o = owner[p];
            if (o >= 0) break;
          }
        }
        // Key: colour, plus bit 32 for "weak" (no matching instance).
        final key = colorFor(o) | (!road && o < 0 ? 1 << 32 : 0);
        final list = groups.putIfAbsent(key, () => <double>[]);
        void seg((double, double) p, (double, double) q) {
          list
            ..add((p.$1 + 0.5) * sx)
            ..add((p.$2 + 0.5) * sy)
            ..add((q.$1 + 0.5) * sx)
            ..add((q.$2 + 0.5) * sy);
        }

        switch (idx) {
          case 1 || 14:
            seg(left, bottom);
          case 2 || 13:
            seg(bottom, right);
          case 3 || 12:
            seg(left, right);
          case 4 || 11:
            seg(top, right);
          case 6 || 9:
            seg(top, bottom);
          case 7 || 8:
            seg(left, top);
          case 5 || 10:
            // Saddle: decide by the centre average.
            final centre = (a + b + c + d) / 4 >= iso;
            if ((idx == 5) == centre) {
              seg(left, top);
              seg(bottom, right);
            } else {
              seg(left, bottom);
              seg(top, right);
            }
        }
      }
    }
    for (final e in groups.entries) {
      sink.add(
        MaskContour(
          argb: e.key & 0xFFFFFFFF,
          lines: Float32List.fromList(e.value),
          road: road,
          weak: e.key > 0xFFFFFFFF,
        ),
      );
    }
  }
}
