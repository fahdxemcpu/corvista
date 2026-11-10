import '../../domain/models/app_settings.dart';
import '../../domain/models/object_class.dart';
import '../../domain/models/tracked_object.dart';
import 'lead_vehicle_monitor.dart';

enum AlertKind {
  pedestrian,
  cyclist,
  motorcycle,
  bus,
  vehicleClose,
  trafficLightGreen,
  trafficLightRed,
  trafficMoving,
  stopSign,
}

class AlertEvent {
  const AlertEvent(this.kind, {this.trackId});
  final AlertKind kind;
  final int? trackId;

  @override
  String toString() => 'AlertEvent(${kind.name}, track: $trackId)';
}

/// Sensitivity-dependent thresholds.
class AlertThresholds {
  const AlertThresholds({
    required this.zones,
    required this.minConfidence,
    required this.corridorDeg,
  });

  final Set<ProximityZone> zones;
  final double minConfidence;
  final double corridorDeg;

  static AlertThresholds of(AlertSensitivity s) => switch (s) {
    AlertSensitivity.low => const AlertThresholds(
      zones: {ProximityZone.veryClose},
      minConfidence: 0.6,
      corridorDeg: 15,
    ),
    AlertSensitivity.medium => const AlertThresholds(
      zones: {ProximityZone.veryClose, ProximityZone.close},
      minConfidence: 0.5,
      corridorDeg: 20,
    ),
    AlertSensitivity.high => const AlertThresholds(
      zones: {
        ProximityZone.veryClose,
        ProximityZone.close,
        ProximityZone.medium,
      },
      minConfidence: 0.4,
      corridorDeg: 25,
    ),
  };
}

class _Candidate {
  const _Candidate(
    this.kind,
    this.trackId,
    this.priority, {
    this.oneShot = false,
  });
  final AlertKind kind;
  final int? trackId;
  final int priority; // lower = more important
  final bool oneShot;
}

/// Turns tracks + ego speed into at most one spoken alert per evaluation.
///
/// * Per-(kind, track) cooldown = `settings.alertCooldownS`.
/// * Per-kind cooldown = half of that (avoids "pedestrian ahead" for every
///   member of a crowd).
/// * Global rate limit: ≤ 1 alert every [globalMinIntervalS] (4 s).
/// * One-shot events (light changes, traffic moving) wait up to
///   [oneShotTtlS] if the global limiter is busy, then expire.
/// * Quiet mode: only very-close vulnerable road users and close vehicles.
class AlertEngine {
  AlertEngine({
    this.globalMinIntervalS = 4,
    this.oneShotTtlS = 3,
    LeadVehicleMonitor? leadMonitor,
  }) : leadMonitor = leadMonitor ?? LeadVehicleMonitor();

  final double globalMinIntervalS;
  final double oneShotTtlS;
  final LeadVehicleMonitor leadMonitor;

  final Map<(AlertKind, int?), double> _lastByKey = {};
  final Map<AlertKind, double> _lastByKind = {};
  final Map<int, LightState> _lightMemory = {};
  final List<(_Candidate, double)> _pendingOneShots = [];
  double? _lastAlertS;

  void reset() {
    _lastByKey.clear();
    _lastByKind.clear();
    _lightMemory.clear();
    _pendingOneShots.clear();
    _lastAlertS = null;
    leadMonitor.reset();
  }

  static bool kindEnabled(AlertKind k, AppSettings s) => switch (k) {
    AlertKind.pedestrian => s.alertPedestrian,
    AlertKind.cyclist => s.alertCyclist,
    AlertKind.motorcycle => s.alertMotorcycle,
    AlertKind.bus => s.alertBus,
    AlertKind.vehicleClose => s.alertVehicleClose,
    AlertKind.trafficLightGreen ||
    AlertKind.trafficLightRed => s.alertTrafficLight,
    AlertKind.trafficMoving => s.alertTrafficMoving,
    AlertKind.stopSign => s.alertStopSign,
  };

