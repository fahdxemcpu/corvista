# Corvista — Native ⇄ Dart Bridge Contract

This file is the single source of truth for the platform interface. Swift lives in
`packages/corvista_native/ios/corvista_native/Sources/corvista_native/`, Dart in
`lib/platform/native_bridge/`. Change both sides together.

## Conventions

* One `MethodChannel('corvista/engine')`. Method names are `<module>.<method>`.
  `CorvistaNativePlugin.swift` routes by prefix to a `ChannelModule`.
* Arguments are always a `Map<String, Object?>` (possibly empty). Results are
  JSON-like values (`Map`, `List`, `num`, `String`, `bool`, `null`, `Uint8List`, `Float64List`).
* Errors are `FlutterError` with these codes: `bad_args`, `permission_denied`,
  `unavailable`, `not_running`, `io_error`, `storage_full`,
  `model_error`, `cancelled`, `failed`.
* Times: `ts` fields are milliseconds since Unix epoch (`Double`). Durations in ms.
* Coordinates for detections: **normalized [0,1], top-left origin, in the upright
  (display-oriented) frame**. `x,y` = top-left corner, `w,h` = size.
* Distances in metres, speeds in m/s (`-1` = invalid), angles in degrees (`-1` = invalid).
* There is no feature gating: Corvista is free and has no StoreKit / entitlement module.

## Object classes (shared ids everywhere)

| id | key            | COCO source labels (YOLO / DETR)             |
|----|----------------|----------------------------------------------|
| 0  | person         | person                                        |
| 1  | bicycle        | bicycle                                       |
| 2  | motorcycle     | motorbike / motorcycle                        |
| 3  | car            | car, truck (trucks/vans are shown as "car" = vehicle) |
| 4  | bus            | bus                                           |
| 5  | trafficLight   | traffic light                                 |
| 6  | stopSign       | stop sign                                     |

Segmentation class-map values: `0` none, `1..7` = class id + 1, `8` = road surface
(DETR `road` 149 + `pavement` 191).

## Models (`ai.setModel`)

| id            | file (mlmodelc)                         | input   |
|---------------|-----------------------------------------|---------|
| `efficient`   | YOLOX-S (`cv_detect_x`)                 | 640²    |
| `enhanced`    | YOLOX-M (`cv_detect_xl`)                | 640²    |
| `segmentation`| YOLOX-S + DETRResnet50SemanticSegmentationF16P8 (`cv_scene`) | 640² + 448² |
| `none`        | — (AI paused, camera keeps running)     | —       |

All models are free (details: docs/MODELS.md).

---

## Methods

### camera
* `camera.start({deviceType?: 'wide'|'ultraWide'|'telephoto', quality?: 'hd720'|'fhd1080', stabilization?: 'off'|'standard'|'cinematic'|'auto', fps?: 30})`
  → `{textureId: int, width: int, height: int, deviceType: String, stabilization: String}`.
  Starts (or reconfigures) the one shared `AVCaptureSession` (video data + optional audio data output).
  `width/height` are the upright buffer size (changes on rotation → status event).
  Errors: `permission_denied`, `unavailable` (no camera, e.g. Simulator).
