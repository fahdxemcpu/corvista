import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/domain/models/detection.dart';
import 'package:corvista/domain/models/object_class.dart';
import 'package:corvista/domain/models/tracked_object.dart';
import 'package:corvista/features/detection/widgets/camera_layer.dart';
import 'package:corvista/features/hud/drive_screen.dart';
import 'package:corvista/features/segmentation/widgets/perception_view.dart';
import 'package:corvista/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import '../fixtures/fake_engine.dart';
import '../fixtures/test_container.dart' show memoryDb;

/// Render harness for the Perception view inside the REAL drive shell
/// (HUD strip, Record/Save, view switcher). Uses real dashcam frames and the
/// real DETR class maps produced by `tools/model_eval/run_eval.sh
/// --dump-maps` (fixtures in test/fixtures/segmentation/, test-only).
///
/// Always checks layout (no exceptions; the perception controls sit in the
/// top strip, clear of the lower half and the shell's bottom controls).
/// PNGs are written only with
/// `--dart-define=PERCEPTION_RENDER_DIR=<dir>` (all scenes × modes);
/// otherwise a small subset runs as a regular widget test.
const _outDir = String.fromEnvironment('PERCEPTION_RENDER_DIR');
const _fixtures = 'test/fixtures/segmentation';

class _Scene {
  _Scene(
    this.name,
    this.frameSize,
    this.map,
    this.mapW,
    this.mapH,
    this.tracks,
  );
  final String name;
  final Size frameSize;
  final Uint8List map;
  final int mapW, mapH;
  final List<TrackedObject> tracks;
}

_Scene _load(String name) {
  final meta = jsonDecode(
    File('$_fixtures/$name.json').readAsStringSync(),
  ) as Map<String, Object?>;
  var id = 1;
  final tracks = <TrackedObject>[
    for (final d in (meta['detections']! as List).cast<Map<String, Object?>>())
      if (ObjectClass.fromId((d['cls']! as num).toInt()) case final cls?)
        TrackedObject(
          id: id++,
          cls: cls,
          box: Rect.fromLTWH(
            (d['x']! as num).toDouble(),
            (d['y']! as num).toDouble(),
            (d['w']! as num).toDouble(),
            (d['h']! as num).toDouble(),
          ),
          confidence: (d['conf']! as num).toDouble(),
          state: TrackState.confirmed,
          ageFrames: 30,
          missedFrames: 0,
          lastSeenTs: 0,
          velocity: (dx: 0, dy: 0, scaleRate: 0),
          light: LightState.unknown,
          bearingDeg: 0,
          approxRangeM: null,
          zone: ProximityZone.far,
        ),
  ];
  return _Scene(
    name,
    Size(
      (meta['width']! as num).toDouble(),
      (meta['height']! as num).toDouble(),
    ),
    File('$_fixtures/$name.classmap').readAsBytesSync(),
    (meta['mapW']! as num).toInt(),
    (meta['mapH']! as num).toInt(),
    tracks,
  );
}

class _FakeCamera extends CameraController {
  _FakeCamera(this.initial);
  final CameraState initial;
  @override
  CameraState build() => initial;
  @override
  Future<void> start({bool force = false}) async {}
  @override
  Future<void> stop() async {}
  @override
  Future<void> loadDevices() async {}
}

class _FixedTracks extends TrackerController {
  _FixedTracks(this.tracks);
  final List<TrackedObject> tracks;
  @override
  List<TrackedObject> build() => tracks;
}

class _FakeModels extends AiModelController {
  _FakeModels({required this.supported});
  final bool supported;
  @override
  AiModelState build() => AiModelState(
    selectedId: 'segmentation',
    models: [
      AiModelInfo(
        id: 'segmentation',
        name: 'Segmentation',
        version: '1',
        license: '',
        source: '',
        installed: true,
        supportsSegmentation: supported,
        sizeBytes: 0,
        inputSize: 448,
      ),
    ],
  );
  @override
  Future<void> loadModels() async {}
  @override
  Future<bool> activate(String id, {bool force = false}) async => true;
}

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
  // Painters without a family (box labels) use the test default font.
  await load('FlutterTest', ['Roboto-Bold.ttf']);
}

