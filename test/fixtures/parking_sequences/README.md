# Parking detection sequences (real footage)

Per-frame detections used by `test/logic/parking_sequences_test.dart` and the
render harness `test/widget/parking_render_test.dart`.

| fixture | footage (720p segment) | frames |
|---|---|---|
| `garage_tuebingen.json` | Tübingen automated car park, windscreen view with bonnet, 0–60 s | 300 |
| `garage_franconia.json` | Franconia-Springfield Metro parking garage, crossing traffic, 8–58 s | 250 |
| `lot_monmouth.json` | Monmouth Mall open parking lot, 72–108 s (bottom-aligned crop) | 180 |

Sources, authors and licences: `docs/TEST_FOOTAGE.md` › Parking footage.

## Regenerate

```sh
# 1. 720p H.264 segment, then frames at 5 fps
ffmpeg -ss <start> -i <source> -t <dur> -vf "scale=1280:720:force_original_aspect_ratio=increase,crop=1280:720,fps=30" \
  -c:v libx264 -crf 22 -pix_fmt yuv420p -an <name>.mp4
ffmpeg -i <name>.mp4 -vf fps=5 -q:v 3 frames/<name>/f_%04d.jpg
# 2. detections with the app's YOLOX-S post-processing (macOS)
tools/model_eval/run_eval.sh --detectors "cv_detect_x=YOLOX-S 640" \
  --sequence frames/<name> --seq-out test/fixtures/parking_sequences/<name>.json --fps 5 --seq-name <name>
# 3. PNG strips (camera frame + parking UI) for review
flutter test test/widget/parking_render_test.dart \
  --dart-define=PARKING_FRAMES_DIR=$PWD/frames --dart-define=PARKING_RENDER_DIR=/tmp/parking_renders
```

Format: `{name, model, fps, width, height, confidence, iou, classes, frames: [{t, frame, inferenceMs,
objects: [{cls, conf, x, y, w, h}]}]}` — `objects` entries are what `Detection.fromMap` reads
(normalized, top-left origin; `cls` indexes `ObjectClass`).
