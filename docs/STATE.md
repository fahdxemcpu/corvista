# Corvista — Dart State Layer Contract

Riverpod **3.x** (`flutter_riverpod: ^3.5`): use `Provider`, `NotifierProvider`,
`AsyncNotifierProvider`, `StreamProvider`, `FutureProvider`. No `StateProvider`/
`StateNotifierProvider` (legacy). All providers are exported from the barrel
`lib/app/providers.dart`. UI code imports only that barrel + `lib/domain/models/*`.

Shared models already written (do not redefine): `lib/domain/models/{object_class,detection,tracked_object,location_fix,incident,app_settings}.dart`,
bridge client `lib/platform/native_bridge/native_engine.dart` (`NativeEngine`, `MapViewController`).

## Providers (name → type → file)

| Provider | Type | File |
|---|---|---|
| `nativeEngineProvider` | `Provider<NativeEngine>` | `lib/platform/native_bridge/engine_provider.dart` |
| `databaseProvider` | `Provider<AppDatabase>` (overridable in tests) | `lib/data/database/database.dart` |
| `settingsProvider` | `NotifierProvider<SettingsController, AppSettings>` | `lib/features/settings/settings_controller.dart` |
| `permissionsProvider` | `NotifierProvider<PermissionsController, Map<AppPermission, PermissionStatus>>` | `lib/core/permissions/permissions_controller.dart` |
| `cameraProvider` | `NotifierProvider<CameraController, CameraState>` | `lib/features/camera/camera_controller.dart` |
| `detectionFrameProvider` | `StreamProvider<DetectionFrame>` | `lib/features/detection/detection_providers.dart` |
| `tracksProvider` | `NotifierProvider<TrackerController, List<TrackedObject>>` | `lib/features/tracking/tracker_controller.dart` |
| `segmentationFrameProvider` | `StreamProvider<SegmentationFrame>` | `lib/features/segmentation/segmentation_providers.dart` |
| `aiModelsProvider` | `NotifierProvider<AiModelController, AiModelState>` | `lib/features/ai_models/ai_model_controller.dart` |
| `locationProvider` | `NotifierProvider<LocationController, LocationState>` | `lib/features/maps/location_controller.dart` |
| `recorderProvider` | `NotifierProvider<RecorderController, RecorderState>` | `lib/features/dashcam/recorder_controller.dart` |
| `clipsProvider` | `StreamProvider<List<IncidentClip>>` | `lib/features/clips/clips_providers.dart` |
| `clipsRepositoryProvider` | `Provider<ClipsRepository>` | `lib/domain/repositories/clips_repository.dart` |
| `storageInfoProvider` | `FutureProvider<StorageInfo>` | `lib/features/clips/clips_providers.dart` |
| `clipActionsProvider` | `Provider<ClipActions>` (trim → `media.trim` + catalogue, batch Save to Photos, Free up space) | `lib/features/clips/clip_actions.dart` |
| `navigationProvider` | `NotifierProvider<NavigationController, NavState>` | `lib/features/navigation/navigation_controller.dart` |
| `weatherProvider` | `NotifierProvider<WeatherController, WeatherState>` | `lib/features/weather/weather_controller.dart` |
| `voiceAlertsProvider` | `NotifierProvider<VoiceAlertController, VoiceAlertState>` | `lib/features/voice_alerts/voice_alert_controller.dart` |
| `parkingProvider` | `NotifierProvider<ParkingController, ParkingState>` | `lib/features/parking/parking_controller.dart` |
| `emergencyProvider` | `NotifierProvider<EmergencyController, EmergencyState>` | `lib/features/emergency/emergency_controller.dart` |
| `emergencyContactsProvider` | `AsyncNotifierProvider<EmergencyContactsController, List<EmergencyContact>>` | `lib/features/emergency/emergency_contacts.dart` |
| `powerProvider` | `NotifierProvider<PowerController, PowerState>` | `lib/features/power/power_controller.dart` |
| `driveSessionProvider` | `NotifierProvider<DriveSessionController, DriveSessionState>` | `lib/features/dashcam/drive_session_controller.dart` |
| `perfProvider` | `NotifierProvider<PerfController, PerfStats>` | `lib/features/power/perf_controller.dart` |

## State classes (immutable, `copyWith`)

