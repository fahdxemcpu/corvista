# Release checklist

## Accounts & identifiers (requires the developer's Apple account — not done by the build agents)
- [ ] Trademark/name clearance for "Corvista" (quick web check found no app conflict; formal search pending)
- [ ] Register domain corvista.app (or update URLs in metadata, app Information screen)
- [ ] App ID `com.corvista.fc.corvista` with capability: WeatherKit (no In-App Purchase — the app is free)
- [ ] App ID `com.corvista.fc.corvista.LiveActivity` (widget extension `CorvistaLiveActivity`, Live Activity / Dynamic Island) — no extra capabilities; provisioning profile for it (automatic signing creates it when the team is set on the extension target too)
- [ ] WeatherKit enabled for the App ID (Certificates, IDs & Profiles → Services) — weather returns "unavailable" until then
- [ ] App Store Connect app record, price **Free**, no in-app purchases or subscriptions (the Paid Applications agreement, tax and banking are not needed for a free app)
- [ ] Signing team set in Xcode (Runner **and** CorvistaLiveActivity targets), automatic signing

## Build
- [ ] `flutter pub get && dart run build_runner build -d && flutter gen-l10n`
- [ ] `dart format --set-exit-if-changed lib test` · `flutter analyze` · `flutter test`
- [ ] `flutter build ipa --release` (bump version/build in pubspec)
- [ ] Privacy manifest present (Runner + plugin), Info.plist usage strings reviewed
- [ ] `Runner.app/PlugIns/CorvistaLiveActivity.appex` present in the archive; extension version/build follow the app (`FLUTTER_BUILD_NAME` / `FLUTTER_BUILD_NUMBER`)
- [ ] Info.plist: `UIBackgroundModes` = `location`, `audio`; `NSSupportsLiveActivities` = YES

## Physical-device verification (NOT yet performed — required before release)
- [ ] Camera preview portrait/landscape on ≥ 2 iPhone models (e.g. A15 & A17/A18 class)
- [ ] Box alignment vs real objects (both orientations, ultra-wide/wide)
- [ ] Inference latency per model (`ai.benchmark`) recorded in docs/MODELS.md
- [ ] Rolling buffer: 720p/20 s and 1080p/30 s saves play back, audio sync, rotation mid-buffer, interruption (phone call), low storage
- [ ] Thermal behaviour in a 30-minute windshield session (sun), battery drain measured
- [ ] Map follow camera at speed, rerouting, offline behaviour
- [ ] Background navigation: lock the screen / switch apps mid-route → spoken prompts continue, blue location indicator shown, Live Activity (Lock Screen + Dynamic Island) updates; ends on arrival / End; indicator disappears after navigation ends; music from another app is ducked only during prompts; prompts survive a phone call
- [ ] Return from background mid-drive → "Recording paused while Corvista was in the background" banner, recording resumes automatically
- [ ] Voice alerts in ≥ 3 languages; voice cancel phrase
- [ ] Emergency Mode with synthetic test only; never stage a crash, never auto-call

## Store listing
- [ ] 10 screenshots per docs/release/APP_STORE_METADATA.md (6.9" and 6.5"), captured from real screens
- [ ] App preview video (optional)
- [ ] App icon 1024 (no alpha) — `assets/icons/app_icon_1024.png`
- [ ] Privacy nutrition label: Location (precise) → App Functionality, not linked, not tracking (sent to Apple services); Search history → App Functionality; no other collection
- [ ] App Review notes — background modes (paste in "Notes for review"):
  > Corvista uses the `location` background mode only during active turn-by-turn navigation that the driver started in the app. Background updates are switched on when guidance starts and off when the driver arrives or ends navigation; outside navigation the app never uses location in the background, and the location permission requested is "While Using the App". The `audio` background mode is used only to speak navigation prompts while the screen is locked or another app is in front. The camera and dashcam recording stop when the app leaves the foreground. To test: Drive tab → Maps → search a destination → Go → lock the device; spoken directions and the Live Activity continue.
- [ ] Age rating questionnaire, export compliance (no non-exempt encryption)
- [ ] TestFlight internal build, then external beta
- [ ] Submit for review — **only with the owner's explicit go-ahead**
