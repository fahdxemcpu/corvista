import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/features/navigation/guidance_engine.dart';
import 'package:corvista/features/navigation/guidance_voice.dart';
import 'package:corvista/features/navigation/maneuver.dart';
import 'package:corvista/features/navigation/navigation_models.dart';
import 'package:corvista/features/navigation/route_guidance.dart';
import 'package:corvista/features/navigation/traffic_side.dart';
import 'package:corvista/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Replays real MapKit routes (test/fixtures/routes, dumped from the
/// Simulator) with synthetic 1 Hz GPS traces: ±10 m noise, speed profiles,
/// a missed turn, a tunnel gap, a motorway exit, wrong-way driving.

RouteInfo loadRoute(String name) {
  final j = jsonDecode(
    File('test/fixtures/routes/$name.json').readAsStringSync(),
  ) as Map<String, Object?>;
  return RouteInfo(
    id: name,
    name: name,
    distanceM: (j['distanceM'] as num).toDouble(),
    expectedTravelTimeS: (j['expectedTravelTimeS'] as num).toDouble(),
    advisories: const [],
    polyline: Float64List.fromList([
      for (final v in j['polyline'] as List) (v as num).toDouble(),
    ]),
    steps: [
      for (final s in j['steps'] as List)
        RouteStep.fromMap((s as Map).cast<Object?, Object?>()),
    ],
  ).drivingOnly();
}

/// Route geometry helper in metres (local plane at the route start).
class Geo {
  Geo(this.route) {
    final p = route.polyline;
    lat0 = p[0];
    lon0 = p[1];
    cos0 = math.cos(lat0 * math.pi / 180);
    for (var i = 0; i + 1 < p.length; i += 2) {
      xs.add((p[i + 1] - lon0) * mLon);
      ys.add((p[i] - lat0) * mLat);
    }
    cum.add(0);
    for (var i = 1; i < xs.length; i++) {
      cum.add(cum.last + math.sqrt(_d2(i - 1, i)));
    }
  }
  final RouteInfo route;
  late final double lat0, lon0, cos0;
  final xs = <double>[], ys = <double>[], cum = <double>[];
  static const mLat = 111195.08;
  double get mLon => mLat * cos0;
  double get total => cum.last;

  double _d2(int a, int b) =>
      (xs[a] - xs[b]) * (xs[a] - xs[b]) + (ys[a] - ys[b]) * (ys[a] - ys[b]);

  int seg(double s) {
    for (var i = 0; i + 1 < cum.length; i++) {
      if (cum[i + 1] >= s) return i;
    }
    return cum.length - 2;
  }

  (double, double) xyAt(double s) {
    final c = s.clamp(0.0, total);
    final i = seg(c);
    final len = cum[i + 1] - cum[i];
    final t = len <= 0 ? 0.0 : (c - cum[i]) / len;
    return (xs[i] + t * (xs[i + 1] - xs[i]), ys[i] + t * (ys[i + 1] - ys[i]));
  }

  double bearingAt(double s) {
    final (x1, y1) = xyAt(math.max(0, s - 5));
    final (x2, y2) = xyAt(s + 5);
    final b = math.atan2(x2 - x1, y2 - y1) * 180 / math.pi;
    return (b + 360) % 360;
  }

  (double, double) toLatLon(double x, double y) =>
      (lat0 + y / mLat, lon0 + x / mLon);

  /// Along-distance of each maneuver point (nearest vertex).
  List<double> stepAlong() {
    final out = <double>[];
    var from = 0;
    for (final st in route.steps) {
      var best = from;
      var bd = double.infinity;
      for (var i = from; i < xs.length; i++) {
        final x = (st.lon - lon0) * mLon, y = (st.lat - lat0) * mLat;
        final d = (xs[i] - x) * (xs[i] - x) + (ys[i] - y) * (ys[i] - y);
        if (d < bd) {
          bd = d;
          best = i;
        }
      }
      out.add(cum[best]);
      from = best;
    }
    return out;
  }
}

class Sample {
  Sample(this.t, this.fix, this.trueAlong, {this.offTrack = 0});
  final int t; // ms
  final NavFix? fix; // null = no fix (tunnel)
  final double trueAlong;
  final double offTrack;
}

