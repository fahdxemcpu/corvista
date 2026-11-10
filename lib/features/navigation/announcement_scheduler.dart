import 'dart:math' as math;

/// How far ahead of a maneuver a spoken prompt is given.
enum AnnouncementTier {
  /// Motorway heads-up (~2 km / 2 mi).
  early,

  /// ~1 km / 1 mi on motorways.
  mid,

  /// ~400 m motorway, ~500 m roads, ~300 m in town.
  prepare,

  /// ~100–200 m before the maneuver (towns and roads).
  near,

  /// About 3.5 s before the maneuver: the instruction alone.
  now,
}

/// Distance conventions for prompts.
enum UnitSystem { metric, imperialFeet, imperialYards }

class Announcement {
  const Announcement({
    required this.stepIndex,
    required this.tier,
    required this.distanceM,
    required this.nominalM,
  });
  final int stepIndex;
  final AnnouncementTier tier;

  /// Distance to the maneuver when the prompt was scheduled.
  final double distanceM;

  /// The round distance to *say* ("In 400 meters").
  final double nominalM;

  @override
  String toString() =>
      'Announcement(step $stepIndex, ${tier.name}, ${distanceM.round()} m, '
      'say ${nominalM.round()} m)';
}

/// Road class used to pick prompt distances (from speed, with hysteresis).
enum RoadClass { city, road, highway }

/// Decides *when* to speak turn-by-turn prompts, like Google Maps:
///
/// * Distances depend on the road class (from speed): motorway 2 km / 1 km
///   / 400 m / now, road 500 m / 200 m / now, town 300 m / 100 m / now
///   (imperial: 2 mi / 1 mi / ¼ mi, ½ mi / 500 ft, 1000 ft / 300 ft; UK:
///   yards).
/// * A prompt is triggered early by the time it takes to say it, so "In
///   400 meters" is heard at ~400 m. "Now" fires ~3.5 s before the
///   maneuver at the current speed.
/// * Each step speaks a given distance at most once and never a farther one
///   after a closer one (GPS jitter / class changes cannot repeat prompts).
///   Tiers less than [minGap] apart at the current speed are merged into the
///   closer one; entering a step inside several tiers speaks only the
///   closest.
class AnnouncementScheduler {
  AnnouncementScheduler({
    this.units = UnitSystem.metric,
    this.minGap = const Duration(seconds: 4),
    this.speechLead = const Duration(milliseconds: 1200),
    this.nowLead = const Duration(milliseconds: 3500),
  });

  final UnitSystem units;
  final Duration minGap;

  /// Prompts start this much before the nominal distance.
  final Duration speechLead;

  /// "Now" prompt lead time.
  final Duration nowLead;

  int _step = -1;
  double _closestSpoken = double.infinity;
  RoadClass _class = RoadClass.city;

  RoadClass get roadClass => _class;

  void _updateClass(double v) {
    // Hysteresis around ~45 km/h and ~80 km/h.
    switch (_class) {
      case RoadClass.city:
        if (v > 23) {
          _class = RoadClass.highway;
        } else if (v > 13.5) {
          _class = RoadClass.road;
        }
      case RoadClass.road:
        if (v > 23) {
          _class = RoadClass.highway;
        } else if (v < 10.5) {
          _class = RoadClass.city;
        }
      case RoadClass.highway:
        if (v < 10.5) {
          _class = RoadClass.city;
        } else if (v < 19.5) {
          _class = RoadClass.road;
        }
    }
  }

  /// (tier, nominal metres) for [c] in [units], farthest first (no "now").
  static List<(AnnouncementTier, double)> tiersFor(RoadClass c, UnitSystem u) {
    const mi = 1609.344, ft = .3048, yd = .9144;
    return switch ((c, u)) {
      (RoadClass.highway, UnitSystem.metric) => [
        (AnnouncementTier.early, 2000),
        (AnnouncementTier.mid, 1000),
        (AnnouncementTier.prepare, 400),
      ],
      (RoadClass.highway, _) => [
        (AnnouncementTier.early, 2 * mi),
        (AnnouncementTier.mid, mi),
        (AnnouncementTier.prepare, mi / 4),
      ],
      (RoadClass.road, UnitSystem.metric) => [
        (AnnouncementTier.prepare, 500),
        (AnnouncementTier.near, 200),
      ],
      (RoadClass.road, UnitSystem.imperialYards) => [
        (AnnouncementTier.prepare, mi / 2),
        (AnnouncementTier.near, 200 * yd),
      ],
      (RoadClass.road, _) => [
        (AnnouncementTier.prepare, mi / 2),
        (AnnouncementTier.near, 500 * ft),
      ],
      (RoadClass.city, UnitSystem.metric) => [
        (AnnouncementTier.prepare, 300),
        (AnnouncementTier.near, 100),
      ],
      (RoadClass.city, UnitSystem.imperialYards) => [
        (AnnouncementTier.prepare, 300 * yd),
        (AnnouncementTier.near, 100 * yd),
      ],
      (RoadClass.city, _) => [
        (AnnouncementTier.prepare, 1000 * ft),
        (AnnouncementTier.near, 300 * ft),
      ],
    };
  }

  /// Distance at which the "now" prompt fires at [speedMps].
  double nowDistance(double speedMps) =>
      math.max(15.0, speedMps * nowLead.inMilliseconds / 1000);

  /// Call for every guidance update. Returns the prompt to speak now, if any.
  Announcement? update({
    required int stepIndex,
    required double distanceM,
    required double speedMps,
  }) {
    if (stepIndex != _step) {
      _step = stepIndex;
      _closestSpoken = double.infinity;
    }
    if (distanceM.isNaN || distanceM < 0) return null;
    final v = math.max(0.0, speedMps);
    _updateClass(v);
    final lead = v * speechLead.inMilliseconds / 1000;
    final nowD = nowDistance(v);

    // Candidates closest first: now, then tiers.
    final tiers = tiersFor(_class, units);
    final candidates = <(AnnouncementTier, double, double)>[
      (AnnouncementTier.now, 0, nowD),
      for (final (t, d) in tiers.reversed) (t, d, d + lead),
    ];
    for (var i = 0; i < candidates.length; i++) {
      final (tier, nominal, trigger) = candidates[i];
      if (distanceM > trigger) continue;
      // Closest due candidate. Already spoken (or a closer one was)?
      final key = tier == AnnouncementTier.now ? 0.0 : nominal;
      if (key >= _closestSpoken) return null;
      // Too close in time to the next closer prompt: let that one speak.
      if (i > 0 && v > 0.5) {
        final (_, _, closerTrigger) = candidates[i - 1];
        if ((distanceM - closerTrigger) / v < minGap.inMilliseconds / 1000) {
          _closestSpoken = key;
          return null;
        }
      }
      _closestSpoken = key;
      return Announcement(
        stepIndex: stepIndex,
        tier: tier,
        distanceM: distanceM,
        nominalM: tier == AnnouncementTier.now ? distanceM : nominal,
      );
    }
    return null;
  }

  /// Forget everything (new route / reroute).
  void reset() {
    _step = -1;
    _closestSpoken = double.infinity;
  }
}
