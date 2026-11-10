#!/bin/zsh
# Captures a simulator screenshot each time the QA tour prints "[qa-shot] <name>".
# usage: capture_shots.sh <udid> <out_dir> <test_log_file>
UDID=$1; OUT=$2; LOG=$3; mkdir -p "$OUT"
tail -n +1 -F "$LOG" 2>/dev/null |
while IFS= read -r line; do
  case "$line" in
    *"[qa-shot] done"*) echo "tour finished"; exit 0 ;;
    *"[qa-shot] "*)
      name=${line##*\[qa-shot\] }; name=${name//[^A-Za-z0-9_]/_}
      xcrun simctl io "$UDID" screenshot --type=png "$OUT/raw_$name.png" >/dev/null 2>&1
      sips -Z 700 "$OUT/raw_$name.png" --out "$OUT/$name.png" >/dev/null 2>&1 && rm -f "$OUT/raw_$name.png"
      echo "shot $name" ;;
    *"[qa-note] "*) echo "note ${line##*\[qa-note\] }" ;;
  esac
done
