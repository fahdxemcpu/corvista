import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/database.dart';
import '../../features/trips/trip_recorder.dart';

/// Event kinds stored in `trip_events.kind`.
abstract final class TripEventKind {
  static const alert = 'alert';
  static const incident = 'incident';
  static const emergency = 'emergency';
  static const navStart = 'navStart';
  static const navArrive = 'navArrive';
  static const reroute = 'reroute';

  /// A finished manual-recording part (`refId` = clip id).
  static const recording = 'recording';
}

class Trip {
  const Trip({
    required this.id,
    required this.startedAt,
    required this.endedAt,
    required this.distanceM,
    required this.movingTimeS,
    required this.avgSpeedMs,
    required this.maxSpeedMs,
    required this.startLat,
    required this.startLon,
    required this.endLat,
    required this.endLon,
    required this.startPlace,
    required this.endPlace,
    required this.detectionCounts,
    required this.alertsCount,
    required this.incidentCount,
    required this.emergencyCount,
    required this.title,
    required this.favorite,
  });

  final String id;
  final DateTime startedAt;
  final DateTime? endedAt;
  final double distanceM, movingTimeS, avgSpeedMs, maxSpeedMs;
  final double? startLat, startLon, endLat, endLon;
  final String? startPlace, endPlace;

  /// ObjectClass name → number of distinct confirmed tracks.
  final Map<String, int> detectionCounts;
  final int alertsCount, incidentCount, emergencyCount;
  final String title;
  final bool favorite;

  bool get isOpen => endedAt == null;
  Duration get duration => (endedAt ?? DateTime.now()).difference(startedAt);
  int get totalDetections => detectionCounts.values.fold(0, (a, b) => a + b);

  static Trip fromRow(TripRow r) {
    Map<String, int> counts;
    try {
      counts = (jsonDecode(r.detectionCountsJson) as Map).map(
        (k, v) => MapEntry('$k', (v as num).toInt()),
      );
    } catch (_) {
      counts = const {};
    }
    return Trip(
      id: r.id,
      startedAt: r.startedAt,
      endedAt: r.endedAt,
      distanceM: r.distanceM,
      movingTimeS: r.movingTimeS,
      avgSpeedMs: r.avgSpeedMs,
      maxSpeedMs: r.maxSpeedMs,
      startLat: r.startLat,
      startLon: r.startLon,
      endLat: r.endLat,
      endLon: r.endLon,
      startPlace: r.startPlace,
      endPlace: r.endPlace,
      detectionCounts: counts,
      alertsCount: r.alertsCount,
      incidentCount: r.incidentCount,
      emergencyCount: r.emergencyCount,
      title: r.title,
      favorite: r.favorite,
    );
  }
}

class TripPoint {
  const TripPoint({
    required this.ts,
    required this.lat,
    required this.lon,
    required this.speed,
    required this.course,
    required this.hAcc,
  });
  final double ts, lat, lon, speed, course, hAcc;

  DateTime get time => DateTime.fromMillisecondsSinceEpoch(ts.round());
  TripFix toFix() => TripFix(
    ts: ts,
    lat: lat,
    lon: lon,
    speed: speed,
    course: course,
    hAcc: hAcc,
  );

  static TripPoint fromRow(TripPointRow r) => TripPoint(
    ts: r.ts,
    lat: r.lat,
    lon: r.lon,
    speed: r.speed,
    course: r.course,
    hAcc: r.hAcc,
  );
}

class TripEvent {
  const TripEvent({
    required this.ts,
    required this.kind,
    required this.label,
    required this.refId,
    required this.lat,
    required this.lon,
  });
  final double ts;
  final String kind, label;
  final String? refId;
  final double? lat, lon;

  DateTime get time => DateTime.fromMillisecondsSinceEpoch(ts.round());

