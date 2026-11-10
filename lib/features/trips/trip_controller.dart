import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../domain/models/location_fix.dart';
import '../../domain/models/tracked_object.dart';
import '../../domain/repositories/trip_repository.dart';
import '../../domain/services/clock.dart';
import '../dashcam/recorder_controller.dart';
import '../emergency/emergency_controller.dart';
import '../maps/location_controller.dart';
import '../navigation/navigation_controller.dart';
import '../settings/settings_controller.dart';
import '../tracking/tracker_controller.dart';
import '../voice_alerts/voice_alert_controller.dart';
import 'trip_recorder.dart';

export '../../domain/repositories/trip_repository.dart';
export 'gpx.dart';
export 'trip_recorder.dart';

class TripState {
  const TripState({
    this.enabled = true,
    this.tripId,
    this.startedAt,
    this.distanceM = 0,
    this.movingTimeS = 0,
  });

  final bool enabled;

  /// Id of the trip being recorded, null when none.
  final String? tripId;
  final DateTime? startedAt;
  final double distanceM;
  final double movingTimeS;

  bool get recording => tripId != null;
}

/// Records trips while a drive session is active. Driven by the drive
/// session (`sessionStarted` / `sessionStopped`) plus location, recorder,
/// voice-alert, emergency and navigation state. Everything stays in the
/// local database.
class TripController extends Notifier<TripState> {
  late TripRecorder _recorder;
  bool _sessionActive = false;
  LocationFix? _lastFix;
  final Map<String, Set<int>> _detections = {};
  int _alerts = 0, _incidents = 0, _emergencies = 0;
  int _pointsSinceSave = 0;
  Future<void> _queue = Future.value();

  TripRepository get _repo => ref.read(tripRepositoryProvider);

  @override
  TripState build() {
    _recorder = TripRecorder();
    ref.listen(locationProvider.select((s) => s.fix), (_, fix) {
      if (fix != null) onFix(fix);
    });
    ref.listen(recorderProvider.select((s) => s.lastSaved), (prev, next) {
      if (next != null && next.id != prev?.id) {
        _incidents++;
        _event(TripEventKind.incident, label: next.reason, refId: next.id);
      }
    });
    // Manual (continuous) recording parts are trip events of kind 'recording'.
    ref.listen(recorderProvider.select((s) => s.lastManualPart), (prev, next) {
      if (next != null && next.id != prev?.id) {
        _event(
          TripEventKind.recording,
          label: next.part == null ? '' : 'part ${next.part}',
          refId: next.id,
        );
      }
    });
    ref.listen(voiceAlertsProvider.select((s) => s.last), (prev, next) {
      if (next != null && !identical(next, prev)) {
        _alerts++;
        _event(TripEventKind.alert, label: next.kind.name);
      }
    });
    ref.listen(emergencyProvider, (prev, next) {
      final ev = next.event;
      if (ev == null || next.isTest) return;
      if (next.phase == EmergencyPhase.countdown && prev?.event?.id != ev.id) {
        _emergencies++;
        _event(TripEventKind.emergency, refId: ev.id);
      }
    });
    ref.listen(tracksProvider, (_, tracks) => _countDetections(tracks));
    ref.listen(navigationProvider, (prev, next) => _onNav(prev, next));
    ref.listen(settingsProvider.select((s) => s.tripLogEnabled), (_, v) {
      state = TripState(
        enabled: v,
        tripId: state.tripId,
        startedAt: state.startedAt,
        distanceM: state.distanceM,
        movingTimeS: state.movingTimeS,
      );
      if (!v) unawaited(endTrip());
    });
    return TripState(enabled: ref.read(settingsProvider).tripLogEnabled);
  }

  bool get _enabled => ref.read(settingsProvider).tripLogEnabled;

  /// Called by the drive session when it starts.
  void sessionStarted() => _sessionActive = true;

  /// Called by the drive session when it stops: ends any trip.
  Future<void> sessionStopped() async {
    _sessionActive = false;
    await endTrip();
  }

  /// Serialises DB writes in arrival order.
  Future<void> _enqueue(Future<void> Function() f) {
    final next = _queue.then((_) async {
      try {
        await f();
      } catch (e) {
        debugPrint('Trip log write failed: $e');
      }
    });
    _queue = next;
    return next;
  }

  /// Completes when all pending writes are done (tests).
  Future<void> flush() => _queue;

  double _ts(LocationFix f) => f.ts > 0
      ? f.ts
      : ref.read(clockProvider)().millisecondsSinceEpoch.toDouble();

  TripFix _toFix(LocationFix f) => TripFix(
    ts: _ts(f),
    lat: f.lat,
    lon: f.lon,
    speed: f.speed,
    course: f.course,
    hAcc: f.hAcc,
  );

  /// Feeds a fix (public for tests).
  void onFix(LocationFix fix) {
    _lastFix = fix;
    if (!_sessionActive || !_enabled) return;
    final u = _recorder.onFix(_toFix(fix));
    _apply(u);
  }

