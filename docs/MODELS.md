# Corvista on-device models

Corvista ships three pre-compiled Core ML models (`.mlmodelc`) in
`packages/corvista_native/ios/corvista_native/Sources/corvista_native/Resources/Models/`.
Sources (`.mlmodel` / `.mlpackage`) and conversion inputs are in `tools/model_sources/`;
conversion scripts are in `tools/model_convert/`. All inference runs on the device; no frames
leave the phone.

> **All performance numbers below were measured on a Mac (Apple M1 Pro, macOS 26.6).
> iPhone performance is UNMEASURED until the app runs on a physical device.** Run
> `ai.benchmark` on the device to get real numbers.

## Bundle names and in-app naming

The app never names the underlying models. The compiled files ship under neutral
names: `cv_detect_x.mlmodelc` (YOLOX-S), `cv_detect_xl.mlmodelc` (YOLOX-M) and
`cv_scene.mlmodelc` (DETR ResNet-50). The bridge sends only the display names
"Efficient", "Enhanced" and "Scene", with no version, licence or source fields; the
screens show localized names, size and status only. Provenance and licences are kept
here. Both components are Apache-2.0, so their licence texts ship in `assets/licenses/`
(`detection_model_LICENSE.txt`, `scene_model_LICENSE.txt`) and are registered in
`lib/main.dart` `_registerLicenses()` as "On-device detection model" and "On-device scene
model" (Settings › Information › Open-source licences). The detection notice keeps
Megvii's copyright line, as Apache-2.0 §4 requires, and states the modifications.

The former YOLOv3-Tiny / YOLOv3 detectors (`cv_detect_s` / `cv_detect_l`) were removed from
the bundle on 2026-11-07. Their compiled copies are kept, for the eval comparison only, in
`tools/model_sources/compiled_legacy/`, and their sources in `tools/model_sources/*.mlmodel`.

## Summary

| bridge id (`ai.setModel`) | model(s) | input | output |
|---|---|---|---|
| `efficient` | YOLOX-S, FP16 (`cv_detect_x`, 17.3 MB) | **640×640** RGB | boxes + 80 COCO class scores (NMS inside the pipeline) |
| `enhanced` | YOLOX-M, FP16 compute + 8-bit palettized weights (`cv_detect_xl`, 24.5 MB) | **640×640** RGB | same as above |
| `segmentation` | YOLOX-S (`cv_detect_x`) + DETRResnet50SemanticSegmentationF16P8 | 640² + 448² | boxes + 448×448 Int32 semantic map (we send a 224×224 map) |

Bundled model size: 17.3 + 24.5 + 41.2 = **83 MB** compiled (previously 8.6 + 59.7 + 41.2 = 109.5 MB).
The segmentation set uses the fast YOLOX-S detector because DETR (≈200 ms on the Mac)
already dominates that set's cost.
| `none` | — | — | AI paused; the camera keeps running |

Every model is free for everyone (Corvista has no paid tier).

## Architectures and weights

### YOLOX-S and YOLOX-M (detection, current)
* **Architecture.** YOLOX (Ge et al., 2021, arXiv:2107.08430): anchor-free YOLO with a CSPDarknet
  backbone (Focus stem, SPP), PAFPN neck and a decoupled head (separate class and box/objectness
  branches), 3 scales (strides 8/16/32 → 8400 candidate boxes at 640×640). YOLOX-S: depth 0.33,
  width 0.50, 9.0 M params, 26.8 GFLOPs at 640. YOLOX-M: depth 0.67, width 0.75, 25.3 M params,
  73.8 GFLOPs. Published COCO val mAP@0.5:0.95: **S 40.5, M 46.9** (for reference: YOLOv3-416
  ≈ 31.0, YOLOv3-Tiny ≈ 16–17; YOLOX-Tiny 32.8 and YOLOX-Nano 25.8 at 416).
