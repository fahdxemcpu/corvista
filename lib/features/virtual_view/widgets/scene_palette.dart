import 'package:flutter/painting.dart';

import '../../../domain/models/app_settings.dart';

/// Colours and rendering switches for one virtual view style.
///
/// * minimal: flat two-tone monochrome, no glow, no fog, thin lines.
/// * perspective: full face shading, horizon fog, soft glows.
/// * highContrast: black / white / yellow, thick outlines, no gradients.
class ScenePalette {
  const ScenePalette({
    required this.skyTop,
    required this.skyHorizon,
    required this.fog,
    required this.roadNear,
    required this.roadFar,
    required this.ground,
    required this.roadEdge,
    required this.laneDash,
    required this.body,
    required this.bus,
    required this.glass,
    required this.dark,
    required this.tail,
    required this.vru,
    required this.ego,
    required this.egoGlass,
    required this.accent,
    required this.close,
    required this.veryClose,
    required this.outline,
    required this.pole,
    required this.shading,
    required this.glow,
    required this.outlineWidth,
    required this.fogObjects,
    required this.edgeWidth,
    required this.dashWidth,
  });

  final Color skyTop, skyHorizon, fog;
  final Color roadNear, roadFar, ground, roadEdge, laneDash;
  final Color body, bus, glass, dark, tail, vru, ego, egoGlass, accent;
  final Color close, veryClose, outline, pole;

  /// Light-direction face shading (otherwise flat two-tone).
  final bool shading;

  /// Blurred glows (halos, tail lights, lit lamps).
  final bool glow;

  /// Face / silhouette outline width (0 = none).
  final double outlineWidth;

  /// Aerial perspective: distant objects blend toward [fog].
  final bool fogObjects;
  final double edgeWidth, dashWidth;

  bool get highContrast => outlineWidth >= 2;

  static ScenePalette of(VirtualStyle style, {bool night = false}) =>
      switch (style) {
        VirtualStyle.minimal => night ? _minimalNight : _minimal,
        VirtualStyle.perspective => night ? _perspectiveNight : _perspective,
        VirtualStyle.highContrast => _highContrast,
      };

  static const _perspective = ScenePalette(
    skyTop: Color(0xFF05080C),
    skyHorizon: Color(0xFF16212D),
    fog: Color(0xFF1B2734),
    roadNear: Color(0xFF1A232D),
    roadFar: Color(0xFF141C25),
    ground: Color(0xFF0A0F15),
    roadEdge: Color(0x66A9B8C8),
    laneDash: Color(0x8CD5DEE8),
    body: Color(0xFF8593A3),
    bus: Color(0xFF7487A3),
    glass: Color(0xFF0C1219),
    dark: Color(0xFF0E1318),
    tail: Color(0xFFFF4A55),
    vru: Color(0xFFE6ECF2),
    ego: Color(0xFFE4EAF0),
    egoGlass: Color(0xFF111A23),
    accent: Color(0xFF38D9E8),
    close: Color(0xFFFFB547),
    veryClose: Color(0xFFFF5A5F),
    outline: Color(0x00000000),
    pole: Color(0xFF4E5B69),
    shading: true,
    glow: true,
    outlineWidth: 0,
    fogObjects: true,
    edgeWidth: 1.6,
    dashWidth: 1,
  );

  static const _perspectiveNight = ScenePalette(
    skyTop: Color(0xFF040202),
    skyHorizon: Color(0xFF1A0D0B),
    fog: Color(0xFF1E100E),
    roadNear: Color(0xFF1A1110),
    roadFar: Color(0xFF130C0B),
    ground: Color(0xFF090505),
    roadEdge: Color(0x55C88A80),
    laneDash: Color(0x66E0A49A),
    body: Color(0xFF8A6A66),
    bus: Color(0xFF7E625F),
    glass: Color(0xFF120A09),
    dark: Color(0xFF070404),
    tail: Color(0xFFFF4A3D),
    vru: Color(0xFFE2C2B8),
    ego: Color(0xFFD9BDB6),
    egoGlass: Color(0xFF1A0F0D),
    accent: Color(0xFFFF5A4E),
    close: Color(0xFFFFA347),
    veryClose: Color(0xFFFF4A3D),
    outline: Color(0x00000000),
    pole: Color(0xFF4A3533),
    shading: true,
    glow: true,
    outlineWidth: 0,
    fogObjects: true,
    edgeWidth: 1.4,
    dashWidth: 1,
  );