  /// [egoSpeedMps] < 0 = unknown. [tsS] monotonic seconds.
  List<AlertEvent> evaluate({
    required List<TrackedObject> tracks,
    required double egoSpeedMps,
    required AppSettings settings,
    required double tsS,
  }) {
    final th = AlertThresholds.of(settings.alertSensitivity);
    final quiet = settings.quietMode;
    final moving = egoSpeedMps > 2;
    final stopped = egoSpeedMps >= 0 && egoSpeedMps < 2;
    final candidates = <_Candidate>[];

    // --- one-shot: light transitions (from filtered lamp state) ---
    final present = <int>{};
    for (final t in tracks) {
      if (t.cls != ObjectClass.trafficLight) continue;
      present.add(t.id);
      final prev = _lightMemory[t.id] ?? LightState.unknown;
      if (t.light != LightState.unknown) _lightMemory[t.id] = t.light;
      if (!t.isConfirmed || t.bearingDeg.abs() > 25) continue;
      if (prev == LightState.red && t.light == LightState.green && stopped) {
        _pendingOneShots.add((
          _Candidate(AlertKind.trafficLightGreen, t.id, 4, oneShot: true),
          tsS,
        ));
      } else if ((prev == LightState.green || prev == LightState.yellow) &&
          t.light == LightState.red &&
          egoSpeedMps > 3) {
        _pendingOneShots.add((
          _Candidate(AlertKind.trafficLightRed, t.id, 3, oneShot: true),
          tsS,
        ));
      }
    }
    _lightMemory.removeWhere((id, _) => !present.contains(id));

    // --- one-shot: lead vehicle starts moving ---
    if (leadMonitor.update(tracks, egoSpeedMps, tsS)) {
      _pendingOneShots.add((
        _Candidate(
          AlertKind.trafficMoving,
          leadMonitor.leadId,
          5,
          oneShot: true,
        ),
        tsS,
      ));
    }
    _pendingOneShots.removeWhere((p) => tsS - p.$2 > oneShotTtlS);

    // --- continuous rules ---
    for (final t in tracks) {
      if (!t.isConfirmed || t.confidence < th.minConfidence) continue;
      final ahead = t.bearingDeg.abs() <= th.corridorDeg;
      switch (t.cls) {
        case ObjectClass.person ||
            ObjectClass.bicycle ||
            ObjectClass.motorcycle:
          final corridor = t.cls == ObjectClass.motorcycle
              ? th.corridorDeg * 1.5
              : th.corridorDeg;
          if (t.bearingDeg.abs() > corridor || !th.zones.contains(t.zone)) {
            break;
          }
          if (quiet && t.zone != ProximityZone.veryClose) break;
          final kind = switch (t.cls) {
            ObjectClass.person => AlertKind.pedestrian,
            ObjectClass.bicycle => AlertKind.cyclist,
            _ => AlertKind.motorcycle,
          };
          candidates.add(
            _Candidate(kind, t.id, t.zone == ProximityZone.veryClose ? 0 : 1),
          );
        case ObjectClass.car:
          final approaching = t.velocity.scaleRate > 0.15;
          final veryClose =
              t.zone == ProximityZone.veryClose && t.bearingDeg.abs() <= 10;
          final closeFast =
              settings.alertSensitivity == AlertSensitivity.high &&
              t.zone == ProximityZone.close &&
              t.bearingDeg.abs() <= 10 &&
              t.velocity.scaleRate > 0.25;
          if ((veryClose && (moving || approaching)) || closeFast) {
            candidates.add(_Candidate(AlertKind.vehicleClose, t.id, 1));
          }
        case ObjectClass.bus:
          if (quiet || !ahead || !th.zones.contains(t.zone)) break;
          candidates.add(_Candidate(AlertKind.bus, t.id, 2));
        case ObjectClass.stopSign:
          if (quiet || !moving || egoSpeedMps <= 3) break;
          if (t.zone == ProximityZone.far || t.zone == ProximityZone.unknown) {
            break;
          }
          candidates.add(_Candidate(AlertKind.stopSign, t.id, 6));
        case ObjectClass.trafficLight:
          break;
      }
    }
    if (!quiet) candidates.addAll(_pendingOneShots.map((p) => p.$1));

    // --- rate limiting ---
    if (_lastAlertS != null && tsS - _lastAlertS! < globalMinIntervalS) {
      return const [];
    }
    candidates.sort((a, b) => a.priority.compareTo(b.priority));
    final cooldown = settings.alertCooldownS.toDouble();
    for (final c in candidates) {
      if (!kindEnabled(c.kind, settings)) continue;
      final keyLast = _lastByKey[(c.kind, c.trackId)];
      if (keyLast != null && tsS - keyLast < cooldown) continue;
      final kindLast = _lastByKind[c.kind];
      if (!c.oneShot && kindLast != null && tsS - kindLast < cooldown / 2) {
        continue;
      }
      _lastByKey[(c.kind, c.trackId)] = tsS;
      _lastByKind[c.kind] = tsS;
      _lastAlertS = tsS;
      if (c.oneShot) _pendingOneShots.removeWhere((p) => identical(p.$1, c));
      _pruneCooldowns(tsS, cooldown);
      return [AlertEvent(c.kind, trackId: c.trackId)];
    }
    return const [];
  }

  void _pruneCooldowns(double tsS, double cooldown) {
    if (_lastByKey.length < 64) return;
    _lastByKey.removeWhere((_, t) => tsS - t > cooldown * 2);
  }
}
