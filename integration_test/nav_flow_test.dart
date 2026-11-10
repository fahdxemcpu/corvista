import 'dart:async';
import 'dart:math' as math;

import 'package:corvista/app/app.dart';
import 'package:corvista/app/providers.dart';
import 'package:corvista/app/router.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// End-to-end navigation flow on the Simulator. A host-side watcher reads the
/// `NAVCTL` lines this test prints to take screenshots (`SHOT name`) and to
/// drive the simulated location (`ROUTE lat,lon lat,lon ...`, `STOP`).
///
/// Run: `flutter test integration_test/nav_flow_test.dart -d <udid>` with the
/// simulator location set near the start point.
/// City under test (`--dart-define=NAV_CITY=london|tokyo|casablanca`):
/// (query typed in steps, cruise speed for the simulated drive m/s).
const city = String.fromEnvironment('NAV_CITY', defaultValue: 'casablanca');
const cities = <String, (List<String>, double)>{
  'casablanca': (['Moro', 'Morocco', 'Morocco Mall'], 18),
  'london': (['Marb', 'Marble', 'Marble Arch'], 12),
  'tokyo': (['渋谷', '渋谷駅'], 12),
};

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final (queries, cruise) = cities[city]!;
  final shotPrefix = '${city}_';

  void ctl(String s) => debugPrint('NAVCTL $s');

  Future<void> wait(WidgetTester t, Duration d) async {
    final end = DateTime.now().add(d);
    while (DateTime.now().isBefore(end)) {
      await t.pump(const Duration(milliseconds: 200));
    }
  }

  Future<void> shot(WidgetTester t, String name) async {
    await wait(t, const Duration(milliseconds: 600));
    ctl('SHOT $shotPrefix$name');
    await wait(t, const Duration(milliseconds: 2500));
  }

  Future<bool> until(
    WidgetTester t,
    bool Function() cond, {
    Duration timeout = const Duration(seconds: 20),
  }) async {
    final end = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(end)) {
      if (cond()) return true;
      await t.pump(const Duration(milliseconds: 250));
    }
    return cond();
  }

  double dist(double la1, double lo1, double la2, double lo2) =>
      NavigationController.distanceM(la1, lo1, la2, lo2);

  /// Waypoints along [poly] between [fromM] and [toM] (along-distance),
  /// spaced ~[spacing] m.
  List<String> waypoints(
    List<double> poly,
    double fromM,
    double toM, {
    double spacing = 40,
  }) {
    final out = <String>[];
    var along = 0.0;
    var lastEmit = -1e9;
    for (var i = 0; i + 3 < poly.length; i += 2) {
      final d = dist(poly[i], poly[i + 1], poly[i + 2], poly[i + 3]);
      if (along + d >= fromM && along <= toM) {
        if (along - lastEmit >= spacing || out.isEmpty) {
          out.add(
            '${poly[i].toStringAsFixed(6)},${poly[i + 1].toStringAsFixed(6)}',
          );
          lastEmit = along;
        }
      }
      along += d;
    }
    final n = poly.length;
    if (toM >= along - 1) {
      out.add(
        '${poly[n - 2].toStringAsFixed(6)},${poly[n - 1].toStringAsFixed(6)}',
      );
    }
    return out;
  }

  testWidgets('search → preview → guidance → reroute → arrival', (t) async {
    // Host grants location (no tap access to the system alert).
    ctl('GRANT');
    await Future<void>.delayed(const Duration(seconds: 3));
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final overrides = await bootstrap();
    await t.pumpWidget(
      ProviderScope(overrides: overrides, child: const CorvistaApp()),
    );
    await wait(t, const Duration(seconds: 1));
    final c = ProviderScope.containerOf(t.element(find.byType(CorvistaApp)));
    await c
        .read(settingsProvider.notifier)
        .update(
          (s) => s.copyWith(
            onboardingDone: true,
            tourDone: true,
            localeTag: () => 'en',
            navVoice: true,
          ),
        );
    await c.read(recentDestinationsProvider.notifier).clear();
    await wait(t, const Duration(seconds: 2));
    c.read(driveSessionProvider.notifier).setView(DriveView.maps);
    await until(t, () => c.read(locationProvider).fix != null);
    await wait(t, const Duration(seconds: 3));
    await shot(t, '01_map_idle');

    // --- search: type incrementally like a user.
    unawaited(c.read(routerProvider).push(Routes.destination));
    await wait(t, const Duration(seconds: 1));
    final field = find.byKey(const ValueKey('nav-search-field'));
    for (final q in queries) {
      await t.enterText(field, q);
      await wait(t, const Duration(milliseconds: 450));
    }
    final gotSuggestions = await until(
      t,
      () => c.read(navigationProvider).suggestions.isNotEmpty,
    );
    final ns = c.read(navigationProvider);
    debugPrint(
      'NAVLOG suggestions=$gotSuggestions '
      '${ns.suggestions.map((s) => s.title).take(5).toList()} '
      'noResults=${ns.noResults} err=${ns.error}',
    );
    expect(gotSuggestions, isTrue, reason: '${queries.last} suggestions');
    await shot(t, '02_suggestions');

    // Search button → full results.
    await t.testTextInput.receiveAction(TextInputAction.search);
    await until(t, () {
      final s = c.read(navigationProvider);
      return s.submitted && !s.loading;
    });
    debugPrint(
      'NAVLOG places=${c.read(navigationProvider).places.map((p) => p.name).take(5).toList()}',
    );
    await shot(t, '03_search_results');

    // Choose the first place → route preview.
    await t.enterText(field, queries.last);
    await until(t, () => c.read(navigationProvider).suggestions.isNotEmpty);
    await wait(t, const Duration(milliseconds: 500));
    await t.tap(find.byType(ListTile).first);
    final previewed = await until(
      t,
      () => c.read(navigationProvider).phase == NavPhase.choosingRoute,
    );
    debugPrint(
      'NAVLOG preview=$previewed routes=${c.read(navigationProvider).routes.map((r) => '${r.distanceM.round()}m/${r.expectedTravelTimeS.round()}s').toList()} '
      'err=${c.read(navigationProvider).error}',
    );
    expect(previewed, isTrue);
    await wait(t, const Duration(seconds: 2));
    await shot(t, '04_route_preview');

    // --- Go.
    await t.tap(find.byKey(const ValueKey('nav-go')));
    await until(
      t,
      () => c.read(navigationProvider).phase == NavPhase.navigating,
    );
    final route = c.read(navigationProvider).route!;
    final poly = route.polyline.toList();
    final total = route.distanceM;
    debugPrint(
      'NAVLOG steps=${route.steps.map((s) => s.instructions).toList()}',
    );
    final g0 = c.read(navigationProvider).guidance;
    debugPrint(
      'NAVLOG maneuvers=${c.read(navigationProvider).route == null ? '' : RouteGuidance(route).maneuvers}',
    );
    debugPrint('NAVLOG g0 next=${g0?.nextStep?.instructions}');
    await wait(t, const Duration(seconds: 2));
    await shot(t, '05_nav_start');

    // Drive the first ~1.8 km.
    final firstLeg = math.min(cruise * 70, total * .5);
    ctl('ROUTE $cruise ${waypoints(poly, 0, firstLeg).join(' ')}');
    for (var i = 0; i < 5; i++) {
      await wait(t, const Duration(seconds: 11));
      final g = c.read(navigationProvider).guidance;
      debugPrint(
        'NAVLOG drive i=$i dist=${g?.distanceToNextM.round()} '
        'man=${g?.maneuver} next=${g?.nextStep?.instructions} '
        'then=${g?.thenManeuver}@${g?.thenDistanceM?.round()} '
        'remain=${g?.remainingM.round()} off=${g?.offRoute}',
      );
      await shot(t, '06_drive_$i');
    }
    debugPrint('NAVLOG spoken=${c.read(navigationProvider.notifier).spoken}');

    // Landscape + Arabic (RTL) while guiding.
    if (city == 'casablanca') {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
      ]);
      await wait(t, const Duration(seconds: 3));
      await shot(t, '06_landscape');
      await c
          .read(settingsProvider.notifier)
          .update((s) => s.copyWith(localeTag: () => 'ar'));
      await wait(t, const Duration(seconds: 2));
      await shot(t, '06_landscape_ar');
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      await wait(t, const Duration(seconds: 3));
      await shot(t, '06_portrait_ar');
      await c
          .read(settingsProvider.notifier)
          .update((s) => s.copyWith(localeTag: () => 'en'));
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      await wait(t, const Duration(seconds: 1));
    }

    // Trip bar expanded.
    await t.tap(find.byKey(const ValueKey('nav-trip-bar')));
    await shot(t, '07_tripbar_expanded');
    await t.tap(find.byKey(const ValueKey('nav-trip-bar')));

    // --- Missed turn: keep driving straight past the route for ~350 m.
    final g1 = c.read(navigationProvider).guidance!;
    final fix = c.read(locationProvider).fix!;
    final brg = (g1.routeBearing ?? fix.course) * math.pi / 180;
    String pt(double d) {
      final lat = fix.lat + d * math.cos(brg) / 111195.0;
      final lon =
          fix.lon +
          d * math.sin(brg) / (111195.0 * math.cos(fix.lat * math.pi / 180));
      return '${lat.toStringAsFixed(6)},${lon.toStringAsFixed(6)}';
    }

    // Leave the road sideways after 60 m (a missed exit / turn).
    final side = brg + math.pi / 2;
    final lat2 =
        fix.lat + (60 * math.cos(brg) + 250 * math.cos(side)) / 111195.0;
    final lon2 =
        fix.lon +
        (60 * math.sin(brg) + 250 * math.sin(side)) /
            (111195.0 * math.cos(fix.lat * math.pi / 180));
    ctl(
      'ROUTE $cruise ${pt(0)} ${pt(60)} '
      '${lat2.toStringAsFixed(6)},${lon2.toStringAsFixed(6)}',
    );
    final v0 = c.read(navigationProvider).routeVersion;
    var sawRerouting = false;
    await until(t, () {
      final s = c.read(navigationProvider);
      if (s.rerouting || (s.guidance?.offRoute ?? false)) {
        if (!sawRerouting) ctl('SHOT ${shotPrefix}08_rerouting');
        sawRerouting = true;
      }
      return s.routeVersion > v0;
    }, timeout: const Duration(seconds: 60));
    debugPrint(
      'NAVLOG rerouted=${c.read(navigationProvider).routeVersion > v0} '
      'saw=$sawRerouting',
    );
    await wait(t, const Duration(seconds: 4));
    await shot(t, '09_after_reroute');

    // --- Last ~700 m of the (new) route → arrival.
    final r2 = c.read(navigationProvider).route!;
    final p2 = r2.polyline.toList();
    ctl(
      'ROUTE $cruise ${waypoints(p2, math.max(0, r2.distanceM - 700), r2.distanceM).join(' ')}',
    );
    await until(
      t,
      () => c.read(navigationProvider).guidance?.arrived ?? false,
      timeout: const Duration(seconds: 120),
    );
    debugPrint(
      'NAVLOG arrived=${c.read(navigationProvider).guidance?.arrived} '
      'spoken=${c.read(navigationProvider.notifier).spoken}',
    );
    ctl('STOP');
    await shot(t, '10_arrived');
  });
}
