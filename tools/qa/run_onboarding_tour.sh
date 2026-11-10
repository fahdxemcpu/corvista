#!/bin/zsh
# Runs the first-launch flow (onboarding → permissions → coach-mark tour) on a
# simulator from a wiped app state, capturing a screenshot at every
# "[qa-shot] <name>" line. `flutter test -d` builds and (re)installs.
# Privacy grants terminate a running app, so they are applied to the
# installed app *before* the test launches it (the app's own permission
# prompts are simulated inside the test).
# usage: run_onboarding_tour.sh <udid> <out_dir> [video.mp4]
# (needs the app installed once, e.g. from a previous run or `flutter run`.)
UDID=$1; OUT=$2; VIDEO=$3
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
BID=com.corvista.fc.corvista
xcrun simctl terminate "$UDID" $BID 2>/dev/null || true
if D=$(xcrun simctl get_app_container "$UDID" $BID data 2>/dev/null); then
  # Fresh first launch: wipe documents, preferences and the database.
  rm -rf "$D/Documents" "$D/Library/Application Support" "$D/Library/Preferences" "$D/tmp"
  mkdir -p "$D/Documents"
  [[ -n "$VIDEO" ]] && cp "$VIDEO" "$D/Documents/test_drive.mp4"
  for s in location microphone camera; do xcrun simctl privacy "$UDID" grant $s $BID 2>/dev/null; done
else
  echo "app not installed yet: run once, then re-run for grants + footage"
fi
xcrun simctl location "$UDID" set 33.5899,-7.6039 2>/dev/null || true
rm -rf "$OUT"; mkdir -p "$OUT"; : > "$OUT/test.log"
"$ROOT/tools/qa/capture_shots.sh" "$UDID" "$OUT" "$OUT/test.log" > "$OUT/capture.log" 2>&1 &
CAP=$!
LANG=en_US.UTF-8 flutter test integration_test/onboarding_tour_test.dart -d "$UDID" > "$OUT/test.log" 2>&1
sleep 3; kill $CAP 2>/dev/null
tail -3 "$OUT/test.log"; grep -c "^shot" "$OUT/capture.log"
