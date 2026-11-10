"""Convert a YOLOX COCO checkpoint to a Core ML object-detection pipeline
(ML Program + NonMaximumSuppression) with the same interface as Apple's
YOLOv3 gallery models used by Corvista:

  inputs : image (RGB, SxS), iouThreshold (Double, optional),
           confidenceThreshold (Double, optional)
  outputs: confidence (N x 80, Double), coordinates (N x 4, Double,
           normalized center x, y, w, h)
  labels : 80 COCO names in Darknet spelling/order (copied from cv_detect_s).

The decode (grid + stride, exp(wh)) and score = objectness * class prob are in
the traced graph. YOLOX >= 0.1.1rc0 weights expect BGR 0..255 without mean/std;
the RGB->BGR swap is folded into the stem conv weights, so the graph needs no
extra op.

Usage (venv with torch 2.7 + coremltools 9.0, see docs/MODELS.md):
  python -I tools/model_convert/convert_yolox.py --model yolox_s --size 640 \
      --repo tools/model_sources/yolox/repo \
      --weights tools/model_sources/yolox/weights/yolox_s.pth \
      --out tools/model_sources/yolox/out/yolox_s_640.mlpackage [--quant fp16|pal8|int8]
"""
import argparse
import json
import os
import sys

import numpy as np
import torch
import torch.nn as nn

p = argparse.ArgumentParser()
p.add_argument("--model", required=True, choices=["yolox_nano", "yolox_tiny", "yolox_s", "yolox_m"])
p.add_argument("--size", type=int, default=416)
p.add_argument("--repo", required=True)
p.add_argument("--weights", required=True)
p.add_argument("--out", required=True)
p.add_argument("--nms-dtype", default="float32", choices=["double", "float32"])
p.add_argument("--precision", default="fp16", choices=["fp16", "fp32"])
p.add_argument("--nms-per-class", action="store_true",
               help="per-class NMS (Apple YOLOv3 style). Default: class-agnostic, like YOLOX's demo; "
                    "avoids car+truck double boxes (both map to Corvista 'car')")
p.add_argument("--quant", default="fp16", choices=["fp16", "pal8", "int8"])
p.add_argument("--check-image", default=os.path.join(os.path.dirname(__file__), "..", "model_eval", "images", "img01.jpg"))
p.add_argument("--labels", default=os.path.join(os.path.dirname(__file__), "coco_labels_darknet.json"))
a = p.parse_args()

sys.path.insert(0, os.path.abspath(a.repo))
import coremltools as ct  # noqa: E402
from coremltools.models import datatypes  # noqa: E402
from yolox.models import YOLOX, YOLOPAFPN, YOLOXHead  # noqa: E402

DEPTH_WIDTH = {"yolox_nano": (0.33, 0.25), "yolox_tiny": (0.33, 0.375), "yolox_s": (0.33, 0.50), "yolox_m": (0.67, 0.75)}
depth, width = DEPTH_WIDTH[a.model]
dw = a.model == "yolox_nano"
in_ch = [256, 512, 1024]
model = YOLOX(YOLOPAFPN(depth, width, in_channels=in_ch, depthwise=dw),
              YOLOXHead(80, width, in_channels=in_ch, depthwise=dw))
for m in model.modules():
    if isinstance(m, nn.BatchNorm2d):
        m.eps, m.momentum = 1e-3, 0.03
ckpt = torch.load(a.weights, map_location="cpu", weights_only=True)
missing, unexpected = model.load_state_dict(ckpt["model"], strict=True), None
model.eval()
model.head.decode_in_inference = True

# Fold RGB->BGR into the Focus stem conv: its 12 input channels are 4 patches x (B, G, R).
stem = model.backbone.backbone.stem.conv.conv
with torch.no_grad():
    idx = [g * 3 + c for g in range(4) for c in (2, 1, 0)]
    stem.weight.copy_(stem.weight[:, idx].clone())