* **Code and weights source.** [github.com/Megvii-BaseDetection/YOLOX](https://github.com/Megvii-BaseDetection/YOLOX),
  pinned commit `6ddff4824372906469a7fae2dc3206c7aa4bbaee` (2025-06-08). Weights: GitHub release
  [0.1.1rc0](https://github.com/Megvii-BaseDetection/YOLOX/releases/tag/0.1.1rc0) assets
  `yolox_s.pth` (sha256 `f55ded71…913a30`) and `yolox_m.pth` (sha256 `60076992…19b6`); also
  downloaded for comparison: `yolox_tiny.pth`, `yolox_nano.pth`. These are the "new" (non-legacy) weights:
  input BGR 0–255 with **no** mean/std normalisation.
* **Licence (verified 2026-11-07).** Repository `LICENSE` is Apache License 2.0
  ("Copyright (c) 2021-2022 Megvii Inc."); the GitHub API reports `spdx_id: Apache-2.0`. The weights
  are distributed as assets of that repository's own release, and neither the README, the release
  notes nor the repo add separate or non-commercial terms for them, so we treat them as Apache-2.0.
  Commercial use is permitted; obligations: ship the licence text and copyright notice and state
  modifications (done in `assets/licenses/detection_model_LICENSE.txt`). Training data is COCO 2017:
  annotations CC BY 4.0; we ship no images. No Ultralytics (AGPL) code or weights are used.
* **Conversion** (`tools/model_convert/convert_yolox.py`, driven by `convert_all.sh`):
  1. Build the YOLOX model from the pinned repo (sys.path, no pip install), load the checkpoint with
     `torch.load(weights_only=True)`, eval mode, `decode_in_inference=True`.
  2. Fold RGB→BGR into the Focus stem conv weights (input stays RGB 0–255, `scale=1`, no extra op).
  3. Rewrite SPP's 5/9/13 max-pools as cascaded 5×5 pools (SPPF form, numerically identical; asserted
     in the script). Without this, MLComputePlan placed the 9×9/13×13 pools on the CPU and split the
     Neural Engine graph; after it, every op except the two I/O casts prefers the ANE.
  4. Trace with decode in the graph: `coordinates = (cx, cy, w, h) / input_size` (normalized,
     center-based, like Apple's YOLOv3), `confidence = objectness × class probability` (N×80).
  5. `ct.convert` (torch 2.7.0, coremltools 9.0, ML Program, iOS 17 target, FP16 compute).
  6. Optional weight compression: `--quant pal8` (k-means 8-bit palettization) or `int8`
     (linear symmetric). YOLOX-M ships pal8; YOLOX-S ships FP16.
  7. Append a `NonMaximumSuppression` model and wrap both in a pipeline: inputs `image` (RGB 640×640),
     optional `iouThreshold` / `confidenceThreshold` (Double; defaults 0.45 / 0.30), outputs
     `confidence` (N×80) and `coordinates` (N×4), `stringClassLabels` = the 80 Darknet-spelled
     COCO names copied from the old `cv_detect_s` (`tools/model_convert/coco_labels_darknet.json`:
     `person, bicycle, car, motorbike, aeroplane, bus, train, truck, …`), so
     `CorvistaClass.fromYOLOLabel` is unchanged.
  8. `xcrun coremlcompiler compile <pkg> <out> --platform iOS --deployment-target 17.0`, then
     `tools/strip_model_metadata.py` on the copies in `Resources/Models/`.
* **Interface differences vs the old YOLOv3 pipelines** (none needs a Swift change):
  * input is 640×640 instead of 416×416 (Vision `.scaleFill` scales either way);
  * `confidence` / `coordinates` are Float32 instead of Double. An ML Program cannot output Double,
    and Core ML's NMS requires the same element type on its inputs and outputs. Vision reads
    `VNRecognizedObjectObservation`s, so the app never sees the arrays;
  * **class-agnostic NMS** (`pickTop.perClass = false`, the setting YOLOX's own demo uses). Apple's
    YOLOv3 used per-class NMS, which leaves a `car` and a `truck` box on the same vehicle. Both
    map to Corvista `car`, so the result was a double box (YOLOv3 had 2 such pairs on img01; per-class
    YOLOX-S had 5 on the eval set, class-agnostic 0). Riders and their bicycle/motorcycle survive
    (checked on img09, x04, x07, x08). Cost: one real bus in img01 was suppressed by an overlapping,
    higher-scoring car box for YOLOX-S. Use `--nms-per-class` to rebuild the old behaviour.
* **Conversion fidelity** (Core ML FP16 vs PyTorch FP32 on img01, anchors with score ≥ 0.30):
  mean max-score difference 0.006 (S) / 0.006 (M FP16) / 0.011 (M pal8); mean box difference ≤ 0.0003
  of the image size. Int8 linear quantization of S was 10× worse on boxes (0.0026), so it is not used.
  8-bit palettization of S halves its size (17.3 → 8.8 MB) at no measured speed gain and with 2× the
  score error, so S stays FP16.
* **Why 640 and not 416.** YOLOX-S at 416 found clearly fewer distant objects (car 48 vs 66,
  person 4 vs 8 on the eval set) for a small saving (8.2 vs 10.8 ms on the Mac). YOLOX-Tiny/Nano at
  416 are much better than YOLOv3-Tiny but weaker than YOLOX-S at 640 at similar Mac latency, so
  they are not shipped.

### YOLOv3 and YOLOv3-Tiny (previous detectors, removed from the bundle)
* **Architecture.** YOLOv3 (Redmon & Farhadi, 2018) uses a Darknet-53 backbone with 3 detection scales.
  YOLOv3-Tiny is a 13-conv backbone with 2 scales. Both are Core ML *pipelines*: a neural network
  followed by a `NonMaximumSuppression` model, with optional `confidenceThreshold` and
  `iouThreshold` inputs.
* **Weights source.** Apple's Core ML model gallery (developer.apple.com/machine-learning/models,
  model version 2.0), converted from the upstream Darknet weights at
  [github.com/pjreddie/darknet](https://github.com/pjreddie/darknet).
* **Upstream licence.** The *YOLO LICENSE, Version 2 (July 29 2016)*. Verified by fetching
  `pjreddie/darknet/master/LICENSE`, which states "Darknet is public domain. Do whatever you want with it."
* **Quantization.** Int8 weights through a look-up table, Float16 compute. Size: Tiny 8.6 MB, YOLOv3 60 MB (compiled).
* **Labels.** The 80 COCO names in Darknet spelling (e.g. `motorbike`); the YOLOX pipelines reuse this list.

### DETR ResNet-50 (semantic segmentation)
* **Architecture.** DETR (Carion et al., 2020): a ResNet-50 backbone with a transformer encoder and
  decoder, using the panoptic head. Apple's export returns a per-pixel arg-max `semanticPredictions`
  (Int32, 448×448).
* **Weights source.** Apple Core ML model gallery (2024-06, version 1.0), converted from
  `facebook/detr-resnet-50-panoptic`. Upstream code and weights:
  [github.com/facebookresearch/detr](https://github.com/facebookresearch/detr).
* **Upstream licence.** Apache License 2.0 (verified by fetching `facebookresearch/detr/main/LICENSE`).
  The model metadata also says "Apache 2". Training data is COCO panoptic: annotations are CC BY 4.0.
* **Quantization.** Float16 with 8-bit palettized weights (`Mixed (Float16, Palettized (8 bits))`,
  183 `constexprLutToDense` ops). It is an ML Program that needs iOS 17 or macOS 14. Size: 41 MB compiled.
* **Labels.** The 201-entry list is in `userDefinedMetadata["com.apple.coreml.model.preview.params"]`.
  **The indices we use were verified against that list**, both at model load
  (`SegmentationLabels.verify`, a mismatch gives `model_error`) and in the eval:
  person 1, bicycle 2, car 3, motorcycle 4, bus 6, truck 8, traffic light 10, stop sign 13,
  road 149, pavement 191.

## Label mapping (`docs/BRIDGE.md` class ids)

| id | key | detector label(s) | DETR index(es) → class-map value |
|---|---|---|---|
| 0 | person | person | 1 → 1 |
| 1 | bicycle | bicycle | 2 → 2 |
| 2 | motorcycle | motorbike | 4 → 3 |
| 3 | car | car, **truck** | 3, **8 (truck)** → 4 |
| 4 | bus | bus | 6 → 5 |
| 5 | trafficLight | traffic light | 10 → 6 |
| 6 | stopSign | stop sign | 13 → 7 |
| — | road | — | 149 road, 191 pavement → 8 |

All other classes are dropped (detections) or mapped to 0 (segmentation).

## Pipeline details (`CoreMLInference/`, `SegmentationEngine/`)

* **Loading.** `MLModel(contentsOf:configuration:)` with `MLModelConfiguration.computeUnits`
  (default `.all`, can be changed with `ai.configure{computeUnits}`), then wrapped in a `VNCoreMLModel`.
  `ai.setModel` releases the previous set *before* loading the next, so only one set is resident at a time.
* **Thresholds.** `confidence` and `iou` reach the pipeline's NMS through
  `VNCoreMLModel.featureProvider`. We also filter in code on
  `VNRecognizedObjectObservation.confidence`, which is the box score. We do **not** filter on
  `labels[0].confidence`, because Vision re-normalizes label confidences to sum to 1 (they were
  always ≈1.0 in the eval).
* **Coordinates.** Vision's normalized bottom-left boxes are converted to top-left. Frames are
  already upright (`videoRotationAngle` on the capture connection), so Vision runs with orientation `.up`.
* **Scheduling.** Detection runs on its own serial queue at ≤ `maxHz` (default 15). A frame is taken only
  when the detector is idle and the interval has elapsed. Other frames are dropped and never queued.
  DETR runs on a separate queue at `segmentationHz` (default 4) on the same frames. The 448×448
  output is reduced to 224×224 with a 2×2 block mode (ties: object class, then road, then none).
* **Thermal.** At `.serious` or `.critical` the detection and segmentation rates are halved. At
  `.critical` segmentation is skipped. The effective rate is never above `ai.configure`'s
  `maxHz`. A `perf` status event carries `thermal` and a `note` when throttling is active.

### `imageCropAndScaleOption = .scaleFill` and the aspect-ratio trade-off
All models use `.scaleFill`. Vision stretches the whole 16:9 (or 9:16) frame to the square input.
As a result, **boxes and the class map cover the full frame**, which the UI needs. The cost is that
objects are squashed horizontally by about 1.78× in landscape.
* `.centerCrop` would preserve the aspect ratio but discard about 44% of a 16:9 frame (the sides in
  landscape, top and bottom in portrait). Those are exactly the areas where cyclists, pedestrians at
  the kerb and overhead signals appear. We rejected it.
* **Letterboxing** (padding to square by hand, then mapping boxes back) was compared on all 13 eval
  images (see the last column of the summary in `tools/model_eval/results.md`).
  * For YOLOv3, letterbox found fewer objects on 5 images (img01 42 vs 46; img05, img07, img09 and
    img13 one fewer each) and more on 2 (img02 8 vs 6, img06 4 vs 3).
  * For Tiny it was mixed: more on img02 (4 vs 1), img04 (6 vs 4), img10 and img11 (2 vs 0), and
    fewer on img05 and img13 (1 vs 3).
  * There was no consistent gain, and letterboxing would add a CPU/GPU copy on every frame.

  **We keep scaleFill.** To revisit this, rerun the comparison with labelled road data.
  The 2026-11-07 rerun with YOLOX (last column of `results.md`) is mixed the same way: letterbox
  found fewer objects on img01 (S 32 vs 38, M 32 vs 41) and more on img02 (6 vs 4, 10 vs 8).
  YOLOX was trained on letterboxed input, but stretching did not hurt it measurably here.

## Traffic-light lamp classifier
For every `trafficLight` box, `TrafficLightClassifier` samples at most a 24×48 grid of the BGRA crop.
* **Crop.** The box is inset by 12% so the housing border and yellow backplate are ignored.
* **Lit pixels.** A pixel counts when its value is ≥ 110/255 and its saturation is ≥ 0.40. Hue bands:
  red 330–20°, amber 20–52°, green 90–180°. The green band stops before sky blue at about 195°.
  Each pixel is weighted by saturation × value².
* **Position priors.** In vertical housings, red is expected in the top third, amber in the middle
  and green at the bottom; a colour outside its third gets weight 0.3. Horizontal housings get no
  prior, because the red side differs by country. Near-square boxes get a weak prior (0.6).
* **Result.** The output is `unknown` when the winning colour is weak (< 0.8% weighted coverage,
  fewer than 3 pixels, or confidence < 0.35).

I checked the 19 traffic-light detections in the eval by eye (crops in the eval run):
* **Correct:**
  * red on img02, img05 (2 horizontal housings), img06, img10 (×2) and img13;
  * amber on img11 (UK) and img13 (night);
  * `unknown` on an unlit housing (img02), on a sign back the detector mistook for a light (img05),
    and on a badly localized Tiny box (img06).
* **Ambiguous:** a blurred orange bokeh light (img12) reported as `yellow`.
* **Not covered:** no lit **green** lamp was available in the eval set, so the green band is untested.

## Measured numbers (Mac only)

From `tools/model_eval/results.md` (2026-11-07): Apple M1 Pro, macOS 26.6. Timings are the median and
p95 over 13 images × 10 runs, wall-clock around `VNImageRequestHandler.perform` on a 1280-px BGRA
buffer, including Vision's scaling and NMS.

| model | file | input | compiled MB | `all` median / p95 ms | `cpuOnly` median / p95 ms |
|---|---|---|---|---|---|
| **YOLOX-S** (efficient, scene) | cv_detect_x | 640 | 17.3 | **11.0 / 14.2** | 31.5 / 45.4 |
| **YOLOX-M pal8** (enhanced) | cv_detect_xl | 640 | 24.5 | **15.7 / 18.6** | 56.9 / 65.7 |
| YOLOv3-Tiny (legacy) | cv_detect_s | 416 | 8.6 | 9.8 / 11.9 | 15.3 / 18.0 |
| YOLOv3 (legacy) | cv_detect_l | 416 | 59.7 | 34.9 / 44.4 | 108.2 / 137.2 |
| DETR ResNet-50 seg | cv_scene | 448 | 41.2 | 200.4 / 218.0 | — |

Other variants measured in the same session (not shipped): YOLOX-Tiny 416 7.6 ms, YOLOX-S 416 8.2 ms,
YOLOX-M 640 FP16 17.1 ms (48.5 MB), YOLOX-S 640 pal8 12.2 ms (8.8 MB).

* **Neural Engine placement.** `MLComputePlan` (macOS) reports every op of both YOLOX programs on
  the ANE except the input/output casts. Before the SPP rewrite (see Conversion), YOLOX-S 640 took
  43–51 ms with `.all`, as the 9×9/13×13 pools fell back to the CPU.
* **Real time on iPhone.** The M1 Pro's 16-core Neural Engine is the same generation as the A14/A15's.
  With the whole graph on the ANE, YOLOX-S *should* stay well inside the 15 Hz detection budget
  (66 ms) on A14-class phones and newer, but **this is unmeasured**; run `ai.benchmark` on a device.
  `cpuOnly` (31.5 ms Mac) is the fallback cost if the ANE is unavailable.
* **Cold load.** The first load (Core ML device specialization) was 2.1 s (S) and 2.6 s (M) in this
  run; YOLOv3-Tiny was 0.6–1.5 s, YOLOv3 2.3–2.6 s.

The earlier Simulator numbers (YOLOv3-Tiny via `tools/model_eval/sim_smoke.dart`, ≈46 ms per
inference, CPU only) say nothing about an iPhone, and were not repeated for YOLOX.

**iPhone:** UNMEASURED.

## Detection quality (Mac, confidence ≥ 0.35)

Per-image boxes: `tools/model_eval/results.md` (13 photos) and `results_extra.md` (14 more,
`images_extra/`); provenance in `tools/model_eval/IMAGES.md`. There is no labelled ground truth.
Counts below are detections; misses and false positives were judged by eye from annotated renders
(`tools/model_eval/render_boxes.py`).

**13-image eval set, detections per class:**

| class | YOLOv3-Tiny | YOLOv3 | **YOLOX-S** | **YOLOX-M** | notes from inspection |
|---|---|---|---|---|---|
| person | 4 | 9 | 8 | 10 | X-S/M get both pedestrians on img02 and the riders on img09 |
| bicycle | 0 | 1 | 0 | 0 | the YOLOv3 "bicycle" on img09 is a motorbike (false positive) |
| motorcycle | 2 | 4 | 6 | 6 | img09 has 6 motorbikes: X-S/M find all |
| car | 39 | 75 | 66 | 70 | YOLOv3's count includes 2 car+truck double boxes; it still finds the most cars in the img01 jam (46 vs 38) |
| bus | 0 | 1 | 1 | 4 | 2 real buses (img06, img01). X-M finds both but also calls a box truck "bus" (still a vehicle); X-S lost the img01 bus to class-agnostic NMS |
| trafficLight | 4 | 15 | 13 | 16 | X-S false positives: a sodium street lamp (img13) and a bokeh light (img12); **X-S misses the large close-up amber light on img11** (all others find it). X-M finds YOLOv3's distant 2nd light on img10 and a green light on img09 |
| stopSign | 1 | 1 | 2 | 2 | the extra X-S/M box on img03 is the back of a real octagonal stop sign |

**Extra 14 images** (highway, intersection, night, rain, motorcycles, cyclist, crossing, bus,
horizontal lights, stop signs, Japanese stop sign), per `results_extra.md`:
* Dense motorcycles (x07): motorcycle/person YOLOv3-Tiny 2/3, YOLOv3 10/14, X-S 11/14, X-M 13/18.
* Night intersection (x04): X-S and X-M find the red traffic light that both YOLOv3 models miss; only
  X-M finds the Thai octagonal stop sign.
* Horizontal lights: x11, both found by YOLOv3, X-S and X-M (Tiny 0); x12 (Taipei), found by X-S/M only.
* Stop signs (x13): 2/2 for every model. Japanese triangular 止まれ sign (x14): no model detects it.
  This is expected, because COCO's "stop sign" is the octagon, and no model raised a false stop sign.
* Cyclist (x08): every model finds the bicycle, and class-agnostic NMS keeps the rider too.
* **Failures shared by all models:** the pedestrian standing in the road in the rainy night dashcam
  frame (x05) is missed by all four; the defocused cars behind a rainy windscreen (x06) and an
  aerial night view (x03; only X-M finds 1 of 2 cars) are mostly missed.

**Summary.** YOLOX-S replaces YOLOv3-Tiny at the same Mac latency (11.0 vs 9.8 ms) and is far more
accurate: roughly YOLOv3-level recall plus buses, motorbikes and night lights. YOLOX-M replaces
YOLOv3 at less than half the latency (15.7 vs 34.9 ms) and 40% of the size, with equal or better
results on these images and a much higher published COCO mAP (46.9 vs ≈31). Evidence: 27 photos,
judged by eye. This is not a benchmark.

* **DETR road coverage.** Road + pavement covered 9–45% of the road scenes, and 0% on the non-road
  photo (img08), which is a negative control with no detections.

## Known limitations
* **COCO-trained, not fine-tuned for roads or dashcams.** The models were trained on COCO, not on
  driving data (no BDD100K or Cityscapes fine-tuning), so expect misses on small and distant objects
  and on unusual viewpoints.
* **Night, rain, fog and glare are weakly covered.** The eval has 6 night images and 2 rain images.
  All models missed a pedestrian in the road in the rainy night dashcam frame (x05), so do not rely
  on detection alone in those conditions. Fog and low sun glare are untested.
* **Traffic-light false positives.** YOLOX-S sometimes boxes sodium street lamps or bokeh as traffic
  lights (img12, img13). The lamp classifier then usually reports a colour, because those lights are
  saturated. It also missed one large, close traffic light (img11).
* **Stop signs.** Only octagonal stop signs (a COCO class) are detected, including the back of a sign.
  Japan's triangular 止まれ and other non-octagonal stop signs are not covered.
* **Class-agnostic NMS.** A bus or truck box that overlaps a higher-scoring car box (IoU > 0.45) is
  suppressed, so the class shown is that of the best-scoring box.
* **Class merges.** Trucks and vans are reported as `car`. Ambulances, trailers and trams have no
  dedicated class. YOLOX-M sometimes labels box trucks `bus`.
* **Aspect distortion from scaleFill.** See the trade-off section above.
* **Lamp classifier.** It is heuristic, and green is untested. Arrows, pedestrian signals and
  LED flicker under rolling shutter are not modelled.
* **DETR speed.** About 200 ms per frame on an M1 Pro. On older iPhones expect `segmentationHz`
  to be limited by latency rather than the setting.

## Reproducing the conversion
```
python3.12 -m venv /tmp/yx && /tmp/yx/bin/pip install torch==2.7.0 torchvision==0.22.0 coremltools==9.0 \
    scikit-learn loguru tabulate psutil thop pycocotools tqdm opencv-python-headless pillow
git clone https://github.com/Megvii-BaseDetection/YOLOX tools/model_sources/yolox/repo
git -C tools/model_sources/yolox/repo checkout 6ddff4824372906469a7fae2dc3206c7aa4bbaee
curl -L -o tools/model_sources/yolox/weights/yolox_s.pth \
    https://github.com/Megvii-BaseDetection/YOLOX/releases/download/0.1.1rc0/yolox_s.pth   # same for yolox_m.pth
PY=/tmp/yx/bin/python tools/model_convert/convert_all.sh yolox_s_640_fp16 yolox_m_640_pal8
cp -R tools/model_sources/yolox/compiled/yolox_s_640_fp16.mlmodelc  <Models>/cv_detect_x.mlmodelc
cp -R tools/model_sources/yolox/compiled/yolox_m_640_pal8.mlmodelc  <Models>/cv_detect_xl.mlmodelc
python3 tools/strip_model_metadata.py <Models>/cv_detect_x.mlmodelc <Models>/cv_detect_xl.mlmodelc
```
`repo/`, `weights/`, `out/` and `compiled/` under `tools/model_sources/yolox/` are git-ignored.

## Reproducing the eval
```
tools/model_eval/run_eval.sh            # full timing (≈2 min): YOLOX-S, YOLOX-M, legacy YOLOv3s, DETR
tools/model_eval/run_eval.sh --runs 1   # quick
tools/model_eval/run_eval.sh --runs 1 --no-seg --no-letterbox --images tools/model_eval/images_extra \
    --out tools/model_eval/results_extra.md --json tools/model_eval/results_extra.json
python3 tools/model_eval/render_boxes.py --json tools/model_eval/results.json \
    --images tools/model_eval/images --out /tmp/annotated     # needs Pillow
```
`main.swift` accepts `--detectors "name-or-path[=Title],…"` for any number of detector pipelines,
`--cpu-all` (cpuOnly timing for each), `--no-seg`, `--no-letterbox` and `--json`.
`run_eval.sh` compiles `tools/model_eval/main.swift` together with the plugin's own
platform-neutral sources (`ModelCatalog.swift`, `DetectionPipeline.swift`,
`TrafficLightClassifier.swift`, `SegmenterRunner.swift`). The eval therefore exercises exactly the
post-processing that ships in the app.

Runtime bridge smoke test on a Simulator:
```
flutter run -d <sim> -t tools/model_eval/sim_smoke.dart \
  --dart-define=VIDEO=/abs/road.mp4 --dart-define=IMAGE=/abs/tools/model_eval/images/img05.jpg
```

## Recorder note: contiguous segments
The rolling buffer writes segments of about 2 s, each a separate MP4 that starts on a keyframe.
* **New segment.** A frame-size change (rotation, lens or quality switch), an interruption, or
  backgrounding closes the current segment.
* **`saveIncident`.** It uses only the **trailing run of segments that are time-contiguous
  (gap < 0.25 s) and share the latest dimensions**, trimmed to `bufferSeconds`.
* **Consequence.** A save made shortly after a rotation contains only the footage since the rotation.
