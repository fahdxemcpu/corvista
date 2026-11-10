import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:corvista/core/theme/app_theme.dart';
import 'package:corvista/data/database/database.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/features/trips/trip_controller.dart';
import 'package:corvista/features/trips/trip_detail_screen.dart';
import 'package:corvista/features/trips/trips_screen.dart';
import 'package:corvista/features/trips/widgets/trip_widgets.dart';
import 'package:corvista/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

/// Render harness for the trip log: pumps the provider-free list and detail
/// views with FIXTURE trips (test-only) and writes PNGs for visual review.
const _outDir = String.fromEnvironment(
  'TRIPS_RENDER_DIR',
  defaultValue:
      'build/qa/trips_renders',
);

final _now = DateTime(2026, 11, 7, 18, 30);

/// Winding synthetic route (city loop) starting at (lat, lon).
List<TripPoint> _route(DateTime start, {int n = 160, double seed = 1}) {
  final pts = <TripPoint>[];
  var lat = 48.8566, lon = 2.3522, heading = seed;
  for (var i = 0; i < n; i++) {
    heading += math.sin(i / 9 * seed) * .18;
    lat += math.cos(heading) * .00045;
    lon += math.sin(heading) * .00065;
    pts.add(
      TripPoint(
        ts: start.millisecondsSinceEpoch + i * 4000.0,
        lat: lat,
        lon: lon,
        speed: 9 + 4 * math.sin(i / 7),
        course: heading,
        hAcc: 6,
      ),
    );
  }
  return pts;
}

Trip _trip(
  String id,
  DateTime start,
  Duration dur, {
  double km = 7.4,
  String title = '',
  bool favorite = false,
  int incidents = 0,
  int alerts = 0,
  int emergencies = 0,
  Map<String, int> detections = const {},
}) => Trip.fromRow(
  TripRow(
    id: id,
    startedAt: start,
    endedAt: start.add(dur),
    distanceM: km * 1000,
    movingTimeS: dur.inSeconds * .82,
    avgSpeedMs: km * 1000 / (dur.inSeconds * .82),
    maxSpeedMs: 19.4,
    detectionCountsJson:
        '{${detections.entries.map((e) => '"${e.key}":${e.value}').join(',')}}',
    alertsCount: alerts,
    incidentCount: incidents,
    emergencyCount: emergencies,
    title: title,
    favorite: favorite,
  ),
);

final _trips = [
  _trip(
    'a',
    _now.subtract(const Duration(hours: 1, minutes: 10)),
    const Duration(minutes: 34),
    km: 18.2,
    incidents: 1,
    alerts: 4,
    favorite: true,
    title: 'Home → Office',
    detections: const {
      'car': 212,
      'person': 31,
      'bicycle': 9,
      'bus': 6,
      'trafficLight': 18,
      'stopSign': 2,
    },
  ),
  _trip(
    'b',
    _now.subtract(const Duration(hours: 9)),
    const Duration(minutes: 12),
    km: 4.1,
    alerts: 1,
  ),
  _trip(
    'c',
    _now.subtract(const Duration(days: 1, hours: 3)),
    const Duration(hours: 1, minutes: 5),
    km: 61.7,
    emergencies: 1,
    incidents: 2,
  ),
  _trip(
    'd',
    _now.subtract(const Duration(days: 4)),
    const Duration(minutes: 8),
    km: 2.3,
  ),
];

TripDetail _detail() {
  final t = _trips.first;
  final pts = _route(t.startedAt);
  TripEvent ev(int i, String kind, {String label = '', String? ref}) =>
      TripEvent(
        ts: pts[i].ts,
        kind: kind,
        label: label,
        refId: ref,
        lat: pts[i].lat,
        lon: pts[i].lon,
      );
  return TripDetail(
    trip: t,
    points: pts,
    events: [
      ev(5, TripEventKind.navStart, label: 'Office'),
      ev(30, TripEventKind.alert, label: 'pedestrian'),
      ev(61, TripEventKind.incident, label: 'manual', ref: 'clip1'),
      ev(90, TripEventKind.reroute),
      ev(120, TripEventKind.alert, label: 'trafficMoving'),
      ev(158, TripEventKind.navArrive, label: 'Office'),
    ],
  );
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
}

