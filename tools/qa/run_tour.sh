#!/bin/zsh
# Fresh-installs Corvista on a simulator with test footage, runs the QA tour
# integration test and captures screenshots.
# usage: run_tour.sh <udid> <out_dir> <video.mp4>
set -e
UDID=$1; OUT=$2; VIDEO=$3
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
BID=com.corvista.fc.corvista
xcrun simctl terminate "$UDID" $BID 2>/dev/null || true
xcrun simctl uninstall "$UDID" $BID 2>/dev/null || true
LANG=en_US.UTF-8 flutter build ios --simulator --debug >/dev/null
xcrun simctl install "$UDID" build/ios/iphonesimulator/Runner.app
D=$(xcrun simctl get_app_container "$UDID" $BID data); mkdir -p "$D/Documents"
cp "$VIDEO" "$D/Documents/test_drive.mp4"
for s in location microphone camera; do xcrun simctl privacy "$UDID" grant $s $BID 2>/dev/null || true; done
xcrun simctl location "$UDID" set 33.5899,-7.6039
rm -rf "$OUT"; mkdir -p "$OUT"; : > "$OUT/test.log"
"$ROOT/tools/qa/capture_shots.sh" "$UDID" "$OUT" "$OUT/test.log" > "$OUT/capture.log" 2>&1 &
CAP=$!
LANG=en_US.UTF-8 flutter test integration_test/qa_tour_test.dart -d "$UDID" --dart-define=VIDEO="$VIDEO" > "$OUT/test.log" 2>&1 || true
sleep 3; kill $CAP 2>/dev/null || true
tail -3 "$OUT/test.log"; grep -c "^shot" "$OUT/capture.log"
