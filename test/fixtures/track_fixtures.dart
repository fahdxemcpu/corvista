import 'dart:ui';

import 'package:corvista/domain/models/detection.dart';
import 'package:corvista/domain/models/location_fix.dart';
import 'package:corvista/domain/models/object_class.dart';
import 'package:corvista/domain/models/tracked_object.dart';

const baseTsMs = 1700000000000.0;

Detection det(
  ObjectClass cls,
  double cx,
  double cy, {
  double w = 0.1,
  double h = 0.2,
  double conf = 0.9,
  LightState light = LightState.unknown,
  double lightConf = 0,
}) => Detection(
  cls: cls,
  confidence: conf,
  box: Rect.fromCenter(center: Offset(cx, cy), width: w, height: h),
  light: light,
  lightConfidence: lightConf,
);

DetectionFrame frame(double tS, List<Detection> dets) => DetectionFrame(
  ts: baseTsMs + tS * 1000,
  frameTs: baseTsMs + tS * 1000,
  frameSize: const Size(1280, 720),
  model: 'efficient',
  inferenceMs: 20,
  hz: 10,
  detections: dets,
);

TrackedObject track({
  int id = 1,
  ObjectClass cls = ObjectClass.car,
  Rect box = const Rect.fromLTWH(0.45, 0.4, 0.1, 0.2),
  double conf = 0.9,
  TrackState state = TrackState.confirmed,
  double dx = 0,
  double dy = 0,
  double scaleRate = 0,
  LightState light = LightState.unknown,
  double bearing = 0,
  double? range = 8,
  ProximityZone? zone,
  int missed = 0,
}) => TrackedObject(
  id: id,
  cls: cls,
  box: box,
  confidence: conf,
  state: state,
  ageFrames: 10,
  missedFrames: missed,
  lastSeenTs: baseTsMs,
  velocity: (dx: dx, dy: dy, scaleRate: scaleRate),
  light: light,
  bearingDeg: bearing,
  approxRangeM: range,
  zone:
      zone ??
      (range == null
          ? ProximityZone.unknown
          : range < 4
          ? ProximityZone.veryClose
          : range < 10
          ? ProximityZone.close
          : range < 25
          ? ProximityZone.medium
          : ProximityZone.far),
);

LocationFix fix({
  double lat = 48.8566,
  double lon = 2.3522,
  double hAcc = 5,
  double speed = 10,
  double course = 0,
  double heading = -1,
  double tsMs = baseTsMs,
}) => LocationFix(
  lat: lat,
  lon: lon,
  alt: 30,
  hAcc: hAcc,
  speed: speed,
  speedAcc: 1,
  course: course,
  heading: heading,
  headingAcc: 5,
  ts: tsMs,
);