Future<void> _render(
  WidgetTester tester,
  String name,
  Size size,
  Widget body, {
  Locale locale = const Locale('en'),
  String title = 'Trips',
  void Function()? verify,
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  final key = GlobalKey();
  final theme = AppTheme.dark();
  await tester.pumpWidget(
    RepaintBoundary(
      key: key,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          textTheme: theme.textTheme.apply(fontFamily: 'Roboto'),
        ),
        locale: locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          appBar: AppBar(title: Text(title)),
          body: body,
        ),
      ),
    ),
  );
  await tester.pump(const Duration(milliseconds: 50));
  expect(tester.takeException(), isNull);
  verify?.call();
  await tester.runAsync(() async {
    final boundary =
        key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 1.5);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    try {
      Directory(_outDir).createSync(recursive: true);
      File('$_outDir/$name.png').writeAsBytesSync(bytes!.buffer.asUint8List());
    } on FileSystemException {
      // Manual review only.
    }
  });
  await tester.pumpWidget(const SizedBox());
}

Widget _list({List<Trip>? trips, bool enabled = true, double? live}) =>
    TripsListView(
      trips: trips ?? _trips,
      unit: SpeedUnit.kmh,
      enabled: enabled,
      now: _now,
      recordingDistanceM: live,
      onOpen: (_) {},
      onEnable: () {},
      thumbnail: (t) => TrackThumbnail(
        points: [
          for (final p in _route(
            t.startedAt,
            n: 80,
            seed: 1 + t.id.codeUnitAt(0) % 5 / 3,
          ))
            (p.lat, p.lon),
        ],
      ),
    );

void main() {
  setUpAll(_loadFonts);
  const portrait = Size(402, 874), landscape = Size(874, 402);

  testWidgets('list portrait', (t) async {
    await _render(
      t,
      'list_port',
      portrait,
      _list(live: 2350),
      verify: () {
        expect(find.text('TODAY'), findsOneWidget);
        expect(find.text('YESTERDAY'), findsOneWidget);
        expect(find.text('Home → Office'), findsOneWidget);
      },
    );
  });
  testWidgets('list landscape', (t) async {
    await _render(t, 'list_land', landscape, _list());
  });
  testWidgets('list RTL', (t) async {
    await _render(t, 'list_rtl', portrait, _list(), locale: const Locale('ar'));
  });
  testWidgets('empty', (t) async {
    await _render(
      t,
      'empty_port',
      portrait,
      _list(trips: const []),
      verify: () => expect(find.text('No trips yet'), findsOneWidget),
    );
  });
  testWidgets('empty disabled', (t) async {
    await _render(
      t,
      'empty_disabled',
      portrait,
      _list(trips: const [], enabled: false),
      verify: () => expect(find.text('Turn on trip log'), findsOneWidget),
    );
  });
  testWidgets('detail portrait', (t) async {
    String? opened;
    await _render(
      t,
      'detail_port',
      const Size(402, 1700),
      TripDetailView(
        detail: _detail(),
        unit: SpeedUnit.kmh,
        useNativeMap: false,
        onOpenClip: (id) => opened = id,
      ),
      title: 'Home → Office',
    );
    expect(opened, isNull);
  });
  testWidgets('detail landscape', (t) async {
    await _render(
      t,
      'detail_land',
      landscape,
      TripDetailView(
        detail: _detail(),
        unit: SpeedUnit.mph,
        useNativeMap: false,
        onOpenClip: (_) {},
      ),
      title: 'Home → Office',
    );
  });
  testWidgets('detail RTL', (t) async {
    await _render(
      t,
      'detail_rtl',
      const Size(402, 1700),
      TripDetailView(
        detail: _detail(),
        unit: SpeedUnit.kmh,
        useNativeMap: false,
        onOpenClip: (_) {},
      ),
      locale: const Locale('ar'),
    );
  });
  testWidgets('incident timeline entry opens the clip', (tester) async {
    tester.view.physicalSize = const Size(402, 1700);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    String? opened;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: TripDetailView(
            detail: _detail(),
            unit: SpeedUnit.kmh,
            useNativeMap: false,
            onOpenClip: (id) => opened = id,
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.scrollUntilVisible(find.text('Incident clip saved'), 200);
    await tester.tap(find.text('Incident clip saved'));
    expect(opened, 'clip1');
  });
}
