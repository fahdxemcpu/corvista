import 'dart:io';
import 'dart:ui' as ui;

import 'package:corvista/core/theme/app_colors.dart';
import 'package:corvista/features/detection/widgets/cover_transform.dart';
import 'package:corvista/features/parking/parking_proximity.dart';
import 'package:corvista/features/parking/widgets/parking_widgets.dart';
import 'package:corvista/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/parking_sequences.dart';

/// Render harness for the parking view on REAL parking footage: replays the
/// detection fixtures (test/fixtures/parking_sequences) through the tracker
/// and `ParkingProximity`, and renders the provider-free [ParkingLayout] with
/// the actual video frame as the camera pane into PNG strips for visual
/// review. Frames come from `PARKING_FRAMES_DIR/<sequence>/f_NNNN.jpg` (not in
/// the repo); without them only the layout smoke check runs.
const _framesDir = String.fromEnvironment(
  'PARKING_FRAMES_DIR',
  defaultValue:
      'build/qa/frames',
);
const _outDir = String.fromEnvironment(
  'PARKING_RENDER_DIR',
  defaultValue:
      'build/qa/parking_renders',
);

// Drive shell geometry (same as virtual_view_render_test.dart).
const _portrait = Size(402, 874);
const _landscape = Size(874, 402);
const _padPortrait = EdgeInsets.fromLTRB(0, 191, 0, 176);
const _padLandscape = EdgeInsets.fromLTRB(62, 90, 62, 105);

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
    'Roboto-Black.ttf',
  ]);
  await load('MaterialIcons', ['MaterialIcons-Regular.otf']);
}

class _FramePainter extends CustomPainter {
  _FramePainter(this.image, this.tf);
  final ui.Image? image;
  final CoverTransform tf;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = Colors.black);
    final img = image;
    if (img == null) return;
    canvas.drawImageRect(
      img,
      Rect.fromLTWH(0, 0, img.width.toDouble(), img.height.toDouble()),
      tf.frameRect,
      Paint()..filterQuality = FilterQuality.medium,
    );
  }

  @override
  bool shouldRepaint(_FramePainter old) => true;
}

