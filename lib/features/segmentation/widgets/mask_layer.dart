import 'dart:async';
import 'dart:isolate';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../domain/models/detection.dart';
import '../../detection/widgets/cover_transform.dart';
import '../seg_rate_meter.dart';

/// Live state of the mask pipeline, shown by the perception controls.
@immutable
class PerceptionStatus {
  const PerceptionStatus({
    this.hasMap = false,
    this.hz,
    this.stalled = false,
    this.presentMask = 0,
  });

  /// At least one segmentation map has been rendered.
  final bool hasMap;

  /// Maps per second (null until two maps arrived).
  final double? hz;

  /// No map for a few seconds.
  final bool stalled;

  /// Class-map values visible in the last raster (see [MaskRaster]).
  final int presentMask;

  @override
  bool operator ==(Object other) =>
      other is PerceptionStatus &&
      other.hasMap == hasMap &&
      other.hz?.toStringAsFixed(1) == hz?.toStringAsFixed(1) &&
      other.stalled == stalled &&
      other.presentMask == presentMask;

  @override
  int get hashCode =>
      Object.hash(hasMap, hz?.toStringAsFixed(1), stalled, presentMask);
}

/// A decoded raster ready to paint.
class _MaskFrame {
  _MaskFrame(this.image, this.raster);
  final ui.Image image;
  final MaskRaster raster;
  void dispose() => image.dispose();
}

/// Rasterizes each segmentation map off the UI thread, cross-fades between
/// consecutive maps (~200 ms) and paints them, smoothed, over the frame rect
/// of the same cover transform as the camera texture.
class MaskLayer extends ConsumerStatefulWidget {
  const MaskLayer({
    super.key,
    required this.transform,
    required this.showObjects,
    required this.showRoad,
    required this.opacity,
    this.status,
  });

  final CoverTransform transform;
  final bool showObjects;
  final bool showRoad;
  final double opacity;
  final ValueNotifier<PerceptionStatus>? status;

  static const fade = Duration(milliseconds: 200);

  /// Rasterizer entry point; a background isolate by default (the full
  /// pass — smoothing, fill, contours — takes several ms on a 224² map).
  @visibleForTesting
  static Future<MaskRaster> Function(MaskInput input) rasterizer =
      _rasterizeInIsolate;

  static Future<MaskRaster> _rasterizeInIsolate(MaskInput input) =>
      Isolate.run(() => MaskRasterizer.build(input));

  @override
  ConsumerState<MaskLayer> createState() => _MaskLayerState();
}

class _MaskLayerState extends ConsumerState<MaskLayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fade = AnimationController(
    vsync: this,
    duration: MaskLayer.fade,
    value: 1,
  );
  final _clock = Stopwatch()..start();
  final _meter = SegRateMeter();
  Timer? _stallTimer;
  _MaskFrame? _cur;
  _MaskFrame? _prev;
  bool _busy = false;
  SegmentationFrame? _pending;
  SegmentationFrame? _last;
  int _generation = 0;

  bool get _enabled => widget.showObjects || widget.showRoad;

  @override
  void initState() {
    super.initState();
    _stallTimer = Timer.periodic(const Duration(seconds: 1), (_) => _report());
    // A map may already be cached by the stream provider.
    final f = ref.read(segmentationFrameProvider).value;
    if (f != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _last == null) _onFrame(f);
      });
    }
  }

  @override
  void didUpdateWidget(MaskLayer old) {
    super.didUpdateWidget(old);
    if (old.showObjects != widget.showObjects ||
        old.showRoad != widget.showRoad) {
      // Layer toggles take effect immediately on the last map.
      _generation++;
      final f = _last;
      if (f != null && _enabled) {
        unawaited(_render(f));
      } else if (!_enabled) {
        setState(_clear);
      }
    }
  }

  @override
  void dispose() {
    _stallTimer?.cancel();
    _fade.dispose();
    _clear();
    super.dispose();
  }

  void _clear() {
    _prev?.dispose();
    _cur?.dispose();
    _prev = null;
    _cur = null;
  }

  void _report({MaskRaster? raster}) {
    final s = widget.status;
    if (s == null) return;
    s.value = PerceptionStatus(
      hasMap: s.value.hasMap || raster != null,
      hz: _meter.hz,
      stalled: _meter.isStalled(_clock.elapsed),
      presentMask: raster?.presentMask ?? s.value.presentMask,
    );
  }

  void _onFrame(SegmentationFrame f) {
    _meter.tick(_clock.elapsed);
    _last = f;
    if (_enabled) unawaited(_render(f));
    _report();
  }

  Future<void> _render(SegmentationFrame f) async {
    if (_busy) {
      _pending = f; // keep only the newest frame
      return;
    }
    _busy = true;
    final gen = _generation;
    try {
      final raster = await MaskLayer.rasterizer(
        MaskInput(
          classMap: f.classMap,
          mapWidth: f.mapWidth,
          mapHeight: f.mapHeight,
          instances: MaskRasterizer.instancesFrom(ref.read(tracksProvider)),
          showObjects: widget.showObjects,
          showRoad: widget.showRoad,
        ),
      );
      final img = await _decode(raster);
      if (!mounted || gen != _generation || !_enabled) {
        img.dispose();
        // A toggle happened meanwhile: render the newest map again.
        if (mounted && _enabled && _pending == null) _pending = _last;
        return;
      }
      setState(() {
        _prev?.dispose();
        _prev = _cur;
        _cur = _MaskFrame(img, raster);
      });
      if (_prev != null) {
        unawaited(_fade.forward(from: 0));
      } else {
        _fade.value = 1;
      }
      _report(raster: raster);
    } catch (_) {
      // Malformed frame: skip it; the next one replaces it.
    } finally {
      _busy = false;
      final next = _pending;
      _pending = null;
      if (next != null && mounted && _enabled) unawaited(_render(next));
    }
  }

  static Future<ui.Image> _decode(MaskRaster r) {
    final c = Completer<ui.Image>();
    ui.decodeImageFromPixels(
      r.rgba,
      r.width,
      r.height,
      ui.PixelFormat.rgba8888,
      c.complete,
    );
    return c.future;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(segmentationFrameProvider, (_, next) {
      final f = next.value;
      if (f != null) _onFrame(f);
    });
    final cur = _cur;
    if (cur == null || !_enabled) return const SizedBox.shrink();
    return Positioned.fill(
      child: IgnorePointer(
        child: RepaintBoundary(
          child: CustomPaint(
            painter: _MaskPainter(
              current: cur,
              previous: _prev,
              fade: _fade,
              frameRect: widget.transform.frameRect,
              opacity: widget.opacity.clamp(0.0, 1.0),
            ),
          ),
        ),
      ),
    );
  }
}

