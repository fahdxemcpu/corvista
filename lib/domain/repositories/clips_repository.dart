import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/database.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../../platform/native_bridge/native_engine.dart';
import '../models/incident.dart';

class IncidentClip {
  const IncidentClip({
    required this.id,
    required this.title,
    required this.path,
    required this.thumbnailPath,
    required this.durationMs,
    required this.width,
    required this.height,
    required this.sizeBytes,
    required this.hasAudio,
    required this.favorite,
    required this.createdAt,
    required this.reason,
    required this.lat,
    required this.lon,
    required this.speed,
    required this.missingFile,
    this.kind = 'incident',
  });

  final String id;
  final String title;
  final String path;
  final String? thumbnailPath;
  final int durationMs, width, height, sizeBytes;
  final bool hasAudio, favorite;
  final DateTime createdAt;
  final String reason;
  final double? lat, lon, speed;
  final bool missingFile;

  /// `incident` | `manual` | `emergency` | `test`.
  final String kind;

  bool get isEmergency => reason == 'emergency' || kind == 'emergency';
  bool get isManualRecording => kind == 'manual';

  static IncidentClip fromRow(IncidentClipRow r) => IncidentClip(
    id: r.id,
    title: r.title,
    path: r.path,
    thumbnailPath: r.thumbnailPath,
    durationMs: r.durationMs,
    width: r.width,
    height: r.height,
    sizeBytes: r.sizeBytes,
    hasAudio: r.hasAudio,
    favorite: r.favorite,
    createdAt: r.createdAt,
    reason: r.reason,
    lat: r.lat,
    lon: r.lon,
    speed: r.speed,
    missingFile: r.missingFile,
    kind: r.kind,
  );
}

/// Drift-backed clip catalogue; files are owned by native (`media.*`).
class ClipsRepository {
  ClipsRepository(
    this._db,
    this._engine, {
    Future<bool> Function(String path)? fileExists,
  }) : _exists = fileExists ?? ((p) => File(p).exists());

  final AppDatabase _db;
  final NativeEngine _engine;
  final Future<bool> Function(String path) _exists;

  /// Default title: local date-time `yyyy-MM-dd HH:mm` (language neutral).
  static String defaultTitle(DateTime t) {
    String two(int v) => v.toString().padLeft(2, '0');
    final l = t.toLocal();
    return '${l.year}-${two(l.month)}-${two(l.day)} ${two(l.hour)}:${two(l.minute)}';
  }

  /// All clips, newest first.
  Stream<List<IncidentClip>> watchAll() =>
      (_db.select(_db.incidentClips)
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .watch()
          .map((rows) => rows.map(IncidentClip.fromRow).toList());

  Future<List<IncidentClip>> all() async =>
      (await (_db.select(
            _db.incidentClips,
          )..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get())
          .map(IncidentClip.fromRow)
          .toList();

  Future<int> count() => _db.incidentClips.count().getSingle();

  Future<void> add(IncidentResult r, {String? title}) => _db
      .into(_db.incidentClips)
      .insertOnConflictUpdate(
        IncidentClipsCompanion.insert(
          id: r.id,
          title: Value(title ?? defaultTitle(r.createdAt)),
          path: r.path,
          thumbnailPath: Value(r.thumbnailPath),
          durationMs: Value(r.durationMs),
          width: Value(r.width),
          height: Value(r.height),
          sizeBytes: Value(r.sizeBytes),
          hasAudio: Value(r.hasAudio),
          createdAt: r.createdAt,
          reason: Value(r.reason),
          lat: Value(r.lat),
          lon: Value(r.lon),
          speed: Value(r.speed),
          kind: Value(r.kind),
        ),
      );

  Future<void> rename(String id, String title) =>
      (_db.update(_db.incidentClips)..where((t) => t.id.equals(id))).write(
        IncidentClipsCompanion(title: Value(title.trim())),
      );

  Future<void> setFavorite(String id, bool v) =>
      (_db.update(_db.incidentClips)..where((t) => t.id.equals(id))).write(
        IncidentClipsCompanion(favorite: Value(v)),
      );

  /// Deletes the clip file + thumbnail via native, then the row. If native
  /// reports an I/O error for a file that still exists, the row is kept.
  Future<void> delete(String id) async {
    final row = await (_db.select(
      _db.incidentClips,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row == null) return;
    try {
      await _engine.deleteMedia(row.path);
    } catch (_) {
      if (await _exists(row.path)) rethrow;
    }
    await (_db.delete(_db.incidentClips)..where((t) => t.id.equals(id))).go();
  }

  Future<void> deleteMany(Iterable<String> ids) async {
    Object? firstError;
    for (final id in ids.toList()) {
      try {
        await delete(id);
      } catch (e) {
        firstError ??= e;
      }
    }
    if (firstError != null) throw firstError;
  }

  /// Marks rows whose file disappeared (and un-marks reappeared ones), and
  /// imports [recovered] clips (from `recorder.recover`) not yet catalogued.
  /// Returns the number of rows changed or added.
  Future<int> reconcile({List<IncidentResult> recovered = const []}) async {
    var changes = 0;
    final rows = await _db.select(_db.incidentClips).get();
    final known = {for (final r in rows) r.id};
    for (final r in rows) {
      final exists = await _exists(r.path);
      if (exists == r.missingFile) {
        await (_db.update(_db.incidentClips)..where((t) => t.id.equals(r.id)))
            .write(IncidentClipsCompanion(missingFile: Value(!exists)));
        changes++;
      }
    }
    for (final r in recovered) {
      if (known.contains(r.id)) continue;
      await add(r);
      changes++;
    }
    return changes;
  }
}

final clipsRepositoryProvider = Provider<ClipsRepository>(
  (ref) => ClipsRepository(
    ref.watch(databaseProvider),
    ref.watch(nativeEngineProvider),
  ),
);