Widget _panel(
  ParkingSequence seq,
  ParkingStep step,
  ui.Image? image,
  Size device,
  EdgeInsets pad, {
  TextDirection dir = TextDirection.ltr,
}) {
  return SizedBox.fromSize(
    size: device,
    child: Directionality(
      textDirection: dir,
      child: Builder(
        builder: (context) {
          final l10n = context.l10n;
          return Stack(
            fit: StackFit.expand,
            children: [
              ParkingLayout(
                contentPadding: pad,
                frameAspect: seq.frameSize.width / seq.frameSize.height,
                assessment: step.assessment,
                beepsOn: true,
                volume: .8,
                onBeeps: (_) {},
                onVolume: (_) {},
                onAbout: () {},
                camera: LayoutBuilder(
                  builder: (context, c) {
                    final tf = CoverTransform(
                      frameSize: seq.frameSize,
                      viewSize: Size(c.maxWidth, c.maxHeight),
                      fit: FrameFit.widthBottom,
                    );
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        CustomPaint(painter: _FramePainter(image, tf)),
                        CustomPaint(
                          painter: ParkingBoxesPainter(
                            transform: tf,
                            tracks: step.tracks,
                            assessment: step.assessment,
                            textDirection: dir,
                            labelStyle: DefaultTextStyle.of(context).style,
                            labelFor: (o) => l10n.parkingObjectSide(
                              l10n.objectClass(o.track.cls),
                              l10n.parkingSide(o.side),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              // Ghost of the drive shell: top HUD and bottom controls areas.
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: pad.top,
                child: const ColoredBox(color: Color(0x22FFFFFF)),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: pad.bottom,
                child: const ColoredBox(color: Color(0x22FFFFFF)),
              ),
              Positioned(
                left: 4,
                top: 4,
                child: Text(
                  '${seq.name}  t=${step.tS.toStringAsFixed(1)}s  '
                  '${step.assessment.zone.name}',
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    backgroundColor: Colors.black54,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}

/// Frames worth looking at: the most severe moments plus an even spread.
List<int> _pick(List<ParkingStep> steps, int n) {
  final idx = List.generate(steps.length, (i) => i)
    ..sort((a, b) {
      final c = steps[b].assessment.zone.level.compareTo(
        steps[a].assessment.zone.level,
      );
      return c != 0 ? c : a.compareTo(b);
    });
  final out = <int>{};
  for (final i in idx) {
    if (out.length >= n ~/ 2) break;
    if (out.every((j) => (j - i).abs() >= 15)) out.add(i);
  }
  for (var k = 0; out.length < n && k < n * 2; k++) {
    final i = ((k + .5) * steps.length / (n * 2)).floor();
    if (out.every((j) => (j - i).abs() >= 8)) out.add(i);
  }
  return out.toList()..sort();
}

String _timeline(List<ParkingStep> steps) {
  const ch = {
    ParkingZone.stop: 'S',
    ParkingZone.veryClose: 'V',
    ParkingZone.close: 'c',
    ParkingZone.nothingClose: '.',
  };
  return steps.map((s) => ch[s.assessment.zone]).join();
}

void main() {
  setUpAll(_loadFonts);

  for (final name in ParkingSequence.names) {
    final seq = ParkingSequence.load(name);
    final model = ParkingProximity();
    final steps = replayParking(seq, model: model);
    final picks = _pick(steps, 8);
    final haveFrames = File('$_framesDir/$name/${seq.files.first}')
        .existsSync();

    for (final (orient, device, pad) in [
      ('land', _landscape, _padLandscape),
      ('port', _portrait, _padPortrait),
    ]) {
      testWidgets('parking render $name $orient', (tester) async {
        // ignore: avoid_print
        print(
          '$name horizon=${model.projector.horizon.toStringAsFixed(2)} '
          '${_timeline(steps)}',
        );
        final per = orient == 'land' ? 4 : 4;
        final chunks = [
          for (var i = 0; i < picks.length; i += per)
            picks.sublist(i, (i + per).clamp(0, picks.length)),
        ];
        for (var ci = 0; ci < chunks.length; ci++) {
          final chunk = chunks[ci];
          final images = <ui.Image?>[];
          await tester.runAsync(() async {
            for (final i in chunk) {
              if (!haveFrames) {
                images.add(null);
                continue;
              }
              final bytes = File('$_framesDir/$name/${seq.files[i]}')
                  .readAsBytesSync();
              final codec = await ui.instantiateImageCodec(bytes);
              images.add((await codec.getNextFrame()).image);
            }
          });
          final land = orient == 'land';
          final total = land
              ? Size(device.width, device.height * chunk.length)
              : Size(device.width * chunk.length, device.height);
          tester.view.physicalSize = total;
          tester.view.devicePixelRatio = 1;
          addTearDown(tester.view.reset);
          final key = GlobalKey();
          final panels = [
            for (var k = 0; k < chunk.length; k++)
              _panel(
                seq,
                steps[chunk[k]],
                images[k],
                device,
                pad,
                // One RTL panel per strip to check mirroring.
                dir: k == chunk.length - 1 && ci == 0
                    ? TextDirection.rtl
                    : TextDirection.ltr,
              ),
          ];
          await tester.pumpWidget(
            RepaintBoundary(
              key: key,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  brightness: Brightness.dark,
                  fontFamily: 'Roboto',
                  scaffoldBackgroundColor: AppColors.background,
                ),
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                home: Material(
                  color: Colors.black,
                  child: land
                      ? Column(children: panels)
                      : Row(children: panels),
                ),
              ),
            ),
          );
          await tester.pump();
          expect(tester.takeException(), isNull);
          if (!haveFrames) continue;
          await tester.runAsync(() async {
            final boundary =
                key.currentContext!.findRenderObject()!
                    as RenderRepaintBoundary;
            final image = await boundary.toImage(pixelRatio: 1);
            final bytes = await image.toByteData(
              format: ui.ImageByteFormat.png,
            );
            image.dispose();
            for (final i in images) {
              i?.dispose();
            }
            try {
              Directory(_outDir).createSync(recursive: true);
              File('$_outDir/${name}_${orient}_$ci.png')
                  .writeAsBytesSync(bytes!.buffer.asUint8List());
            } on FileSystemException {
              // Output is for manual review only.
            }
          });
          await tester.pumpWidget(const SizedBox());
        }
      });
    }
  }
}
