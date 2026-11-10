import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../domain/models/app_settings.dart';
import '../../../domain/models/object_class.dart';
import 'scene_camera.dart';
import 'scene_models.dart';
import 'scene_palette.dart';
import 'scene_smoother.dart';

/// Stylized 2.5D road scene. Every object comes from a confirmed (or fading
/// lost) track, placed on the road plane by `PlacementFilter` (ground-contact
/// projection, lane snapping) and interpolated by [SceneSmoother].
/// Proximity is conveyed by object styling only (neutral -> amber -> red),
/// never by numbers. Lane markings are decorative and captioned as such.
class VirtualScenePainter extends CustomPainter {
  VirtualScenePainter({
    required this.smoother,
    required this.style,
    required this.insets,
    this.night = false,
    this.leftHand = false,
    super.repaint,
  }) : palette = ScenePalette.of(style, night: night);

  final SceneSmoother smoother;
  final VirtualStyle style;

  /// Screen area covered by the drive shell (HUD, controls, info bar); the
  /// scene is framed inside the remaining viewport.
  final EdgeInsets insets;
  final bool night;

  /// Left-hand traffic: the illustrative road is mirrored (ego lane on the
  /// left). Objects arrive already placed for the driving side.
  final bool leftHand;
  final ScenePalette palette;

  // Reused paints / path (no per-face allocations).
  final _fill = Paint()..isAntiAlias = true;
  final _stroke = Paint()
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round
    ..isAntiAlias = true;
  final _glow = Paint();
  final _path = Path();
  final _pts = <Offset>[];
  final _poly = <Offset>[];
  final _visible = <(MeshFace, double)>[];

  late SceneCamera _cam;

  static const _camPos = V3(0, SceneCamera.camH, 0);

  @override
  void paint(Canvas canvas, Size size) {
    _cam = SceneCamera(size, insets);
    canvas.drawPicture(
      _Backdrop.of(_cam, palette, style, RoadLayout(leftHand: leftHand)),
    );

    final items = smoother.items.toList()
      ..sort((a, b) => b.depth.compareTo(a.depth));
    for (final s in items) {
      final layered = s.opacity < .99;
      if (layered) {
        canvas.saveLayer(
          null,
          Paint()..color = Color.fromRGBO(0, 0, 0, s.opacity.clamp(0.0, 1.0)),
        );
      }
      _object(canvas, s);
      if (layered) canvas.restore();
    }
    _ego(canvas);
  }

  // ---------------------------------------------------------------- colours

  bool get _hc => palette.highContrast;

  /// Highlight colour + strength for a smoothed alert level (0..1).
  (Color, double) _alert(double a) {
    if (a <= .5) return (palette.close, (a * 2).clamp(0.0, 1.0));
    return (Color.lerp(palette.close, palette.veryClose, (a - .5) * 2)!, 1.0);
  }

  double _fogT(double depth) =>
      palette.fogObjects ? ((depth - 14) / 50).clamp(0.0, .5) : 0.0;

  Color _shade(Color base, MeshFace f) {
    if (_hc) return base;
    if (!palette.shading) {
      return Color.lerp(Colors.black, base, .55 + .45 * f.flat)!;
    }
    final c = Color.lerp(Colors.black, base, .28 + .72 * f.light)!;
    return f.light > .9
        ? Color.lerp(c, Colors.white, (f.light - .9) * 1.4)!
        : c;
  }

  // ---------------------------------------------------------------- objects

  void _object(Canvas canvas, SceneItem s) {
    final depth = s.depth;
    final z = SceneCamera.zFor(depth);
    final cls = s.cls;
    final halfW = cls == ObjectClass.bus
        ? 1.3
        : (cls == ObjectClass.car ? .95 : .5);
    final x = _cam.fitX(s.x, z, marginPx: halfW * _cam.scaleAt(z) + 10);
    final (aColor, aStrength) = _alert(s.alert);
    final fog = _fogT(depth);
    switch (cls) {
      case ObjectClass.car:
        _vehicle(
          canvas,
          SceneModels.sedan,
          x,
          z,
          palette.body,
          aColor,
          aStrength,
          fog,
        );
      case ObjectClass.bus:
        _vehicle(
          canvas,
          SceneModels.bus,
          x,
          z,
          palette.bus,
          aColor,
          aStrength,
          fog,
        );
      case ObjectClass.person:
        _vru(canvas, x, z, _Figure.person, aColor, aStrength, fog);
      case ObjectClass.bicycle:
        _vru(canvas, x, z, _Figure.bicycle, aColor, aStrength, fog);
      case ObjectClass.motorcycle:
        _vru(canvas, x, z, _Figure.motorcycle, aColor, aStrength, fog);
      case ObjectClass.trafficLight:
        _trafficLight(canvas, x, z, s.light, fog);
      case ObjectClass.stopSign:
        _stopSign(canvas, x, z, fog);
    }
  }

