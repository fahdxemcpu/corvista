import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/domain/models/object_class.dart';
import 'package:corvista/domain/models/tracked_object.dart';
import 'package:corvista/features/detection/placement_filter.dart';
import 'package:corvista/features/virtual_view/widgets/virtual_view.dart';
import 'package:corvista/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

/// Render harness for the virtual view: pumps the provider-free
/// [VirtualSceneView] with FIXTURE tracks (test-only, never app code) for
/// every style in portrait and landscape, framed by the drive shell's
/// measured insets, and writes PNGs for visual review. Shell controls are
/// drawn as translucent ghosts so overlaps are visible.
const _outDir = String.fromEnvironment(
  'VIRTUAL_RENDER_DIR',
  defaultValue:
      'build/qa/virtual_renders',
);

/// Fixture placement: [bearing] / [range] as a camera would see them,
/// snapped like `PlacementFilter` does (vehicles to 3.5 m lanes, people
/// beyond the kerb to the sidewalk, signals to the roadside).
PlacedObject _t(
  int id,
  ObjectClass cls,
  double bearing,
  ProximityZone zone,
  double? range, {
  LightState light = LightState.unknown,
}) {
  const lanes = LaneModel();
  final d = range ?? 40;
  final x = d * math.tan(bearing * math.pi / 180);
  final vehicle =
      !cls.isSignal && cls != ObjectClass.person && cls != ObjectClass.bicycle;
  final lane = (x / lanes.laneWidthM).round().clamp(
    lanes.minLane,
    lanes.maxLane,
  );
  final slot = cls.isSignal || (!vehicle && x > lanes.kerbEdge)
      ? (x >= 0 ? RoadSlot.kerbSide : RoadSlot.farSide)
      : (!vehicle && x < lanes.farEdge ? RoadSlot.farSide : RoadSlot.lane);
  final dx = switch (slot) {
    RoadSlot.kerbSide =>
      cls.isSignal ? lanes.kerbEdge + .6 : lanes.kerbSidewalk,
    RoadSlot.farSide => cls.isSignal ? lanes.farEdge - .6 : lanes.farSidewalk,
    RoadSlot.lane => vehicle ? lane * lanes.laneWidthM : x,
  };
  return PlacedObject(
    id: id,
    cls: cls,
    distanceM: d,
    lateralM: x,
    displayX: dx,
    lane: lane,
    slot: slot,
    zone: zone,
    lost: false,
    light: light,
  );
}

final _scenes = <String, List<PlacedObject>>{
  'busy': [
    _t(1, ObjectClass.car, 1, ProximityZone.close, 6.5),
    _t(2, ObjectClass.car, -14, ProximityZone.medium, 15),
    _t(3, ObjectClass.car, 24, ProximityZone.veryClose, 3),
    _t(4, ObjectClass.bus, 9, ProximityZone.far, 32),
    _t(5, ObjectClass.person, 30, ProximityZone.close, 8),
    _t(6, ObjectClass.bicycle, -30, ProximityZone.medium, 12),
    _t(7, ObjectClass.motorcycle, -4, ProximityZone.medium, 21),
    _t(
      8,
      ObjectClass.trafficLight,
      -20,
      ProximityZone.far,
      36,
      light: LightState.red,
    ),
    _t(9, ObjectClass.stopSign, 34, ProximityZone.medium, 17),
  ],
  'signals': [
    _t(1, ObjectClass.car, -2, ProximityZone.medium, 13),
    _t(
      2,
      ObjectClass.trafficLight,
      -16,
      ProximityZone.far,
      30,
      light: LightState.red,
    ),
    _t(
      3,
      ObjectClass.trafficLight,
      14,
      ProximityZone.medium,
      22,
      light: LightState.green,
    ),
    _t(4, ObjectClass.person, -26, ProximityZone.veryClose, 3.2),
    _t(5, ObjectClass.stopSign, 30, ProximityZone.close, 8),
  ],
  'empty': const [],
};

