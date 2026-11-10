/// Low-poly models for the virtual view, built once in local coordinates:
/// metres, `x` right, `y` up from the road, `z` forward with the model's rear
/// at `z = 0`. Models never rotate (traffic is drawn heading away from the
/// camera), so face normals and lighting are precomputed.
library;

import 'dart:math' as math;

/// Face material, resolved to a colour per style by the painter.
enum Mat { body, glass, roof, dark, tail, housing }

class V3 {
  const V3(this.x, this.y, this.z);
  final double x, y, z;

  V3 operator +(V3 o) => V3(x + o.x, y + o.y, z + o.z);
  V3 operator -(V3 o) => V3(x - o.x, y - o.y, z - o.z);
  V3 operator *(double k) => V3(x * k, y * k, z * k);
  double dot(V3 o) => x * o.x + y * o.y + z * o.z;
  double get length => math.sqrt(dot(this));
  V3 get normalized {
    final l = length;
    return l == 0 ? this : this * (1 / l);
  }
}

class MeshFace {
  MeshFace(this.idx, this.mat, {this.hint, this.decals = const []});

  final List<int> idx;
  final Mat mat;

  /// Approximate outward direction; when null the normal is oriented away
  /// from the model's long axis.
  final V3? hint;

  /// Coplanar details (lights, windows) drawn right after this face, only
  /// when the face is visible.
  final List<MeshFace> decals;

  late final V3 normal, center;

  /// Directional light factor 0..1 (1 = facing the key light).
  late final double light;

  /// Two-tone factor for flat styles: tops 1, rear faces .9, sides .76.
  late final double flat;
}

class Mesh {
  Mesh(this.verts, this.faces, {required this.length, required this.width})
    : height = verts.fold<double>(0, (m, v) => math.max(m, v.y)) {
    for (final f in faces) {
      _prepare(f);
      for (final d in f.decals) {
        _prepare(d);
      }
    }
  }

  final List<V3> verts;
  final List<MeshFace> faces;
  final double length, width, height;

  /// Key light: from above, slightly left and from behind the viewer.
  static final V3 lightDir = const V3(-.35, 1, -.5).normalized;

  void _prepare(MeshFace f) {
    var nx = 0.0, ny = 0.0, nz = 0.0;
    var c = const V3(0, 0, 0);
    final k = f.idx.length;
    for (var i = 0; i < k; i++) {
      final a = verts[f.idx[i]], b = verts[f.idx[(i + 1) % k]];
      nx += (a.y - b.y) * (a.z + b.z);
      ny += (a.z - b.z) * (a.x + b.x);
      nz += (a.x - b.x) * (a.y + b.y);
      c = c + a;
    }
    c = c * (1 / k);
    var n = V3(nx, ny, nz).normalized;
    final out = f.hint ?? (c - V3(0, height * .45, c.z));
    if (n.dot(out) < 0) n = n * -1;
    f
      ..normal = n
      ..center = c
      ..light = (.36 + .64 * math.max(0.0, n.dot(lightDir))).clamp(0.0, 1.0)
      ..flat = n.y > .55 ? 1.0 : (n.z < -.6 ? .9 : .76);
  }
}

const _back = V3(0, 0, -1);

/// One loft cross-section; [pts] run from bottom-left over the top to
/// bottom-right, as (x, y).
class _Station {
  const _Station(this.z, this.pts);
  final double z;
  final List<(double, double)> pts;
}

Mesh _loft(
  List<_Station> st,
  Mat Function(int station, int edge) mat, {
  required List<MeshFace> Function(List<V3> verts) rearDecals,
  void Function(List<V3> verts, List<MeshFace> faces)? extras,
}) {
  final n = st.first.pts.length;
  final verts = <V3>[
    for (final s in st)
      for (final p in s.pts) V3(p.$1, p.$2, s.z),
  ];
  int v(int s, int p) => s * n + p;
  final faces = <MeshFace>[];
  extras?.call(verts, faces);
  faces.add(
    MeshFace(
      [for (var p = 0; p < n; p++) v(0, p)],
      Mat.body,
      hint: _back,
      decals: rearDecals(verts),
    ),
  );
  for (var s = 0; s < st.length - 1; s++) {
    for (var e = 0; e < n - 1; e++) {
      faces.add(
        MeshFace([
          v(s, e),
          v(s, e + 1),
          v(s + 1, e + 1),
          v(s + 1, e),
        ], mat(s, e)),
      );
    }
  }
  var w = 0.0;
  for (final s in st) {
    for (final p in s.pts) {
      w = math.max(w, p.$1.abs());
    }
  }
  return Mesh(verts, faces, length: st.last.z, width: 2 * w);
}

/// Appends an axis-aligned box's outer faces (no bottom).
void _box(
  List<V3> verts,
  List<MeshFace> faces,
  (double, double) x,
  (double, double) y,
  (double, double) z,
  Mat mat,
) {
  final b = verts.length;
  final (x0, x1) = x;
  final (y0, y1) = y;
  final (z0, z1) = z;
  verts.addAll([
    V3(x0, y0, z0), V3(x1, y0, z0), V3(x1, y1, z0), V3(x0, y1, z0), //
    V3(x0, y0, z1), V3(x1, y0, z1), V3(x1, y1, z1), V3(x0, y1, z1),
  ]);
  for (final (q, h) in const [
    ([0, 1, 2, 3], V3(0, 0, -1)),
    ([5, 4, 7, 6], V3(0, 0, 1)),
    ([3, 2, 6, 7], V3(0, 1, 0)),
    ([4, 0, 3, 7], V3(-1, 0, 0)),
    ([1, 5, 6, 2], V3(1, 0, 0)),
  ]) {
    faces.add(MeshFace([for (final i in q) b + i], mat, hint: h));
  }
}

