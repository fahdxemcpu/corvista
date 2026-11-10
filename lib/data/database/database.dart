import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'database.g.dart';

/// Key/value store; the whole `AppSettings` JSON lives under key `app`.
@DataClassName('SettingRow')
class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('IncidentClipRow')
class IncidentClips extends Table {
  TextColumn get id => text()();
  TextColumn get title => text().withDefault(const Constant(''))();
  TextColumn get path => text()();
  TextColumn get thumbnailPath => text().nullable()();
  IntColumn get durationMs => integer().withDefault(const Constant(0))();
  IntColumn get width => integer().withDefault(const Constant(0))();
  IntColumn get height => integer().withDefault(const Constant(0))();
  IntColumn get sizeBytes => integer().withDefault(const Constant(0))();
  BoolColumn get hasAudio => boolean().withDefault(const Constant(false))();
  BoolColumn get favorite => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get reason => text().withDefault(const Constant('manual'))();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  RealColumn get speed => real().nullable()();
  BoolColumn get missingFile => boolean().withDefault(const Constant(false))();

  /// `incident` | `manual` | `emergency` | `test` (schema v3).
  TextColumn get kind => text().withDefault(const Constant('incident'))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DrivingSessionRow')
class DrivingSessions extends Table {
  TextColumn get id => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endedAt => dateTime().nullable()();
  TextColumn get view => text()();
  TextColumn get modelId => text()();
  TextColumn get recordingProfile => text()();
  TextColumn get metricsJson => text().withDefault(const Constant('{}'))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('EmergencyEventRow')
class EmergencyEvents extends Table {
  TextColumn get id => text()();
  DateTimeColumn get triggeredAt => dateTime()();
  TextColumn get evidenceJson => text()();
  BoolColumn get cancelled => boolean().withDefault(const Constant(false))();
  TextColumn get cancelledBy => text().nullable()();
  TextColumn get clipId => text().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
  TextColumn get actionsJson => text().withDefault(const Constant('[]'))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('AiModelRow')
class AiModels extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get version => text().withDefault(const Constant(''))();
  TextColumn get fileName => text().withDefault(const Constant(''))();
  TextColumn get labelsJson => text().withDefault(const Constant('[]'))();
  TextColumn get viewsJson => text().withDefault(const Constant('[]'))();
  TextColumn get license => text().withDefault(const Constant(''))();
  TextColumn get perfJson => text().withDefault(const Constant('{}'))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Diagnostics only — written when "Save detection log" is enabled.
@DataClassName('DetectionRow')
class Detections extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get ts => real()();
  IntColumn get cls => integer()();
  RealColumn get conf => real()();
  RealColumn get x => real()();
  RealColumn get y => real()();
  RealColumn get w => real()();
  RealColumn get h => real()();
  IntColumn get trackId => integer().nullable()();
  RealColumn get rangeM => real().nullable()();
  RealColumn get bearing => real().nullable()();
  TextColumn get modelId => text().withDefault(const Constant(''))();
}

/// One recorded drive (trip log). `endedAt == null` = still open (or the app
/// was terminated mid-trip; finalized on next launch from its points).
@DataClassName('TripRow')
class Trips extends Table {
  TextColumn get id => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endedAt => dateTime().nullable()();
  RealColumn get distanceM => real().withDefault(const Constant(0))();
  RealColumn get movingTimeS => real().withDefault(const Constant(0))();
  RealColumn get avgSpeedMs => real().withDefault(const Constant(0))();
  RealColumn get maxSpeedMs => real().withDefault(const Constant(0))();
  RealColumn get startLat => real().nullable()();
  RealColumn get startLon => real().nullable()();
  RealColumn get endLat => real().nullable()();
  RealColumn get endLon => real().nullable()();
  TextColumn get startPlace => text().nullable()();
  TextColumn get endPlace => text().nullable()();
  TextColumn get detectionCountsJson =>
      text().withDefault(const Constant('{}'))();
  IntColumn get alertsCount => integer().withDefault(const Constant(0))();
  IntColumn get incidentCount => integer().withDefault(const Constant(0))();
  IntColumn get emergencyCount => integer().withDefault(const Constant(0))();
  TextColumn get title => text().withDefault(const Constant(''))();
  BoolColumn get favorite => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('TripPointRow')
@TableIndex(name: 'trip_points_trip', columns: {#tripId})
class TripPoints extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tripId => text()();

  /// Epoch milliseconds.
  RealColumn get ts => real()();
  RealColumn get lat => real()();
  RealColumn get lon => real()();

  /// m/s, negative = unknown.
  RealColumn get speed => real()();
  RealColumn get course => real()();
  RealColumn get hAcc => real()();
}

/// kind: alert | incident | emergency | navStart | navArrive | reroute | recording
@DataClassName('TripEventRow')
@TableIndex(name: 'trip_events_trip', columns: {#tripId})
class TripEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tripId => text()();
  RealColumn get ts => real()();
  TextColumn get kind => text()();
  TextColumn get label => text().withDefault(const Constant(''))();
  TextColumn get refId => text().nullable()();
  RealColumn get lat => real().nullable()();
  RealColumn get lon => real().nullable()();
}

@DriftDatabase(
  tables: [
    Settings,
    IncidentClips,
    DrivingSessions,
    EmergencyEvents,
    AiModels,
    Detections,
    Trips,
    TripPoints,
    TripEvents,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// Production: `AppDatabase()` opens `corvista.sqlite` via drift_flutter.
  /// Tests: `AppDatabase(NativeDatabase.memory())`.
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'corvista'));

  static const detectionLogCap = 10000;

  /// v1: initial. v2: trip log (`trips`, `trip_points`, `trip_events`).
  /// v3: `incident_clips.kind` (manual recordings vs incidents).
  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(trips);
        await m.createTable(tripPoints);
        await m.createTable(tripEvents);
        await m.createIndex(tripPointsTrip);
        await m.createIndex(tripEventsTrip);
      }
      if (from < 3) {
        await m.addColumn(incidentClips, incidentClips.kind);
        // Existing rows: derive the kind from the reason they were saved with.
        await customStatement(
          "UPDATE incident_clips SET kind = CASE reason "
          "WHEN 'emergency' THEN 'emergency' WHEN 'test' THEN 'test' "
          "WHEN 'recording' THEN 'manual' ELSE 'incident' END",
        );
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  // ---- settings ----
  Future<String?> readSetting(String key) async {
    final row = await (select(
      settings,
    )..where((t) => t.key.equals(key))).getSingleOrNull();
    return row?.value;
  }

  Future<void> writeSetting(String key, String value) => into(settings)
      .insertOnConflictUpdate(SettingsCompanion.insert(key: key, value: value));

  // ---- driving sessions ----
  Future<void> startSession({
    required String id,
    required DateTime startedAt,
    required String view,
    required String modelId,
    required String recordingProfile,
  }) => into(drivingSessions).insertOnConflictUpdate(
    DrivingSessionsCompanion.insert(
      id: id,
      startedAt: startedAt,
      view: view,
      modelId: modelId,
      recordingProfile: recordingProfile,
    ),
  );

  Future<void> endSession(String id, DateTime endedAt, {String? metricsJson}) =>
      (update(drivingSessions)..where((t) => t.id.equals(id))).write(
        DrivingSessionsCompanion(
          endedAt: Value(endedAt),
          metricsJson: metricsJson == null
              ? const Value.absent()
              : Value(metricsJson),
        ),
      );

  // ---- emergency events ----
  Future<void> upsertEmergencyEvent(EmergencyEventsCompanion row) =>
      into(emergencyEvents).insertOnConflictUpdate(row);

  // ---- detection log (diagnostics) ----
  Future<void> logDetections(List<DetectionsCompanion> rows) async {
    if (rows.isEmpty) return;
    await batch((b) => b.insertAll(detections, rows));
  }

  /// Deletes the oldest rows so at most [detectionLogCap] remain.
  Future<void> trimDetectionLog({int cap = detectionLogCap}) async {
    final count = await detections.count().getSingle();
    if (count <= cap) return;
    final excess = count - cap;
    await customStatement(
      'DELETE FROM detections WHERE id IN '
      '(SELECT id FROM detections ORDER BY id ASC LIMIT ?)',
      [excess],
    );
  }
}

/// Overridden by `bootstrap()` with the already-opened instance; tests
/// override with an in-memory database.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