  static TripEvent fromRow(TripEventRow r) => TripEvent(
    ts: r.ts,
    kind: r.kind,
    label: r.label,
    refId: r.refId,
    lat: r.lat,
    lon: r.lon,
  );
}

/// Drift-backed trip log. Trips, points and events stay on this device.
/// Deleting a trip never deletes incident clips (only its own rows).
class TripRepository {
  TripRepository(this._db);
  final AppDatabase _db;

  /// Finished trips, newest first.
  Stream<List<Trip>> watchTrips() =>
      (_db.select(_db.trips)
            ..where((t) => t.endedAt.isNotNull())
            ..orderBy([(t) => OrderingTerm.desc(t.startedAt)]))
          .watch()
          .map((rows) => rows.map(Trip.fromRow).toList());

  Stream<Trip?> watchTrip(String id) =>
      (_db.select(_db.trips)..where((t) => t.id.equals(id)))
          .watchSingleOrNull()
          .map((r) => r == null ? null : Trip.fromRow(r));

  Future<Trip?> trip(String id) async {
    final r = await (_db.select(
      _db.trips,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return r == null ? null : Trip.fromRow(r);
  }

  Future<List<TripPoint>> points(String tripId) async =>
      (await (_db.select(_db.tripPoints)
                ..where((t) => t.tripId.equals(tripId))
                ..orderBy([(t) => OrderingTerm.asc(t.ts)]))
              .get())
          .map(TripPoint.fromRow)
          .toList();

  Future<List<TripEvent>> events(String tripId) async =>
      (await (_db.select(_db.tripEvents)
                ..where((t) => t.tripId.equals(tripId))
                ..orderBy([(t) => OrderingTerm.asc(t.ts)]))
              .get())
          .map(TripEvent.fromRow)
          .toList();

  Future<void> create(String id, DateTime startedAt, {TripFix? first}) => _db
      .into(_db.trips)
      .insert(
        TripsCompanion.insert(
          id: id,
          startedAt: startedAt,
          startLat: Value(first?.lat),
          startLon: Value(first?.lon),
        ),
      );

  Future<void> addPoints(String tripId, List<TripFix> pts) async {
    if (pts.isEmpty) return;
    await _db.batch(
      (b) => b.insertAll(_db.tripPoints, [
        for (final p in pts)
          TripPointsCompanion.insert(
            tripId: tripId,
            ts: p.ts,
            lat: p.lat,
            lon: p.lon,
            speed: p.speed,
            course: p.course,
            hAcc: p.hAcc,
          ),
      ]),
    );
  }

  Future<void> addEvent(
    String tripId, {
    required double ts,
    required String kind,
    String label = '',
    String? refId,
    double? lat,
    double? lon,
  }) => _db
      .into(_db.tripEvents)
      .insert(
        TripEventsCompanion.insert(
          tripId: tripId,
          ts: ts,
          kind: kind,
          label: Value(label),
          refId: Value(refId),
          lat: Value(lat),
          lon: Value(lon),
        ),
      );

  /// Writes stats (and counters); sets `endedAt` when [finished].
  Future<void> saveStats(
    String tripId,
    TripStats s, {
    bool finished = false,
    Map<String, int>? detectionCounts,
    int? alerts,
    int? incidents,
    int? emergencies,
  }) => (_db.update(_db.trips)..where((t) => t.id.equals(tripId))).write(
    TripsCompanion(
      distanceM: Value(s.distanceM),
      movingTimeS: Value(s.movingTimeS),
      avgSpeedMs: Value(s.avgSpeedMs),
      maxSpeedMs: Value(s.maxSpeedMs),
      startLat: s.startLat == null ? const Value.absent() : Value(s.startLat),
      startLon: s.startLon == null ? const Value.absent() : Value(s.startLon),
      endLat: Value(s.endLat),
      endLon: Value(s.endLon),
      endedAt: finished
          ? Value(DateTime.fromMillisecondsSinceEpoch(s.endTs.round()))
          : const Value.absent(),
      detectionCountsJson: detectionCounts == null
          ? const Value.absent()
          : Value(jsonEncode(detectionCounts)),
      alertsCount: alerts == null ? const Value.absent() : Value(alerts),
      incidentCount: incidents == null
          ? const Value.absent()
          : Value(incidents),
      emergencyCount: emergencies == null
          ? const Value.absent()
          : Value(emergencies),
    ),
  );

  Future<void> rename(String id, String title) =>
      (_db.update(_db.trips)..where((t) => t.id.equals(id))).write(
        TripsCompanion(title: Value(title.trim())),
      );

  Future<void> setFavorite(String id, bool v) => (_db.update(
    _db.trips,
  )..where((t) => t.id.equals(id))).write(TripsCompanion(favorite: Value(v)));

  /// Deletes the trip, its points and events. Incident clips are untouched.
  Future<void> delete(String id) => _db.transaction(() async {
    await (_db.delete(_db.tripPoints)..where((t) => t.tripId.equals(id))).go();
    await (_db.delete(_db.tripEvents)..where((t) => t.tripId.equals(id))).go();
    await (_db.delete(_db.trips)..where((t) => t.id.equals(id))).go();
  });

  /// Deletes trips that started before `now − retentionDays` (0 = keep
  /// forever). Favourites are purged too (retention is a privacy setting).
  /// Returns the number of trips removed.
  Future<int> purge({required int retentionDays, required DateTime now}) async {
    if (retentionDays <= 0) return 0;
    final cutoff = now.subtract(Duration(days: retentionDays));
    final old = await (_db.select(
      _db.trips,
    )..where((t) => t.startedAt.isSmallerThanValue(cutoff))).get();
    for (final t in old) {
      await delete(t.id);
    }
    return old.length;
  }

  /// Finalizes trips left open by app termination: recomputes stats from
  /// their saved points; discards those shorter than [minTripM]. Skips
  /// [exceptId] (the live trip). Returns the number finalized (kept).
  /// Links a manual-recording part recovered after a crash to the trip whose
  /// time span contains it (a `recording` event, once). Returns the trip id.
  Future<String?> linkRecoveredRecording(
    String clipId,
    DateTime at, {
    int? part,
  }) async {
    final rows =
        await (_db.select(_db.trips)
              ..where((t) => t.startedAt.isSmallerOrEqualValue(at))
              ..orderBy([(t) => OrderingTerm.desc(t.startedAt)])
              ..limit(1))
            .get();
    if (rows.isEmpty) return null;
    final trip = rows.single;
    final end = trip.endedAt;
    if (end != null && at.isAfter(end.add(const Duration(minutes: 2)))) {
      return null;
    }
    final dup = await (_db.select(
      _db.tripEvents,
    )..where((e) => e.tripId.equals(trip.id) & e.refId.equals(clipId))).get();
    if (dup.isNotEmpty) return trip.id;
    await addEvent(
      trip.id,
      ts: at.millisecondsSinceEpoch.toDouble(),
      kind: TripEventKind.recording,
      label: part == null ? '' : 'part $part',
      refId: clipId,
    );
    return trip.id;
  }

  Future<int> finalizeOpen({double minTripM = 200, String? exceptId}) async {
    final open = await (_db.select(
      _db.trips,
    )..where((t) => t.endedAt.isNull())).get();
    var kept = 0;
    for (final t in open) {
      if (t.id == exceptId) continue;
      final pts = await points(t.id);
      final s = TripAccumulator.summarize(pts.map((p) => p.toFix()));
      if (pts.length < 2 || s.distanceM < minTripM) {
        await delete(t.id);
        continue;
      }
      await saveStats(t.id, s, finished: true);
      kept++;
    }
    return kept;
  }
}

final tripRepositoryProvider = Provider<TripRepository>(
  (ref) => TripRepository(ref.watch(databaseProvider)),
);