/// A decal quad on the rear face (slightly proud of the surface).
MeshFace _rearQuad(
  List<V3> verts,
  (double, double) x,
  (double, double) y,
  Mat mat, {
  double z = -.012,
}) {
  final b = verts.length;
  final (x0, x1) = x;
  final (y0, y1) = y;
  verts.addAll([V3(x0, y0, z), V3(x1, y0, z), V3(x1, y1, z), V3(x0, y1, z)]);
  return MeshFace([b, b + 1, b + 2, b + 3], mat, hint: _back);
}

/// Symmetric 6-point profile: sill, beltline, roof/deck.
List<(double, double)> _p6(
  double hwB,
  double hwBelt,
  double yBelt,
  double hwTop,
  double yTop,
) => [
  (-hwB, .28),
  (-hwBelt, yBelt),
  (-hwTop, yTop),
  (hwTop, yTop),
  (hwBelt, yBelt),
  (hwB, .28),
];

Mesh _buildSedan() {
  final st = [
    _Station(0.00, _p6(.84, .87, .80, .78, .93)),
    _Station(0.22, _p6(.91, .92, .86, .86, .99)),
    _Station(0.95, _p6(.92, .92, .90, .84, 1.02)),
    _Station(1.75, _p6(.92, .92, .92, .62, 1.41)),
    _Station(2.90, _p6(.92, .92, .92, .64, 1.43)),
    _Station(3.70, _p6(.92, .91, .88, .82, .98)),
    _Station(4.42, _p6(.88, .86, .76, .76, .82)),
    _Station(4.60, _p6(.80, .78, .64, .68, .70)),
  ];
  // Edges: 0 lower-left, 1 upper-left, 2 top, 3 upper-right, 4 lower-right.
  Mat mat(int s, int e) {
    if (e == 1 || e == 3) return s >= 2 && s <= 4 ? Mat.glass : Mat.body;
    if (e == 2) {
      if (s == 2 || s == 4) return Mat.glass; // rear window / windshield
      if (s == 3) return Mat.roof;
    }
    return Mat.body;
  }

  return _loft(
    st,
    mat,
    extras: (v, f) {
      for (final z in const [(.62, 1.30), (3.30, 3.98)]) {
        _box(v, f, (-.90, -.66), (0, .62), z, Mat.dark);
        _box(v, f, (.66, .90), (0, .62), z, Mat.dark);
      }
    },
    rearDecals: (v) => [
      _rearQuad(v, (-.70, .70), (.30, .37), Mat.dark),
      _rearQuad(v, (-.80, .80), (.65, .73), Mat.tail, z: -.016),
    ],
  );
}

Mesh _buildBus() {
  List<(double, double)> p(double hw, double roof) => [
    (-hw, .38),
    (-hw, 1.15),
    (-hw, 2.62),
    (-hw + .12, roof),
    (hw - .12, roof),
    (hw, 2.62),
    (hw, 1.15),
    (hw, .38),
  ];
  final st = [
    _Station(0, p(1.20, 2.98)),
    _Station(.25, p(1.27, 3.05)),
    _Station(10.6, p(1.27, 3.05)),
    _Station(11.0, p(1.20, 2.95)),
  ];
  // Edges: 0 body, 1 window band, 2 roof edge, 3 roof, 4 edge, 5 window, 6.
  Mat mat(int s, int e) {
    if ((e == 1 || e == 5) && s == 1) return Mat.glass;
    if (e == 3) return Mat.roof;
    return Mat.body;
  }

  return _loft(
    st,
    mat,
    extras: (v, f) {
      for (final z in const [(1.6, 2.6), (8.2, 9.2)]) {
        _box(v, f, (-1.22, -.94), (0, .92), z, Mat.dark);
        _box(v, f, (.94, 1.22), (0, .92), z, Mat.dark);
      }
    },
    rearDecals: (v) => [
      _rearQuad(v, (-.96, .96), (1.55, 2.60), Mat.glass),
      _rearQuad(v, (-1.10, 1.10), (.38, .52), Mat.dark),
      _rearQuad(v, (-1.08, -.88), (.64, 1.22), Mat.tail, z: -.016),
      _rearQuad(v, (.88, 1.08), (.64, 1.22), Mat.tail, z: -.016),
    ],
  );
}

Mesh _buildHousing() {
  final v = <V3>[];
  final f = <MeshFace>[];
  _box(v, f, (-.2, .2), (0, 1.02), (0, .26), Mat.housing);
  return Mesh(v, f, length: .26, width: .4);
}

abstract final class SceneModels {
  static final Mesh sedan = _buildSedan();
  static final Mesh bus = _buildBus();
  static final Mesh housing = _buildHousing();
}