// Drive shell geometry measured from DriveScreen on a 402x874 / 874x402
// iPhone (contentPadding + control rects).
const _portrait = Size(402, 874);
const _landscape = Size(874, 402);
const _padPortrait = EdgeInsets.fromLTRB(0, 191, 0, 176);
const _padLandscape = EdgeInsets.fromLTRB(62, 90, 62, 105);
const _ghostsPortrait = [
  Rect.fromLTRB(12, 68, 390, 185), // HUD strip
  Rect.fromLTRB(12, 718, 68, 774), // clips
  Rect.fromLTRB(78, 718, 134, 774), // settings
  Rect.fromLTRB(314, 698, 390, 774), // save
  Rect.fromLTRB(12, 784, 390, 832), // view switcher
];
const _ghostsLandscape = [
  Rect.fromLTRB(74, 6, 800, 84),
  Rect.fromLTRB(74, 317, 130, 373),
  Rect.fromLTRB(140, 317, 196, 373),
  Rect.fromLTRB(724, 297, 800, 373),
  Rect.fromLTRB(207, 309, 713, 373),
];

Future<void> _loadFonts() async {
  final root = Platform.environment['FLUTTER_ROOT'];
  if (root == null) return;
  final dir = '$root/bin/cache/artifacts/material_fonts';
  Future<void> load(String family, List<String> files) async {
    final loader = FontLoader(family);
    var any = false;
    for (final f in files) {
      final file = File('$dir/$f');
      if (!file.existsSync()) continue;
      any = true;
      loader.addFont(
        Future.value(ByteData.sublistView(file.readAsBytesSync())),
      );
    }
    if (any) await loader.load();
  }

  await load('Roboto', [
    'Roboto-Regular.ttf',
    'Roboto-Medium.ttf',
    'Roboto-Bold.ttf',
  ]);
  await load('MaterialIcons', ['MaterialIcons-Regular.otf']);
}

void main() {
  setUpAll(_loadFonts);

  for (final style in VirtualStyle.values) {
    for (final landscape in [false, true]) {
      for (final scene in _scenes.entries) {
        for (final (night, left) in [
          (false, false),
          if (style == VirtualStyle.perspective && scene.key == 'busy')
            (true, false),
          // Left-hand traffic: road mirrored, objects still by bearing.
          if (scene.key != 'signals' && style != VirtualStyle.minimal)
            (false, true),
        ]) {
          final name =
              '${style.name}_${landscape ? 'land' : 'port'}_${scene.key}${night ? '_night' : ''}${left ? '_lht' : ''}';
          testWidgets('virtual view renders $name', (tester) async {
            final size = landscape ? _landscape : _portrait;
            tester.view.physicalSize = size;
            tester.view.devicePixelRatio = 1;
            addTearDown(tester.view.reset);
            final key = GlobalKey();
            await tester.pumpWidget(
              RepaintBoundary(
                key: key,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    brightness: Brightness.dark,
                    fontFamily: 'Roboto',
                  ),
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalizations.supportedLocales,
                  home: Scaffold(
                    backgroundColor: Colors.black,
                    body: Stack(
                      fit: StackFit.expand,
                      children: [
                        VirtualSceneView(
                          objects: scene.value,
                          style: style,
                          night: night,
                          leftHand: left,
                          reduceMotion: true,
                          status: VirtualStatus.live,
                          contentPadding: landscape
                              ? _padLandscape
                              : _padPortrait,
                        ),
                        for (final r
                            in landscape ? _ghostsLandscape : _ghostsPortrait)
                          Positioned.fromRect(
                            rect: r,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: const Color(0x33FFFFFF),
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: const Color(0x66FFFFFF),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
            await tester.pump();
            await tester.pump(const Duration(milliseconds: 50));
            expect(tester.takeException(), isNull);
            expect(find.byType(VirtualSceneView), findsOneWidget);
            if (scene.value.isEmpty) {
              expect(find.byIcon(Icons.radar_rounded), findsOneWidget);
            }

            await tester.runAsync(() async {
              final boundary =
                  key.currentContext!.findRenderObject()!
                      as RenderRepaintBoundary;
              final image = await boundary.toImage(pixelRatio: 1.5);
              final bytes = await image.toByteData(
                format: ui.ImageByteFormat.png,
              );
              image.dispose();
              try {
                Directory(_outDir).createSync(recursive: true);
                File('$_outDir/$name.png')
                    .writeAsBytesSync(bytes!.buffer.asUint8List());
              } on FileSystemException {
                // Output is for manual review only; never fail CI on it.
              }
            });
            await tester.pumpWidget(const SizedBox());
          });
        }
      }
    }
  }
}
