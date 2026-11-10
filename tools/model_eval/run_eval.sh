#!/bin/sh
# Builds and runs the Corvista model eval on macOS. Run from anywhere.
# Compiles main.swift together with the plugin's platform-neutral inference sources
# so the eval uses exactly the post-processing that ships in the app.
#
# Default detectors: the bundled YOLOX-S / YOLOX-M plus, for comparison, the former
# YOLOv3-Tiny / YOLOv3 models kept in tools/model_sources/compiled_legacy.
# Any option is passed through (a --detectors given here wins), e.g.
#   tools/model_eval/run_eval.sh --runs 1 --images tools/model_eval/images_extra \
#       --out /tmp/extra.md --json /tmp/extra.json --no-seg
# Sequence mode (per-frame JSON detections of extracted video frames, first detector only;
# used for test/fixtures/parking_sequences):
#   tools/model_eval/run_eval.sh --detectors "cv_detect_x=YOLOX-S 640" \
#       --sequence <frames dir> --seq-out <file.json> --fps 5 [--seq-name <name>]
# Segmentation fixtures (always pass --out/--json too, or the repo results are overwritten):
#   tools/model_eval/run_eval.sh --runs 1 --no-letterbox --images <frames_dir> \
#       --out /tmp/seg.md --json /tmp/seg.json --dump-maps <out_dir> --detectors "cv_detect_x=YOLOX-S 640"
set -e
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SRC="$ROOT/packages/corvista_native/ios/corvista_native/Sources/corvista_native"
LEGACY="$ROOT/tools/model_sources/compiled_legacy"
OUT="${TMPDIR:-/tmp}/corvista_model_eval"
xcrun swiftc -O -o "$OUT" \
  "$ROOT/tools/model_eval/main.swift" \
  "$SRC/ModelManager/ModelCatalog.swift" \
  "$SRC/CoreMLInference/DetectionPipeline.swift" \
  "$SRC/CoreMLInference/TrafficLightClassifier.swift" \
  "$SRC/SegmentationEngine/SegmenterRunner.swift"
DET="cv_detect_x=YOLOX-S 640,cv_detect_xl=YOLOX-M 640 pal8"
[ -d "$LEGACY/cv_detect_s.mlmodelc" ] && DET="$DET,$LEGACY/cv_detect_s.mlmodelc=YOLOv3-Tiny (legacy)"
[ -d "$LEGACY/cv_detect_l.mlmodelc" ] && DET="$DET,$LEGACY/cv_detect_l.mlmodelc=YOLOv3 (legacy)"
cd "$ROOT"
"$OUT" "$@" --models "$SRC/Resources/Models" --images "$ROOT/tools/model_eval/images" \
  --out "$ROOT/tools/model_eval/results.md" --json "$ROOT/tools/model_eval/results.json" --detectors "$DET"