/// Paints the cross-faded mask rasters: smoothed fill (high-quality
/// upsampling + light blur), then a dark halo and a bright outline.
class _MaskPainter extends CustomPainter {
  _MaskPainter({
    required _MaskFrame current,
    required _MaskFrame? previous,
    required Animation<double> fade,
    required this.frameRect,
    required this.opacity,
  }) : _cur = current,
       _prev = previous,
       _fade = fade,
       super(repaint: fade);

  final _MaskFrame _cur;
  final _MaskFrame? _prev;
  final Animation<double> _fade;
  final Rect frameRect;
  final double opacity;
  static const blurSigma = 1.4;

  @override
  void paint(Canvas canvas, Size size) {
    if (opacity <= 0 || frameRect.isEmpty) return;
    final t = _fade.value.clamp(0.0, 1.0);
    final prev = t < 1 ? _prev : null;
    canvas.saveLayer(
      frameRect.inflate(4),
      Paint()..color = Color.fromRGBO(255, 255, 255, opacity),
    );
    // Fill: prev·(1−t) + cur·t (additive inside the layer = exact lerp).
    if (prev != null) _fill(canvas, prev, 1 - t, BlendMode.srcOver);
    _fill(
      canvas,
      _cur,
      prev == null ? 1 : t,
      prev == null ? BlendMode.srcOver : BlendMode.plus,
    );
    if (prev != null) _contours(canvas, prev.raster, 1 - t);
    _contours(canvas, _cur.raster, prev == null ? 1 : t);
    canvas.restore();
  }

  void _fill(Canvas canvas, _MaskFrame f, double a, BlendMode mode) {
    final img = f.image;
    canvas.drawImageRect(
      img,
      Rect.fromLTWH(0, 0, img.width.toDouble(), img.height.toDouble()),
      frameRect,
      Paint()
        ..color = Color.fromRGBO(0, 0, 0, a)
        ..blendMode = mode
        ..filterQuality = FilterQuality.high
        ..imageFilter = ui.ImageFilter.blur(
          sigmaX: blurSigma,
          sigmaY: blurSigma,
          tileMode: TileMode.clamp,
        ),
    );
  }

  void _contours(Canvas canvas, MaskRaster r, double a) {
    if (a <= 0.01 || r.contours.isEmpty) return;
    final pts = <Float32List>[for (final c in r.contours) _toView(c.lines)];
    final halo = Paint()
      ..color = Color.fromRGBO(0, 0, 0, 0.35 * a)
      ..strokeWidth = 3.2
      ..strokeCap = StrokeCap.round;
    for (var k = 0; k < pts.length; k++) {
      if (r.contours[k].weak) continue;
      canvas.drawRawPoints(ui.PointMode.lines, pts[k], halo);
    }
    final line = Paint()
      ..strokeWidth = 1.3
      ..strokeCap = StrokeCap.round;
    for (var k = 0; k < pts.length; k++) {
      final c = r.contours[k];
      final k0 = c.road ? 0.8 : (c.weak ? 0.4 : 0.95);
      line.color = Color(c.argb).withValues(alpha: k0 * a);
      canvas.drawRawPoints(ui.PointMode.lines, pts[k], line);
    }
  }

  Float32List _toView(Float32List n) {
    final out = Float32List(n.length);
    final l = frameRect.left, t = frameRect.top;
    final w = frameRect.width, h = frameRect.height;
    for (var i = 0; i < n.length; i += 2) {
      out[i] = l + n[i] * w;
      out[i + 1] = t + n[i + 1] * h;
    }
    return out;
  }

  @override
  bool shouldRepaint(_MaskPainter old) =>
      old._cur != _cur ||
      old._prev != _prev ||
      old.frameRect != frameRect ||
      old.opacity != opacity;
}
