import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/domain/models/detection.dart';
import 'package:corvista/domain/models/object_class.dart';
import 'package:corvista/domain/models/tracked_object.dart';
import 'package:corvista/features/detection/placement_filter.dart';
import 'package:corvista/features/tracking/object_tracker.dart';
import 'package:corvista/features/virtual_view/widgets/scene_camera.dart';
import 'package:corvista/features/virtual_view/widgets/scene_smoother.dart';
import 'package:corvista/features/virtual_view/widgets/virtual_scene_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Replays real detector output (test/fixtures/drive_sequences, produced by
/// tools/model_eval on 10 fps frames of the test-footage videos) through the
/// production pipeline: ObjectTracker → PlacementFilter → SceneSmoother →
/// VirtualScenePainter. Asserts placement consistency and smoothness, and
/// writes a strip (camera frame + boxes above, virtual scene below, matching
/// track ids) for visual review when the frames are available locally.
const _scratch = String.fromEnvironment(
  'VIRTUAL_REPLAY_DIR',
  defaultValue:
      'build/qa',
);

const _sequences = {
  'city_krakow': false,
  'rural_road': false,
  'nz_left_traffic': true, // left-hand traffic
};

const _hfov = 68.0; // AppSettings.cameraFov default (unknown footage optics)

class _Frame {
  _Frame(this.tMs, this.image, this.dets);
  final double tMs;
  final String image;
  final List<Detection> dets;
}

List<_Frame> _load(String name) {
  final j = jsonDecode(
    File('test/fixtures/drive_sequences/$name.json').readAsStringSync(),
  ) as Map<String, Object?>;
  return [
    for (final f in (j['frames']! as List).cast<Map<String, Object?>>())
      _Frame((f['t']! as num).toDouble(), f['image']! as String, [
        for (final r in (f['d']! as List).cast<List<Object?>>())
          Detection(
            cls: ObjectClass.fromId((r[0]! as num).toInt())!,
            confidence: (r[1]! as num).toDouble(),
            box: Rect.fromLTWH(
              (r[2]! as num).toDouble(),
              (r[3]! as num).toDouble(),
              (r[4]! as num).toDouble(),
              (r[5]! as num).toDouble(),
            ),
            light: r.length > 6
                ? lightStateFrom(r[6] as String?)
                : LightState.unknown,
            lightConfidence: r.length > 7 ? (r[7]! as num).toDouble() : 0,
          ),
      ]),
  ];
}

Color _idColor(int id) =>
    HSVColor.fromAHSV(1, (id * 67.0) % 360, .75, 1).toColor();

void _label(Canvas c, String s, Offset at, Color color, {double size = 11}) {
  final tp = TextPainter(
    text: TextSpan(
      text: s,
      style: TextStyle(
        color: Colors.black,
        fontSize: size,
        fontWeight: FontWeight.w700,
        fontFamily: 'Roboto',
      ),
    ),
    textDirection: TextDirection.ltr,
  )..layout();
  final r = Rect.fromLTWH(at.dx, at.dy, tp.width + 6, tp.height + 2);
  c.drawRRect(
    RRect.fromRectAndRadius(r, const Radius.circular(3)),
    Paint()..color = color,
  );
  tp.paint(c, at + const Offset(3, 1));
}

Future<void> _loadFonts() async {
  final root = Platform.environment['FLUTTER_ROOT'];
  if (root == null) return;
  final f = File('$root/bin/cache/artifacts/material_fonts/Roboto-Bold.ttf');
  if (!f.existsSync()) return;
  final loader = FontLoader('Roboto')
    ..addFont(Future.value(ByteData.sublistView(f.readAsBytesSync())));
  await loader.load();
}