# SPP: MaxPool 9x9 / 13x13 (stride 1) are not placed on the Neural Engine (MLComputePlan
# shows them on CPU, splitting the graph). Rewrite them as cascaded 5x5 pools (SPPF form),
# which is mathematically identical for stride-1 max pooling with same padding.
from yolox.models.network_blocks import SPPBottleneck  # noqa: E402


def _sppf_forward(self, x):
    x = self.conv1(x)
    y1 = self.m[0](x)        # 5x5
    y2 = self.m[0](y1)       # == 9x9
    y3 = self.m[0](y2)       # == 13x13
    return self.conv2(torch.cat([x, y1, y2, y3], dim=1))


for mod in model.modules():
    if isinstance(mod, SPPBottleneck):
        assert [m.kernel_size for m in mod.m] == [5, 9, 13]
        _ref_in = torch.randn(1, mod.conv1.conv.in_channels, 20, 20)
        with torch.no_grad():
            _ref = mod(_ref_in)
            mod.forward = _sppf_forward.__get__(mod)
            assert torch.allclose(_ref, mod(_ref_in), atol=1e-5), "SPPF rewrite mismatch"

S = a.size


class Export(nn.Module):
    def __init__(self, m):
        super().__init__()
        self.m = m

    def forward(self, x):
        out = self.m(x)[0]                 # (N, 85): cx, cy, w, h (pixels), obj, 80 cls
        boxes = out[:, :4] * (1.0 / S)     # normalized center-based x, y, w, h
        scores = out[:, 4:5] * out[:, 5:]  # objectness x class probability
        return scores, boxes


ex = Export(model).eval()
dummy = torch.rand(1, 3, S, S) * 255
with torch.no_grad():
    traced = torch.jit.trace(ex, dummy)
    ref_scores, ref_boxes = ex(dummy)
N = ref_scores.shape[0]
print(f"{a.model}@{S}: {N} anchors")

mlp = ct.convert(
    traced,
    inputs=[ct.ImageType(name="image", shape=(1, 3, S, S), color_layout=ct.colorlayout.RGB, scale=1.0)],
    outputs=[ct.TensorType(name="raw_confidence", dtype=np.float32),
             ct.TensorType(name="raw_coordinates", dtype=np.float32)],
    convert_to="mlprogram",
    minimum_deployment_target=ct.target.iOS17,
    compute_precision=ct.precision.FLOAT16 if a.precision == "fp16" else ct.precision.FLOAT32,
)

if a.quant == "pal8":
    import coremltools.optimize.coreml as cto
    cfg = cto.OptimizationConfig(global_config=cto.OpPalettizerConfig(mode="kmeans", nbits=8))
    mlp = cto.palettize_weights(mlp, cfg)
elif a.quant == "int8":
    import coremltools.optimize.coreml as cto
    cfg = cto.OptimizationConfig(global_config=cto.OpLinearQuantizerConfig(mode="linear_symmetric", dtype="int8"))
    mlp = cto.linear_quantize_weights(mlp, cfg)

labels = json.load(open(a.labels))
assert len(labels) == 80

# ---- NonMaximumSuppression model (mirrors Apple's YOLOv3 pipeline) ----
spec = mlp.get_spec()
AT = ct.proto.FeatureTypes_pb2.ArrayFeatureType
NMS_DT = AT.DOUBLE if a.nms_dtype == "double" else AT.FLOAT32
nms_spec = ct.proto.Model_pb2.Model()
nms_spec.specificationVersion = spec.specificationVersion
for i, out in enumerate(spec.description.output):
    ma = out.type.multiArrayType
    nin = nms_spec.description.input.add()
    nin.name = out.name
    nin.type.multiArrayType.dataType = NMS_DT
    nin.type.multiArrayType.shape.extend([N, 80 if i == 0 else 4])