class Replay {
  Replay(this.route, {this.lht}) : geo = Geo(route);
  final RouteInfo route;
  final bool? lht;
  final Geo geo;
  final rnd = math.Random(42);

  double _noise(double sigma) {
    // Box–Muller, clamped to ±2σ (±10 m for σ = 5).
    final u = math.max(1e-9, rnd.nextDouble()), v = rnd.nextDouble();
    final n = math.sqrt(-2 * math.log(u)) * math.cos(2 * math.pi * v);
    return (n * sigma).clamp(-2 * sigma, 2 * sigma);
  }

  NavFix fixAt(double s, double speed, {double lateral = 0, double hAcc = 8}) {
    final (x, y) = geo.xyAt(s);
    final b = geo.bearingAt(s) * math.pi / 180;
    // Lateral offset to the right of travel + noise.
    final nx = x + math.cos(b) * lateral + _noise(5);
    final ny = y - math.sin(b) * lateral + _noise(5);
    final (lat, lon) = geo.toLatLon(nx, ny);
    return NavFix(
      lat: lat,
      lon: lon,
      speed: speed,
      course: speed > 1 ? (geo.bearingAt(s) + _noise(3) + 360) % 360 : -1,
      hAcc: hAcc,
    );
  }

  /// Speed profile: [cruise], slowing to 7 m/s around maneuvers.
  double speedAt(double s, List<double> along, double cruise) {
    var v = cruise;
    for (final a in along) {
      final d = (a - s).abs();
      if (d < 80) v = math.min(v, 7 + (cruise - 7) * d / 80);
    }
    return v;
  }

  /// 1 Hz trace along the whole route.
  List<Sample> trace({double cruise = 13}) {
    final along = geo.stepAlong();
    final out = <Sample>[];
    var s = 0.0;
    var t = 0;
    while (s < geo.total) {
      final v = speedAt(s, along, cruise);
      out.add(Sample(t, fixAt(s, v), s));
      s += v;
      t += 1000;
    }
    out.add(Sample(t, fixAt(geo.total, 2), geo.total));
    return out;
  }
}

class RunResult {
  final steps = <int>[];
  final prompts = <(int, String, double)>[]; // (t, text, trueDistToNext)
  final offRouteEdges = <int>[];
  bool arrived = false;
  final errors = <double>[];
}

RunResult run(
  GuidanceEngine e,
  List<Sample> samples, {
  List<double>? stepAlong,
  bool predictBetween = false,
}) {
  final r = RunResult();
  final t0 = DateTime(2026, 11, 7, 12);
  var wasOff = false;
  for (final smp in samples) {
    final now = t0.add(Duration(milliseconds: smp.t));
    final Guidance g;
    if (smp.fix == null) {
      g = e.predict(now, tMs: smp.t);
    } else {
      final u = e.onFix(smp.fix!, now, tMs: smp.t);
      g = u.guidance;
      for (final p in u.prompts) {
        var dist = double.nan;
        if (stepAlong != null) {
          final next = stepAlong.where((a) => a > smp.trueAlong + 1);
          dist = next.isEmpty ? double.nan : next.first - smp.trueAlong;
        }
        r.prompts.add((smp.t, p, dist));
      }
      if (u.offRoute && !wasOff) r.offRouteEdges.add(smp.t);
      wasOff = u.offRoute;
    }
    if (r.steps.isEmpty || r.steps.last != g.stepIndex) {
      r.steps.add(g.stepIndex);
    }
    if (g.arrived) r.arrived = true;
    if (smp.offTrack == 0) r.errors.add((g.progressM - smp.trueAlong).abs());
  }
  return r;
}

GuidanceVoice voice({SpeedUnit unit = SpeedUnit.kmh}) => GuidanceVoice(
  lookupAppLocalizations(const Locale('en')),
  unit: unit,
  locale: 'en',
);

const fixtures = [
  'casablanca_roundabouts',
  'paris_etoile',
  'paris_city',
  'manhattan_grid',
  'la_highway_exits',
  'casablanca_motorway',
  'london_lht',
  'tokyo_lht',
];

