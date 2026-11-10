# Corvista Privacy Policy (draft — have it reviewed by counsel before publishing)

_Last updated: 10 November 2026_

Corvista ("we") does not operate user accounts and does not run servers that receive your camera images, video, location, trips or diagnostic information. Everything described below stays on your iPhone unless you choose to share it, or unless it is needed by an Apple service listed under "Data shared with service providers".

## Data processed on your device
* **Camera frames** are analysed on your iPhone with on-device AI (Core ML) to detect supported road objects. Frames are not uploaded and no cloud AI is used.
* **Rolling buffer & clips**: short video segments are written to temporary storage on your iPhone while the camera is active and continuously overwritten. When you tap Save Incident (or Emergency Mode preserves footage), a clip and its thumbnail are saved in the app's private storage on your device. Clips leave your device only when you share or export them. The camera and recording stop when Corvista leaves the screen; there is no background recording.
* **Microphone audio** (optional) is recorded into clips only if you turn it on and grant permission.
* **Location, speed and heading** are used on your device for the speed display, maps, navigation, weather, the trip log, clip metadata (optional "Save location") and Emergency Mode.
* **Trip log**: while a drive is active and "Record trips" is on (Settings › Trips, on by default), Corvista stores each trip's GPS track, distance, duration, speeds, detection counts and a timeline of events (alerts, saved clips, navigation) in the app's local database on your iPhone only. Trips are never uploaded. You choose how long trips are kept (7, 30 or 90 days — the default —, 1 year or forever); older trips are deleted automatically when Corvista starts. You can delete individual trips, turn the trip log off, or erase everything with Delete all data. A trip leaves your device only if you export it (GPX) and share it yourself.
* **Background location — turn-by-turn navigation only.** Location is used in the background **only during active turn-by-turn navigation that you start**, so spoken directions and the Live Activity keep working when you lock the screen or switch apps. It stops when you arrive or end navigation. iOS shows the location indicator while this happens. Corvista asks only for "While Using the App" location permission and does not track you in the background at any other time.
* **Live Activity** (Lock Screen and Dynamic Island, optional — Settings › Driving › Live Activity): during navigation it shows the next maneuver, distance, arrival time and dashcam status. It is updated locally by the app on your iPhone; no push server is used and its content is not sent to us. It ends when navigation ends. You can also turn Live Activities off in iOS Settings.
* **Motion sensors** are used on your device only when Emergency Mode is enabled, and only while driving.
* **Emergency contacts** you choose are stored in the iOS Keychain on your device. Emergency events (time, impact measurements, optional position, whether it was cancelled) are stored in the local database. Corvista never calls or messages anyone automatically: iOS asks you to confirm every call and message.
* **Speech recognition** for the optional emergency cancel phrase is performed on-device where your iPhone supports it; otherwise iOS may use Apple's speech service according to Apple's privacy policy.
* **Detection log** (diagnostics, off by default): if you turn on "Save detection log", detected object boxes are stored locally (capped at 10,000 rows) for troubleshooting.
* **Settings and recent destinations** (your last 10 navigation destinations) and the clip catalogue are stored in a local database.
* **Private diagnostic log**: if Corvista encounters an error, a short technical entry (time, app version, error message and the top of the program stack trace) is written to a private file on your iPhone. Before writing, Corvista removes locations and coordinates, contact names, phone numbers and other long numbers, and e-mail addresses. The log is limited in size (older entries are discarded automatically). **It is never sent automatically** — there is no analytics or crash-reporting service. You can share it yourself (Settings › Information › Diagnostics › Share diagnostic log; you choose the recipient, e.g. an e-mail to support) or clear it at any time.

## Data shared with service providers
* **Apple MapKit** (map tiles, search, directions) and **Apple WeatherKit** (weather) receive the location or search text needed to answer your request, plus standard network information such as IP address. Apple processes this under its own privacy policy. We do not receive it.

## What we do not do
No advertising, no tracking, no analytics or crash-reporting SDKs, no sale of data, no cloud AI inference, no automatic upload of footage, trips or logs, no hidden background recording, no background location outside navigation you started, and no automatic calls or messages to emergency services or contacts.

## Your choices and deleting your data
* Deny or revoke camera, microphone, location, speech and notification permissions in iOS Settings; the related features stop working and the app explains why.
* Delete individual clips in Clips and individual trips in the trip log; turn the trip log, "Save location", the detection log or the Live Activity off in Settings.
* **Delete all data** (Settings › Privacy & data) permanently erases, from this iPhone: incident clips and thumbnails, the trip log and GPS tracks, emergency contacts and emergency events, detection logs and the diagnostic log, settings and recent destinations, and the temporary recording buffer and caches. Corvista then starts again from its welcome screens. This cannot be undone.
* Deleting the app also removes its local data (iOS may keep Keychain items such as emergency contacts until you use Delete all data first).
* Anything you have already shared (a clip, a GPX file, the diagnostic log) is outside Corvista's control; delete it where you sent it.

## Languages
Corvista is available in 41 languages. Translations of this policy are provided for convenience; the English version prevails in case of difference.

## Children
Corvista is not directed to children.

## Changes
We will update this policy when the app's data practices change and show the new "Last updated" date.

## Contact
support@corvista.app (placeholder — confirm before publishing)