```dart
// settings_controller.dart
class SettingsController extends Notifier<AppSettings> {
  Future<void> update(AppSettings Function(AppSettings s) f); // persists to Drift
}

// permissions_controller.dart
enum AppPermission { camera, microphone, locationWhenInUse, speech, notifications }
enum PermissionStatus { granted, denied, restricted, notDetermined, limited }
class PermissionsController ... { Future<void> refresh(); Future<PermissionStatus> request(AppPermission p); Future<void> openSettings(); }

// camera_controller.dart
enum CameraStatus { idle, starting, running, interrupted, stopped, unavailable, permissionDenied, error }
class CameraState { CameraStatus status; int? textureId; Size previewSize /*upright buffer px*/; double fps; int droppedFrames; String? error; String source /*camera|file*/; String deviceType; List<Map> devices; }
class CameraController ... { Future<void> start(); Future<void> stop(); Future<void> focus(Offset normalized); Future<void> startTestFile(String path); }

// ai_model_controller.dart
class AiModelInfo { String id, name, version, license, source; bool installed, supportsSegmentation; int sizeBytes; int inputSize; double? measuredMeanMs; }
class AiModelState { List<AiModelInfo> models; String selectedId; bool loading; String? error; double? lastLoadMs; double inferenceMs; double detectHz; }
class AiModelController ... { Future<void> select(String id); Future<bool> activate(String id); Future<bool> applySelected(); Future<void> benchmark(String imagePath); }

// location_controller.dart
class LocationState { LocationFix? fix; bool permissionGranted; bool active; String? error; }  // plus start()/stop()

// recorder_controller.dart
enum RecorderStatus { idle, buffering, saving, error }
class RecorderState { RecorderStatus status; int bufferedMs; int targetBufferMs; int width; int height; bool audio; bool watermark; String? fallbackReason; IncidentResult? lastSaved; String? error; }
class RecorderController ... { Future<void> applyConfig(); Future<IncidentResult?> saveIncident({String reason = 'manual'}); }
  // Saves are allowed at any speed. Corvista is free: no feature gating anywhere (stored settings are applied as-is).

// clips (drift-backed)
class IncidentClip { String id; String title; String path; String? thumbnailPath; int durationMs, width, height, sizeBytes; bool hasAudio, favorite; DateTime createdAt; String reason; double? lat, lon, speed; bool missingFile; }
class ClipsRepository { Stream<List<IncidentClip>> watchAll(); Future<void> add(IncidentResult r); Future<void> rename(String id, String title); Future<void> setFavorite(String id, bool v);
  Future<void> delete(String id); Future<void> deleteMany(Iterable<String> ids); Future<int> reconcile(); /* marks missing files, imports recovered */ }
class StorageInfo { int freeBytes, totalBytes, clipsBytes, bufferBytes, clipCount; }
// No gallery limit: the clips library shows every saved clip (the app is entirely free).

// navigation_controller.dart
class PlaceSuggestion { String id, title, subtitle; }
class Place { String name, address; double lat, lon; String? category; }
class RouteInfo { String id, name; double distanceM, expectedTravelTimeS; List<String> advisories; Float64List polyline; List<RouteStep> steps; }
class RouteStep { String instructions; double distanceM, lat, lon; }
class Guidance { int stepIndex; RouteStep? nextStep; double distanceToNextM; double remainingM; Duration remaining; DateTime eta; bool offRoute; bool arrived;
  Maneuver? maneuver; RouteStep? thenStep; Maneuver? thenManeuver; double? thenDistanceM; double progressM, totalM; double? snappedLat, snappedLon; int segmentIndex; }
class Maneuver { ManeuverType type; double angle; int? exit; double? exitAngle; }   // maneuver.dart: geometry-first, text tie-breaks
enum NavPhase { idle, searching, choosingRoute, navigating, error }
class NavState { NavPhase phase; String query; List<PlaceSuggestion> suggestions; String? completedQuery; List<Place> places; bool submitted;
  Place? destination; List<RouteInfo> routes; int selectedRoute; int routeVersion; Guidance? guidance; bool rerouting; String? error; bool loading;
  bool get noResults; int get fastestRoute; }
class NavigationController ... { void setQuery(String q) /*loading at once, debounced complete, empty → nav.search fallback*/; Future<void> submit([String? q]) /*nav.search*/;
  Future<void> choose(PlaceSuggestion s); Future<void> chooseDestination(Place p); Future<void> start(); void selectRoute(int i); void cancel(); Future<void> setVoice(bool on);
  List<String> spoken; /* prompts via AnnouncementScheduler + GuidanceVoice → SpeechArbiter (guidance channel) */ }
// route_guidance.dart: RouteGuidance.updateFix(NavFix{lat,lon,speed,course,hAcc}) — heading-aware map matching in a
//   window around progress (wrong-direction / parallel segments rejected), alpha-beta filter on along-route progress,
//   dead reckoning (predict(), ≤ 60 s in tunnels / hAcc > 50 m), off route = cross > max(30 m, 2·hAcc) for ≥ 3 s with a
//   heading mismatch (or far / wrong way), ETA = MapKit time × remaining fraction adjusted by observed pace,
//   left-hand traffic from TrafficSide + roundabout geometry. All distances are along the polyline.
// guidance_engine.dart: GuidanceEngine (pure, replayable): tracker + AnnouncementScheduler (Google-like 2 km / 1 km /
//   400 m / now on motorways, 500 / 200 / now on roads, 300 / 100 / now in town; imperial & UK yards) + "Continue for".
// navFrameProvider: dead-reckoned Guidance at ~15 Hz while navigating → banner distance, trip bar, native navFrame (puck/camera).
// RouteInfo.drivingOnly(): ends driving guidance at MapKit's parking point when a walk follows.
// recent_destinations.dart: recentDestinationsProvider (List<Place>, newest first, max 10, Drift setting 'nav.recents'); add/remove/clear.
// voice_alerts/speech_arbiter.dart: speechArbiterProvider — guidance has priority; hazard alerts skipped while guidance speaks (> 1.5 s left).
// AppSettings.navVoice (bool, default true): spoken turn-by-turn guidance.

// weather_controller.dart
class HourlyWeather { DateTime time; String condition, symbol; double temperatureC, precipitationChance, windKph; }
class WeatherState { bool loading; String? error; String? condition, symbol; double? temperatureC, apparentC, windKph, visibilityKm, precipitationChance, humidity; DateTime? asOf; List<HourlyWeather> hourly; String? locationName; String? attributionLegalUrl; String? attributionLogoDark; String? attributionLogoLight; String? serviceName; }
class WeatherController ... { Future<void> refresh({bool force = false}); } // auto refresh every 15 min / 3 km moved, only while map visible or HUD weather on

// voice_alert_controller.dart
class SpokenAlert { AlertKind kind; String text; DateTime at; int? trackId; }
enum AlertKind { pedestrian, cyclist, motorcycle, bus, vehicleClose, trafficLightGreen, trafficLightRed, trafficMoving, stopSign }
class VoiceAlertState { bool enabled; SpokenAlert? last; List<SpokenAlert> recent; List<Map> voices; }
class VoiceAlertController ... { Future<void> testSpeak(); } // listens to tracksProvider + locationProvider internally

// parking_controller.dart
class ParkingState { bool active; bool beepsEnabled; ParkingAssessment assessment; /* zone, nearest, toneLevel getters */ }
class ParkingAssessment { ParkingZone zone; ParkingObject? nearest; Map<ParkingSide, ParkingZone> sectors; List<ParkingObject> objects; int toneLevel; }
class ParkingController ... { void setActive(bool v); }

// emergency_controller.dart
enum EmergencyPhase { disabled, armed, countdown, cancelled, escalated }
class ImpactEvidence { double peakG; double durationMs; double? speedBeforeKmh; double? speedAfterKmh; double rotationPeak; double score; }
class EmergencyEvent { String id; DateTime at; ImpactEvidence evidence; double? lat, lon; String? clipId; bool cancelled; String? cancelledBy /*button|voice*/; List<String> actions; }
class EmergencyState { EmergencyPhase phase; int secondsLeft; EmergencyEvent? event; bool voiceListening; String? lastVoiceText; }
class EmergencyController ... { Future<void> arm(); Future<void> disarm(); void cancel({String by = 'button'}); Future<void> callEmergency(); Future<String> messageContacts(); Future<void> simulateForTest(); /* runs synthetic fixture through ImpactDetector, clearly labelled TEST, never calls */ }
class EmergencyContact { String identifier, name, phone; }
class EmergencyContactsController ... { Future<void> pickAndAdd(); Future<void> remove(String identifier); }  // flutter_secure_storage

// power_controller.dart
enum ThermalLevel { nominal, fair, serious, critical }
class PowerState { PowerMode mode; ThermalLevel thermal; double battery; bool charging; bool lowPowerMode; double aiHz; double segHz; bool reducedEffects; String? notice; }

// perf_controller.dart
class PerfStats { double inferenceMs, detectHz, cameraFps, memoryMB; int droppedFrames; double? segmentationMs; }

// drive_session_controller.dart
class DriveSessionState { bool active; DriveView view; DateTime? startedAt; String? sessionId; }
class DriveSessionController ... { Future<void> start(); Future<void> stop(); void setView(DriveView v); }
  // start(): keepAwake, camera.start (device/quality from settings), recorder.configure, ai.setModel/configure,
  // location.start, motion.start if emergency enabled. Writes a DrivingSession row. stop() reverses.
  // Pauses camera on app background (AppLifecycleState.paused) and resumes on resume — no hidden background recording.
```

