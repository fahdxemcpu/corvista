import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:corvista/domain/models/object_class.dart';
import 'package:corvista/domain/models/tracked_object.dart';
import 'package:corvista/features/segmentation/mask_rasterizer.dart';
import 'package:corvista/features/segmentation/seg_rate_meter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/track_fixtures.dart';

const _w = 40, _h = 30;
const _person = 1, _car = 4, _road = MaskRasterizer.road;

/// 40×30 map: road on the bottom 10 rows, a person block (x 4..11, y 8..17)
/// and a car block (x 20..31, y 6..19); everything else none.
Uint8List _map() {
  final m = Uint8List(_w * _h);
  for (var y = 0; y < _h; y++) {
    for (var x = 0; x < _w; x++) {
      var v = 0;
      if (y >= 20) v = _road;
      if (x >= 4 && x < 12 && y >= 8 && y < 18) v = _person;
      if (x >= 20 && x < 32 && y >= 6 && y < 20) v = _car;
      m[y * _w + x] = v;
    }
  }
  return m;
}

List<int> _px(MaskRaster r, int x, int y) {
  final o = (y * r.width + x) * 4;
  return r.rgba.sublist(o, o + 4);
}

MaskRaster _build({
  Uint8List? map,
  List<MaskInstance> instances = const [],
  bool showObjects = true,
  bool showRoad = true,
  int w = _w,
  int h = _h,
}) => MaskRasterizer.build(
  MaskInput(
    classMap: map ?? _map(),
    mapWidth: w,
    mapHeight: h,
    instances: instances,
    showObjects: showObjects,
    showRoad: showRoad,
  ),
);

MaskInstance _inst(int value, Rect r, Color c) => MaskInstance(
  value: value,
  left: r.left,
  top: r.top,
  right: r.right,
  bottom: r.bottom,
  argb: c.toARGB32(),
);

