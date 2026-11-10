import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/misc.dart' show Override;

import '../data/database/database.dart';
import '../domain/models/incident.dart';
import '../domain/repositories/clips_repository.dart';
import '../domain/repositories/settings_repository.dart';
import '../domain/repositories/trip_repository.dart';
import '../features/settings/settings_controller.dart';
import '../platform/native_bridge/engine_provider.dart';
import '../platform/native_bridge/native_engine.dart';

/// Pre-`runApp` initialisation. Usage in `main.dart`:
///
/// ```dart
/// Future<void> main() async {
///   final overrides = await bootstrap();
///   runApp(ProviderScope(overrides: overrides, child: const CorvistaApp()));
/// }
/// ```
///
/// Opens the database, loads persisted settings (so the first frame already
/// has the user's theme/locale), then — after the first frame — recovers
/// orphaned recordings (`recorder.recover`) and reconciles the clip
/// catalogue. Native failures are non-fatal.
Future<List<Override>> bootstrap({
  NativeEngine? engine,
  AppDatabase? database,
  bool deferMaintenance = true,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  final sw = Stopwatch()..start();
  final eng = engine ?? NativeEngine();
  final db = database ?? AppDatabase();
  final settings = await loadSettings(
    db,
    region: WidgetsBinding.instance.platformDispatcher.locale.countryCode,
  );
  debugPrint('[bootstrap] settings loaded in ${sw.elapsedMilliseconds} ms');

  // Recovery and reconciliation only touch the clip catalogue, which the UI
  // watches as a stream, so they run after the first frame instead of
  // delaying app start.
  Future<void> maintenance() async {
    final t = Stopwatch()..start();
    var recovered = const <IncidentResult>[];
    try {
      recovered = await eng.recoverIncidents();
    } catch (e) {
      debugPrint('recorder.recover failed: $e');
    }
    try {
      await ClipsRepository(db, eng).reconcile(recovered: recovered);
    } catch (e) {
      debugPrint('clips reconcile failed: $e');
    }
    // Trip log: finalize trips interrupted by app termination, then apply
    // the retention setting.
    try {
      final trips = TripRepository(db);
      await trips.finalizeOpen();
      // Manual-recording parts recovered after a crash join their trip.
      for (final r in recovered.where((r) => r.kind == 'manual')) {
        await trips.linkRecoveredRecording(r.id, r.createdAt, part: r.part);
      }
      await trips.purge(
        retentionDays: settings.tripRetentionDays,
        now: DateTime.now(),
      );
    } catch (e) {
      debugPrint('trip maintenance failed: $e');
    }
    debugPrint('[bootstrap] maintenance done in ${t.elapsedMilliseconds} ms');
  }

  if (deferMaintenance) {
    WidgetsBinding.instance.addPostFrameCallback((_) => maintenance());
  } else {
    await maintenance();
  }

  return [
    nativeEngineProvider.overrideWithValue(eng),
    databaseProvider.overrideWithValue(db),
    initialSettingsProvider.overrideWithValue(settings),
  ];
}