## Pure logic (unit-tested, no Flutter bindings)

| Class | File | Responsibility |
|---|---|---|
| `ObjectTracker` | `lib/features/tracking/object_tracker.dart` | ByteTrack-style two-stage IoU association, per-track constant-velocity filter, conservative expiry (lost after 0.6 s, removed after 1.0 s), id stability. `List<TrackedObject> update(DetectionFrame f, {required double hfovDeg})` |
| `SpatialEstimator` | `lib/features/detection/spatial_estimator.dart` | bearing from box centre & HFOV; approx range via pinhole `f_px·H_nominal/h_px`; zone thresholds; returns null when box touches top/bottom edge (truncated) |
| `MapProjector` | `lib/features/maps/map_projector.dart` | (lat,lon,heading) + (bearing, range) → (lat,lon) via local ENU; returns null if heading/fix accuracy insufficient (hAcc > 30 m or no direction) |
| `TrafficLightFilter` | `lib/features/voice_alerts/traffic_light_filter.dart` | per-track lamp-state hysteresis: state accepted after ≥ 4 consistent frames over ≥ 0.4 s with lightConf ≥ .5; emits red→green transitions |
| `LeadVehicleMonitor` | `lib/features/voice_alerts/lead_vehicle_monitor.dart` | lead = confirmed vehicle track within central 30 % width with largest box; stationary ≥ 3 s (ego speed < 1 m/s & box centre/scale stable) then receding (scale rate < −8 %/s for ≥ 0.7 s) while ego still stopped → "traffic moving" |
| `AlertEngine` | `lib/features/voice_alerts/alert_engine.dart` | rules + cooldowns per (kind, trackId) & global rate limit (≤ 1 alert / 4 s), sensitivity thresholds, quiet mode; outputs `AlertKind` events |
| `ParkingProximity` | `lib/features/parking/parking_proximity.dart` | close-range (0–5 m) parking zones (stop / very close / close / nothing close) per side (left / centre / right) from box-bottom contact (shared `GroundProjector`) + nominal height/width, bottom-edge rule, log-domain temporal filter, zone + release hysteresis; zone level = `audio.proximity` level |
| `ImpactDetector` | `lib/features/emergency/impact_detector.dart` | sliding-window over motion samples + speed; candidate when peak |a| ≥ 4 g sustained ≥ 30 ms (or ≥ 6 g spike) AND (speed before ≥ 20 km/h and after ≤ 8 km/h within 10 s, or rotation peak ≥ 6 rad/s); rejects isolated phone drops (free-fall signature |a|≈1 g user-accel preceding) ; outputs `ImpactEvidence` with score |
| `RouteGuidance` | `lib/features/navigation/route_guidance.dart` | project fix onto polyline, step index, distance to next maneuver, remaining distance/time (scaled by route expected time), off-route (> 60 m for 3 fixes), arrival (< 30 m) |
| `PowerPolicy` | `lib/features/power/power_policy.dart` | (mode, thermal, battery, lowPower) → `{aiHz, segHz, reducedEffects, notice}` |
| `MaskPainter`* | `lib/features/segmentation/mask_rasterizer.dart` | classMap + tracks → RGBA `Uint8List` (per-instance tint inside boxes, road tint) — pure function, UI decodes with `decodeImageFromPixels` |
| `AlertPhrases` | `lib/features/voice_alerts/alert_phrases.dart` | spoken phrases per AlertKind for the 12 priority languages (en, fr, ar, es, de, pt, it, nl, tr, hi, zh, ja); fallback en |

## Database (Drift) — `lib/data/database/database.dart`

Tables: `Settings(key TEXT PK, value TEXT)`, `IncidentClips(...)` (fields of `IncidentClip`), `DrivingSessions(id, startedAt, endedAt, view, modelId, recordingProfile, metricsJson)`,
`EmergencyEvents(id, triggeredAt, evidenceJson, cancelled, cancelledBy, clipId, lat, lon, actionsJson)`,
`AiModels(id, name, version, fileName, labelsJson, viewsJson, license, perfJson)` (seeded from `ai.models`),
`Detections(id, ts, cls, conf, x, y, w, h, trackId, rangeM, bearing, modelId)` — **only** written when the user enables
"Save detection log" diagnostics (off by default, capped at 10 000 rows). Run `dart run build_runner build` to generate `database.g.dart`.