void main() {
  setUpAll(_loadFonts);

  for (final MapEntry(key: name, value: leftHand) in _sequences.entries) {
    testWidgets('replay $name: placement matches camera, moves smoothly', (
      tester,
    ) async {
      final frames = _load(name);
      final tracker = ObjectTracker();
      final filter = PlacementFilter(leftHand: leftHand);
      final smoother = SceneSmoother();
      const frameSize = Size(1280, 720);
      const base = 1.0e9; // epoch ms

      final picks = {20, 38, 56, 74, 92};
      final snaps = <(int, List<TrackedObject>, List<SceneItem>)>[];
      final lastX = <int, double>{}, lastD = <int, double>{};
      final lastT = <int, double>{};
      var maxObjects = 0, sideChecks = 0, sideMismatch = 0;

      for (var i = 0; i < frames.length; i++) {
        final f = frames[i];
        final tracks = tracker.update(
          DetectionFrame(
            ts: base + f.tMs,
            frameTs: base + f.tMs,
            frameSize: frameSize,
            model: 'YOLOX-S',
            inferenceMs: 30,
            hz: 10,
            detections: f.dets,
          ),
          hfovDeg: _hfov,
        );
        final placed = filter.update(
          tracks,
          tS: (base + f.tMs) / 1000,
          frameSize: frameSize,
          hfovDeg: _hfov,
        );
        maxObjects = math.max(maxObjects, placed.length);
        final byId = {for (final t in tracks) t.id: t};
        for (final p in placed) {
          final t = byId[p.id];
          expect(t, isNotNull, reason: 'placed object without a track');
          expect(t!.state, isNot(TrackState.tentative));
          expect(p.distanceM, inInclusiveRange(1.0, 66.0));
          // Left/right agrees with the camera image (clear cases only).
          final cx = t.box.center.dx - .5;
          if (!p.lost && cx.abs() > .12) {
            sideChecks++;
            if (cx.sign != p.lateralM.sign) sideMismatch++;
          }
          // Physically plausible motion between updates (40 m/s range
          // rate, 8 m/s lateral; the filter clamps each update).
          final fresh = t.missedFrames == 0;
          if (fresh && lastD[p.id] != null) {
            final dt = math.min(.5, (f.tMs - lastT[p.id]!) / 1000);
            expect((p.distanceM - lastD[p.id]!).abs(), lessThan(40 * dt + .05));
            expect((p.lateralM - lastX[p.id]!).abs(), lessThan(8 * dt + .05));
          }
          if (fresh) {
            lastD[p.id] = p.distanceM;
            lastX[p.id] = p.lateralM;
            lastT[p.id] = f.tMs;
          }
        }
        smoother.setTargets(placed);
        // Six display frames per detector frame, glide bounded per frame.
        for (var k = 0; k < 6; k++) {
          final before = {for (final s in smoother.items) s.id: s.x};
          smoother.tick(1 / 60);
          for (final s in smoother.items) {
            final b = before[s.id];
            if (b != null) expect((s.x - b).abs(), lessThan(1.6));
          }
        }
        if (picks.contains(i)) {
          snaps.add((
            i,
            tracks.where((t) => t.isConfirmed && t.missedFrames == 0).toList(),
            [
              for (final s in smoother.items)
                SceneItem(s.target, s.opacity)
                  ..x = s.x
                  ..depth = s.depth
                  ..alert = s.alert,
            ],
          ));
        }
      }
      expect(maxObjects, lessThanOrEqualTo(12));
      expect(sideChecks, greaterThan(20));
      expect(sideMismatch, 0, reason: 'objects drawn on the wrong side');

      // ---- visual strip (best effort; skipped without local frames).
      final frameDir = Directory('$_scratch/seq/$name');
      if (!frameDir.existsSync()) return;
      await tester.runAsync(() async {
        const colW = 360.0, camH = colW * 9 / 16, sceneH = 520.0;
        final rec = ui.PictureRecorder();
        final c = Canvas(rec);
        final total = Size(colW * snaps.length, camH + sceneH);
        c.drawRect(Offset.zero & total, Paint()..color = Colors.black);
        for (var k = 0; k < snaps.length; k++) {
          final (fi, tracks, items) = snaps[k];
          final ox = k * colW;
          final file = File('${frameDir.path}/${frames[fi].image}');
          if (file.existsSync()) {
            final codec = await ui.instantiateImageCodec(
              file.readAsBytesSync(),
              targetWidth: colW.toInt(),
            );
            final img = (await codec.getNextFrame()).image;
            c.drawImage(img, Offset(ox, 0), Paint());
          }
          for (final t in tracks) {
            final r = Rect.fromLTRB(
              ox + t.box.left * colW,
              t.box.top * camH,
              ox + t.box.right * colW,
              t.box.bottom * camH,
            );
            c.drawRect(
              r,
              Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1.5
                ..color = _idColor(t.id),
            );
            _label(
              c,
              '${t.id}',
              r.topLeft - const Offset(0, 13),
              _idColor(t.id),
              size: 9,
            );
          }
          _label(
            c,
            't=${(fi / 10).toStringAsFixed(1)}s',
            Offset(ox + 4, 4),
            Colors.white,
          );

          // Scene.
          c.save();
          c.translate(ox, camH);
          c.clipRect(Offset.zero & const Size(colW, sceneH));
          final sm = SceneSmoother()..snap = true;
          final placed = [for (final s in items) s.target];
          sm.setTargets(placed);
          sm.tick(1);
          for (final s in sm.items) {
            final src = items.firstWhere((e) => e.id == s.id);
            s
              ..x = src.x
              ..depth = src.depth
              ..alert = src.alert
              ..opacity = src.opacity;
          }
          const insets = EdgeInsets.only(top: 8, bottom: 40);
          VirtualScenePainter(
            smoother: sm,
            style: VirtualStyle.perspective,
            insets: insets,
            leftHand: leftHand,
          ).paint(c, const Size(colW, sceneH));
          final cam = SceneCamera(const Size(colW, sceneH), insets);
          for (final s in sm.items) {
            final z = SceneCamera.zFor(s.depth);
            final p = cam.project(cam.fitX(s.x, z), 1.9, z);
            _label(
              c,
              '${s.id}',
              p - const Offset(6, 14),
              _idColor(s.id),
              size: 9,
            );
          }
          c.restore();
          c.drawLine(
            Offset(ox, 0),
            Offset(ox, total.height),
            Paint()..color = Colors.white24,
          );
        }
        final img = await rec.endRecording().toImage(
          total.width.toInt(),
          total.height.toInt(),
        );
        final bytes = await img.toByteData(format: ui.ImageByteFormat.png);
        try {
          final out = Directory('$_scratch/replay')
            ..createSync(recursive: true);
          File('${out.path}/$name.png')
              .writeAsBytesSync(bytes!.buffer.asUint8List());
        } on FileSystemException {
          // Review output only.
        }
      });
    });
  }
}