* `camera.stop()` → `null`. Stops session, finalises buffer segments (buffer kept on disk until `recorder.clearBuffer` or next start).
* `camera.devices()` → `[{deviceType, name, maxFps, stabilizationModes:[String], supports1080: bool}]`.
* `camera.focus({x, y})` (normalized preview point) → `null`. Tap-to-focus/expose, then returns to continuous auto.
* `camera.setTorch({on: bool})` → `null` (only if hasTorch, else `unavailable`).
* `camera.startFile({path, loop?: true})` → like `camera.start` (+ `recording: true, hasAudio`). **Test mode only**:
  decodes a local video file at real-time pace through the same pipeline — preview, inference AND the rolling
  recorder (video + the file's audio track) — so Save Incident produces real clips on the Simulator. Everything is
  flagged `source: 'file'`; such clips carry `source: 'file', testFootage: true` and a `TEST` title. The file pauses
  in the background like the camera.

### ai
* `ai.models()` → `[{id, name, version, installed: true, sizeBytes, inputSize, labels:[int], supportsSegmentation: bool, license, source}]`.
* `ai.setModel({id})` → `{id, loadMs}`. Releases the previous model (`MLModel` deallocated). All models are free (no gating).
* `ai.configure({confidence?: 0..1 (default .35), iou?: .45, maxHz?: 15, segmentationHz?: 4, paused?: bool, computeUnits?: 'all'|'cpuAndNeuralEngine'|'cpuAndGPU'|'cpuOnly'})` → `null`.
* `ai.analyzeImage({path})` → `{width, height, inferenceMs, objects:[Detection]}` — runs the active detector on a still image (diagnostics/tests).
* `ai.benchmark({path, iterations: 20})` → `{model, meanMs, p95Ms, iterations, computeUnits}` measured on device.

### recorder (rolling buffer + incidents)
* `recorder.configure({profile: 'standard'|'premium', bufferSeconds: 20|30, audio: bool, watermark: bool, timestamp: bool, timestampFormat?: 'iso'|'local', watermarkText?: String})`
  → effective config `{profile, width, height, bufferSeconds, audio, watermark, timestamp, fallbackReason?: String}`.
  Everything is free: `profile` only selects the resolution (`standard` 720p / `premium` 1080p); buffer 5–30 s, audio, watermark and timestamp are as requested. If audio requested
  without mic permission → `audio:false, fallbackReason:'microphone_permission'`.
* `recorder.status()` → `{state: 'idle'|'buffering'|'saving'|'error', bufferedMs, segments, width, height, audio}`.
* `recorder.saveIncident({reason: 'manual'|'emergency'|'test', lat?, lon?, speed?, title?})`
  → `IncidentResult {id, path, thumbnailPath, durationMs, width, height, sizeBytes, hasAudio, createdAt, reason, lat?, lon?, speed?}`.
  Finalises the current segment, composes the last ≤ bufferSeconds of footage (AVMutableComposition,
  passthrough export to `.mp4` in `Application Support/Clips/`, atomic rename), validates
  (duration > 0.5 s, size > 0, playable), generates JPEG thumbnail. Errors: `not_running`, `storage_full`, `io_error`, `failed`.
* `recorder.clearBuffer()` → `null`. Deletes temporary segments.
* `recorder.startManual({preRollSeconds: 5, maxMinutes: 0|15|30|60, splitMinutes: 5, lat?, lon?, speed?})`
  → `manual` map (below). **Manual (continuous) recording** on top of the rolling buffer
  (profile, audio, watermark/timestamp follow the current `recorder.configure`). Segments from
  (now − preRoll) onward are protected from pruning. Every `splitMinutes`, on a frame-size change and on
  stop, the protected run is exported as a clip **part** through the incident exporter (passthrough,
  `.partial` → atomic rename, validation, thumbnail, sidecar) with `reason:'recording', kind:'manual', part,
  sessionId, startedAt, endedAt, manualStartedAt`, then released; recording continues seamlessly into the
  next part. The incident buffer keeps working (Save Incident makes its own clip). Errors: `not_running`
  (camera not running), `storage_full`. Idempotent while active. Debug builds accept `splitMinutes` ≥ 0.25
  (release ≥ 1). Each finished part is also emitted as `{type:'recorder', event:'manual_part', part}`.
  **Auto-stop** (finalizing everything recorded) emits `{type:'recorder', note:'manual_stopped_<reason>', manual}`
  with reason `storage` (free space below ~1.5 parts + 300 MB), `max_duration`, `camera_stopped`,
  `background` (iOS stops capture), `thermal` (critical).
* `recorder.stopManual({lat?, lon?, speed?})` → `{parts: [IncidentResult], manual, reason}` — resolves after
  the final part(s) are written. `reason: 'not_active'` when nothing was recording.
* `IncidentResult` now also carries `kind: 'incident'|'manual'|'emergency'|'test'` (and `part` for manual parts).
* `recorder.recover()` → `[IncidentResult]` — on launch: finds orphaned `.partial` exports / segments from
  a terminated session and tries to package them; cleans abandoned temp files.

### media
* `media.thumbnail({path, atMs?: 1000})` → `String` thumbnail path.
* `media.probe({path})` → `{durationMs, width, height, hasAudio, sizeBytes, playable}`.
* `media.storage()` → `{freeBytes, totalBytes, clipsBytes, bufferBytes}`.
* `media.delete({path})` → `null` (deletes clip + its thumbnail atomically).
* `media.cleanup()` → `{bytesFreed, filesDeleted, recovered: [IncidentResult]}`. Frees space nobody needs:
  buffer dirs of previous processes, orphaned thumbnails/sidecars in `Clips/`, cached thumbnails and temporary
  (share/GPX) files older than 1 day; also runs `recover()` (valid `.partial` exports are finalized and returned in
  `recovered` — add them to the library; invalid ones are deleted). Never deletes a saved clip or the current buffer.
  The same cleanup (without `.partial` handling) also runs natively ~20 s after launch and on every drive stop.
* `media.trim({path, startMs, endMs, meta?: {title?, reason?, kind?, createdAt?, lat?, lon?, speed?}})` → `IncidentResult`
  of a **new** clip (the source is never modified). `endMs - startMs` ≥ 1000 (else `bad_args`); the range is clamped
  to the source duration. Event metadata is inherited from the source sidecar (`meta` overrides it; the new sidecar
  adds `trimmedFrom`, `trimStartMs`, `trimEndMs`). Same durability as incident saves: sidecar first →
  `AVAssetExportSession` with `timeRange` to `<id>.mp4.partial` (passthrough, falling back to
  `AVAssetExportPresetHighestQuality`) → atomic rename → validation → JPEG thumbnail → final sidecar. Space check:
  proportional share of the source × 1.2 + 20 MB. Errors: `storage_full`, `io_error`, `failed`, `bad_args`.
  Dart adds the result with `ClipsRepository.add` (`ClipActions.trim`).
* `media.saveToPhotos({path, createdAt?: ms, lat?, lon?})` → `'saved' | 'denied' | 'failed'`. Requests
  `PHPhotoLibrary.requestAuthorization(for: .addOnly)` (NSPhotoLibraryAddUsageDescription; Corvista never reads the
  library) and creates the asset with `PHAssetChangeRequest.creationRequestForAssetFromVideo`, setting the asset's
  creation date / location when given. `io_error` only when the file does not exist.
* `recorder.debug({freeBytes?: int|null, pauseBeforeRenameMs?: int, memoryWarning?: bool})` — **debug builds only**
  (QA fault injection: low-storage simulation, hold a save before its atomic rename, post a memory warning).

### location
* `location.start({accuracy?: 'navigation'|'best', distanceFilter?: 0})` → `null`; `location.stop()`.
  Streams on `corvista/location`. Also enables heading updates.
* `location.current()` → last `LocationFix` or `null`.
* `location.setBackground({on: bool})` → `{on, running}`. Background navigation: `on` sets
  `allowsBackgroundLocationUpdates` + `showsBackgroundLocationIndicator` (blue pill) and holds a
  `CLBackgroundActivitySession` (created in the foreground), so updates started in the foreground
  keep flowing when the app is backgrounded / the screen locks. Authorization stays When-In-Use.
  Also tells `AudioSessionCoordinator` that prompts may be spoken from the background
  (UIBackgroundModes `audio`; mixable `.playback/.voicePrompt` session activated per prompt).
  Dart (`lib/features/navigation/background_nav_bridge.dart`) sends `on: true` only while
  `NavPhase.navigating` and not arrived, `false` otherwise. The flag survives `location.stop/start`.
  Errors: `unavailable` (no `location` UIBackgroundMode), `permission_denied`.

### liveActivity (ActivityKit, iOS 16.2+; Lock Screen + Dynamic Island)
Rendered by the widget extension `ios/CorvistaLiveActivity` (bundle id `com.corvista.fc.corvista.LiveActivity`).
Shared type `CorvistaNavAttributes` lives in
`Sources/corvista_native/LiveActivity/CorvistaNavAttributes.swift` and is compiled into **both**
the plugin and the extension (file reference in `Runner.xcodeproj`) — change it once.
`ContentState = {maneuver, distance, instruction, etaMs, remaining, progress: 0..1,
dashcam: 'recording'|'paused'|'off', dashcamLabel, phase: 'navigating'|'rerouting'|'arrived'|'ended'}`;
`maneuver` is a Dart `ManeuverType` name (mapped natively to SF Symbols: `arrow.turn.up.left/right`,
`arrow.up`, `arrow.up.left/right`, `arrow.uturn.left/right`, `arrow.merge`,
`arrow.triangle.turn.up.right.circle` (roundabout), `flag.checkered`). All strings are pre-formatted
by Dart in the user's units/language; the ETA is rendered with the device time format.
* `liveActivity.status()` → `{supported, enabled (ActivityAuthorizationInfo().areActivitiesEnabled), active}`.
* `liveActivity.start({destination, etaLabel, ...ContentState})` → `{id}`. Ends a previous one first.
  Errors: `unavailable` (disabled in iOS Settings / iOS < 16.2), `failed`.
* `liveActivity.update(ContentState)` → `null`. No-op without an activity. De-duplicated and
  throttled natively to ≤ 1 update/s (newest pending state flushed when the interval elapses).
* `liveActivity.end({final?: ContentState, immediate?: false})` → `null`.
  `Activity.end(content, dismissalPolicy: .default)` (`.immediate` when the user turns the setting off).
Activities left from a previous process are ended at launch; the live one is ended (phase `ended`)
on `UIApplication.willTerminateNotification`. Dart: `lib/features/navigation/live_activity_bridge.dart`
(Settings › Driving › Live Activity, `AppSettings.liveActivity`, default on).

### motion
* `motion.start({hz?: 50})`, `motion.stop()`. Streams on `corvista/motion`.

### nav (MapKit search + directions; no view needed)
* `nav.complete({query, lat?, lon?})` → `[{id, title, subtitle}]` (MKLocalSearchCompleter, debounced natively).
  Only the newest call waits for MapKit (≤ 4 s); superseded calls are answered immediately with the
  current (possibly stale) list, which Dart discards.
* `nav.resolve({id})` → `[Place]` for a completion; `nav.search({query, lat?, lon?})` → `[Place]`.
  `Place = {name, address, lat, lon, category?}`.
* `nav.route({fromLat, fromLon, toLat, toLon, transport?: 'automobile'})`
  → `[Route]` (alternates included). `Route = {id, name, distanceM, expectedTravelTimeS, advisories:[String], polyline: Float64List (lat,lon pairs), steps:[{instructions, distanceM, lat, lon, notice?}]}`.
  Step `lat/lon` = the maneuver point, i.e. the **end** of the MKRouteStep polyline (the instruction is
  performed after driving the step's `distanceM`). Steps of a final walk (MapKit "Prepare to park your car")
  carry `walking: true`; Dart ends driving guidance at the parking point.
  Errors: `no_route` (MKError.directionsNotFound — no driving directions in this region / no road link),
  `unavailable` (offline / server) with message.

### weather (WeatherKit)
* `weather.get({lat, lon})` → `{current: {condition, symbol, temperatureC, apparentC, humidity, windKph, windDirectionDeg, visibilityKm?, precipitationChance, isDaylight, asOf}, hourly: [{ts, condition, symbol, temperatureC, precipitationChance, windKph}], attribution: {serviceName, legalURL, logoLightURL, logoDarkURL}, locationName?}`.
  Errors: `unavailable` (no entitlement / offline / not signed with WeatherKit capability).

### speech (TTS)
* `speech.voices()` → `[{id, name, language, quality: 'default'|'enhanced'|'premium'}]`.
* `speech.speak({text, language, voiceId?, volume?: 0..1, rate?: 0..1, interrupt?: bool})` → `null` (ducks other audio).
* `speech.stop()`.

### audio (proximity tones)
* `audio.proximity({level: 0|1|2|3, volume: 0..1})` → `null`. 0 = silent, 1 = slow beeps (far), 2 = fast, 3 = continuous tone. Generated with AVAudioEngine, mixes with other audio.
* `audio.alertTone({kind: 'emergency'|'chime', volume})` → `null`; `audio.stopAll()`.

### voice (cancellation phrase)
* `voice.start({phrases: [String], locale, timeoutS: 30})` → `null`. On-device recognition where available
  (`requiresOnDeviceRecognition` when supported). Events on `corvista/voice`.
* `voice.stop()`.

### contacts
* `contacts.pick()` → `{identifier, name, phone}` or `null` if cancelled. Uses `CNContactPickerViewController`
  (no Contacts permission required).

### emergency
* `emergency.call({number})` → `bool` opened. Uses `tel://` (iOS shows its own confirmation).
* `emergency.compose({recipients: [String], body})` → `'sent'|'cancelled'|'failed'|'unavailable'` (MFMessageComposeViewController; never auto-sends).

### permissions
* `permissions.status({kind})` / `permissions.request({kind})` → `'granted'|'denied'|'restricted'|'notDetermined'|'limited'`.
  kinds: `camera`, `microphone`, `locationWhenInUse`, `speech`, `notifications`.

### system
* `system.info()` → `{thermal: 'nominal'|'fair'|'serious'|'critical', battery: 0..1 | -1, charging: bool, lowPower: bool, memoryMB, model, osVersion, appVersion, build}`.
* `system.keepAwake({on})`, `system.openSettings()`, `system.openURL({url})`.

---

## Event streams

### `corvista/detections`
```
{type:'detections', ts, frameTs, w, h, model, inferenceMs, hz,
 objects:[{cls:int, conf:double, x, y, w, h, light?:'red'|'yellow'|'green'|'unknown', lightConf?:double}]}
{type:'segmentation', ts, frameTs, w, h, inferenceMs, mapW, mapH, classMap: Uint8List(mapW*mapH)}
```
`light` is produced for `trafficLight` boxes by a native HSV lamp classifier on the crop
(bright saturated red/amber/green pixel ratios in the upper/middle/lower thirds). `unknown` when evidence is weak.
The class map covers the **full** frame (DETR input is scale-filled), row-major, top-left origin.

### `corvista/status`
```
{type:'camera', state:'running'|'stopped'|'interrupted'|'error'|'unavailable', reason?, source:'camera'|'file', fps, droppedFrames, w, h, textureId, recording: bool}
{type:'recorder', state, bufferedMs, segments, width, height, audio, source:'camera'|'file', recording: bool,
 manual: {active, id?, startedAt?, elapsedMs, files, part?, preRollSeconds?, maxMinutes?, splitMinutes?},
 appendMs?, renderMs?, framesPerSec?, encoderNotReady?, droppedFrames?}   // per-second recorder cost
{type:'recorder', event:'manual_part', part: IncidentResult} | {type:'recorder', event:'manual_part_failed', code, message}
{type:'recorder', note:'manual_stopped_storage'|'manual_stopped_max_duration'|'manual_stopped_camera_stopped'|'manual_stopped_background'|'manual_stopped_thermal', manual, …}
{type:'memory', event:'warning'|'released', reason?, released?:[String], memoryMB, memoryMBBefore, …}
   // warning: Dart clears image caches; released: drive stop / background freed models, writers, pools
{type:'thermal', state}
{type:'perf', inferenceMs, detectHz, segmentationMs?, memoryMB, droppedFrames}
```

### `corvista/location`
`{lat, lon, alt, hAcc, vAcc, speed, speedAcc, course, courseAcc, heading, headingAcc, ts}`
(`heading` = true heading if available else magnetic; `-1` when invalid).
Also `{type:'auth', status}` when authorization changes.

### `corvista/motion`
`{ts, hz, samples: Float64List}` — flat records of 7 values `[t(ms), ax, ay, az, rx, ry, rz]`,
user acceleration in g (gravity removed), rotation rate rad/s. Batched every ~200 ms.

### `corvista/voice`
`{type:'listening'|'partial'|'matched'|'ended'|'error', text?, phrase?, message?}`

---

## Platform view `corvista/map`

`UiKitView(viewType: 'corvista/map', creationParams: {pitch: 55, showsBuildings: true, elevation: 'realistic', dark: true, followUser: true, showsTraffic: false})`.
Per-view channel `corvista/map_<viewId>`:

Dart → native:
* `setCameraMode({mode: 'follow'|'overview'|'free'})` — follow = speed-sensitive driving camera (heading-up, distance 650 m @ 0 km/h (≈350 m visible) → 1800 m @ 130 km/h, pitch 60°→45°, animated ≤ 1 s); overview = fit route; free = user control.
* `recenter()` → switches to `follow`.
* `zoom({delta: ±1})`, `setPitch({deg})`, `setStyle({style:'standard'|'hybrid'|'muted', dark: bool, showsTraffic: bool})`.
* `setRoute({polyline: Float64List, destination: {lat, lon, name}})`, `clearRoute()`.
* `setObjects({objects: [{id, cls, lat, lon, approx: true}]})` — approximate detection markers.
* `setRouteProgress({segment, lat, lon})` — travelled part of the route (up to the user's
  projected position on polyline segment `segment`) is drawn dimmed; the rest keeps the bright
  line + casing (`MKPolylineRenderer.strokeStart/strokeEnd`, no overlay rebuild).
* `navFrame({lat, lon, course, speed, distanceToManeuverM?, segment?})` — ~15 Hz while guiding: Dart's
  route-snapped, alpha-beta-filtered, dead-reckoned position. Native shows a route-snapped arrow puck
  (system blue dot hidden), drives the follow camera from it (heading-up, puck in the lower part of the
  free area, zoom/pitch by speed and distance to the maneuver, per-frame smoothing) and dims the
  travelled route. Without frames for 1.5 s the camera falls back to the device location.
* `setNavContext({navigating: bool, distanceToManeuverM?})` — turn-by-turn follow camera: a bit
  more look-ahead while navigating, zooms in (to ~55 %) and pitches up slightly over the last
  400 m before a maneuver.

Native → Dart (invokeMethod on the same channel):
* `onUserGesture({})` — user panned/rotated (Dart shows Recenter).
* `onCameraMode({mode})`.
