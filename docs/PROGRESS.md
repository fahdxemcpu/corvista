# Corvista — progress & resume point

_Updated 2026-11-10._ State: `flutter gen-l10n` (0 warnings), `dart analyze lib test integration_test` clean, **`flutter test test`: 401 passing**, unsigned **release build OK** (117 MB incl. Live Activity extension). The app is **completely free** (no paywall, no StoreKit, no gating).

## ▶ What's left

1. **Physical iPhone testing** (never done — the Simulator has no camera/Neural Engine): camera preview & box alignment, real recording (720p/1080p, audio, rotation, 30 s buffer after the `maxContiguityGap = 1.0 s` fix), manual recording parts + crash recovery, inference/segmentation speed (`ai.benchmark`), thermal over 30 min, background navigation + Live Activity on the Lock Screen, memory.
2. **Remaining Simulator checks** (scripts in `tools/qa/`, run from an isolated repo copy): drive scenarios with the YOLOX models (`run_drive.sh`), background nav/Live Activity (`run_background_nav.sh`), trim / Save to Photos on a real clip, yards (GB region), "no directions" country.
3. **Owner-only release steps** (`docs/release/RELEASE_CHECKLIST.md`): Apple signing team, App IDs (app + `com.corvista.fc.corvista.LiveActivity`), WeatherKit capability, price Free, trademark check for "Corvista", legal review of privacy policy/terms, App Store screenshots from your own footage, TestFlight.
4. **Languages**: 43 locales complete (en + 38 languages at 878/878 strings + 4 regional variants). Machine-translated — a native-speaker review is recommended for top markets. After adding any UI string, translate it into all locale files (rules in the appendix; validator `tools/check_arb.py`).

## Verified on the Simulator (2026-11-10, QA tour + footage)
Onboarding → Allow-all permissions → guided tour (with Record step) → all five views on real road footage → Save Incident produced a real 20 s clip → clips library, trips, settings, diagnostics, emergency test countdown (closes on cancel) → light theme → Arabic RTL, German, Japanese. Virtual placement and Parking/Perception redesigns were also checked on real road/parking footage via replay renders.

## ✅ Built (this session)

- **Core**: one shared AVCaptureSession → Flutter texture preview + Core ML inference + disk-backed rolling buffer (2 s AVAssetWriter segments) → incident export (atomic, validated, thumbnail), watermark/timestamp burn-in, 720p or 1080p, 20 or 30 s, mic audio, recovery after kill, storage-full handling. Test footage (local video) feeds the same pipeline incl. recorder.
- **AI**: YOLOX-S (Efficient) / YOLOX-M (Enhanced), Apache-2.0, 640², NMS pipeline; DETR-R50 semantic segmentation (object + road masks). Neutral model names, metadata stripped, licences page. Eval in `tools/model_eval/`, details `docs/MODELS.md`.
- **Tracking & logic**: ByteTrack-style tracker, monocular range zones (measured FOV), traffic-light lamp state, lead-vehicle "traffic moving", alert engine with cooldowns, impact detector (synthetic fixtures), power/thermal policy.
- **Views**: Detection, Virtual 2.5D (redesigned, 3 styles, left/right-hand traffic), Map (MapKit 3D), Parking (split + beeps), Perception (masks; auto-loads segmentation model). 7 HUD styles.
- **Navigation**: search + recents, route alternates, Waze-style banner/then-chip/trip bar, geometry maneuvers, route-matched position with dead-reckoning, along-route distances, speed-scaled spoken prompts, robust off-route/reroute, ETA, worldwide units/LHT. Background navigation + Live Activity/Dynamic Island extension.
- **Trip log**: automatic trips, GPS track, stats, detections per class, event timeline linked to clips, GPX export, retention settings, DB migration.
- **App**: onboarding (5 pages), all permissions at first launch ("Allow all"), guided coach-mark tour (replay in Help), clips gallery/player, settings, emergency mode (countdown, voice cancel, contacts, call/SMS handoff, test mode), regional defaults (units, emergency number), memory-pressure handling, `media.cleanup` + "Free up space", privacy manifests, app icon, release docs.
- **Privacy**: Settings › Privacy & data › Delete all data (`DataEraser`, `lib/domain/services/data_eraser.dart`); private redacted error log (`lib/core/errors/error_log.dart`, share/clear in Diagnostics); privacy policy + App Store metadata/review notes refreshed.
- **Languages**: 42 locale files (en + 37 languages + 4 regional variants); 41 declared to iOS.

## Monetization: none (2026-11-10)
- Product decision: **the app is totally free, no paid features.** Paywall, StoreKit module (`StoreModule`/`EntitlementStore`), `entitlementProvider`/`isPremiumProvider`/`PremiumGate`/`effectiveSettingsProvider`, `feature_flags.dart`, the 5 km/h save rule, the 5-clip gallery limit, all PRO/Premium badges and locks, `ios/Corvista.storekit` and `docs/STOREKIT.md` were removed. StoreKit is no longer linked. `RecordingProfile.premium` / wire value `'premium'` remains only as the 1080p profile identifier.

## Known limitations / risks
- Nothing verified on a physical iPhone. Simulator has no camera/ANE (segmentation ≈ 1.1 s/frame there).
- Japan's triangular stop sign and some rainy-night pedestrians are not detected by the COCO-trained models.
- Background camera recording is impossible on iOS (Live Activity + auto-resume instead).
- Start/end place names in trips are blank (no reverse-geocoding bridge yet).
- Translations are machine-generated (no native-speaker review).

## Appendix — translation brief (for the remaining work)
Translate from `lib/l10n/app_en.arb` (read `@key` descriptions). Keep `{placeholders}` and ICU plural/select structure (always `other`; language-appropriate categories; never both `=1` and `one`). Don't translate: Corvista, Apple, Apple Maps, Apple Weather, WeatherKit, MapKit, Core ML, iPhone, iOS, App Store, HD, Full HD, 720p, 1080p, GPS, GPX. Premium, calm, concise, automotive tone; short button labels; safety/legal never stronger than English; TTS strings (navSpeak*, navSpoken*, alert/voice-cancel phrases) natural spoken language; formal register customary for apps; RTL without control characters. Write files via a Python script (`json.dump(ensure_ascii=False, indent=2)` + newline), template key order, no `@` metadata in non-template files.