void _mockChannels() {
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  messenger.setMockMethodCallHandler(const MethodChannel('corvista/engine'), (
    call,
  ) async {
    if (call.method.endsWith('.models') ||
        call.method.endsWith('.devices') ||
        call.method.endsWith('.voices')) {
      return <Object?>[];
    }
    if (call.method.startsWith('permissions.')) return 'granted';
    return null;
  });
}

void main() {
  setUpAll(_loadFonts);
  setUp(_mockChannels);
  tearDown(() => CameraLayer.debugTextureBuilder = null);

  const full = _outDir != '';
  final scenes = full
      ? ['krakow_41', 'rural_22', 'krakow_22', 'rural_6']
      : ['krakow_41'];

  for (final scene in scenes) {
    for (final landscape in [false, true]) {
      for (final mode in SegmentationMode.values) {
        if (!full && mode != SegmentationMode.combined && landscape) continue;
        for (final rtl in [false, if (full && scene == 'krakow_41') true]) {
          if (rtl && mode != SegmentationMode.combined) continue;
          final name =
              '${scene}_${landscape ? 'land' : 'port'}_${mode.name}${rtl ? '_rtl' : ''}';
          testWidgets('perception renders $name', (tester) async {
            await _render(tester, scene, landscape, mode, name, rtl: rtl);
          });
        }
      }
    }
  }

  for (final landscape in [false, true]) {
    final o = landscape ? 'land' : 'port';
    testWidgets('perception opacity popover ($o)', (tester) async {
      await _render(
        tester,
        'krakow_22',
        landscape,
        SegmentationMode.combined,
        'krakow_22_${o}_opacity',
        interact: (tester) async {
          await tester.tap(find.bySemanticsLabel('Mask opacity'));
          await tester.pump(const Duration(milliseconds: 300));
          expect(find.byType(Slider), findsOneWidget);
        },
      );
    });
    testWidgets('perception legend toggles ($o)', (tester) async {
      await _render(
        tester,
        'rural_22',
        landscape,
        SegmentationMode.combined,
        'rural_22_${o}_legend_${landscape ? 'open' : 'collapsed'}',
        interact: (tester) async {
          final disclaimer = find.textContaining('approximate');
          if (landscape) {
            // Landscape: closed until tapped.
            expect(disclaimer, findsNothing);
            await tester.tap(find.bySemanticsLabel('Mask legend'));
          } else {
            // Portrait: auto-opened once, then auto-hides.
            expect(disclaimer, findsOneWidget);
            await tester.pump(const Duration(seconds: 7));
          }
          await tester.pump(const Duration(milliseconds: 300));
          expect(disclaimer, landscape ? findsOneWidget : findsNothing);
        },
      );
    });
  }

  testWidgets('perception unsupported state', (tester) async {
    await _render(
      tester,
      'rural_6',
      false,
      SegmentationMode.combined,
      'rural_6_port_unsupported',
      supported: false,
      verify: () => expect(find.text('Masks unavailable'), findsWidgets),
    );
  });

  testWidgets('perception warming-up state', (tester) async {
    await _render(
      tester,
      'rural_6',
      true,
      SegmentationMode.combined,
      'rural_6_land_warmup',
      sendMap: false,
      verify: () => expect(find.text('Warming up…'), findsOneWidget),
    );
  });
}

