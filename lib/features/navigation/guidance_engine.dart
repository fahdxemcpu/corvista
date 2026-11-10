import 'dart:math' as math;

import 'announcement_scheduler.dart';
import 'guidance_voice.dart';
import 'maneuver.dart';
import 'navigation_models.dart';
import 'route_guidance.dart';

/// Result of feeding one fix to [GuidanceEngine].
class GuidanceUpdate {
  const GuidanceUpdate({
    required this.guidance,
    this.prompts = const [],
    this.offRoute = false,
  });
  final Guidance guidance;

  /// Phrases to speak now, in order.
  final List<String> prompts;

  /// The tracker declared the vehicle off route (reroute wanted).
  final bool offRoute;
}

/// Pure turn-by-turn session: route tracking + prompt scheduling + phrases.
/// No I/O, so it can be replayed with recorded / synthetic GPS traces.
class GuidanceEngine {
  GuidanceEngine(RouteInfo route, {required this.voice, bool? leftHandTraffic})
    : _lht = leftHandTraffic {
    _set(route);
  }

  final GuidanceVoice voice;
  final bool? _lht;

  late RouteGuidance _tracker;
  late AnnouncementScheduler _scheduler;
  int _lastStep = -1;
  bool _arrivalSpoken = false;

  /// "Continue for …" is said when the next maneuver is at least this far.
  static const continueMinM = 1500.0;

  RouteGuidance get tracker => _tracker;
  RouteInfo get route => _tracker.route;

  void _set(RouteInfo r) {
    _tracker = RouteGuidance(r, leftHandTraffic: _lht);
    _scheduler = AnnouncementScheduler(units: voice.units);
    _lastStep = -1;
  }

  /// New route after a reroute (keeps the arrival state).
  void replaceRoute(RouteInfo r) => _set(r);

  Guidance predict(DateTime now, {int? tMs}) => _tracker.predict(now, tMs: tMs);

  GuidanceUpdate onFix(NavFix fix, DateTime now, {int? tMs}) {
    final g = _tracker.updateFix(fix, now, tMs: tMs);
    final prompts = <String>[];
    if (g.arrived) {
      if (!_arrivalSpoken) {
        _arrivalSpoken = true;
        prompts.add(voice.l10n.navSpeakArrived);
      }
      return GuidanceUpdate(guidance: g, prompts: prompts);
    }
    if (g.offRoute) return GuidanceUpdate(guidance: g, offRoute: true);

    final speed = fix.speed >= 0 ? fix.speed : g.speedMps;
    final passed = _lastStep >= 0 && g.stepIndex != _lastStep;
    final first = _lastStep < 0;
    _lastStep = g.stepIndex;

    final a = _scheduler.update(
      stepIndex: g.stepIndex,
      distanceM: g.distanceToNextM,
      speedMps: speed,
    );
    if (a != null) {
      final p = voice.prompt(a, g);
      if (p != null) prompts.add(p);
    } else if ((passed || first) &&
        g.distanceToNextM >= continueMinM &&
        g.maneuver?.type != ManeuverType.arrive) {
      // Long stretch ahead: "Continue for 5 km" unless a prompt is close.
      final tiers = AnnouncementScheduler.tiersFor(
        _scheduler.roadClass,
        voice.units,
      );
      final farthest = tiers.isEmpty ? 0.0 : tiers.first.$2;
      final secondsToTier = speed > 1
          ? (g.distanceToNextM - farthest) / speed
          : double.infinity;
      if (secondsToTier > 12) {
        prompts.add(voice.continueFor(_roundForSpeech(g.distanceToNextM)));
      }
    }
    return GuidanceUpdate(guidance: g, prompts: prompts);
  }

  static double _roundForSpeech(double m) =>
      m >= 10000 ? (m / 1000).roundToDouble() * 1000 : math.max(m, 0);
}