for name, size in (("confidence", 80), ("coordinates", 4)):
    o = nms_spec.description.output.add()
    o.name = name
    t = o.type.multiArrayType
    t.dataType = NMS_DT
    r0 = t.shapeRange.sizeRanges.add(); r0.lowerBound = 0; r0.upperBound = -1
    r1 = t.shapeRange.sizeRanges.add(); r1.lowerBound = size; r1.upperBound = size
# Like Apple's YOLOv3 pipeline, the threshold inputs are declared only on the
# pipeline (optional); the NMS model references them by name.
nms = nms_spec.nonMaximumSuppression
nms.confidenceInputFeatureName = "raw_confidence"
nms.coordinatesInputFeatureName = "raw_coordinates"
nms.confidenceOutputFeatureName = "confidence"
nms.coordinatesOutputFeatureName = "coordinates"
nms.iouThresholdInputFeatureName = "iouThreshold"
nms.confidenceThresholdInputFeatureName = "confidenceThreshold"
nms.iouThreshold = 0.45
nms.confidenceThreshold = 0.30
nms.pickTop.perClass = a.nms_per_class
nms.stringClassLabels.vector.extend(labels)

pipe = ct.models.pipeline.Pipeline(
    input_features=[("image", datatypes.Array(3, S, S)),
                    ("iouThreshold", datatypes.Double()),
                    ("confidenceThreshold", datatypes.Double())],
    output_features=["confidence", "coordinates"],
)
pipe.add_model(mlp)
pipe.add_model(nms_spec)
ps = pipe.spec
ps.specificationVersion = spec.specificationVersion
ps.description.input[0].ParseFromString(spec.description.input[0].SerializeToString())
for i in (1, 2):
    ps.description.input[i].type.isOptional = True
ps.description.output[0].ParseFromString(nms_spec.description.output[0].SerializeToString())
ps.description.output[1].ParseFromString(nms_spec.description.output[1].SerializeToString())
ps.description.input[1].shortDescription = "IoU threshold override (default 0.45)"
ps.description.input[2].shortDescription = "Confidence threshold override (default 0.30)"
ps.description.output[0].shortDescription = "Box score (objectness x class) per class"
ps.description.output[1].shortDescription = "Normalized center x, y, width, height"
ps.description.metadata.shortDescription = f"COCO object detector, {S}x{S}"
ps.description.metadata.license = "Apache-2.0"
ps.description.metadata.userDefined["com.apple.coreml.model.preview.type"] = "objectDetector"
ps.description.metadata.userDefined["classes"] = ",".join(labels)

final = ct.models.MLModel(ps, weights_dir=mlp.weights_dir)
final.save(a.out)
print("saved", a.out)

# Sanity check on macOS: raw ML Program vs torch.
try:
    from PIL import Image
    img = Image.open(a.check_image).convert("RGB").resize((S, S), Image.BILINEAR)
    arr = np.asarray(img)
    with torch.no_grad():
        rs, rb = ex(torch.from_numpy(arr).permute(2, 0, 1)[None].float())
    o = mlp.predict({"image": img})
    print("torch: boxes with score>=0.35:", int((rs.max(1).values >= 0.35).sum()),
          " coreml:", int((o["raw_confidence"].max(1) >= 0.35).sum()))
    keep = rs.numpy().max(1) >= 0.30
    print("mean |score diff| on kept", float(np.abs(o["raw_confidence"][keep] - rs.numpy()[keep]).max(1).mean()))
    print("on anchors with torch score>=0.30: max |score diff|",
          float(np.abs(o["raw_confidence"][keep] - rs.numpy()[keep]).max()),
          "max |box diff| (normalized)", float(np.abs(o["raw_coordinates"][keep] - rb.numpy()[keep]).max()),
          "mean |box diff|", float(np.abs(o["raw_coordinates"][keep] - rb.numpy()[keep]).mean()))
except Exception as e:  # pragma: no cover
    print("sanity check skipped:", e)