  static const _minimal = ScenePalette(
    skyTop: Color(0xFF0B1117),
    skyHorizon: Color(0xFF0B1117),
    fog: Color(0xFF0B1117),
    roadNear: Color(0xFF131B23),
    roadFar: Color(0xFF131B23),
    ground: Color(0xFF0B1117),
    roadEdge: Color(0x33C4CFDA),
    laneDash: Color(0x4DC4CFDA),
    body: Color(0xFF5E6B79),
    bus: Color(0xFF5E6B79),
    glass: Color(0xFF26313C),
    dark: Color(0xFF1B232C),
    tail: Color(0xFF9AA6B2),
    vru: Color(0xFFB9C4CF),
    ego: Color(0xFFDCE3EA),
    egoGlass: Color(0xFF6E7B88),
    accent: Color(0xFFDCE3EA),
    close: Color(0xFFFFCB65),
    veryClose: Color(0xFFF16B70),
    outline: Color(0x00000000),
    pole: Color(0xFF3A4652),
    shading: false,
    glow: false,
    outlineWidth: 0,
    fogObjects: false,
    edgeWidth: 1,
    dashWidth: .8,
  );

  static const _minimalNight = ScenePalette(
    skyTop: Color(0xFF080505),
    skyHorizon: Color(0xFF080505),
    fog: Color(0xFF080505),
    roadNear: Color(0xFF140D0C),
    roadFar: Color(0xFF140D0C),
    ground: Color(0xFF080505),
    roadEdge: Color(0x33D8A8A0),
    laneDash: Color(0x4DD8A8A0),
    body: Color(0xFF6B5452),
    bus: Color(0xFF6B5452),
    glass: Color(0xFF2B1E1C),
    dark: Color(0xFF1E1413),
    tail: Color(0xFFB08A84),
    vru: Color(0xFFC8A9A2),
    ego: Color(0xFFDDC4BE),
    egoGlass: Color(0xFF7A625D),
    accent: Color(0xFFDDC4BE),
    close: Color(0xFFFFA347),
    veryClose: Color(0xFFFF4A3D),
    outline: Color(0x00000000),
    pole: Color(0xFF3E2D2B),
    shading: false,
    glow: false,
    outlineWidth: 0,
    fogObjects: false,
    edgeWidth: 1,
    dashWidth: .8,
  );

  static const _highContrast = ScenePalette(
    skyTop: Color(0xFF000000),
    skyHorizon: Color(0xFF000000),
    fog: Color(0xFF000000),
    roadNear: Color(0xFF000000),
    roadFar: Color(0xFF000000),
    ground: Color(0xFF000000),
    roadEdge: Color(0xFFFFFFFF),
    laneDash: Color(0xFFFFFFFF),
    body: Color(0xFFFFFFFF),
    bus: Color(0xFFFFFFFF),
    glass: Color(0xFF000000),
    dark: Color(0xFF000000),
    tail: Color(0xFF000000),
    vru: Color(0xFFFFFFFF),
    ego: Color(0xFF000000),
    egoGlass: Color(0xFF000000),
    accent: Color(0xFFFFFFFF),
    close: Color(0xFFFFE600),
    veryClose: Color(0xFFFFE600),
    outline: Color(0xFF000000),
    pole: Color(0xFFFFFFFF),
    shading: false,
    glow: false,
    outlineWidth: 2.2,
    fogObjects: false,
    edgeWidth: 3,
    dashWidth: 1.5,
  );
}