  void _vehicle(
    Canvas canvas,
    Mesh mesh,
    double x,
    double z,
    Color base,
    Color aColor,
    double a,
    double fog,
  ) {
    final hw = mesh.width / 2;
    _footprint(canvas, x, z, hw, mesh.length, aColor, a);
    var body = base;
    var outline = palette.outline;
    var outlineW = palette.outlineWidth;
    if (_hc) {
      if (a > .75) {
        body = palette.veryClose;
      } else if (a > .2) {
        outline = palette.close;
        outlineW = 3.2;
      }
    } else if (a > 0) {
      body = Color.lerp(body, aColor, a * (a >= 1 ? .4 : .3))!;
    }
    if (fog > 0) body = Color.lerp(body, palette.fog, fog)!;
    _mesh(
      canvas,
      mesh,
      x,
      0,
      z,
      body: body,
      glass: fog > 0
          ? Color.lerp(palette.glass, palette.fog, fog * .6)!
          : palette.glass,
      roof: body,
      outline: outline,
      outlineW: outlineW,
      tailGlow: palette.glow,
    );
  }

  /// Soft contact shadow, plus an alert halo when close.
  void _footprint(
    Canvas canvas,
    double x,
    double z,
    double hw,
    double len,
    Color aColor,
    double a, {
    bool ego = false,
  }) {
    final k = _cam.scaleAt(z);
    if (!_hc) {
      _fill.color = Colors.black.withValues(alpha: palette.shading ? .55 : .45);
      if (palette.shading) {
        _quad(x - hw - .12, x + hw + .12, z - .15, z + len + .1);
        _fill.maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          math.max(1.5, .18 * k),
        );
        canvas.drawPath(_path, _fill);
        _fill.maskFilter = null;
      } else {
        // Flat styles: a soft-edged oval reads calmer than a hard quad.
        canvas.drawOval(_groundOval(x, z, hw + .25, len, .3), _fill);
      }
    }
    // High contrast carries proximity on the body itself (fill / outline).
    if (a <= .01 || _hc) return;
    final e = .35 + .25 * a;
    if (palette.glow) {
      _quad(x - hw - e, x + hw + e, z - e, z + len + e * .6);
      _fill
        ..color = aColor.withValues(alpha: .55 * a.clamp(0.0, 1.0) + .1)
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          math.max(3.0, .45 * k),
        );
      canvas.drawPath(_path, _fill);
      _fill.maskFilter = null;
    } else {
      _fill.color = aColor.withValues(alpha: .3 * a + .12);
      canvas.drawOval(_groundOval(x, z, hw + e, len, e), _fill);
    }
  }

  /// Screen bounds of a ground rectangle around a footprint, for ovals.
  Rect _groundOval(double x, double z, double hw, double len, double e) {
    final near = _cam.project(x, 0, z - e),
        far = _cam.project(x, 0, z + len + e);
    final l = _cam.project(x - hw, 0, z + len * .35).dx;
    final r = _cam.project(x + hw, 0, z + len * .35).dx;
    return Rect.fromLTRB(l, far.dy, r, near.dy);
  }

  /// Sets [_path] to the projected ground rectangle.
  void _quad(double x0, double x1, double z0, double z1) {
    final a = _cam.project(x0, 0, z0), b = _cam.project(x1, 0, z0);
    final c = _cam.project(x1, 0, z1), d = _cam.project(x0, 0, z1);
    _path
      ..reset()
      ..moveTo(a.dx, a.dy)
      ..lineTo(b.dx, b.dy)
      ..lineTo(c.dx, c.dy)
      ..lineTo(d.dx, d.dy)
      ..close();
  }

  void _mesh(
    Canvas canvas,
    Mesh m,
    double ox,
    double oy,
    double oz, {
    required Color body,
    required Color glass,
    required Color roof,
    Color? tail,
    Color? dark,
    Color? housing,
    Color outline = const Color(0x00000000),
    double outlineW = 0,
    bool tailGlow = false,
  }) {
    _pts.clear();
    for (final v in m.verts) {
      _pts.add(_cam.project(v.x + ox, v.y + oy, v.z + oz));
    }
    _visible.clear();
    for (final f in m.faces) {
      final wx = f.center.x + ox, wy = f.center.y + oy, wz = f.center.z + oz;
      final dx = _camPos.x - wx, dy = _camPos.y - wy, dz = _camPos.z - wz;
      if (f.normal.x * dx + f.normal.y * dy + f.normal.z * dz <= 0) continue;
      _visible.add((f, dx * dx + dy * dy + dz * dz));
    }
    _visible.sort((a, b) => b.$2.compareTo(a.$2));
    final k = _cam.scaleAt(oz);
    Color colorOf(Mat mat) => switch (mat) {
      Mat.body => body,
      Mat.glass => glass,
      Mat.roof => roof,
      Mat.dark => dark ?? palette.dark,
      Mat.tail => tail ?? palette.tail,
      Mat.housing => housing ?? palette.dark,
    };
    for (final (f, _) in _visible) {
      _facePath(f);
      var c = f.mat == Mat.tail ? colorOf(f.mat) : _shade(colorOf(f.mat), f);
      if (f.mat == Mat.glass && palette.shading) {
        // Sky reflection: upward-facing glass catches a cool sheen.
        c = Color.lerp(
          c,
          palette.skyHorizon,
          .25 + .45 * f.normal.y.clamp(0, 1),
        )!;
        c = Color.lerp(c, Colors.white, .06 * f.light)!;
      }
      _fill.color = c;
      canvas.drawPath(_path, _fill);
      if (outlineW > 0) {
        _stroke
          ..color = outline
          ..strokeWidth = outlineW;
        canvas.drawPath(_path, _stroke);
      } else {
        // Hairline in the face colour hides anti-aliasing seams.
        _stroke
          ..color = c
          ..strokeWidth = .9;
        canvas.drawPath(_path, _stroke);
      }
      for (final d in f.decals) {
        _facePath(d);
        final dc = colorOf(d.mat);
        _fill.color = d.mat == Mat.tail ? dc : _shade(dc, d);
        canvas.drawPath(_path, _fill);
        if (d.mat == Mat.tail && tailGlow) {
          _glow
            ..color = dc.withValues(alpha: .55)
            ..maskFilter = MaskFilter.blur(
              BlurStyle.normal,
              math.max(2.0, .12 * k),
            );
          canvas.drawPath(_path, _glow);
        }
        if (outlineW > 0 && d.mat != Mat.tail) {
          _stroke
            ..color = outline
            ..strokeWidth = outlineW * .6;
          canvas.drawPath(_path, _stroke);
        }
      }
    }
  }

  void _facePath(MeshFace f) {
    _poly.clear();
    for (final i in f.idx) {
      _poly.add(_pts[i]);
    }
    _path
      ..reset()
      ..addPolygon(_poly, true);
  }

  // ------------------------------------------------- vulnerable road users

  void _vru(
    Canvas canvas,
    double x,
    double z,
    _Figure fig,
    Color aColor,
    double a,
    double fog,
  ) {
    final k = _cam.scaleAt(z);
    final base = _cam.project(x, 0, z);
    // Ground footprint.
    final r = fig == _Figure.person ? .45 : .6;
    final p0 = _cam.project(x - r, 0, z - r * .6);
    final p1 = _cam.project(
      x + r,
      0,
      z + r * (fig == _Figure.person ? .6 : 1.6),
    );
    final foot = Rect.fromLTRB(p0.dx, p1.dy, p1.dx, p0.dy);
    if (!_hc) {
      _fill
        ..color = Colors.black.withValues(alpha: .5)
        ..maskFilter = palette.shading
            ? MaskFilter.blur(BlurStyle.normal, math.max(1.0, .1 * k))
            : null;
      canvas.drawOval(foot, _fill);
      _fill.maskFilter = null;
    }
    if (a > .01) {
      final halo = foot.inflate(.25 * k);
      if (_hc) {
        _stroke
          ..color = palette.close
          ..strokeWidth = 3;
        canvas.drawOval(halo, _stroke);
      } else {
        _fill
          ..color = aColor.withValues(alpha: .5 * a + .12)
          ..maskFilter = palette.glow
              ? MaskFilter.blur(BlurStyle.normal, math.max(3.0, .3 * k))
              : null;
        canvas.drawOval(halo, _fill);
        _fill.maskFilter = null;
      }
    }

    var rider = palette.vru;
    if (_hc) {
      rider = a > .75 ? palette.veryClose : palette.vru;
    } else if (a > 0) {
      rider = Color.lerp(rider, aColor, a * (a >= 1 ? .55 : .35))!;
    }
    if (fog > 0) rider = Color.lerp(rider, palette.fog, fog)!;
    var machine = _hc
        ? palette.vru
        : Color.lerp(palette.body, Colors.black, .25)!;
    if (fog > 0) machine = Color.lerp(machine, palette.fog, fog)!;
    final tyre = _hc ? Colors.white : palette.dark;

    Offset at(double mx, double my) =>
        Offset(base.dx + mx * k, base.dy - my * k);
    RRect rr(double x0, double y0, double x1, double y1, double rad) =>
        RRect.fromRectAndRadius(
          Rect.fromPoints(at(x0, y0), at(x1, y1)),
          Radius.circular(rad * k),
        );

    final riderPath = Path();
    final machinePath = Path();
    final tyrePath = Path();
    final strokes = <(Offset, Offset, double)>[];
    Rect? tailRect;

    switch (fig) {
      case _Figure.person:
        riderPath
          ..addRRect(rr(-.17, 0, -.035, .9, .065))
          ..addRRect(rr(.035, 0, .17, .9, .065))
          ..addRRect(
            RRect.fromRectAndCorners(
              Rect.fromPoints(at(-.23, .84), at(.23, 1.45)),
              topLeft: Radius.circular(.13 * k),
              topRight: Radius.circular(.13 * k),
              bottomLeft: Radius.circular(.05 * k),
              bottomRight: Radius.circular(.05 * k),
            ),
          )
          ..addRRect(rr(-.31, .88, -.215, 1.4, .05))
          ..addRRect(rr(.215, .88, .31, 1.4, .05))
          ..addOval(Rect.fromCircle(center: at(0, 1.6), radius: .12 * k));
      case _Figure.bicycle:
        tyrePath.addRRect(rr(-.035, 0, .035, .68, .035));
        strokes
          ..add((at(-.3, 1.05), at(.3, 1.05), .045))
          ..add((at(-.1, .95), at(-.16, .36), .12))
          ..add((at(.1, .95), at(.16, .52), .12))
          ..add((at(-.2, 1.34), at(-.3, 1.07), .085))
          ..add((at(.2, 1.34), at(.3, 1.07), .085));
        riderPath
          ..addRRect(rr(-.21, .92, .21, 1.42, .1))
          ..addOval(Rect.fromCircle(center: at(0, 1.55), radius: .125 * k));
        tailRect = Rect.fromPoints(at(-.05, .7), at(.05, .77));
      case _Figure.motorcycle:
        tyrePath.addRRect(rr(-.085, 0, .085, .62, .08));
        machinePath.addPath(
          Path()
            ..moveTo(at(-.26, .42).dx, at(-.26, .42).dy)
            ..lineTo(at(.26, .42).dx, at(.26, .42).dy)
            ..lineTo(at(.19, .88).dx, at(.19, .88).dy)
            ..lineTo(at(-.19, .88).dx, at(-.19, .88).dy)
            ..close(),
          Offset.zero,
        );
        strokes
          ..add((at(-.44, 1.08), at(.44, 1.08), .05))
          ..add((at(-.23, 1.3), at(-.38, 1.1), .1))
          ..add((at(.23, 1.3), at(.38, 1.1), .1));
        riderPath
          ..addRRect(rr(-.33, .5, -.19, .96, .06))
          ..addRRect(rr(.19, .5, .33, .96, .06))
          ..addRRect(rr(-.25, .88, .25, 1.38, .12))
          ..addOval(Rect.fromCircle(center: at(0, 1.5), radius: .155 * k));
        tailRect = Rect.fromPoints(at(-.1, .74), at(.1, .81));
    }

    // Draw back to front: tyre, machine, limbs, rider.
    _fill.color = tyre;
    canvas.drawPath(tyrePath, _fill);
    _fill.color = machine;
    canvas.drawPath(machinePath, _fill);
    final limb = Paint()
      ..color = fig == _Figure.person ? rider : rider
      ..strokeCap = StrokeCap.round;
    for (final (p, q, w) in strokes) {
      final isBar = w < .06;
      canvas.drawLine(
        p,
        q,
        limb
          ..color = isBar ? (_hc ? Colors.white : palette.pole) : rider
          ..strokeWidth = math.max(1.0, w * k),
      );
    }
    final bounds = riderPath.getBounds();
    if (palette.shading && !bounds.isEmpty) {
      _fill.shader = LinearGradient(
        colors: [
          Color.lerp(rider, Colors.white, .18)!,
          rider,
          Color.lerp(rider, Colors.black, .38)!,
        ],
        stops: const [0, .45, 1],
      ).createShader(bounds);
      canvas.drawPath(riderPath, _fill);
      _fill.shader = null;
    } else {
      _fill.color = rider;
      canvas.drawPath(riderPath, _fill);
    }
    if (_hc) {
      _stroke
        ..color = a > .2 && a <= .75 ? palette.close : palette.outline
        ..strokeWidth = a > .2 && a <= .75 ? 3 : 1.8;
      canvas.drawPath(riderPath, _stroke);
    }
    if (tailRect != null) {
      final tr = RRect.fromRectAndRadius(tailRect, Radius.circular(.02 * k));
      _fill.color = _hc ? palette.close : palette.tail;
      canvas.drawRRect(tr, _fill);
      if (palette.glow) {
        _glow
          ..color = palette.tail.withValues(alpha: .6)
          ..maskFilter = MaskFilter.blur(
            BlurStyle.normal,
            math.max(2.0, .1 * k),
          );
        canvas.drawRRect(tr, _glow);
      }
    }
  }

  // --------------------------------------------------------------- signals

  /// Signals are drawn at least this many pixels per metre so lamp states
  /// stay readable when far away.
  double get _signalMinK => math.min(34.0, _cam.viewport.height * .07);

  /// Signal scale at depth [z]: enlarged when far, but never so much that
  /// the signal (about [top] m tall) rises above the horizon.
  double _signalK(double z, double top, {double f = 1}) {
    final k = _cam.scaleAt(z);
    final cap = k * SceneCamera.camH / (top + .2);
    return math.max(k, math.min(_signalMinK * f, cap));
  }

  void _pole(Canvas canvas, double x, double z, double top, double k) {
    final b = _cam.project(x, 0, z);
    final t = Offset(b.dx, b.dy - top * k);
    final w = math.max(_hc ? 3.0 : 2.0, .1 * k);
    if (palette.shading) {
      _fill.shader = LinearGradient(
        colors: [
          Color.lerp(palette.pole, Colors.white, .25)!,
          Color.lerp(palette.pole, Colors.black, .35)!,
        ],
      ).createShader(Rect.fromLTRB(b.dx - w / 2, t.dy, b.dx + w / 2, b.dy));
    } else {
      _fill.color = palette.pole;
    }
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(b.dx - w / 2, t.dy, b.dx + w / 2, b.dy),
        Radius.circular(w / 2),
      ),
      _fill,
    );
    _fill.shader = null;
    if (!_hc) {
      _fill
        ..color = Colors.black.withValues(alpha: .45)
        ..maskFilter = palette.shading
            ? MaskFilter.blur(BlurStyle.normal, math.max(1.0, w * .6))
            : null;
      canvas.drawOval(
        Rect.fromCenter(center: b, width: w * 3.2, height: w * 1.1),
        _fill,
      );
      _fill.maskFilter = null;
    }
  }

  static const _lampColors = [
    Color(0xFFFF453A),
    Color(0xFFFFB020),
    Color(0xFF30D158),
  ];
  static const _lampStates = [
    LightState.red,
    LightState.yellow,
    LightState.green,
  ];

  void _trafficLight(
    Canvas canvas,
    double x,
    double z,
    LightState light,
    double fog,
  ) {
    final k = _signalK(z, 3.8);
    const poleH = 2.7;
    _pole(canvas, x, z, poleH, k);
    final b = _cam.project(x, 0, z);
    final w = .42 * k, h = 1.06 * k;
    final front = Rect.fromLTWH(b.dx - w / 2, b.dy - poleH * k - h, w, h);
    // Housing: top + side faces give it volume.
    final depthPx = .18 * k;
    final dir = (b.dx - _cam.cx).sign; // side facing the road centre
    final top = Path()
      ..moveTo(front.left, front.top)
      ..lineTo(front.right, front.top)
      ..lineTo(front.right - dir * depthPx * .5, front.top - depthPx * .6)
      ..lineTo(front.left - dir * depthPx * .5, front.top - depthPx * .6)
      ..close();
    final side = Path();
    final sx = dir > 0 ? front.left : front.right;
    side
      ..moveTo(sx, front.top)
      ..lineTo(sx - dir * depthPx * .5, front.top - depthPx * .6)
      ..lineTo(sx - dir * depthPx * .5, front.bottom - depthPx * .6)
      ..lineTo(sx, front.bottom)
      ..close();
    final housing = _hc ? Colors.black : const Color(0xFF151C24);
    _fill.color = _hc ? Colors.white : Color.lerp(housing, Colors.white, .12)!;
    canvas.drawPath(top, _fill);
    _fill.color = _hc ? Colors.white : Color.lerp(housing, Colors.black, .4)!;
    canvas.drawPath(side, _fill);
    final rr = RRect.fromRectAndRadius(front, Radius.circular(w * .22));
    _fill.color = housing;
    canvas.drawRRect(rr, _fill);
    _stroke
      ..color = _hc ? Colors.white : const Color(0xFF34404C)
      ..strokeWidth = _hc ? 2 : 1;
    canvas.drawRRect(rr, _stroke);

    final lr = w * .29;
    for (var i = 0; i < 3; i++) {
      final c = Offset(front.center.dx, front.top + h * (i + .5) / 3);
      final on = light == _lampStates[i];
      final col = _lampColors[i];
      if (on && palette.glow) {
        _glow
          ..color = col.withValues(alpha: .55)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, lr * 1.6);
        canvas.drawCircle(c, lr * 2.2, _glow);
      }
      _fill.color = on
          ? col
          : (_hc
                ? Colors.black
                : Color.lerp(housing, col, palette.shading ? .22 : .16)!);
      canvas.drawCircle(c, lr, _fill);
      if (on && !_hc) {
        _fill.color = Colors.white.withValues(alpha: .55);
        canvas.drawCircle(c - Offset(lr * .3, lr * .3), lr * .3, _fill);
      }
      if (_hc) {
        _stroke
          ..color = on ? Colors.white : const Color(0xFF8A8A8A)
          ..strokeWidth = on ? 2.4 : 1.2;
        canvas.drawCircle(c, lr, _stroke);
      }
    }
    if (fog > 0) {
      _fill.color = palette.fog.withValues(alpha: fog * .5);
      canvas.drawRect(front.inflate(2), _fill);
    }
  }

  void _stopSign(Canvas canvas, double x, double z, double fog) {
    final k = _signalK(z, 2.9, f: .85);
    const poleH = 2.0;
    _pole(canvas, x, z, poleH, k);
    final b = _cam.project(x, 0, z);
    final r = .42 * k;
    final c = Offset(b.dx, b.dy - poleH * k - r * .85);
    final oct = Path();
    for (var i = 0; i < 8; i++) {
      final a = math.pi / 8 + i * math.pi / 4;
      final p = c + Offset(math.cos(a), math.sin(a)) * r;
      i == 0 ? oct.moveTo(p.dx, p.dy) : oct.lineTo(p.dx, p.dy);
    }
    oct.close();
    if (palette.glow) {
      _glow
        ..color = const Color(0xFFE5383B).withValues(alpha: .3)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, r * .5);
      canvas.drawPath(oct, _glow);
    }
    _fill.color = palette.shading || _hc
        ? const Color(0xFFD7263D)
        : const Color(0xFFB8434B);
    canvas.drawPath(oct, _fill);
    _stroke
      ..color = Colors.white
      ..strokeWidth = math.max(_hc ? 2.5 : 1.2, r * .11);
    canvas.drawPath(oct, _stroke);
    // "STOP" legend when large enough to read; a plain white band reads as a
    // "no entry" sign, so tiny far signs get no legend at all.
    if (r >= 7) {
      final tp = TextPainter(
        text: TextSpan(
          text: 'STOP',
          style: TextStyle(
            color: Colors.white,
            fontSize: r * .62,
            fontWeight: FontWeight.w800,
            letterSpacing: -r * .02,
            height: 1,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, c - Offset(tp.width / 2, tp.height / 2));
    }
    if (fog > 0) {
      _fill.color = palette.fog.withValues(alpha: fog * .5);
      canvas.drawPath(oct, _fill);
    }
  }

  // -------------------------------------------------------------------- ego

  void _ego(Canvas canvas) {
    const z = SceneCamera.egoZ;
    final m = SceneModels.sedan;
    final k = _cam.scaleAt(z);
    if (palette.glow) {
      // Accent underglow.
      _quad(-1.35, 1.35, z - .5, z + m.length + .4);
      _fill
        ..color = palette.accent.withValues(alpha: .22)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, .5 * k);
      canvas.drawPath(_path, _fill);
      _fill.maskFilter = null;
    }
    _footprint(
      canvas,
      0,
      z,
      m.width / 2,
      m.length,
      palette.accent,
      0,
      ego: true,
    );
    _mesh(
      canvas,
      m,
      0,
      0,
      z,
      body: palette.ego,
      glass: palette.egoGlass,
      roof: palette.ego,
      tail: _hc ? Colors.white : palette.tail,
      dark: _hc ? Colors.black : null,
      outline: _hc ? Colors.white : palette.outline,
      outlineW: _hc ? 2.6 : 0,
      tailGlow: palette.glow,
    );
  }

  @override
  bool shouldRepaint(VirtualScenePainter old) =>
      old.style != style ||
      old.night != night ||
      old.leftHand != leftHand ||
      old.insets != insets ||
      !identical(old.smoother, smoother);
}

