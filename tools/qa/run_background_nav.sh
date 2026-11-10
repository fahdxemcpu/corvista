#!/bin/zsh
# Background navigation + Live Activity QA on a simulator: installs Corvista
# with test footage, runs integration_test/background_nav_test.dart and acts on
# its BGCTL lines (screenshots, simulated drive, background / lock / foreground).
# usage: run_background_nav.sh <udid> <out_dir> [video.mp4] [hold_seconds]
# hold_seconds keeps the app navigating in the background for manual inspection.
UDID=$1; OUT=$2; VIDEO=$3; HOLD=${4:-0}
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
BID=com.corvista.fc.corvista
rm -rf "$OUT"; mkdir -p "$OUT"; : > "$OUT/test.log"
xcrun simctl terminate "$UDID" $BID 2>/dev/null || true
LANG=en_US.UTF-8 flutter build ios --simulator --debug >"$OUT/build.log" 2>&1 || { tail "$OUT/build.log"; exit 1; }
xcrun simctl install "$UDID" build/ios/iphonesimulator/Runner.app
if [[ -n "$VIDEO" ]]; then
  D=$(xcrun simctl get_app_container "$UDID" $BID data); mkdir -p "$D/Documents"
  cp "$VIDEO" "$D/Documents/test_drive.mp4"
fi
for s in location location-always microphone camera notifications; do
  xcrun simctl privacy "$UDID" grant $s $BID 2>/dev/null || true
done
xcrun simctl location "$UDID" set 33.5899,-7.6039

lock_device() {
  # The Simulator has no simctl lock: use Device › Lock in Simulator.app.
  open -a "$(xcode-select -p)/Applications/Simulator.app" --args -CurrentDeviceUDID "$UDID"; sleep 2
  osascript -e 'tell application "Simulator" to activate' \
    -e 'delay 0.5' \
    -e 'tell application "System Events" to tell process "Simulator" to click menu item "Lock" of menu "Device" of menu bar 1' 2>&1
}

shot() {
  xcrun simctl io "$UDID" screenshot --type=png --mask=black "$OUT/$1.png" >/dev/null 2>&1 && echo "shot $1"
}

(
  tail -n +1 -F "$OUT/test.log" 2>/dev/null | while IFS= read -r line; do
    case "$line" in
      *"BGCTL DONE"*) echo "done"; exit 0 ;;
      *"BGCTL SHOT "*) shot "${${line##*BGCTL SHOT }//[^A-Za-z0-9_]/_}" ;;
      *"BGCTL ROUTE "*)
        args=(${=${line##*BGCTL ROUTE }}); speed=${args[1]}; pts=(${args[2,-1]})
        xcrun simctl location "$UDID" clear >/dev/null 2>&1
        xcrun simctl location "$UDID" start --speed=$speed $pts >/dev/null 2>&1 &
        echo "route ${#pts} pts @ $speed m/s" ;;
      *"BGCTL BACKGROUND"*) xcrun simctl launch "$UDID" com.apple.Preferences >/dev/null && echo "background" ;;
      *"BGCTL LOCK"*) lock_device && echo "lock" ;;
      *"BGCTL FOREGROUND"*) xcrun simctl launch "$UDID" $BID >/dev/null && echo "foreground" ;;
      *"BGCTL STOP"*) xcrun simctl location "$UDID" clear >/dev/null 2>&1; echo "stop" ;;
    esac
  done
) > "$OUT/driver.log" 2>&1 &
DRV=$!
LANG=en_US.UTF-8 flutter test integration_test/background_nav_test.dart -d "$UDID" --dart-define=HOLD_S=$HOLD > "$OUT/test.log" 2>&1
RC=$?
sleep 2; kill $DRV 2>/dev/null
xcrun simctl location "$UDID" clear >/dev/null 2>&1
xcrun simctl spawn "$UDID" log show --last 10m --predicate 'eventMessage CONTAINS "[corvista]"' --style compact > "$OUT/native.log" 2>/dev/null
grep -E "BGLOG|\[bgnav\]|\[liveActivity\]" "$OUT/test.log"
tail -2 "$OUT/test.log"; cat "$OUT/driver.log"
exit $RC
