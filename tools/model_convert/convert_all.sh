#!/bin/bash
# Converts the YOLOX variants evaluated in docs/MODELS.md. Usage:
#   PY=/path/to/venv/bin/python tools/model_convert/convert_all.sh [variant ...]
# variant = <model>_<size>_<quant>, e.g. yolox_s_640_fp16 (default: all below).
set -e
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PY="${PY:-python3}"
SRC="$ROOT/tools/model_sources/yolox"
mkdir -p "$SRC/out"
VARIANTS=("$@")
[ ${#VARIANTS[@]} -eq 0 ] && VARIANTS=(yolox_tiny_416_fp16 yolox_s_416_fp16 yolox_s_640_fp16 yolox_m_640_fp16 yolox_s_640_pal8 yolox_s_640_int8)
for v in "${VARIANTS[@]}"; do
  q="${v##*_}"; rest="${v%_*}"; size="${rest##*_}"; model="${rest%_*}"
  out="$SRC/out/$v.mlpackage"
  rm -rf "$out"
  echo "== $model $size $q"
  "$PY" -I "$ROOT/tools/model_convert/convert_yolox.py" --model "$model" --size "$size" --quant "$q" \
    --repo "$SRC/repo" --weights "$SRC/weights/$model.pth" --out "$out" 2>&1 | grep -E "anchors|torch:|mean|rror|saved"
  mkdir -p "$SRC/compiled"
  rm -rf "$SRC/compiled/$v.mlmodelc"
  xcrun coremlcompiler compile "$out" "$SRC/compiled" --platform iOS --deployment-target 17.0 >/dev/null
  mv "$SRC/compiled/$(basename "$out" .mlpackage).mlmodelc" "$SRC/compiled/$v.mlmodelc" 2>/dev/null || true
done
