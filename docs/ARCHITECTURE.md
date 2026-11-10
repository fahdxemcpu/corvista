# Corvista — Architecture

```
┌──────────────────────────── Flutter (Dart) ─────────────────────────────┐
│ UI (lib/features/*/…_screen.dart, widgets, painters)                    │
│   Detection · Virtual 2.5D · Map · Parking · Perception · Clips · …     │
│                         ▲ Riverpod 3 providers (docs/STATE.md)          │
│ State & logic: tracker, spatial estimator, alert engine, impact         │
│ detector, route guidance, power policy, mask rasterizer (pure, tested)  │
│ Drift/SQLite: settings, clips, sessions, emergency events, models       │
│                         ▲ NativeEngine (lib/platform/native_bridge)     │
└──────────── MethodChannel corvista/engine · 6 EventChannels ────────────┘
               Texture (camera preview) · UiKitView corvista/map
┌──────────────────── corvista_native (Swift, iOS 17) ────────────────────┐
│ CaptureCoordinator: ONE AVCaptureSession ─┬─► FlutterTexture (preview)  │
│   (video BGRA + optional audio)           ├─► Vision/Core ML (throttled)│
│                                           │     YOLOv3-Tiny / YOLOv3    │
│                                           │     DETR-R50 semantic seg   │
│                                           │     lamp-colour classifier  │
│                                           └─► Rolling buffer (2 s       │
│                                                 AVAssetWriter segments) │
│                                                 → incident export .mp4  │
│ MapKit view (3D realistic elevation, driving camera) · MKLocalSearch     │
│ MKDirections · WeatherKit · CoreLocation · CoreMotion · AVSpeech        │
│ AVAudioEngine tones · SFSpeechRecognizer · Contacts/Message UI · ActivityKit │
└──────────────────────────────────────────────────────────────────────────┘
```

## Principles

* **Frames never cross into Dart.** Preview is a native texture; Dart receives
  ~10–15 Hz structured detections and a 224×224 class map at ~4 Hz.
* **One capture pipeline** feeds preview, inference and recording.
* **Free, no gating.** Every feature is available to everyone; there is no StoreKit,
  entitlement or paywall code in Dart or native.
* **Pure logic in Dart** (tracking, estimation, alert rules, impact detection,
  guidance) so it is unit-tested with `flutter test` and synthetic fixtures.
* **Graceful degradation**: maps/search/routes/weather are online; AI, tracking,
  alerts and recording are fully on-device and keep working offline.
* **Background = navigation only**: location/voice keep running in the background only
  during turn-by-turn guidance (`location.setBackground`); the camera and recorder always
  stop when the app leaves the foreground (iOS), and resume on return.
* **Honest estimates**: monocular range is approximate (docs/ESTIMATION.md);
  UI shows zones, map markers are marked approximate.

## Folders

| Path | Role |
|---|---|
| `lib/app` | app widget, router, bootstrap, provider barrel |
| `lib/core` | theme, shared widgets, animations, permissions, errors |
| `lib/domain` | models, repositories, services |
| `lib/data` | Drift database |
| `lib/features/*` | feature screens + controllers + pure logic |
| `lib/platform/native_bridge` | typed channel client |
| `packages/corvista_native/ios/…/Sources/corvista_native` | Swift engine (CameraEngine, CoreMLInference, SegmentationEngine, RecordingEngine, MapIntegration, Navigation, Weather, MotionMonitoring, Location, SpeechAlerts, EmergencyAssist, StoreKit, System) |
| `ios/CorvistaLiveActivity` | WidgetKit extension: navigation Live Activity (Lock Screen + Dynamic Island); shares `CorvistaNavAttributes.swift` with the plugin's `LiveActivity/` |
| `tools/model_sources`, `tools/model_eval` | original Core ML models, evaluation script & results |
| `docs/` | contracts, models, estimation, parity matrix, release |

The native code is a local Flutter plugin built with Swift Package Manager
(a CocoaPods podspec is also provided). Core ML models are precompiled
(`.mlmodelc`) and shipped as package resources.

## Build

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
flutter test
LANG=en_US.UTF-8 flutter build ios --simulator --debug
```
`lib/native_smoke_main.dart` is a build-only entrypoint for native work.