enum _Figure { person, bicycle, motorcycle }

/// Cached static backdrop (sky, road, illustrative lanes, fog, rings,
/// vignette) recorded once per layout + style.
class _Backdrop {
  static ui.Picture? _pic;
  static Object? _key;

  static ui.Picture of(
    SceneCamera cam,
    ScenePalette pal,
    VirtualStyle style,
    RoadLayout road,
  ) {
    final key = (cam.size, cam.viewport, pal, style, road.leftHand);
    final cached = _pic;
    if (cached != null && _key == key) return cached;
    final rec = ui.PictureRecorder();
    _paint(Canvas(rec), cam, pal, style, road);
    _pic?.dispose();
    _key = key;
    return _pic = rec.endRecording();
  }

  static void _paint(
    Canvas canvas,
    SceneCamera cam,
    ScenePalette pal,
    VirtualStyle style,
    RoadLayout layout,
  ) {
    final size = cam.size;
    final w = size.width, h = size.height, hz = cam.horizon;
    final span = cam.viewport.bottom - hz;
    final p = Paint();

    // Sky + ground.
    p.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [pal.skyTop, pal.skyHorizon, pal.ground],
      stops: [0, (hz / h).clamp(0.0, 1.0), math.min(1.0, (hz + span * .5) / h)],
    ).createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, p);
    p.shader = null;

    // Road surface.
    final zNear = cam.zNear;
    final road = layout.surface(cam);
    p.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [pal.roadFar, pal.roadNear],
    ).createShader(Rect.fromLTRB(0, hz, w, cam.viewport.bottom));
    canvas.drawPath(road, p);
    p.shader = null;

    if (pal.shading) {
      // Soft sheen down the ego lane.
      final c = cam.project(0, 0, SceneCamera.egoFront + 8);
      p.shader =
          RadialGradient(
            colors: [Colors.white.withValues(alpha: .035), Colors.transparent],
          ).createShader(
            Rect.fromCenter(center: c, width: span * 1.6, height: span),
          );
      canvas.drawRect(Offset.zero & size, p);
      p.shader = null;
    }

    // Sidewalk strips (where roadside people / signals stand).
    if (!pal.highContrast) {
      final walk = Paint()
        ..color = Color.lerp(pal.roadNear, Colors.white, .045)!
        ..isAntiAlias = true;
      for (final (x0, x1) in layout.sidewalks) {
        canvas.drawPath(RoadLayout.band(cam, x0, x1, zFar: 400), walk);
      }
    }

    // Illustrative markings as fitted ground bands (perspective taper).
    final zMark = math.max(zNear, SceneCamera.egoZ - 1.5);
    const zFar = 400.0;
    void line(Paint paint, double x, double hw, [double z0 = 0, double? z1]) {
      canvas.drawPath(
        RoadLayout.band(
          cam,
          x - hw,
          x + hw,
          zNear: math.max(zMark, z0),
          zFar: z1 ?? zFar,
        ),
        paint,
      );
    }

    final edge = Paint()
      ..color = pal.roadEdge
      ..isAntiAlias = true;
    final mark = Paint()
      ..color = pal.laneDash
      ..isAntiAlias = true;
    final ew = .045 * pal.edgeWidth, dw = .07 * pal.dashWidth;
    // Markings start just behind the ego so they never run under the
    // overlays / shell controls below the scene.
    line(edge, layout.kerbEdge, ew);
    line(edge, layout.farEdge, ew);
    // Double centre line (oncoming traffic beyond it).
    line(mark, layout.centreLine - .16, dw * .8);
    line(mark, layout.centreLine + .16, dw * .8);
    for (final x in layout.dashes) {
      for (var z = 1.0; z < 220; z += 9) {
        if (z + 3 < zMark) continue;
        line(mark, x, dw, z, z + 3);
      }
    }

    // Ground rings around the ego (perspective only, decorative).
    if (style == VirtualStyle.perspective) {
      final cz = SceneCamera.egoZ + SceneCamera.egoLen / 2;
      canvas
        ..save()
        ..clipPath(road);
      for (final (r, a) in const [(4.2, .14), (7.0, .05)]) {
        final ring = Path();
        for (var i = 0; i <= 72; i++) {
          final t = i / 72 * 2 * math.pi;
          final pt = cam.project(r * math.sin(t), 0, cz + r * math.cos(t));
          i == 0 ? ring.moveTo(pt.dx, pt.dy) : ring.lineTo(pt.dx, pt.dy);
        }
        canvas.drawPath(
          ring,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1
            ..color = pal.accent.withValues(alpha: a),
        );
      }
      canvas.restore();
    }

    // Horizon fog.
    if (pal.fogObjects) {
      final top = hz - span * .12, bottom = hz + span * .32;
      p.shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          pal.fog.withValues(alpha: 0),
          pal.fog.withValues(alpha: .95),
          pal.fog.withValues(alpha: 0),
        ],
        stops: [0, (hz - top) / (bottom - top), 1],
      ).createShader(Rect.fromLTRB(0, top, w, bottom));
      canvas.drawRect(Rect.fromLTRB(0, top, w, bottom), p);
      p.shader = null;
    }

    // Vignette.
    if (style != VirtualStyle.highContrast) {
      p.shader =
          RadialGradient(
            center: Alignment(0, ((cam.viewport.center.dy / h) * 2 - 1)),
            radius: 1.05,
            colors: [Colors.transparent, Colors.black.withValues(alpha: .55)],
            stops: const [.55, 1],
          ).createShader(
            Rect.fromCenter(
              center: Offset(w / 2, h / 2),
              width: math.max(w, h),
              height: math.max(w, h),
            ),
          );
      canvas.drawRect(Offset.zero & size, p);
      p.shader = null;
    }
  }
}