  void _apply(TripUpdate u) {
    if (u.started) _begin(u.points.isEmpty ? null : u.points.first);
    final id = state.tripId;
    if (id != null && u.points.isNotEmpty) {
      final pts = u.points;
      unawaited(_enqueue(() => _repo.addPoints(id, pts)));
      _pointsSinceSave += pts.length;
      final s = _recorder.stats;
      state = TripState(
        enabled: state.enabled,
        tripId: id,
        startedAt: state.startedAt,
        distanceM: s.distanceM,
        movingTimeS: s.movingTimeS,
      );
      if (_pointsSinceSave >= 15) {
        _pointsSinceSave = 0;
        unawaited(
          _enqueue(() => _repo.saveStats(id, s, detectionCounts: _counts())),
        );
      }
    }
    final ended = u.ended;
    if (ended != null) unawaited(_finish(ended));
  }

  void _begin(TripFix? first) {
    final id = const Uuid().v4();
    final startedAt = first != null
        ? DateTime.fromMillisecondsSinceEpoch(first.ts.round())
        : ref.read(clockProvider)();
    _detections.clear();
    _alerts = _incidents = _emergencies = 0;
    _pointsSinceSave = 0;
    state = TripState(enabled: state.enabled, tripId: id, startedAt: startedAt);
    unawaited(_enqueue(() => _repo.create(id, startedAt, first: first)));
  }

  Map<String, int> _counts() => {
    for (final e in _detections.entries) e.key: e.value.length,
  };

  void _countDetections(List<TrackedObject> tracks) {
    if (state.tripId == null) return;
    for (final t in tracks) {
      if (t.isConfirmed) (_detections[t.cls.name] ??= {}).add(t.id);
    }
  }

  void _event(String kind, {String label = '', String? refId}) {
    final id = state.tripId;
    if (id == null) return;
    final f = _lastFix;
    final ts = ref.read(clockProvider)().millisecondsSinceEpoch.toDouble();
    unawaited(
      _enqueue(
        () => _repo.addEvent(
          id,
          ts: ts,
          kind: kind,
          label: label,
          refId: refId,
          lat: f?.lat,
          lon: f?.lon,
        ),
      ),
    );
  }

  void _onNav(NavState? prev, NavState next) {
    final wasNav = prev?.phase == NavPhase.navigating;
    final isNav = next.phase == NavPhase.navigating;
    if (!wasNav && isNav) {
      if (_sessionActive && _enabled && !_recorder.active) {
        final f = _lastFix;
        _apply(_recorder.forceStart(at: f == null ? null : _toFix(f)));
      }
      _event(TripEventKind.navStart, label: next.destination?.name ?? '');
    } else if (wasNav && isNav && prev!.routeVersion != next.routeVersion) {
      _event(TripEventKind.reroute);
    }
    if (prev?.guidance?.arrived != true && next.guidance?.arrived == true) {
      _event(TripEventKind.navArrive, label: next.destination?.name ?? '');
    }
  }

  /// Ends the current trip (if any) and persists or discards it.
  Future<void> endTrip() async {
    final s = _recorder.end();
    if (s == null) return;
    await _finish(s);
  }

  Future<void> _finish(TripStats s) async {
    final id = state.tripId;
    if (id == null) return;
    final counts = _counts();
    final alerts = _alerts, incidents = _incidents, emergencies = _emergencies;
    if (ref.mounted) state = TripState(enabled: state.enabled);
    await _enqueue(() async {
      if (s.distanceM < _recorder.minTripM || s.pointCount < 2) {
        await _repo.delete(id);
      } else {
        await _repo.saveStats(
          id,
          s,
          finished: true,
          detectionCounts: counts,
          alerts: alerts,
          incidents: incidents,
          emergencies: emergencies,
        );
      }
    });
  }
}

final tripProvider = NotifierProvider<TripController, TripState>(
  TripController.new,
);

/// Finished trips, newest first.
final tripsProvider = StreamProvider<List<Trip>>(
  (ref) => ref.watch(tripRepositoryProvider).watchTrips(),
);

/// Everything the trip detail screen needs.
class TripDetail {
  const TripDetail({
    required this.trip,
    required this.points,
    required this.events,
  });
  final Trip trip;
  final List<TripPoint> points;
  final List<TripEvent> events;
}

final tripDetailProvider = StreamProvider.family<TripDetail?, String>((
  ref,
  id,
) async* {
  final repo = ref.watch(tripRepositoryProvider);
  final points = await repo.points(id);
  final events = await repo.events(id);
  await for (final t in repo.watchTrip(id)) {
    yield t == null
        ? null
        : TripDetail(trip: t, points: points, events: events);
  }
});

/// Downsampled (≤ 80 points) track shape for list thumbnails.
final tripShapeProvider = FutureProvider.family<List<(double, double)>, String>(
  (ref, id) async {
    final pts = await ref.watch(tripRepositoryProvider).points(id);
    return downsampleTrack([for (final p in pts) (p.lat, p.lon)]);
  },
);

/// Keeps first/last and evenly spaced points so at most [max] remain.
List<(double, double)> downsampleTrack(
  List<(double, double)> pts, {
  int max = 80,
}) {
  if (pts.length <= max) return pts;
  final step = (pts.length - 1) / (max - 1);
  return [for (var i = 0; i < max; i++) pts[(i * step).round()]];
}
