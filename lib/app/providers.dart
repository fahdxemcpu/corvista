/// Corvista state layer — the only import UI code needs (plus
/// `lib/domain/models/*`). Contract: docs/STATE.md.
///
/// ## Startup
/// `main.dart` must call `await bootstrap()` (lib/app/bootstrap.dart) and pass
/// the returned `List<Override>` to `ProviderScope(overrides: ...)`. It opens
/// the Drift DB, loads persisted settings into `initialSettingsProvider`
/// (so `settingsProvider` starts with the user's values), runs
/// `recorder.recover` and reconciles the clip catalogue.
///
/// ## Conventions
/// * `settingsProvider` = the user's stored preferences, applied as-is
///   (Corvista is free: no feature is gated).
/// * `RecorderController.saveIncident()`: native failures return null and
///   set `recorderProvider.error`.
/// * `clipsProvider` = the clips library (every saved clip; no gallery limit).
/// * `tracksProvider` emits confirmed + lost tracks (draw lost ones faded).
/// * Emergency: `EmergencyState.isTest` marks simulations; call/message are
///   disabled then (`actionsEnabled`). After the countdown the phase is
///   `escalated` and the UI must present the call / message buttons — nothing
///   is called or sent automatically. `dismiss()` returns to armed.
/// * Error strings in states are bridge error codes (`unavailable`,
///   `permission_denied`, `no_location`, ...) for the UI to localize, except
///   `WeatherState.error` which carries the native message.
library;

export 'package:flutter_riverpod/misc.dart' show Override;

export '../app/bootstrap.dart';
export '../core/errors/app_errors.dart';
export '../core/errors/error_log.dart';
export '../core/permissions/permissions_controller.dart';
export '../data/database/database.dart' show AppDatabase, databaseProvider;
export '../data/local_storage/secure_store.dart';
export '../domain/repositories/settings_repository.dart'
    show loadSettings, saveSettings, settingsKey;
export '../domain/services/clock.dart';
export '../domain/services/data_eraser.dart';
export '../domain/services/emergency_message.dart';
export '../domain/services/voice_language.dart';
export '../features/ai_models/ai_model_controller.dart';
export '../features/camera/camera_controller.dart';
export '../features/clips/clips_providers.dart';
export '../features/dashcam/drive_session_controller.dart';
export '../features/dashcam/recorder_controller.dart';
export '../features/detection/detection_providers.dart';
export '../features/emergency/emergency_controller.dart';
export '../features/maps/location_controller.dart';
export '../features/navigation/navigation_controller.dart';
export '../features/parking/parking_controller.dart';
export '../features/power/perf_controller.dart';
export '../features/power/power_controller.dart';
export '../features/segmentation/segmentation_providers.dart';
export '../features/settings/settings_controller.dart';
export '../features/tracking/tracker_controller.dart';
export '../features/trips/trip_controller.dart';
export '../features/voice_alerts/voice_alert_controller.dart';
export '../features/weather/weather_controller.dart';
export '../platform/native_bridge/engine_provider.dart';
export '../platform/native_bridge/native_engine.dart';
