import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/errors/error_log.dart';
import '../../data/database/database.dart';
import '../../data/local_storage/secure_store.dart';
import '../../features/camera/camera_controller.dart';
import '../../features/clips/clips_providers.dart';
import '../../features/dashcam/drive_session_controller.dart';
import '../../features/emergency/emergency_controller.dart';
import '../../features/navigation/navigation_controller.dart';
import '../../features/settings/settings_controller.dart';
import '../../features/trips/trip_controller.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../models/app_settings.dart';
import '../models/incident.dart';
import 'regional_defaults.dart';

/// Outcome of [DataEraser.eraseAll].
class EraseReport {
  const EraseReport({
    required this.clipsDeleted,
    required this.clipFailures,
    required this.failedSteps,
  });

  final int clipsDeleted;
  final int clipFailures;

  /// Steps that threw (best effort: later steps still ran).
  final List<String> failedSteps;

  bool get complete => clipFailures == 0 && failedSteps.isEmpty;
}

/// "Delete all data" (Settings › Privacy & data).
///
/// Order:
/// 1. stop navigation, the drive session (trip finalised), emergency
///    monitoring, camera and recorder;
/// 2. delete every saved clip file + thumbnail (`media.delete` per clip),
///    then the rolling buffer (`recorder.clearBuffer`) and temporary files
///    (`media.cleanup`; recovered partial exports are deleted too);
/// 3. clear every Drift table in one transaction (clips catalogue, trips,
///    GPS tracks, trip events, driving sessions, emergency events, detection
///    log, model cache, settings incl. recent destinations), then `VACUUM`;
/// 4. delete emergency contacts from the Keychain and the private error log;
/// 5. reset settings to region defaults with `onboardingDone = false` (the
///    router then shows onboarding).
///
/// Every step is best effort; failures are reported in [EraseReport].
class DataEraser {
  DataEraser(this._ref, {String? Function()? region})
    : _region =
          region ?? (() => PlatformDispatcher.instance.locale.countryCode);

  final Ref _ref;
  final String? Function() _region;

  Future<EraseReport> eraseAll() async {
    final failed = <String>[];
    Future<void> step(String name, Future<void> Function() f) async {
      try {
        await f();
      } catch (e) {
        debugPrint('DataEraser: $name failed: $e');
        failed.add(name);
      }
    }

    final engine = _ref.read(nativeEngineProvider);
    final db = _ref.read(databaseProvider);

    // 1. Stop everything that could write new data.
    await step('navigation', () async {
      final nav = _ref.read(navigationProvider);
      if (nav.phase != NavPhase.idle) {
        _ref.read(navigationProvider.notifier).cancel();
      }
    });
    await step(
      'session',
      () => _ref.read(driveSessionProvider.notifier).stop(),
    );
    await step('trip', () => _ref.read(tripProvider.notifier).flush());
    await step(
      'emergency',
      () => _ref.read(emergencyProvider.notifier).disarm(),
    );
    await step('camera', () => _ref.read(cameraProvider.notifier).stop());

    // 2. Media files.
    var deleted = 0, clipFailures = 0;
    var rows = const <IncidentClipRow>[];
    await step(
      'clips',
      () async => rows = await db.select(db.incidentClips).get(),
    );
    for (final r in rows) {
      try {
        await engine.deleteMedia(r.path);
        deleted++;
      } catch (e) {
        debugPrint('DataEraser: media.delete failed: $e');
        clipFailures++;
      }
    }
    await step('buffer', engine.clearBuffer);
    await step('cleanup', () async {
      final r = await engine.mediaCleanup();
      final recovered = r is Map ? r['recovered'] : null;
      if (recovered is List) {
        for (final m in recovered.whereType<Map<Object?, Object?>>()) {
          final res = IncidentResult.fromMap(m);
          await engine.deleteMedia(res.path);
        }
      }
    });

    // 3. Database: everything, in one transaction.
    await step('database', () async {
      await db.transaction(() async {
        for (final t in db.allTables) {
          await db.delete(t).go();
        }
      });
    });
    // Rewrite the file so deleted rows don't linger in free pages.
    await step('vacuum', () => db.customStatement('VACUUM'));

    // 4. Keychain + error log.
    await step('contacts', () async {
      await _ref
          .read(secureStorageProvider)
          .delete(key: EmergencyContactsController.storageKey);
      _ref.read(errorLogProvider)?.setSensitiveTerms(const []);
    });
    await step('errorLog', () async => _ref.read(errorLogProvider)?.clear());

    // 5. Settings back to first-launch defaults (persisted).
    await step('settings', () async {
      final defaults = RegionalDefaults.apply(
        const AppSettings(),
        _region(),
      ).copyWith(onboardingDone: false, tourDone: false);
      await _ref.read(settingsProvider.notifier).update((_) => defaults);
    });

    _ref
      ..invalidate(recentDestinationsProvider)
      ..invalidate(emergencyContactsProvider)
      ..invalidate(storageInfoProvider)
      ..invalidate(errorLogSizeProvider);

    return EraseReport(
      clipsDeleted: deleted,
      clipFailures: clipFailures,
      failedSteps: failed,
    );
  }
}

final dataEraserProvider = Provider<DataEraser>(DataEraser.new);