void main() {
  const style = MaskStyle();

  test('output is mapW*mapH premultiplied RGBA; present classes reported', () {
    final r = _build();
    expect(r.rgba.length, _w * _h * 4);
    expect(r.presentClasses, [ObjectClass.person, ObjectClass.car]);
    expect(r.hasRoad, isTrue);
    expect(r.isEmpty, isFalse);
    // Premultiplied: no channel exceeds alpha.
    for (var i = 0; i < r.rgba.length; i += 4) {
      expect(r.rgba[i], lessThanOrEqualTo(r.rgba[i + 3]));
      expect(r.rgba[i + 1], lessThanOrEqualTo(r.rgba[i + 3]));
      expect(r.rgba[i + 2], lessThanOrEqualTo(r.rgba[i + 3]));
    }
  });

  test('interior gets the full layer alpha, edges are feathered inward', () {
    final r = _build();
    final inner = _px(r, 8, 12)[3], edge = _px(r, 4, 12)[3];
    expect(inner, (style.unmatchedAlpha * 255).round());
    expect(edge, greaterThan(0));
    expect(edge, lessThan(inner));
    // Outside the layer stays transparent (the UI blur feathers outward).
    expect(_px(r, 3, 12), [0, 0, 0, 0]);
  });

  test('isolated specks are removed from fill, contours and legend', () {
    final m = Uint8List(_w * _h);
    m[10 * _w + 10] = _car; // single pixel
    m[20 * _w + 20] = _person; // 1×2 sliver
    m[21 * _w + 20] = _person;
    final r = _build(map: m);
    expect(r.rgba.every((v) => v == 0), isTrue);
    expect(r.contours, isEmpty);
    expect(r.isEmpty, isTrue);
  });

  test(
    'instance tint inside matching boxes; smallest box wins; class gating',
    () {
      const a = Color(0xFFFF0000),
          b = Color(0xFF00FF00),
          carC = Color(0xFF0000FF);
      final r = _build(
        instances: [
          // Big person box covering the whole person block…
          _inst(_person, const Rect.fromLTWH(0, 0, 0.5, 1), a),
          // …and a smaller one over its right half (wins there).
          _inst(_person, const Rect.fromLTRB(8 / _w, 0, 12 / _w, 1), b),
          // A car box over everything must not tint person pixels.
          _inst(_car, const Rect.fromLTWH(0, 0, 1, 1), carC),
        ],
      );
      final left = _px(r, 6, 12), right = _px(r, 9, 12), car = _px(r, 25, 12);
      final full = (style.objectAlpha * 255).round();
      expect(left, [full, 0, 0, full]);
      expect(right, [0, full, 0, full]);
      expect(car, [0, 0, full, full]);
    },
  );

  test('instancesFrom skips tentative tracks and keeps ids distinct', () {
    final inst = MaskRasterizer.instancesFrom([
      track(id: 1, cls: ObjectClass.car),
      track(id: 2, cls: ObjectClass.car),
      track(id: 3, cls: ObjectClass.person, state: TrackState.tentative),
    ]);
    expect(inst.map((i) => i.value), [_car, _car]);
    expect(inst[0].argb, isNot(inst[1].argb));
  });

  test('road is a vertical gradient: strongest at the bottom', () {
    final r = _build(showObjects: false);
    final top = _px(r, 2, 21)[3], bottom = _px(r, 2, 28)[3];
    expect(top, greaterThan(0));
    expect(bottom, greaterThan(top));
    expect(MaskRasterizer.horizonRow(_map(), _w, _h), 20);
    final a0 = MaskRasterizer.roadAlphaAt(20, 20, _h, style);
    final a1 = MaskRasterizer.roadAlphaAt(_h - 1, 20, _h, style);
    expect(a0, closeTo(style.roadFarAlpha, 1e-9));
    expect(a1, closeTo(style.roadNearAlpha, 1e-9));
    expect(MaskRasterizer.horizonRow(Uint8List(_w * _h), _w, _h), _h);
  });

  test('layer toggles are independent', () {
    final noRoad = _build(showRoad: false);
    expect(_px(noRoad, 2, 28), [0, 0, 0, 0]);
    expect(noRoad.hasRoad, isFalse);
    expect(_px(noRoad, 8, 12)[3], greaterThan(0));
    final noObj = _build(showObjects: false);
    expect(_px(noObj, 8, 12), [0, 0, 0, 0]);
    expect(noObj.presentClasses, isEmpty);
    final none = _build(showObjects: false, showRoad: false);
    expect(none.rgba.every((v) => v == 0), isTrue);
    expect(none.contours, isEmpty);
  });

  test('contours hug the region boundary with sub-pixel smooth lines', () {
    final r = _build(showRoad: false);
    final person = r.contours.where((c) => !c.road).toList();
    expect(person, isNotEmpty);
    // Every endpoint of the car outline lies within ~1 px of its block edge.
    for (final c in person) {
      for (var i = 0; i < c.lines.length; i += 2) {
        final x = c.lines[i] * _w, y = c.lines[i + 1] * _h;
        final nearPerson =
            x > 3 && x < 13 && y > 7 && y < 19; // block 4..12 × 8..18
        final nearCar = x > 19 && x < 33 && y > 5 && y < 21;
        expect(nearPerson || nearCar, isTrue, reason: '($x, $y)');
      }
    }
    // Closed loops: every endpoint is shared by exactly two segments.
    final counts = <String, int>{};
    for (final c in person) {
      for (var i = 0; i < c.lines.length; i += 2) {
        final k =
            '${c.lines[i].toStringAsFixed(4)},${c.lines[i + 1].toStringAsFixed(4)}';
        counts[k] = (counts[k] ?? 0) + 1;
      }
    }
    expect(counts.values.every((n) => n == 2), isTrue);
    // Unmatched objects are outlined as "weak".
    expect(person.every((c) => c.weak), isTrue);
  });

  test('no outline along the frame border; road edge skips objects', () {
    final roadOnly = _build(showObjects: false);
    final edge = roadOnly.contours.where((c) => c.road).toList();
    expect(edge, isNotEmpty);
    double maxY = 0;
    for (final c in edge) {
      for (var i = 1; i < c.lines.length; i += 2) {
        if (c.lines[i] > maxY) maxY = c.lines[i];
      }
    }
    // Road fills rows 20..29: only its top edge (~y 20/30) is outlined.
    expect(maxY * _h, lessThan(21));
    int segs(MaskRaster r) =>
        r.contours.where((c) => c.road).fold(0, (n, c) => n + c.segmentCount);
    // Where the car touches the road (row 19/20) the road edge is skipped.
    final m = _map();
    final withCar = _build(map: m);
    expect(segs(withCar), lessThan(segs(roadOnly)));
  });

  test('matched instance outlines are not weak', () {
    final r = _build(
      showRoad: false,
      instances: [
        _inst(
          _car,
          const Rect.fromLTWH(0.5, 0, 0.5, 1),
          const Color(0xFF00FFFF),
        ),
      ],
    );
    final strong = r.contours.where((c) => !c.weak).toList();
    expect(strong, hasLength(1));
    expect(strong.single.argb, MaskRasterizer.edgeArgb(0xFF00FFFF));
  });

  test('short class map throws', () {
    expect(
      () => MaskRasterizer.build(
        MaskInput(classMap: Uint8List(3), mapWidth: _w, mapHeight: _h),
      ),
      throwsArgumentError,
    );
  });

  test('real DETR map (fixture): classes, road, cost', () {
    final map = File('test/fixtures/segmentation/krakow_41_land.classmap')
        .readAsBytesSync();
    final input = MaskInput(classMap: map, mapWidth: 224, mapHeight: 224);
    MaskRasterizer.build(input); // warm-up (JIT)
    final sw = Stopwatch()..start();
    const runs = 10;
    late MaskRaster r;
    for (var i = 0; i < runs; i++) {
      r = MaskRasterizer.build(input);
    }
    final ms = sw.elapsedMicroseconds / 1000 / runs;
    // ignore: avoid_print
    print(
      'MaskRasterizer.build 224² real map: ${ms.toStringAsFixed(2)} ms (JIT)',
    );
    expect(r.presentClasses, contains(ObjectClass.car));
    expect(r.hasRoad, isTrue);
    expect(r.contours.fold(0, (n, c) => n + c.segmentCount), greaterThan(100));
    expect(ms, lessThan(250)); // sanity only; real cost runs in an isolate
  });

  group('SegRateMeter', () {
    test('rate from intervals; null until two maps', () {
      final m = SegRateMeter();
      expect(m.hz, isNull);
      m.tick(Duration.zero);
      expect(m.hz, isNull);
      for (var i = 1; i <= 5; i++) {
        m.tick(Duration(milliseconds: 250 * i));
      }
      expect(m.hz, closeTo(4, 1e-6));
      expect(m.count, 6);
    });

    test('stall detection and restart after a gap', () {
      final m = SegRateMeter();
      m
        ..tick(Duration.zero)
        ..tick(const Duration(milliseconds: 500));
      expect(m.isStalled(const Duration(milliseconds: 2000)), isFalse);
      expect(m.isStalled(const Duration(milliseconds: 3600)), isTrue);
      m
        ..tick(const Duration(seconds: 10))
        ..tick(const Duration(milliseconds: 10200));
      // The 9.5 s gap restarted the average instead of dragging it down.
      expect(m.hz, greaterThan(1.5));
      m.reset();
      expect(m.hz, isNull);
      expect(m.isStalled(const Duration(seconds: 99)), isFalse);
    });
  });
}
