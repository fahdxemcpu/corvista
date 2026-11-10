import '../../domain/models/tracked_object.dart';

/// Detects "traffic ahead is moving" while the ego vehicle is stopped.
///
/// * Lead = confirmed vehicle track whose box centre lies in the central
///   [centralBand] of the frame width; the largest such box wins.
/// * Armed once the lead and ego have both been stationary for
///   [stationaryS] (ego speed < [egoStoppedMps], |scaleRate| and centre drift
///   below the stability limits).
/// * Fires once when, while armed and ego still stopped, the lead recedes
///   (scaleRate < −[recedeRate]) continuously for [recedeS].
class LeadVehicleMonitor {
  LeadVehicleMonitor({
    this.centralBand = 0.30,
    this.stationaryS = 3.0,
    this.egoStoppedMps = 1.0,
    this.stableScaleRate = 0.05,
    this.stableCentreSpeed = 0.03,
    this.recedeRate = 0.08,
    this.recedeS = 0.7,
  });

  final double centralBand;
  final double stationaryS;
  final double egoStoppedMps;
  final double stableScaleRate;
  final double stableCentreSpeed;
  final double recedeRate;
  final double recedeS;

  int? _leadId;
  double? _stationarySince;
  bool _armed = false;
  double? _recedeSince;

  int? get leadId => _leadId;
  bool get armed => _armed;

  void reset() {
    _leadId = null;
    _stationarySince = null;
    _armed = false;
    _recedeSince = null;
  }

  static TrackedObject? findLead(
    List<TrackedObject> tracks, {
    double band = 0.30,
  }) {
    final lo = 0.5 - band / 2, hi = 0.5 + band / 2;
    TrackedObject? best;
    var bestArea = 0.0;
    for (final t in tracks) {
      if (!t.isConfirmed || !t.cls.isVehicle) continue;
      final cx = t.box.center.dx;
      if (cx < lo || cx > hi) continue;
      final a = t.box.width * t.box.height;
      if (a > bestArea) {
        bestArea = a;
        best = t;
      }
    }
    return best;
  }

  /// [egoSpeedMps] negative = unknown (treated as not stopped).
  /// Returns true exactly once per stop when traffic ahead starts moving.
  bool update(List<TrackedObject> tracks, double egoSpeedMps, double tsS) {
    final egoStopped = egoSpeedMps >= 0 && egoSpeedMps < egoStoppedMps;
    if (!egoStopped) {
      reset();
      return false;
    }
    final lead = findLead(tracks, band: centralBand);
    if (lead == null) {
      // Lead vanished; stay conservative and require a fresh stop.
      _leadId = null;
      _stationarySince = null;
      _armed = false;
      _recedeSince = null;
      return false;
    }
    if (lead.id != _leadId) {
      reset();
      _leadId = lead.id;
    }
    final v = lead.velocity;
    final stable =
        v.scaleRate.abs() < stableScaleRate &&
        v.dx.abs() < stableCentreSpeed &&
        v.dy.abs() < stableCentreSpeed;

    if (!_armed) {
      if (stable) {
        _stationarySince ??= tsS;
        if (tsS - _stationarySince! >= stationaryS) _armed = true;
      } else {
        _stationarySince = null;
      }
      return false;
    }

    if (v.scaleRate < -recedeRate) {
      _recedeSince ??= tsS;
      if (tsS - _recedeSince! >= recedeS - 1e-9) {
        // Fire once, then require a new stationary period.
        _armed = false;
        _stationarySince = null;
        _recedeSince = null;
        return true;
      }
    } else {
      _recedeSince = null;
    }
    return false;
  }
}
