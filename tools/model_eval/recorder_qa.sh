#!/bin/zsh
# Recorder QA on a simulator: runs integration_test/recorder_qa_test.dart (phases
# matrix, kill, recover), performs the host-side actions it asks for (background /
# foreground, kill mid-save, CPU sampling) and verifies every saved clip with ffmpeg.
#
# usage: recorder_qa.sh <udid> <out_dir> <v720_with_audio.mp4> <v1080_with_audio.mp4> <v720_no_audio.mp4>
set -u
UDID=$1; OUT=$2; V720=$3; V1080=$4; VNA=$5
ROOT="${QA_ROOT:-$(cd "$(dirname "$0")/../.." && pwd)}"; cd "$ROOT"  # QA_ROOT: isolated copy (builds are not shared)
BID=com.corvista.fc.corvista
mkdir -p "$OUT"
DEFS=(--dart-define=V720="$V720" --dart-define=V1080="$V1080" --dart-define=VNOAUDIO="$VNA")
clips_dir() { echo "$(xcrun simctl get_app_container "$UDID" $BID data 2>/dev/null)/Library/Application Support/Clips"; }
runner_pid() { pgrep -f "$UDID.*Runner.app/Runner" | head -1; }

# ---- phase: matrix ----
LOG="$OUT/matrix.log"; : > "$LOG"
LANG=en_US.UTF-8 flutter test integration_test/recorder_qa_test.dart -d "$UDID" \
  --dart-define=QA_PHASE=matrix "${DEFS[@]}" > "$LOG" 2>&1 &
TP=$!
bg_done=0; cpu_done=0
while kill -0 $TP 2>/dev/null; do
  if [[ $bg_done == 0 ]] && grep -q "\[qa\] HOST bg" "$LOG"; then
    bg_done=1
    xcrun simctl launch "$UDID" com.apple.Preferences >/dev/null 2>&1; sleep 6
    xcrun simctl launch "$UDID" $BID >/dev/null 2>&1
    echo "host: background 6 s then foreground" >> "$OUT/host.log"
  fi
  if [[ $cpu_done == 0 ]] && grep -q "\[qa\] HOST cpu start" "$LOG"; then
    cpu_done=1; PID=$(runner_pid); : > "$OUT/cpu.txt"
    while ! grep -q "\[qa\] HOST cpu end" "$LOG"; do
      ps -o %cpu=,rss= -p "$PID" >> "$OUT/cpu.txt" 2>/dev/null; sleep 1
    done
  fi
  sleep 0.5
done
mkdir -p "$OUT/clips"; cp -p "$(clips_dir)"/*.mp4 "$(clips_dir)"/*.json "$(clips_dir)"/*.jpg "$OUT/clips/" 2>/dev/null

# ---- phase: kill mid-save ----
LOG2="$OUT/kill.log"; : > "$LOG2"
LANG=en_US.UTF-8 flutter test integration_test/recorder_qa_test.dart -d "$UDID" \
  --dart-define=QA_PHASE=kill "${DEFS[@]}" > "$LOG2" 2>&1 &
TP=$!
until grep -q "\[qa\] HOST kill" "$LOG2" || ! kill -0 $TP 2>/dev/null; do sleep 0.5; done
for i in {1..60}; do ls "$(clips_dir)"/*.mp4.partial >/dev/null 2>&1 && break; sleep 0.5; done
ls -la "$(clips_dir)" | grep partial > "$OUT/partial_before_kill.txt"
xcrun simctl terminate "$UDID" $BID; echo "host: terminated app with .partial present" >> "$OUT/host.log"
kill $TP 2>/dev/null; wait $TP 2>/dev/null

# ---- phase: recover ----
LOG3="$OUT/recover.log"
LANG=en_US.UTF-8 flutter test integration_test/recorder_qa_test.dart -d "$UDID" \
  --dart-define=QA_PHASE=recover "${DEFS[@]}" > "$LOG3" 2>&1
cp -p "$(clips_dir)"/*.mp4 "$(clips_dir)"/*.json "$(clips_dir)"/*.jpg "$OUT/clips/" 2>/dev/null
ls -la "$(clips_dir)" > "$OUT/clips_after_recover.txt"

# ---- host verification of every clip ----
mkdir -p "$OUT/frames"; : > "$OUT/ffprobe.txt"
for f in "$OUT"/clips/*.mp4; do
  id=$(basename "$f" .mp4)
  {
    echo "== $id"
    ffprobe -v error -show_entries stream=codec_type,codec_name,width,height,sample_rate:format=duration,size -of compact "$f"
    ffmpeg -v error -i "$f" -f null - && echo "decode: ok"
    echo "black: $(ffmpeg -i "$f" -vf blackdetect=d=0.2:pix_th=0.05 -an -f null - 2>&1 | grep -c black_start)"
    echo "frozen>1.2s: $(ffmpeg -i "$f" -vf freezedetect=n=0.001:d=1.2 -an -f null - 2>&1 | grep -c freeze_start)"
  } >> "$OUT/ffprobe.txt"
  ffmpeg -v error -y -ss 0.3 -i "$f" -frames:v 1 -vf scale=640:-1 "$OUT/frames/${id}_first.png"
  ffmpeg -v error -y -sseof -0.5 -i "$f" -frames:v 1 -vf scale=640:-1 "$OUT/frames/${id}_last.png"
done
grep -h "\[qa\] RESULT" "$LOG" "$LOG3" | sed 's/.*\[qa\] RESULT //' > "$OUT/results.jsonl"
echo "done: $(wc -l < "$OUT/results.jsonl") results"
