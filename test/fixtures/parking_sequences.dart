import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:corvista/domain/models/detection.dart';
import 'package:corvista/domain/models/tracked_object.dart';
import 'package:corvista/features/parking/parking_proximity.dart';
import 'package:corvista/features/tracking/object_tracker.dart';

/// Real parking footage detection sequences (see
/// test/fixtures/parking_sequences/README.md): per-frame YOLOX-S detections
/// dumped by `tools/model_eval/run_eval.sh --sequence`.
class ParkingSequence {
  ParkingSequence(this.name, this.fps, this.frameSize, this.frames, this.files);

  final String name;
  final double fps;
  final Size frameSize;
  final List<DetectionFrame> frames;

  /// Source frame file names (f_0001.jpg …), parallel to [frames].
  final List<String> files;

  static const names = ['garage_tuebingen', 'garage_franconia', 'lot_monmouth'];

  static ParkingSequence load(String name) {
    final m = jsonDecode(
      File('test/fixtures/parking_sequences/$name.json').readAsStringSync(),
    ) as Map<String, dynamic>;
    final size = Size(
      (m['width'] as num).toDouble(),
      (m['height'] as num).toDouble(),
    );
    final frames = <DetectionFrame>[];
    final files = <String>[];
    for (final f in (m['frames'] as List).cast<Map<String, dynamic>>()) {
      final tMs = 1.7e12 + (f['t'] as num).toDouble() * 1000;
      frames.add(
        DetectionFrame.fromMap({
          'ts': tMs,
          'frameTs': tMs,
          'w': size.width,
          'h': size.height,
          'model': m['model'],
          'objects': f['objects'],
        }),
      );
      files.add(f['frame'] as String);
    }
    return ParkingSequence(
      name,
      (m['fps'] as num).toDouble(),
      size,
      frames,
      files,
    );
  }
}

/// One replayed step: tracker output + parking assessment.
typedef ParkingStep = ({
  double tS,
  List<TrackedObject> tracks,
  ParkingAssessment assessment,
});

/// Feeds [seq] through the app's tracker and parking model.
List<ParkingStep> replayParking(
  ParkingSequence seq, {
  double hfovDeg = 68,
  ParkingProximity? model,
}) {
  final tracker = ObjectTracker();
  final m = model ?? ParkingProximity();
  return [
    for (final f in seq.frames)
      () {
        final tracks = tracker.update(f, hfovDeg: hfovDeg);
        final tS = f.frameTs / 1000;
        return (
          tS: tS - 1.7e9,
          tracks: tracks,
          assessment: m.evaluate(
            tracks,
            frameSize: seq.frameSize,
            hfovDeg: hfovDeg,
            tsS: tS,
          ),
        );
      }(),
  ];
}