Future<void> _render(
  WidgetTester tester,
  String sceneName,
  bool landscape,
  SegmentationMode mode,
  String name, {
  bool supported = true,
  bool sendMap = true,
  bool rtl = false,
  void Function()? verify,
  Future<void> Function(WidgetTester tester)? interact,
}) async {
  final scene = _load('${sceneName}_${landscape ? 'land' : 'port'}');
  tester.view.physicalSize = landscape
      ? const Size(874 * 3, 402 * 3)
      : const Size(402 * 3, 874 * 3);
  tester.view.devicePixelRatio = 3;
  tester.view.padding = landscape
      ? const FakeViewPadding(left: 62 * 3, right: 62 * 3, bottom: 21 * 3)
      : const FakeViewPadding(top: 62 * 3, bottom: 34 * 3);
  addTearDown(tester.view.reset);

  final jpg = File(
    'test/fixtures/segmentation/${sceneName}_${landscape ? 'land' : 'port'}.jpg',
  ).readAsBytesSync();
  final frame = (await tester.runAsync(() async {
    final codec = await ui.instantiateImageCodec(jpg);
    return (await codec.getNextFrame()).image;
  }))!;
  CameraLayer.debugTextureBuilder = (_) =>
      RawImage(image: frame, fit: BoxFit.fill);

  final seg = StreamController<SegmentationFrame>.broadcast();
  addTearDown(seg.close);
  final engine = FakeNativeEngine();
  final db = memoryDb();
  addTearDown(db.close);
  final settings = AppSettings(
    onboardingDone: true,
    tourDone: true,
    defaultView: DriveView.segmentation,
    segmentationMode: mode,
    reduceMotion: true,
  );
  final router = GoRouter(
    initialLocation: '/drive',
    routes: [GoRoute(path: '/drive', builder: (_, _) => const DriveScreen())],
  );
  final key = GlobalKey();
  await tester.pumpWidget(
    RepaintBoundary(
      key: key,
      child: ProviderScope(
        retry: (_, _) => null,
        overrides: [
          nativeEngineProvider.overrideWithValue(engine),
          databaseProvider.overrideWithValue(db),
          initialSettingsProvider.overrideWithValue(settings),
          cameraProvider.overrideWith(
            () => _FakeCamera(
              CameraState(
                status: CameraStatus.running,
                textureId: 1,
                previewSize: scene.frameSize,
                fps: 30,
              ),
            ),
          ),
          tracksProvider.overrideWith(() => _FixedTracks(scene.tracks)),
          aiModelsProvider.overrideWith(
            () => _FakeModels(supported: supported),
          ),
          segmentationFrameProvider.overrideWith((ref) => seg.stream),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Roboto'),
          locale: rtl ? const Locale('ar') : const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router,
        ),
      ),
    ),
  );
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 100));

  SegmentationFrame segFrame(double ts) => SegmentationFrame(
    ts: ts,
    frameSize: scene.frameSize,
    mapWidth: scene.mapW,
    mapHeight: scene.mapH,
    classMap: scene.map,
    inferenceMs: 240,
  );
  if (sendMap) {
    // Two maps 250 ms apart → fps known, cross-fade exercised.
    for (final ts in [0.0, 250.0]) {
      seg.add(segFrame(ts));
      await tester.pump();
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 250)),
      );
      await tester.pump();
    }
    await tester.pump(const Duration(milliseconds: 300));
  }
  expect(tester.takeException(), isNull);
  expect(find.byType(PerceptionView), findsOneWidget);

  // Layout contract: perception controls stay in the upper part of the
  // screen, clear of the road half and the shell's bottom controls.
  final viewSize = tester.view.physicalSize / tester.view.devicePixelRatio;
  final pill = find.bySemanticsLabel('Perception layers');
  if (!rtl) {
    expect(pill, findsOneWidget);
    final r = tester.getRect(pill);
    expect(r.bottom, lessThan(viewSize.height * (landscape ? .42 : .36)));
  }

  verify?.call();
  await interact?.call(tester);

  if (_outDir.isNotEmpty) {
    await tester.runAsync(() async {
      final boundary =
          key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 1.5);
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      image.dispose();
      Directory(_outDir).createSync(recursive: true);
      File('$_outDir/$name.png').writeAsBytesSync(bytes!.buffer.asUint8List());
    });
  }
  await tester.pumpWidget(const SizedBox());
  await tester.pump(const Duration(seconds: 15));
  frame.dispose();
}
