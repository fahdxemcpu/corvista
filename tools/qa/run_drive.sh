#!/bin/zsh
# Driving simulation: for each scenario, move the simulated GPS along a real
# street route while TEST FOOTAGE plays, run integration_test/drive_sim_test.dart
# and capture screenshots + stats.
# usage: run_drive.sh <udid> <out_dir> <footage_dir> [scenario ...]
UDID=$1; OUT=$2; FOOT=$3; shift 3
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
typeset -A ROUTE SPEED
# Waypoints roughly along real streets (lat,lon); speeds in m/s.
ROUTE[city_krakow]="50.0647,19.9450 50.0614,19.9383 50.0590,19.9370 50.0545,19.9365"; SPEED[city_krakow]=9
ROUTE[rural_road]="23.1291,113.2644 23.1330,113.2680 23.1380,113.2720 23.1420,113.2770"; SPEED[rural_road]=12
ROUTE[nz_left_traffic]="-41.2706,173.2840 -41.2668,173.2905 -41.2621,173.2980 -41.2575,173.3060"; SPEED[nz_left_traffic]=16
ROUTE[night_traffic]="34.0522,-118.2437 34.0560,-118.2480 34.0605,-118.2530 34.0650,-118.2580"; SPEED[night_traffic]=25
ROUTE[rain_doha]="25.2854,51.5310 25.2900,51.5285 25.2950,51.5255 25.3000,51.5225"; SPEED[rain_doha]=14
ROUTE[dashcam_sample]="52.5200,13.4050 52.5225,13.4100 52.5250,13.4150 52.5275,13.4200"; SPEED[dashcam_sample]=11
SCEN=(${@:-city_krakow rural_road nz_left_traffic night_traffic rain_doha dashcam_sample})
mkdir -p "$OUT"
for s in $SCEN; do
  D="$OUT/$s"; rm -rf "$D"; mkdir -p "$D"; : > "$D/test.log"
  xcrun simctl location "$UDID" clear >/dev/null 2>&1
  xcrun simctl location "$UDID" start --speed=${SPEED[$s]} ${=ROUTE[$s]} >/dev/null 2>&1 &
  "$ROOT/tools/qa/capture_shots.sh" "$UDID" "$D" "$D/test.log" > "$D/capture.log" 2>&1 &
  CAP=$!
  LANG=en_US.UTF-8 flutter test integration_test/drive_sim_test.dart -d "$UDID" \
    --dart-define=VIDEO="$FOOT/$s.mp4" --dart-define=SCENARIO=$s > "$D/test.log" 2>&1
  sleep 2; kill $CAP 2>/dev/null
  echo "== $s: $(grep -c '^shot' $D/capture.log) shots"; grep -o '\[drive\] .*' "$D/test.log" | head -1
done
xcrun simctl location "$UDID" clear >/dev/null 2>&1