/// Empty-state "scanning" sweep: a soft arc travelling forward along the
/// road from the ego vehicle. [t] in 0..1; static when motion is reduced.
class ScanPainter extends CustomPainter {
  ScanPainter({
    required this.insets,
    required this.style,
    required this.t,
    this.night = false,
    this.leftHand = false,
  }) : super(repaint: t);

  final EdgeInsets insets;
  final VirtualStyle style;
  final Animation<double> t;
  final bool night;
  final bool leftHand;

  @override
  void paint(Canvas canvas, Size size) {
    final cam = SceneCamera(size, insets);
    final pal = ScenePalette.of(style, night: night);
    canvas
      ..save()
      ..clipPath(RoadLayout(leftHand: leftHand).surface(cam));
    for (final phase in const [0.0, .5]) {
      final v = (t.value + phase) % 1.0;
      final r = 3 + v * 40;
      final alpha = (1 - v) * (1 - v) * (pal.highContrast ? .8 : .45);
      final path = Path();
      for (var i = 0; i <= 40; i++) {
        final a = (-55 + 110 * i / 40) * math.pi / 180;
        final p = cam.project(
          r * math.sin(a),
          0,
          SceneCamera.egoFront + r * math.cos(a),
        );
        i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
      }
      canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = pal.highContrast ? 2.5 : 1.6
          ..color = (pal.highContrast ? pal.close : pal.accent).withValues(
            alpha: alpha,
          ),
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(ScanPainter old) =>
      old.insets != insets ||
      old.style != style ||
      old.night != night ||
      old.leftHand != leftHand;
}
