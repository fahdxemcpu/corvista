import 'dart:typed_data';
import 'dart:ui';

import 'object_class.dart';

/// A single raw detection from the native detector for one frame.
/// Box is normalized (0..1), top-left origin, in the upright frame.
class Detection {
  const Detection({
    required this.cls,
    required this.confidence,
    required this.box,
    this.light = LightState.unknown,
    this.lightConfidence = 0,
  });

  final ObjectClass cls;
  final double confidence;
  final Rect box;
  final LightState light;
  final double lightConfidence;

  static Detection? fromMap(Map<Object?, Object?> m) {
    final cls = ObjectClass.fromId((m['cls'] as num).toInt());
    if (cls == null) return null;
    final x = (m['x'] as num).toDouble(), y = (m['y'] as num).toDouble();
    return Detection(
      cls: cls,
      confidence: (m['conf'] as num).toDouble(),
      box: Rect.fromLTWH(
        x,
        y,
        (m['w'] as num).toDouble(),
        (m['h'] as num).toDouble(),
      ),
      light: lightStateFrom(m['light'] as String?),
      lightConfidence: (m['lightConf'] as num?)?.toDouble() ?? 0,
    );
  }
}

/// One inference result from native.
class DetectionFrame {
  const DetectionFrame({
    required this.ts,
    required this.frameTs,
    required this.frameSize,
    required this.model,
    required this.inferenceMs,
    required this.hz,
    required this.detections,
  });

  final double ts;
  final double frameTs;
  final Size frameSize;
  final String model;
  final double inferenceMs;
  final double hz;
  final List<Detection> detections;

  static DetectionFrame fromMap(Map<Object?, Object?> m) => DetectionFrame(
    ts: (m['ts'] as num).toDouble(),
    frameTs: (m['frameTs'] as num?)?.toDouble() ?? (m['ts'] as num).toDouble(),
    frameSize: Size((m['w'] as num).toDouble(), (m['h'] as num).toDouble()),
    model: m['model'] as String? ?? '',
    inferenceMs: (m['inferenceMs'] as num?)?.toDouble() ?? 0,
    hz: (m['hz'] as num?)?.toDouble() ?? 0,
    detections: [
      for (final o in (m['objects'] as List? ?? const []))
        ?Detection.fromMap(o as Map<Object?, Object?>),
    ],
  );
}

/// Semantic class map for the full frame. Values: 0 none, 1..7 class+1, 8 road.
class SegmentationFrame {
  const SegmentationFrame({
    required this.ts,
    required this.frameSize,
    required this.mapWidth,
    required this.mapHeight,
    required this.classMap,
    required this.inferenceMs,
  });

  static const int road = 8;

  final double ts;
  final Size frameSize;
  final int mapWidth;
  final int mapHeight;
  final Uint8List classMap;
  final double inferenceMs;

  static SegmentationFrame fromMap(Map<Object?, Object?> m) =>
      SegmentationFrame(
        ts: (m['ts'] as num).toDouble(),
        frameSize: Size((m['w'] as num).toDouble(), (m['h'] as num).toDouble()),
        mapWidth: (m['mapW'] as num).toInt(),
        mapHeight: (m['mapH'] as num).toInt(),
        classMap: m['classMap'] as Uint8List,
        inferenceMs: (m['inferenceMs'] as num?)?.toDouble() ?? 0,
      );
}
