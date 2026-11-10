# App Store metadata (en-US draft)

**App name (30):** Corvista: AI Dashcam
**Subtitle (30):** Road awareness on your iPhone
**Bundle ID:** com.corvista.fc.corvista · **SKU:** corvista-ios-001
**Primary category:** Navigation · **Secondary:** Utilities · **Age rating:** 4+
**Price:** Free (Tier 0) · **In-app purchases:** none · **Subscriptions:** none

## Promotional text (170)
Your iPhone as an intelligent dashcam: on-device AI, turn-by-turn navigation with Live Activity, a private trip log and Full HD clips. Free — no subscriptions, no ads.

## Description
Corvista turns your iPhone into an intelligent dashcam and road-awareness companion.

ADVANCED ON-DEVICE AI
Advanced on-device AI recognizes seven supported road-object categories — people, bicycles, motorcycles, cars, buses, traffic lights and stop signs — directly on your iPhone. Camera frames are never uploaded for analysis. Detection works best in good visibility and can miss or misjudge objects.

MULTIPLE VIEWS OF ONE ROAD
• Live Detection: boxes and labels over the camera image
• Virtual View: a calm 2.5D scene built from current detections
• 3D Map: mapped roads and buildings, destination search and weather
• Parking View: camera beside a simplified nearby-object scene, with optional proximity beeps
• Perception: object masks and a road-surface overlay

TURN-BY-TURN NAVIGATION
Search a destination, compare routes and follow clear spoken directions with well-timed prompts, automatic rerouting and arrival time — in your units, for left- or right-hand traffic. Directions keep going when you lock the screen, and a Live Activity on the Lock Screen and in the Dynamic Island shows the next turn, distance and arrival time at a glance.

TRIP LOG
Every drive can be recorded as a trip: route on a map, distance, time, speeds, detections and a timeline linked to your saved clips. Trips stay on your iPhone only; choose how long to keep them, export a trip as GPX, or turn the trip log off.

DASHCAM & CLIPS
Corvista keeps a short rolling buffer while the camera is active. Tap Save Incident to keep the recent footage, then review, rename, favorite and share it. Clips stay on your iPhone unless you share them.

SPOKEN ALERTS
Optional, short voice cues for supported nearby objects, traffic-light changes and traffic moving ahead, with cooldowns to avoid repetition.

EMERGENCY MODE (OPTIONAL)
If enabled and a possible severe impact is detected, Corvista shows a countdown you can cancel, tries to preserve recent footage, and prepares a call and a message to your chosen contacts. Corvista never contacts emergency services or anyone else automatically — iOS always asks you to confirm before calling or sending. Impact detection can miss real crashes and can be triggered by other events.

PRIVATE BY DESIGN
No account, no ads, no tracking or analytics. Clips, trips, contacts and settings stay on your iPhone, and Settings › Privacy & data › Delete all data erases everything in one step.

41 LANGUAGES
Corvista's interface is available in 41 languages, with local units and emergency numbers for your region.

COMPLETELY FREE
Every feature is included for everyone, with no subscription, no in-app purchases and no ads: both AI detection models and segmentation, Full HD 1080p clips with up to 30 seconds of history, optional microphone audio (with permission), optional watermark, timestamp options, all driving HUD styles and an unlimited clip gallery (limited only by your device storage).

IMPORTANT
Corvista is a driving-awareness aid. It does not steer, brake or control your vehicle, it is not a collision-avoidance system, and it does not replace attentive driving, road signs or parking sensors. Detections, distances and positions are estimates and can be wrong; there is no guarantee that any object or event will be detected. Always follow road signs and local traffic laws over spoken directions. Mount your phone securely and complete setup before driving. Maps, search, directions and weather require an internet connection.

Terms of Use: https://corvista.app/terms · Privacy Policy: https://corvista.app/privacy

## Keywords (100)
dashcam,dash cam,car camera,ai,detection,trip log,turn-by-turn,navigation,live activity,gps,parking

## Support URL / Marketing URL
https://corvista.app/support · https://corvista.app  (placeholders — domain not yet registered; verify before submission)

## Pricing (App Store Connect)
Free app. No in-app purchases or subscriptions are configured; the In-App Purchase capability is not used.

## App Review notes
• No account or login. All features are reachable from the Drive screen.
• The app is free with no in-app purchases: every feature (all AI models, Perception view, 1080p/30 s clips, audio, watermark off, all HUD styles) is available without any purchase.
• The camera requires a physical device; on the Simulator the app shows "Camera unavailable" and offers TEST FOOTAGE mode (real on-device inference over a local video file, clearly labelled).
• **Background location (`UIBackgroundModes: location`)** is used only while the user is following turn-by-turn directions they started from the Map view (search a destination › Go). It keeps route progress, rerouting and spoken prompts working when the screen is locked or another app is in front, and it is turned off on arrival or when navigation ends. Authorization stays "While Using the App" (no "Always" request); iOS shows the blue location indicator. The camera and recorder are never used in the background.
• **Background audio (`UIBackgroundModes: audio`)** is used only to speak navigation prompts while navigating in the background; it mixes with / ducks other audio.
• **Live Activity:** during navigation a Live Activity (Lock Screen + Dynamic Island) shows the next maneuver, distance, ETA and dashcam status; it is updated locally (no push notifications) and ends with navigation. It can be turned off in Settings › Driving › Live Activity. To see it: start navigation to any destination, then lock the device.
• Emergency Mode never calls or messages automatically and does not contact emergency services by itself: it presents iOS's own call confirmation and the Messages composer. Settings → Emergency → "Test countdown (no call)" demonstrates the flow without any call.
• AI detection runs on-device with Core ML; no camera frames, clips, trips or logs are uploaded. Maps, search, directions and weather use Apple MapKit/WeatherKit. There is no analytics or crash-reporting SDK; errors go to a private on-device log that the user may share manually (Settings › Information › Diagnostics).
• Data deletion: Settings › Privacy & data › Delete all data erases all clips, trips, contacts, logs and settings and returns to onboarding.

## Screenshot plan (10, from real implemented screens; simulated scenes labelled)
1 "Your iPhone. Smarter road awareness." – Drive/Detection
2 "Real-time AI object detection." – Detection view with boxes (captured on device, real scene)
3 "Multiple intelligent driving views." – view switcher collage
4 "Explore roads in 3D." – Map with route
5 "See nearby objects in Virtual View." – Virtual view
6 "Intelligent parking visualization." – Parking split view
7 "Advanced object segmentation." – Perception view
8 "Save important driving moments." – Clips gallery
9 "Emergency assistance tools." – Emergency setup (TEST label)
10 "Free. Private. No subscriptions." – Settings (Recording: 1080p, 30 s, audio)
Detection screenshots must be captured from real footage on device; any composited/simulated imagery carries a visible "Simulated" label.