void main() {
  group('real MapKit routes: maneuver classification', () {
    for (final name in fixtures) {
      test(name, () {
        final route = loadRoute(name);
        final g = RouteGuidance(route);
        final mans = g.maneuvers;
        final problems = <String>[];
        for (var i = 0; i < route.steps.length; i++) {
          final text = route.steps[i].instructions.toLowerCase();
          final m = mans[i];
          if (i == route.steps.length - 1) {
            if (m.type != ManeuverType.arrive) {
              problems.add('last step not arrive: $m');
            }
            continue;
          }
          if (text.contains('roundabout')) {
            if (m.type != ManeuverType.roundabout) {
              problems.add('"$text" → $m');
            }
            continue;
          }
          final saysLeft = RegExp(r'\b(left)\b').hasMatch(text);
          final saysRight = RegExp(r'\b(right)\b').hasMatch(text);
          if (saysLeft == saysRight) continue;
          final directional = {
            ManeuverType.slightLeft,
            ManeuverType.left,
            ManeuverType.sharpLeft,
            ManeuverType.uTurnLeft,
            ManeuverType.keepLeft,
            ManeuverType.mergeLeft,
            ManeuverType.slightRight,
            ManeuverType.right,
            ManeuverType.sharpRight,
            ManeuverType.uTurnRight,
            ManeuverType.keepRight,
            ManeuverType.mergeRight,
          };
          if (!directional.contains(m.type) || m.isLeft != saysLeft) {
            problems.add('"$text" → $m');
          }
          if (text.startsWith('turn ') &&
              !{
                ManeuverType.left,
                ManeuverType.right,
                ManeuverType.sharpLeft,
                ManeuverType.sharpRight,
                ManeuverType.slightLeft,
                ManeuverType.slightRight,
              }.contains(m.type)) {
            problems.add('turn not a turn: "$text" → $m');
          }
        }
        expect(problems, isEmpty, reason: problems.join('\n'));
      });
    }

    test('roundabout exit numbers from MapKit text', () {
      final g = RouteGuidance(loadRoute('casablanca_roundabouts'));
      final exits = [
        for (final m in g.maneuvers)
          if (m.type == ManeuverType.roundabout && m.exit != null) m.exit,
      ];
      expect(exits, containsAllInOrder([2, 1, 2]));
      final etoile = RouteGuidance(loadRoute('paris_etoile'));
      expect(
        etoile.maneuvers
            .where((m) => m.type == ManeuverType.roundabout)
            .first
            .exit,
        6,
      );
    });

    test('motorway exit ramp is a slight move (geometry side)', () {
      final route = loadRoute('la_highway_exits');
      final g = RouteGuidance(route);
      final i = route.steps.indexWhere(
        (s) => s.instructions.contains('exit 1B'),
      );
      expect(i, greaterThan(0));
      // MapKit gives no side here: the geometry decides (a left exit).
      expect(
        g.maneuvers[i].type,
        anyOf(ManeuverType.slightRight, ManeuverType.slightLeft),
      );
    });

    test('left-hand traffic detection', () {
      expect(TrafficSide.isLeftHand(51.5014, -0.1419), isTrue); // London
      expect(TrafficSide.isLeftHand(35.6896, 139.7006), isTrue); // Tokyo
      expect(TrafficSide.isLeftHand(-33.87, 151.21), isTrue); // Sydney
      expect(TrafficSide.isLeftHand(19.07, 72.88), isTrue); // Mumbai
      expect(TrafficSide.isLeftHand(33.57, -7.59), isFalse); // Casablanca
      expect(TrafficSide.isLeftHand(48.86, 2.35), isFalse); // Paris
      expect(TrafficSide.isLeftHand(40.76, -73.98), isFalse); // New York
      expect(TrafficSide.isLeftHand(16.8, 96.15), isFalse); // Yangon
      expect(RouteGuidance(loadRoute('london_lht')).lht, isTrue);
    });
  });

  group('replay with noisy 1 Hz GPS', () {
    for (final name in fixtures) {
      test('$name: banner + prompts follow the route', () {
        final route = loadRoute(name);
        final highway = name.contains('highway') || name.contains('motorway');
        final rp = Replay(route);
        final along = rp.geo.stepAlong();
        final e = GuidanceEngine(route, voice: voice());
        final r = run(e, rp.trace(cruise: highway ? 29 : 12), stepAlong: along);
        // Never off route on the route itself, even with ±10 m noise.
        expect(r.offRouteEdges, isEmpty, reason: 'false reroute');
        expect(r.arrived, isTrue);
        // Banner visits the steps in order (never backwards).
        for (var i = 1; i < r.steps.length; i++) {
          expect(r.steps[i], greaterThan(r.steps[i - 1]), reason: '${r.steps}');
        }
        // Progress tracks truth closely.
        final sorted = [...r.errors]..sort();
        expect(sorted[(sorted.length * .95).floor()], lessThan(25));
        // Each maneuver (≥ 150 m after the previous) gets a "now" prompt
        // ~1–6 s before it, and nothing is said twice in a row.
        final g = RouteGuidance(route);
        for (var i = 0; i < route.steps.length - 1; i++) {
          final gap = i == 0 ? along[0] : along[i] - along[i - 1];
          if (gap < 150) continue;
          final text = route.steps[i].instructions.replaceAll(
            RegExp(r'[.。]+$'),
            '',
          );
          final now = r.prompts.where((p) => p.$2.startsWith(text)).toList();
          expect(
            now,
            isNotEmpty,
            reason: 'now prompt for "$text": ${r.prompts}',
          );
          final v = rp.speedAt(
            along[i] - now.first.$3,
            along,
            highway ? 29 : 12,
          );
          final secs = now.first.$3 / v;
          expect(
            secs,
            inInclusiveRange(0.8, 7.0),
            reason: '"$text" at ${now.first.$3.round()} m',
          );
          expect(g.maneuvers[i].type, isNot(ManeuverType.arrive));
        }
        for (var i = 1; i < r.prompts.length; i++) {
          expect(r.prompts[i].$2, isNot(r.prompts[i - 1].$2));
        }
        expect(r.prompts.last.$2, 'You have arrived');
      });
    }

    test('motorway prompts at 2 km / 1 km / 400 m / now', () {
      final route = loadRoute('la_highway_exits');
      final rp = Replay(route);
      final e = GuidanceEngine(route, voice: voice());
      final r = run(e, rp.trace(cruise: 30), stepAlong: rp.geo.stepAlong());
      final exit = r.prompts
          .where((p) => p.$2.contains('exit 1B'))
          .map((p) => p.$2)
          .toList();
      expect(exit, [
        'In 2 kilometers, take exit 1B towards Lincoln Blvd and CA-1 South',
        'In 1 kilometer, take exit 1B towards Lincoln Blvd and CA-1 South',
        'In 400 meters, take exit 1B towards Lincoln Blvd and CA-1 South',
        'Take exit 1B towards Lincoln Blvd and CA-1 South',
      ]);
      // "Continue for …" after joining the motorway.
      expect(r.prompts.map((p) => p.$2), contains(startsWith('Continue for')));
    });

    test('US units: miles and feet', () {
      final route = loadRoute('la_highway_exits');
      final rp = Replay(route);
      final e = GuidanceEngine(route, voice: voice(unit: SpeedUnit.mph));
      final r = run(e, rp.trace(cruise: 30));
      final texts = r.prompts.map((p) => p.$2).toList();
      expect(texts, contains(startsWith('In 2 miles, take exit 1B')));
      expect(texts, contains(startsWith('In 1 mile, take exit 1B')));
      expect(texts, contains(startsWith('In 0.25 miles, take exit 1B')));
      expect(texts.where((t) => t.contains('meters')), isEmpty);
    });

    test('missed turn: one reroute request within 6 s', () {
      final route = loadRoute('manhattan_grid');
      final rp = Replay(route);
      final along = rp.geo.stepAlong();
      // Drive to the 2nd turn, then carry straight on for 300 m.
      final turnAt = along[1];
      final samples = <Sample>[];
      var t = 0;
      var s = 0.0;
      while (s < turnAt) {
        samples.add(Sample(t, rp.fixAt(s, 10), s));
        s += 10;
        t += 1000;
      }
      final b = rp.geo.bearingAt(turnAt - 20) * math.pi / 180;
      final (cx, cy) = rp.geo.xyAt(turnAt);
      int? leftAt;
      for (var d = 10.0; d <= 300; d += 10) {
        final (lat, lon) = rp.geo.toLatLon(
          cx + math.sin(b) * d,
          cy + math.cos(b) * d,
        );
        samples.add(
          Sample(
            t,
            NavFix(
              lat: lat,
              lon: lon,
              speed: 10,
              course: (b * 180 / math.pi + 360) % 360,
              hAcc: 8,
            ),
            turnAt,
            offTrack: d,
          ),
        );
        if (d >= 40) leftAt ??= t;
        t += 1000;
      }
      final e = GuidanceEngine(route, voice: voice());
      final r = run(e, samples);
      expect(r.offRouteEdges, hasLength(1), reason: '${r.offRouteEdges}');
      expect(r.offRouteEdges.first - leftAt!, lessThanOrEqualTo(6000));
    });

    test('tunnel: 45 s without GPS, then noisy fixes — no reroute', () {
      final route = loadRoute('casablanca_motorway');
      final rp = Replay(route);
      final full = rp.trace(cruise: 25);
      // Middle of the trip: drop fixes for 45 s, then 10 s of junk fixes
      // (hAcc 150 m, scattered) while the car keeps driving.
      final start = full.length ~/ 2;
      final samples = <Sample>[
        for (var i = 0; i < full.length; i++)
          if (i >= start && i < start + 45)
            Sample(full[i].t, null, full[i].trueAlong)
          else if (i >= start + 45 && i < start + 55)
            Sample(
              full[i].t,
              NavFix(
                lat: full[i].fix!.lat + .003,
                lon: full[i].fix!.lon - .002,
                speed: -1,
                hAcc: 150,
              ),
              full[i].trueAlong,
            )
          else
            full[i],
      ];
      final e = GuidanceEngine(route, voice: voice());
      final r = run(e, samples);
      expect(r.offRouteEdges, isEmpty);
      // Dead reckoning keeps the position close during the gap.
      final gapErrors = r.errors.sublist(start, start + 55);
      expect(gapErrors.reduce(math.max), lessThan(150));
      // …and it re-locks right after.
      expect(
        r.errors.sublist(start + 58, start + 70).reduce(math.max),
        lessThan(30),
      );
      expect(r.arrived, isTrue);
    });

    test('wrong way on the route is off route', () {
      final route = loadRoute('paris_city');
      final rp = Replay(route);
      final e = GuidanceEngine(route, voice: voice());
      final samples = <Sample>[];
      var t = 0;
      // Start correctly for 200 m, then drive back along the route.
      for (var s = 0.0; s < 200; s += 10, t += 1000) {
        samples.add(Sample(t, rp.fixAt(s, 10), s));
      }
      for (var s = 200.0; s > 60; s -= 10, t += 1000) {
        final f = rp.fixAt(s, 10);
        samples.add(
          Sample(
            t,
            NavFix(
              lat: f.lat,
              lon: f.lon,
              speed: 10,
              course: (rp.geo.bearingAt(s) + 180) % 360,
              hAcc: 8,
            ),
            s,
            offTrack: 1,
          ),
        );
      }
      final r = run(e, samples);
      expect(r.offRouteEdges, hasLength(1));
    });

    test('dead reckoning between fixes is smooth (no jumps)', () {
      final route = loadRoute('casablanca_roundabouts');
      final rp = Replay(route);
      final e = GuidanceEngine(route, voice: voice());
      final t0 = DateTime(2026, 11, 7, 12);
      var prev = -1.0;
      var maxStep = 0.0;
      for (var i = 0; i < 60; i++) {
        final s = i * 12.0;
        e.onFix(rp.fixAt(s, 12), t0.add(Duration(seconds: i)), tMs: i * 1000);
        for (var k = 1; k < 15; k++) {
          final ms = i * 1000 + k * 66;
          final g = e.predict(t0.add(Duration(milliseconds: ms)), tMs: ms);
          if (prev >= 0 && i > 3) {
            maxStep = math.max(maxStep, (g.progressM - prev).abs());
          }
          prev = g.progressM;
        }
      }
      // 12 m/s at 15 Hz ≈ 0.8 m per frame; corrections stay small.
      expect(maxStep, lessThan(6));
    });
  });
}
