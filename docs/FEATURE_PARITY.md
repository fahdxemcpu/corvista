# Feature-parity matrix

Reference: a typical consumer AI dashcam feature set (public product documentation, 2026).
**Ref** = documented reference behaviour · **Ours** = Corvista implementation · **Verified** = how it was checked.
**Pricing:** Corvista is completely free — every feature commonly reserved for a paid tier (extra detector, segmentation, road mask, 1080p/30 s, audio, timestamp, watermark off, all HUD styles, stationary saving, unlimited gallery) is available to everyone. There are no in-app purchases.
Status: ✅ implemented & verified as stated · 🟡 implemented, not yet verified on a physical iPhone · 🔴 open.
"Sim" = iOS Simulator with TEST FOOTAGE (real on-device inference over real road photos/video). No physical-device testing has been performed yet.

| # | Feature | Ref | Ours | Verified | Status |
|---|---|---|---|---|---|
| 1 | Live rear-camera preview | Camera view | One `AVCaptureSession` → `FlutterTexture`; rotation via `videoRotationAngle`; focus/exposure; interruption handling | Compiles; Sim has no camera (shows honest "Camera unavailable") | 🟡 |
| 2 | On-device detection | 7 classes, on-device | Core ML via Vision, throttled, frame-dropping inference queue | Mac eval on 13 real photos; Sim live on footage (~10–13 Hz) | 🟡 (iPhone perf unmeasured) |
| 3 | 7 categories | person, bicycle, motorcycle, car, bus, traffic light, stop sign | Same ids everywhere; truck→car ("vehicle") | Unit tests + eval | ✅ |
| 4 | Boxes + confidence | Boxes & labels | HUD corner brackets, labels, optional %; cover-transform mapping, off-screen culling | Widget tests + Sim screenshots | ✅ |
| 5 | Multiple models | Free detector, Pro detector, Pro seg | Efficient, Enhanced, Segmentation — all free; names neutral in UI | Mac eval: Enhanced finds far more objects (46 vs 20 cars in jam) | ✅ |
| 6 | Object segmentation | Object masks (Pro) | Free. Semantic class map + per-track instance tint inside boxes | Mac eval (class histograms) | 🟡 |
| 7 | Road-surface mask | Road overlay (Pro) | Free. DETR road+pavement classes → road overlay; disclaimer "not drivable space / lanes" | Mac eval: road 9–45 % on road scenes, 0 % non-road | 🟡 |
| 8 | Virtual 2.5D view | Simplified 2.5D scene | Perspective scene from real tracks, 3 styles, zones not metres | Sim screenshots; redesign in progress | 🟡 |
| 9 | 3D maps | Mapped roads + buildings | MapKit realistic elevation, buildings, driving camera | Sim | 🟡 |
| 10 | Destination search & route | Search + guidance | MKLocalSearchCompleter / MKDirections; route overlay | Native probe on Sim returned real places & routes; UI search bug being fixed | 🔴→🟡 |
| 11 | Location, heading, speed | Yes | CoreLocation stream; speed only when valid | Sim (simulated location) | 🟡 |
| 12 | Objects on map | Approximate camera objects | `MapProjector` (bearing + approx range + heading); hidden when heading/accuracy insufficient | Unit tests | 🟡 |
| 13 | Parking View | Camera + simplified scene | Split view, zones rings, nearest highlight, disclaimers | Sim screenshots | 🟡 |
| 14 | Proximity beeps | Yes | AVAudioEngine tone levels 0–3 with hysteresis | Unit tests (levels) | 🟡 |
| 15 | Spoken alerts | Nearby objects, light change, traffic moving | AlertEngine + cooldown/rate limit; 12-language phrases; heard on Sim | Unit tests; TTS heard on Sim | 🟡 |
| 16 | Traffic-light change | Yes | HSV lamp classifier + temporal filter (≥4 frames/0.4 s) | Red/amber correct on photos; green untested | 🟡 |
| 17 | Traffic moving ahead | Yes | Lead-vehicle monitor (stationary ≥3 s, then receding) | Unit tests | 🟡 |
| 18 | Rolling buffer | Local rolling buffer | 2 s AVAssetWriter segments, disk-backed, pre-created writers | macOS harness (continuity, audio, size change) | 🟡 |
| 19 | Save incident | Save incident | Compose + passthrough export, atomic rename, validation, thumbnail | macOS harness | 🟡 |
| 20 | 720p / 1080p | Free 720p 20 s / Pro 1080p 30 s | 720p or 1080p and 20 or 30 s, user's choice, all free | Code + harness | 🟡 |
| 21 | Microphone audio | Pro, with permission | Free, opt-in. Audio output added only when permitted; shared audio-session coordinator | Harness (synthetic audio) | 🟡 |
| 22 | Clips gallery | Review & share | Thumbnails, metadata, favorite, rename, multi-select delete, storage bar; no gallery limit (device storage only) | Widget tests | 🟡 |
| 23 | Playback & sharing | Yes | video_player (AVPlayer), share_plus | Not yet exercised with a real saved clip | 🟡 |
| 24 | Watermark & timestamp | Free watermark; Pro timestamp | Core Image burn-in; watermark optional and timestamp free | Harness | 🟡 |
| 25 | Emergency detection | Opt-in, possible severe crash | ImpactDetector (g-peak + speed drop / rotation, free-fall rejection) | Synthetic fixtures (6 scenarios) | 🟡 |
| 26 | Countdown & cancel | Yes | Full-screen countdown, big cancel, test mode never calls | State tests | 🟡 |
| 27 | Emergency contacts | Chosen contacts | CNContactPicker → Keychain | Not run (needs UI) | 🟡 |
| 28 | Call & message prep | iOS confirmation required | `tel://` + MFMessageComposeViewController, never auto-sends | Code review | 🟡 |
| 29 | Voice cancellation | Optional | SFSpeechRecognizer on-device when supported, bounded | Not run | 🟡 |
| 30 | Driving tools / HUD | Free Classic & Grid; Pro all | 7 HUD styles, all free | Widget smoke test all styles × orientations | ✅ |
| 31 | Power Saver / thermal | Workload adapts | PowerPolicy + native thermal throttle | Unit tests | 🟡 |
| 32 | Multilingual | 50 options (44 on store) | 12 fully translated (en fr ar es de pt it nl tr hi zh ja), RTL Arabic | gen-l10n clean; RTL screenshots pending | 🟡 (≈50 locales 🔴) |
| 33 | Premium management | Optional subscription | Not applicable: Corvista is free, no subscription or paywall | — | ✅ (removed by design) |
| 34 | StoreKit 2 | Auto-renewable | Not applicable: no StoreKit / in-app purchases | — | ✅ (removed by design) |
| 35 | Privacy & permissions | On-device, local clips | Explained before request, denied states, privacy manifests, honest usage strings | Sim | ✅ |
| — | Weather | Forecast in map view | WeatherKit current + hourly + attribution | Unavailable until signed with WeatherKit capability | 🔴 (setup) |
| — | Turn-by-turn (Waze-like) | Route guidance | Geometry maneuvers, banner, spoken guidance — in progress | — | 🔴 in progress |

## Original enhancements (not in reference docs)
Seven HUD styles, test-footage mode (real inference on recorded video), measured-FOV range estimation, diagnostics/benchmark screen, detection log (opt-in).

## Known deviations
- Incidents can be saved at any speed, including while parked (the reference's free plan needs ≥ 5 km/h).
- Orientation change mid-buffer: a saved clip contains only footage after the last rotation.
- Lane guidance and speed limits are not shown (no licensed data source).
- Segmentation model internal file still contains upstream op names; descriptive metadata stripped.
