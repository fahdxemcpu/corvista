# Corvista model evaluation results (Mac)

- Generated: 2026-11-07T16:37:54Z
- Host: **Apple M1 Pro (arm64), macOS Version 26.6.2 (Build 25G83)** — these are Mac numbers, NOT iPhone numbers.
- Detector thresholds: confidence ≥ 0.35, NMS IoU 0.45 (passed via `VNCoreMLModel.featureProvider`, also filtered in code).
- Timing: median / p95 of 10 runs after 1 warm-up, wall clock around `VNImageRequestHandler.perform` (includes Vision scaling).
- Post-processing: `DetectionPipeline.swift`, `SegmenterRunner.swift`, `TrafficLightClassifier.swift` from the plugin sources.

## Models (computeUnits = all, first load includes ANE/GPU compilation)

| model | file | input | compiled size MB | load ms |
|---|---|---|---|---|
| YOLOX-S 640 | cv_detect_x | 640×640 | 17.3 | 2059 |
| YOLOX-M 640 pal8 | cv_detect_xl | 640×640 | 24.5 | 2571 |
| YOLOv3-Tiny (legacy) | cv_detect_s | 416×416 | 8.6 | 602 |
| YOLOv3 (legacy) | cv_detect_l | 416×416 | 59.7 | 2635 |
| DETR ResNet-50 seg | cv_scene | 448×448 | 41.2 | 161 |

DETR label table check against model metadata: **OK — indices 1,2,3,4,6,8,10,13,149,191 match**

## Summary

| image | YOLOX-S 640 | YOLOX-M 640 pal8 | YOLOv3-Tiny (legacy) | YOLOv3 (legacy) | road % (DETR) | letterbox count (scaleFill) |
|---|---|---|---|---|---|---|
| img01.jpg | car×38 | bus×3, car×38 | car×20 | car×46 | 25.4 | 32 (38) / 32 (41) / 20 (20) / 42 (46) |
| img02.jpg | person×2, trafficLight×2 | car×1, person×4, trafficLight×3 | person×1 | car×2, person×2, trafficLight×2 | 31.9 | 6 (4) / 10 (8) / 4 (1) / 8 (6) |
| img03.jpg | car×1, stopSign×2 | car×1, stopSign×2 | car×1, stopSign×1 | car×1, stopSign×1 | 9.7 | 3 (3) / 3 (3) / 2 (2) / 2 (2) |
| img04.jpg | car×6 | car×6 | car×4 | car×7 | 28.9 | 6 (6) / 6 (6) / 6 (4) / 7 (7) |
| img05.jpg | car×9, trafficLight×4 | car×12, trafficLight×4 | car×4 | car×8, trafficLight×3 | 23.6 | 10 (13) / 11 (16) / 3 (4) / 10 (11) |
| img06.jpg | bus×1, car×2, trafficLight×1 | bus×1, car×1, trafficLight×1 | trafficLight×1 | bus×1, car×1, trafficLight×1 | 16.5 | 3 (4) / 4 (3) / 1 (1) / 4 (3) |
| img07.jpg | car×2 | car×2 | — | car×2 | 15.9 | 1 (2) / 2 (2) / 0 (0) / 1 (2) |
| img08.jpg | — | — | — | — | 0.0 | 0 (0) / 0 (0) / 0 (0) / 0 (0) |
| img09.jpg | car×1, motorcycle×6, person×5 | car×2, motorcycle×5, person×6, trafficLight×1 | motorcycle×2, person×1 | bicycle×1, car×1, motorcycle×3, person×7 | 45.1 | 11 (12) / 12 (14) / 3 (3) / 11 (12) |
| img10.jpg | car×6, trafficLight×1 | car×6, trafficLight×2 | car×8 | car×6, trafficLight×2 | 35.5 | 8 (7) / 8 (8) / 9 (8) / 8 (8) |
| img11.jpg | — | trafficLight×1 | — | trafficLight×1 | 0.0 | 1 (0) / 1 (1) / 2 (0) / 1 (1) |
| img12.jpg | car×1, person×1, trafficLight×1 | car×1, motorcycle×1 | car×2, person×2 | car×1, motorcycle×1, trafficLight×1 | 23.0 | 3 (3) / 6 (2) / 4 (4) / 3 (3) |
| img13.jpg | trafficLight×4 | trafficLight×4 | trafficLight×3 | trafficLight×5 | 22.0 | 4 (4) / 3 (4) / 1 (3) / 4 (5) |

## Detections per class, all images (confidence ≥ 0.35; counts, not verified hits)

| class | YOLOX-S 640 | YOLOX-M 640 pal8 | YOLOv3-Tiny (legacy) | YOLOv3 (legacy) |
|---|---|---|---|---|
| person | 8 | 10 | 4 | 9 |
| bicycle | 0 | 0 | 0 | 1 |
| motorcycle | 6 | 6 | 2 | 4 |
| car | 66 | 70 | 39 | 75 |
| bus | 1 | 4 | 0 | 1 |
| trafficLight | 13 | 16 | 4 | 15 |
| stopSign | 2 | 2 | 1 | 1 |

## Timing across all images (Mac, ms)

| model | compute units | median | p95 |
|---|---|---|---|
| YOLOX-S 640 | all | 11.0 | 14.2 |
| YOLOX-S 640 | cpuOnly | 31.5 | 45.4 |
| YOLOX-M 640 pal8 | all | 15.7 | 18.6 |
| YOLOX-M 640 pal8 | cpuOnly | 56.9 | 65.7 |
| YOLOv3-Tiny (legacy) | all | 9.8 | 11.9 |
| YOLOv3-Tiny (legacy) | cpuOnly | 15.3 | 18.0 |
| YOLOv3 (legacy) | all | 34.9 | 44.4 |
| YOLOv3 (legacy) | cpuOnly | 108.2 | 137.2 |
| DETR ResNet-50 seg | all | 200.4 | 218.0 |

## Per-image results

### img01.jpg (1280×845)

**YOLOX-S 640** — 14.1 ms, 38 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.91 | 0.207 | 0.807 | 0.182 | 0.192 |  |
| car (car) | 0.91 | 0.511 | 0.754 | 0.142 | 0.214 |  |
| car (car) | 0.88 | 0.355 | 0.637 | 0.126 | 0.155 |  |
| car (car) | 0.87 | 0.518 | 0.449 | 0.078 | 0.097 |  |
| car (car) | 0.87 | 0.937 | 0.275 | 0.061 | 0.060 |  |
| car (car) | 0.86 | 0.277 | 0.521 | 0.105 | 0.117 |  |
| car (car) | 0.86 | 0.804 | 0.658 | 0.118 | 0.161 |  |
| car (car) | 0.86 | 0.455 | 0.530 | 0.096 | 0.121 |  |
| car (car) | 0.78 | 0.540 | 0.376 | 0.071 | 0.086 |  |
| car (car) | 0.76 | 0.856 | 0.225 | 0.048 | 0.046 |  |
| car (car) | 0.75 | 0.628 | 0.464 | 0.076 | 0.085 |  |
| car (car) | 0.71 | 0.623 | 0.533 | 0.089 | 0.115 |  |
| car (truck) | 0.69 | 0.755 | 0.807 | 0.160 | 0.191 |  |
| car (car) | 0.69 | 0.767 | 0.255 | 0.061 | 0.067 |  |
| car (car) | 0.69 | 0.661 | 0.432 | 0.064 | 0.090 |  |
| car (car) | 0.68 | 0.251 | 0.345 | 0.066 | 0.074 |  |
| car (car) | 0.67 | 0.093 | 0.643 | 0.164 | 0.198 |  |
| car (car) | 0.67 | 0.390 | 0.403 | 0.080 | 0.108 |  |
| car (car) | 0.65 | 0.485 | 0.346 | 0.059 | 0.078 |  |
| car (car) | 0.65 | 0.573 | 0.605 | 0.111 | 0.165 |  |
| car (car) | 0.63 | 0.577 | 0.345 | 0.051 | 0.071 |  |
| car (car) | 0.63 | 0.777 | 0.357 | 0.070 | 0.075 |  |
| car (car) | 0.58 | 0.598 | 0.315 | 0.048 | 0.056 |  |
| car (car) | 0.55 | 0.130 | 0.291 | 0.056 | 0.052 |  |
| car (car) | 0.54 | 0.575 | 0.175 | 0.027 | 0.030 |  |
| car (car) | 0.53 | 0.523 | 0.292 | 0.046 | 0.054 |  |
| car (car) | 0.49 | 0.545 | 0.213 | 0.032 | 0.032 |  |
| car (truck) | 0.49 | 0.736 | 0.163 | 0.076 | 0.127 |  |
| car (car) | 0.46 | 0.136 | 0.298 | 0.058 | 0.081 |  |
| car (car) | 0.46 | 0.598 | 0.186 | 0.033 | 0.042 |  |
| car (car) | 0.46 | 0.670 | 0.334 | 0.062 | 0.088 |  |
| car (truck) | 0.45 | 0.673 | 0.224 | 0.081 | 0.106 |  |
| car (truck) | 0.44 | 0.671 | 0.185 | 0.048 | 0.047 |  |
| car (car) | 0.43 | 0.670 | 0.406 | 0.057 | 0.050 |  |
| car (car) | 0.43 | 0.855 | 0.488 | 0.047 | 0.111 |  |
| car (truck) | 0.40 | 0.761 | 0.426 | 0.104 | 0.281 |  |
| car (car) | 0.40 | 0.343 | 0.954 | 0.179 | 0.045 |  |
| car (car) | 0.38 | 0.782 | 0.315 | 0.049 | 0.036 |  |

(YOLOX-S 640 cpuOnly: 38.0 ms)

**YOLOX-M 640 pal8** — 18.7 ms, 41 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.96 | 0.209 | 0.808 | 0.181 | 0.191 |  |
| car (car) | 0.94 | 0.510 | 0.755 | 0.143 | 0.217 |  |
| car (car) | 0.94 | 0.356 | 0.637 | 0.123 | 0.163 |  |
| car (car) | 0.92 | 0.801 | 0.659 | 0.122 | 0.164 |  |
| car (car) | 0.92 | 0.093 | 0.646 | 0.162 | 0.189 |  |
| car (car) | 0.92 | 0.278 | 0.519 | 0.103 | 0.117 |  |
| car (car) | 0.91 | 0.456 | 0.528 | 0.097 | 0.124 |  |
| car (car) | 0.88 | 0.515 | 0.448 | 0.079 | 0.095 |  |
| car (car) | 0.86 | 0.572 | 0.603 | 0.117 | 0.165 |  |
| car (car) | 0.85 | 0.623 | 0.464 | 0.083 | 0.106 |  |
| car (car) | 0.85 | 0.621 | 0.533 | 0.090 | 0.130 |  |
| car (car) | 0.81 | 0.938 | 0.273 | 0.062 | 0.063 |  |
| car (car) | 0.79 | 0.542 | 0.376 | 0.069 | 0.093 |  |
| bus (bus) | 0.79 | 0.733 | 0.169 | 0.078 | 0.119 |  |
| car (car) | 0.74 | 0.598 | 0.314 | 0.049 | 0.059 |  |
| car (car) | 0.73 | 0.577 | 0.344 | 0.052 | 0.073 |  |
| car (car) | 0.72 | 0.857 | 0.224 | 0.047 | 0.047 |  |
| car (car) | 0.72 | 0.484 | 0.348 | 0.063 | 0.076 |  |
| car (car) | 0.65 | 0.669 | 0.400 | 0.059 | 0.059 |  |
| car (car) | 0.64 | 0.524 | 0.292 | 0.044 | 0.053 |  |
| car (car) | 0.60 | 0.596 | 0.185 | 0.035 | 0.043 |  |
| car (car) | 0.60 | 0.854 | 0.489 | 0.048 | 0.111 |  |
| car (car) | 0.57 | 0.770 | 0.256 | 0.058 | 0.064 |  |
| car (car) | 0.57 | 0.661 | 0.434 | 0.065 | 0.091 |  |
| car (truck) | 0.47 | 0.392 | 0.402 | 0.080 | 0.112 |  |
| car (truck) | 0.47 | 0.606 | 0.128 | 0.034 | 0.057 |  |
| car (car) | 0.46 | 0.598 | 0.275 | 0.050 | 0.055 |  |
| car (truck) | 0.45 | 0.746 | 0.810 | 0.168 | 0.189 |  |
| car (car) | 0.44 | 0.252 | 0.345 | 0.067 | 0.073 |  |
| car (car) | 0.43 | 0.544 | 0.211 | 0.034 | 0.037 |  |
| car (car) | 0.43 | 0.574 | 0.171 | 0.031 | 0.032 |  |
| car (car) | 0.43 | 0.614 | 0.251 | 0.039 | 0.039 |  |
| bus (bus) | 0.42 | 0.671 | 0.185 | 0.047 | 0.051 |  |
| car (truck) | 0.42 | 0.670 | 0.224 | 0.087 | 0.190 |  |
| car (car) | 0.40 | 0.485 | 0.322 | 0.055 | 0.051 |  |
| car (car) | 0.40 | 0.787 | 0.427 | 0.073 | 0.058 |  |
| car (truck) | 0.40 | 0.136 | 0.300 | 0.059 | 0.079 |  |
| bus (bus) | 0.39 | 0.765 | 0.481 | 0.099 | 0.227 |  |
| car (car) | 0.38 | 0.781 | 0.315 | 0.047 | 0.037 |  |
| car (car) | 0.38 | 0.639 | 0.164 | 0.030 | 0.030 |  |
| car (car) | 0.37 | 0.130 | 0.292 | 0.042 | 0.051 |  |

(YOLOX-M 640 pal8 cpuOnly: 65.7 ms)

**YOLOv3-Tiny (legacy)** — 12.9 ms, 20 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.93 | 0.092 | 0.630 | 0.153 | 0.201 |  |
| car (car) | 0.90 | 0.224 | 0.799 | 0.155 | 0.189 |  |
| car (car) | 0.90 | 0.824 | 0.704 | 0.072 | 0.072 |  |
| car (car) | 0.89 | 0.290 | 0.551 | 0.062 | 0.041 |  |
| car (car) | 0.88 | 0.138 | 0.669 | 0.067 | 0.137 |  |
| car (car) | 0.88 | 0.261 | 0.843 | 0.077 | 0.120 |  |
| car (car) | 0.86 | 0.551 | 0.788 | 0.060 | 0.154 |  |
| car (car) | 0.83 | 0.519 | 0.758 | 0.123 | 0.220 |  |
| car (car) | 0.82 | 0.800 | 0.382 | 0.027 | 0.029 |  |
| car (car) | 0.73 | 0.478 | 0.566 | 0.055 | 0.052 |  |
| car (car) | 0.71 | 0.539 | 0.490 | 0.029 | 0.032 |  |
| car (car) | 0.69 | 0.415 | 0.465 | 0.026 | 0.031 |  |
| car (car) | 0.69 | 0.379 | 0.688 | 0.068 | 0.063 |  |
| car (car) | 0.65 | 0.540 | 0.474 | 0.027 | 0.034 |  |
| car (car) | 0.54 | 0.593 | 0.646 | 0.068 | 0.053 |  |
| car (car) | 0.49 | 0.786 | 0.273 | 0.023 | 0.027 |  |
| car (car) | 0.48 | 0.803 | 0.358 | 0.025 | 0.030 |  |
| car (car) | 0.44 | 0.644 | 0.551 | 0.037 | 0.028 |  |
| car (car) | 0.40 | 0.594 | 0.684 | 0.065 | 0.050 |  |
| car (car) | 0.40 | 0.651 | 0.493 | 0.033 | 0.027 |  |

(YOLOv3-Tiny (legacy) cpuOnly: 18.0 ms)

**YOLOv3 (legacy)** — 42.7 ms, 46 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 1.00 | 0.358 | 0.642 | 0.122 | 0.154 |  |
| car (car) | 1.00 | 0.806 | 0.667 | 0.121 | 0.152 |  |
| car (car) | 1.00 | 0.096 | 0.645 | 0.161 | 0.192 |  |
| car (car) | 1.00 | 0.856 | 0.223 | 0.049 | 0.047 |  |
| car (car) | 1.00 | 0.460 | 0.532 | 0.090 | 0.121 |  |
| car (car) | 1.00 | 0.219 | 0.808 | 0.166 | 0.192 |  |
| car (car) | 1.00 | 0.853 | 0.488 | 0.047 | 0.113 |  |
| car (truck) | 1.00 | 0.393 | 0.406 | 0.082 | 0.103 |  |
| car (truck) | 1.00 | 0.761 | 0.806 | 0.146 | 0.188 |  |
| car (car) | 1.00 | 0.284 | 0.513 | 0.095 | 0.118 |  |
| car (car) | 1.00 | 0.511 | 0.759 | 0.143 | 0.219 |  |
| car (car) | 0.98 | 0.936 | 0.273 | 0.060 | 0.062 |  |
| car (car) | 0.97 | 0.574 | 0.624 | 0.109 | 0.150 |  |
| car (car) | 0.96 | 0.517 | 0.451 | 0.073 | 0.088 |  |
| car (truck) | 0.96 | 0.571 | 0.599 | 0.121 | 0.164 |  |
| car (truck) | 0.96 | 0.765 | 0.483 | 0.098 | 0.214 |  |
| car (car) | 0.96 | 0.626 | 0.542 | 0.081 | 0.122 |  |
| car (car) | 0.94 | 0.489 | 0.375 | 0.053 | 0.046 |  |
| car (car) | 0.90 | 0.528 | 0.295 | 0.042 | 0.049 |  |
| car (car) | 0.90 | 0.540 | 0.378 | 0.067 | 0.079 |  |
| car (car) | 0.89 | 0.634 | 0.464 | 0.069 | 0.107 |  |
| car (truck) | 0.88 | 0.746 | 0.183 | 0.064 | 0.115 |  |
| car (car) | 0.87 | 0.128 | 0.292 | 0.068 | 0.051 |  |
| car (car) | 0.87 | 0.602 | 0.271 | 0.044 | 0.061 |  |
| car (truck) | 0.87 | 0.670 | 0.343 | 0.067 | 0.066 |  |
| car (car) | 0.85 | 0.778 | 0.359 | 0.078 | 0.069 |  |
| car (car) | 0.85 | 0.487 | 0.335 | 0.055 | 0.045 |  |
| car (car) | 0.84 | 0.333 | 0.944 | 0.208 | 0.056 |  |
| car (car) | 0.83 | 0.579 | 0.351 | 0.048 | 0.057 |  |
| car (car) | 0.82 | 0.667 | 0.406 | 0.059 | 0.053 |  |
| car (truck) | 0.81 | 0.768 | 0.258 | 0.059 | 0.055 |  |
| car (car) | 0.80 | 0.598 | 0.312 | 0.050 | 0.059 |  |
| car (car) | 0.73 | 0.533 | 0.263 | 0.035 | 0.029 |  |
| car (car) | 0.71 | 0.779 | 0.426 | 0.073 | 0.051 |  |
| car (car) | 0.63 | 0.549 | 0.224 | 0.028 | 0.029 |  |
| car (truck) | 0.60 | 0.676 | 0.224 | 0.074 | 0.127 |  |
| car (car) | 0.57 | 0.392 | 0.419 | 0.076 | 0.096 |  |
| car (car) | 0.56 | 0.546 | 0.212 | 0.030 | 0.026 |  |
| car (truck) | 0.54 | 0.672 | 0.187 | 0.056 | 0.042 |  |
| car (car) | 0.49 | 0.540 | 0.247 | 0.025 | 0.022 |  |
| car (car) | 0.49 | 0.615 | 0.224 | 0.029 | 0.028 |  |
| car (car) | 0.47 | 0.244 | 0.351 | 0.071 | 0.052 |  |
| car (car) | 0.46 | 0.491 | 0.321 | 0.041 | 0.027 |  |
| car (car) | 0.45 | 0.138 | 0.337 | 0.057 | 0.043 |  |
| car (car) | 0.40 | 0.780 | 0.410 | 0.063 | 0.047 |  |
| car (car) | 0.39 | 0.614 | 0.247 | 0.034 | 0.029 |  |

(YOLOv3 (legacy) cpuOnly: 129.5 ms)

**DETR segmentation** — 214.2 ms, 224×224 class map

| class | pixels % |
|---|---|
| none | 39.0 |
| car | 31.0 |
| bus | 4.7 |
| road | 25.4 |

Letterbox comparison (objects, letterbox vs scaleFill): YOLOX-S 640 32 vs 38; YOLOX-M 640 pal8 32 vs 41; YOLOv3-Tiny (legacy) 20 vs 20; YOLOv3 (legacy) 42 vs 46.

### img02.jpg (1280×853)

**YOLOX-S 640** — 11.3 ms, 4 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| person (person) | 0.83 | 0.618 | 0.300 | 0.054 | 0.227 |  |
| trafficLight (traffic light) | 0.74 | 0.411 | 0.249 | 0.021 | 0.052 | red (0.42) |
| person (person) | 0.73 | 0.814 | 0.306 | 0.046 | 0.093 |  |
| trafficLight (traffic light) | 0.52 | 0.269 | 0.098 | 0.042 | 0.101 | unknown (0.03) |

(YOLOX-S 640 cpuOnly: 37.2 ms)

**YOLOX-M 640 pal8** — 15.8 ms, 8 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| person (person) | 0.88 | 0.619 | 0.304 | 0.053 | 0.222 |  |
| person (person) | 0.77 | 0.813 | 0.305 | 0.047 | 0.223 |  |
| trafficLight (traffic light) | 0.76 | 0.412 | 0.248 | 0.020 | 0.053 | red (0.38) |
| trafficLight (traffic light) | 0.61 | 0.273 | 0.099 | 0.039 | 0.096 | unknown (0.01) |
| trafficLight (traffic light) | 0.54 | 0.213 | 0.072 | 0.051 | 0.121 | unknown (0.12) |
| person (person) | 0.51 | 0.813 | 0.305 | 0.046 | 0.094 |  |
| person (person) | 0.42 | 0.011 | 0.344 | 0.021 | 0.057 |  |
| car (car) | 0.38 | 0.019 | 0.296 | 0.555 | 0.315 |  |

(YOLOX-M 640 pal8 cpuOnly: 58.4 ms)

**YOLOv3-Tiny (legacy)** — 9.5 ms, 1 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| person (person) | 0.84 | 0.827 | 0.330 | 0.016 | 0.046 |  |

(YOLOv3-Tiny (legacy) cpuOnly: 14.6 ms)

**YOLOv3 (legacy)** — 44.4 ms, 6 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 1.00 | 0.816 | 0.258 | 0.177 | 0.374 |  |
| car (car) | 1.00 | 0.019 | 0.296 | 0.542 | 0.424 |  |
| person (person) | 0.69 | 0.817 | 0.306 | 0.044 | 0.090 |  |
| trafficLight (traffic light) | 0.69 | 0.278 | 0.100 | 0.036 | 0.093 | unknown (0.00) |
| person (person) | 0.68 | 0.609 | 0.304 | 0.067 | 0.214 |  |
| trafficLight (traffic light) | 0.54 | 0.414 | 0.251 | 0.021 | 0.050 | red (0.44) |

(YOLOv3 (legacy) cpuOnly: 119.7 ms)

**DETR segmentation** — 197.7 ms, 224×224 class map

| class | pixels % |
|---|---|
| none | 25.8 |
| person | 0.7 |
| motorcycle | 0.3 |
| car | 31.9 |
| bus | 8.1 |
| trafficLight | 1.2 |
| road | 31.9 |

Letterbox comparison (objects, letterbox vs scaleFill): YOLOX-S 640 6 vs 4; YOLOX-M 640 pal8 10 vs 8; YOLOv3-Tiny (legacy) 4 vs 1; YOLOv3 (legacy) 8 vs 6.

### img03.jpg (1280×720)

**YOLOX-S 640** — 11.3 ms, 3 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| stopSign (stop sign) | 0.92 | 0.668 | 0.611 | 0.072 | 0.136 |  |
| car (truck) | 0.68 | 0.429 | 0.799 | 0.082 | 0.121 |  |
| stopSign (stop sign) | 0.56 | 0.347 | 0.774 | 0.019 | 0.034 |  |

(YOLOX-S 640 cpuOnly: 35.8 ms)

**YOLOX-M 640 pal8** — 15.4 ms, 3 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| stopSign (stop sign) | 0.94 | 0.669 | 0.610 | 0.071 | 0.137 |  |
| stopSign (stop sign) | 0.72 | 0.346 | 0.773 | 0.019 | 0.034 |  |
| car (truck) | 0.69 | 0.428 | 0.797 | 0.082 | 0.122 |  |

(YOLOX-M 640 pal8 cpuOnly: 58.1 ms)

**YOLOv3-Tiny (legacy)** — 9.8 ms, 2 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| stopSign (stop sign) | 0.98 | 0.686 | 0.643 | 0.043 | 0.064 |  |
| car (car) | 0.64 | 0.447 | 0.841 | 0.061 | 0.056 |  |

(YOLOv3-Tiny (legacy) cpuOnly: 16.1 ms)

**YOLOv3 (legacy)** — 39.4 ms, 2 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 1.00 | 0.435 | 0.802 | 0.075 | 0.103 |  |
| stopSign (stop sign) | 1.00 | 0.668 | 0.617 | 0.073 | 0.128 |  |

(YOLOv3 (legacy) cpuOnly: 106.0 ms)

**DETR segmentation** — 199.5 ms, 224×224 class map

| class | pixels % |
|---|---|
| none | 88.7 |
| person | 0.1 |
| car | 0.8 |
| stopSign | 0.7 |
| road | 9.7 |

Letterbox comparison (objects, letterbox vs scaleFill): YOLOX-S 640 3 vs 3; YOLOX-M 640 pal8 3 vs 3; YOLOv3-Tiny (legacy) 2 vs 2; YOLOv3 (legacy) 2 vs 2.

### img04.jpg (1280×960)

**YOLOX-S 640** — 11.5 ms, 6 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.94 | 0.740 | 0.579 | 0.257 | 0.276 |  |
| car (car) | 0.93 | 0.563 | 0.548 | 0.179 | 0.146 |  |
| car (car) | 0.92 | 0.397 | 0.553 | 0.152 | 0.136 |  |
| car (car) | 0.91 | 0.739 | 0.545 | 0.140 | 0.096 |  |
| car (car) | 0.68 | 0.535 | 0.540 | 0.080 | 0.094 |  |
| car (truck) | 0.61 | 0.393 | 0.512 | 0.069 | 0.085 |  |

(YOLOX-S 640 cpuOnly: 32.7 ms)

**YOLOX-M 640 pal8** — 16.0 ms, 6 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.95 | 0.746 | 0.582 | 0.254 | 0.275 |  |
| car (car) | 0.94 | 0.558 | 0.547 | 0.181 | 0.148 |  |
| car (car) | 0.93 | 0.399 | 0.553 | 0.150 | 0.135 |  |
| car (car) | 0.91 | 0.738 | 0.545 | 0.139 | 0.097 |  |
| car (car) | 0.80 | 0.535 | 0.539 | 0.094 | 0.100 |  |
| car (truck) | 0.76 | 0.394 | 0.512 | 0.087 | 0.087 |  |

(YOLOX-M 640 pal8 cpuOnly: 61.9 ms)

**YOLOv3-Tiny (legacy)** — 9.8 ms, 4 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.89 | 0.541 | 0.560 | 0.193 | 0.124 |  |
| car (car) | 0.80 | 0.593 | 0.573 | 0.091 | 0.101 |  |
| car (car) | 0.78 | 0.743 | 0.598 | 0.257 | 0.239 |  |
| car (car) | 0.72 | 0.431 | 0.591 | 0.100 | 0.065 |  |

(YOLOv3-Tiny (legacy) cpuOnly: 15.1 ms)

**YOLOv3 (legacy)** — 37.2 ms, 7 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 1.00 | 0.561 | 0.540 | 0.172 | 0.161 |  |
| car (car) | 1.00 | 0.758 | 0.576 | 0.233 | 0.294 |  |
| car (car) | 1.00 | 0.402 | 0.549 | 0.148 | 0.144 |  |
| car (car) | 1.00 | 0.735 | 0.540 | 0.136 | 0.104 |  |
| car (truck) | 0.67 | 0.392 | 0.512 | 0.083 | 0.083 |  |
| car (car) | 0.54 | 0.531 | 0.537 | 0.081 | 0.086 |  |
| car (car) | 0.38 | 0.479 | 0.533 | 0.050 | 0.026 |  |

(YOLOv3 (legacy) cpuOnly: 110.5 ms)

**DETR segmentation** — 202.3 ms, 224×224 class map

| class | pixels % |
|---|---|
| none | 60.3 |
| person | 0.2 |
| car | 10.6 |
| road | 28.9 |

Letterbox comparison (objects, letterbox vs scaleFill): YOLOX-S 640 6 vs 6; YOLOX-M 640 pal8 6 vs 6; YOLOv3-Tiny (legacy) 6 vs 4; YOLOv3 (legacy) 7 vs 7.

### img05.jpg (1280×696)

**YOLOX-S 640** — 11.2 ms, 13 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.87 | 0.494 | 0.686 | 0.095 | 0.057 |  |
| car (truck) | 0.85 | 0.083 | 0.609 | 0.160 | 0.128 |  |
| car (car) | 0.75 | 0.397 | 0.703 | 0.037 | 0.032 |  |
| car (car) | 0.71 | 0.339 | 0.697 | 0.043 | 0.027 |  |
| car (car) | 0.71 | 0.455 | 0.697 | 0.022 | 0.023 |  |
| car (car) | 0.60 | 0.732 | 0.677 | 0.098 | 0.051 |  |
| trafficLight (traffic light) | 0.57 | 0.469 | 0.524 | 0.022 | 0.019 | red (0.91) |
| car (car) | 0.56 | 0.855 | 0.613 | 0.144 | 0.245 |  |
| trafficLight (traffic light) | 0.55 | 0.183 | 0.423 | 0.040 | 0.035 | unknown (0.00) |
| trafficLight (traffic light) | 0.44 | 0.277 | 0.412 | 0.039 | 0.036 | unknown (0.00) |
| car (car) | 0.41 | 0.396 | 0.695 | 0.034 | 0.026 |  |
| car (car) | 0.40 | 0.429 | 0.694 | 0.024 | 0.019 |  |
| trafficLight (traffic light) | 0.36 | 0.099 | 0.491 | 0.020 | 0.024 | unknown (0.00) |

(YOLOX-S 640 cpuOnly: 30.7 ms)

**YOLOX-M 640 pal8** — 15.9 ms, 16 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.89 | 0.495 | 0.688 | 0.095 | 0.054 |  |
| car (car) | 0.83 | 0.858 | 0.626 | 0.142 | 0.230 |  |
| car (car) | 0.81 | 0.396 | 0.706 | 0.036 | 0.029 |  |
| car (truck) | 0.76 | 0.723 | 0.662 | 0.107 | 0.069 |  |
| car (truck) | 0.74 | 0.084 | 0.609 | 0.111 | 0.129 |  |
| car (car) | 0.74 | 0.342 | 0.698 | 0.040 | 0.026 |  |
| trafficLight (traffic light) | 0.73 | 0.278 | 0.414 | 0.039 | 0.034 | unknown (0.00) |
| car (car) | 0.72 | 0.455 | 0.698 | 0.021 | 0.022 |  |
| trafficLight (traffic light) | 0.64 | 0.182 | 0.424 | 0.040 | 0.033 | unknown (0.00) |
| trafficLight (traffic light) | 0.61 | 0.099 | 0.488 | 0.021 | 0.026 | unknown (0.00) |
| car (truck) | 0.60 | 0.225 | 0.657 | 0.039 | 0.071 |  |
| car (car) | 0.55 | 0.383 | 0.697 | 0.022 | 0.019 |  |
| car (car) | 0.52 | 0.433 | 0.693 | 0.022 | 0.020 |  |
| car (truck) | 0.52 | 0.167 | 0.646 | 0.074 | 0.089 |  |
| trafficLight (traffic light) | 0.44 | 0.470 | 0.526 | 0.022 | 0.018 | red (0.92) |
| car (car) | 0.41 | 0.480 | 0.686 | 0.021 | 0.023 |  |

(YOLOX-M 640 pal8 cpuOnly: 56.2 ms)

**YOLOv3-Tiny (legacy)** — 10.1 ms, 4 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.96 | 0.855 | 0.618 | 0.145 | 0.244 |  |
| car (car) | 0.83 | 0.899 | 0.659 | 0.063 | 0.165 |  |
| car (car) | 0.79 | 0.764 | 0.688 | 0.038 | 0.026 |  |
| car (car) | 0.51 | 0.742 | 0.690 | 0.030 | 0.027 |  |

(YOLOv3-Tiny (legacy) cpuOnly: 15.3 ms)

**YOLOv3 (legacy)** — 34.1 ms, 11 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 1.00 | 0.493 | 0.690 | 0.097 | 0.053 |  |
| car (car) | 0.98 | 0.396 | 0.705 | 0.037 | 0.029 |  |
| car (truck) | 0.97 | 0.857 | 0.617 | 0.142 | 0.251 |  |
| car (car) | 0.89 | 0.732 | 0.670 | 0.095 | 0.057 |  |
| trafficLight (traffic light) | 0.88 | 0.531 | 0.522 | 0.025 | 0.019 | red (0.63) |
| car (car) | 0.85 | 0.456 | 0.693 | 0.023 | 0.024 |  |
| trafficLight (traffic light) | 0.73 | 0.466 | 0.527 | 0.025 | 0.017 | red (0.81) |
| car (car) | 0.57 | 0.385 | 0.693 | 0.023 | 0.022 |  |
| car (car) | 0.45 | 0.480 | 0.689 | 0.020 | 0.017 |  |
| car (truck) | 0.43 | 0.070 | 0.611 | 0.139 | 0.123 |  |
| trafficLight (traffic light) | 0.43 | 0.278 | 0.415 | 0.040 | 0.033 | unknown (0.00) |

(YOLOv3 (legacy) cpuOnly: 108.5 ms)

**DETR segmentation** — 199.7 ms, 224×224 class map

| class | pixels % |
|---|---|
| none | 71.0 |
| car | 4.4 |
| trafficLight | 1.0 |
| road | 23.6 |

Letterbox comparison (objects, letterbox vs scaleFill): YOLOX-S 640 10 vs 13; YOLOX-M 640 pal8 11 vs 16; YOLOv3-Tiny (legacy) 3 vs 4; YOLOv3 (legacy) 10 vs 11.

### img06.jpg (1280×720)

**YOLOX-S 640** — 11.0 ms, 4 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| bus (bus) | 0.95 | 0.015 | 0.065 | 0.977 | 0.856 |  |
| car (car) | 0.81 | 0.000 | 0.591 | 0.034 | 0.188 |  |
| trafficLight (traffic light) | 0.68 | 0.000 | 0.086 | 0.063 | 0.055 | red (1.00) |
| car (car) | 0.47 | 0.384 | 0.527 | 0.204 | 0.043 |  |

(YOLOX-S 640 cpuOnly: 32.3 ms)

**YOLOX-M 640 pal8** — 15.1 ms, 3 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| bus (bus) | 0.95 | 0.011 | 0.080 | 0.986 | 0.844 |  |
| trafficLight (traffic light) | 0.81 | 0.000 | 0.085 | 0.062 | 0.056 | red (1.00) |
| car (car) | 0.80 | 0.000 | 0.593 | 0.033 | 0.184 |  |

(YOLOX-M 640 pal8 cpuOnly: 56.0 ms)

**YOLOv3-Tiny (legacy)** — 9.4 ms, 1 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| trafficLight (traffic light) | 0.58 | 0.015 | 0.101 | 0.018 | 0.043 | unknown (0.00) |

(YOLOv3-Tiny (legacy) cpuOnly: 15.0 ms)

**YOLOv3 (legacy)** — 35.4 ms, 3 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| bus (bus) | 1.00 | 0.030 | 0.055 | 0.956 | 0.887 |  |
| car (car) | 0.97 | 0.001 | 0.547 | 0.032 | 0.258 |  |
| trafficLight (traffic light) | 0.59 | 0.001 | 0.083 | 0.063 | 0.060 | red (1.00) |

(YOLOv3 (legacy) cpuOnly: 116.2 ms)

**DETR segmentation** — 198.5 ms, 224×224 class map

| class | pixels % |
|---|---|
| none | 21.0 |
| person | 0.0 |
| car | 1.5 |
| bus | 61.0 |
| road | 16.5 |

Letterbox comparison (objects, letterbox vs scaleFill): YOLOX-S 640 3 vs 4; YOLOX-M 640 pal8 4 vs 3; YOLOv3-Tiny (legacy) 1 vs 1; YOLOv3 (legacy) 4 vs 3.

### img07.jpg (1280×720)

**YOLOX-S 640** — 10.4 ms, 2 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.71 | 0.543 | 0.772 | 0.029 | 0.035 |  |
| car (car) | 0.50 | 0.457 | 0.783 | 0.026 | 0.028 |  |

(YOLOX-S 640 cpuOnly: 31.1 ms)

**YOLOX-M 640 pal8** — 15.1 ms, 2 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.82 | 0.543 | 0.773 | 0.029 | 0.035 |  |
| car (car) | 0.73 | 0.457 | 0.781 | 0.026 | 0.030 |  |

(YOLOX-M 640 pal8 cpuOnly: 57.3 ms)

**YOLOv3-Tiny (legacy)** — 9.1 ms, 0 objects

_none_

(YOLOv3-Tiny (legacy) cpuOnly: 15.5 ms)

**YOLOv3 (legacy)** — 31.5 ms, 2 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.85 | 0.547 | 0.765 | 0.028 | 0.039 |  |
| car (car) | 0.85 | 0.457 | 0.786 | 0.024 | 0.025 |  |

(YOLOv3 (legacy) cpuOnly: 107.9 ms)

**DETR segmentation** — 198.4 ms, 224×224 class map

| class | pixels % |
|---|---|
| none | 83.8 |
| car | 0.3 |
| trafficLight | 0.1 |
| road | 15.9 |

Letterbox comparison (objects, letterbox vs scaleFill): YOLOX-S 640 1 vs 2; YOLOX-M 640 pal8 2 vs 2; YOLOv3-Tiny (legacy) 0 vs 0; YOLOv3 (legacy) 1 vs 2.

### img08.jpg (1280×720)

**YOLOX-S 640** — 10.1 ms, 0 objects

_none_

(YOLOX-S 640 cpuOnly: 30.4 ms)

**YOLOX-M 640 pal8** — 15.0 ms, 0 objects

_none_

(YOLOX-M 640 pal8 cpuOnly: 55.2 ms)

**YOLOv3-Tiny (legacy)** — 9.3 ms, 0 objects

_none_

(YOLOv3-Tiny (legacy) cpuOnly: 15.1 ms)

**YOLOv3 (legacy)** — 33.2 ms, 0 objects

_none_

(YOLOv3 (legacy) cpuOnly: 105.0 ms)

**DETR segmentation** — 200.1 ms, 224×224 class map

| class | pixels % |
|---|---|
| none | 100.0 |

Letterbox comparison (objects, letterbox vs scaleFill): YOLOX-S 640 0 vs 0; YOLOX-M 640 pal8 0 vs 0; YOLOv3-Tiny (legacy) 0 vs 0; YOLOv3 (legacy) 0 vs 0.

### img09.jpg (1280×852)

**YOLOX-S 640** — 11.0 ms, 12 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.90 | 0.056 | 0.448 | 0.134 | 0.062 |  |
| motorcycle (motorbike) | 0.85 | 0.625 | 0.537 | 0.180 | 0.162 |  |
| motorcycle (motorbike) | 0.80 | 0.919 | 0.519 | 0.081 | 0.119 |  |
| motorcycle (motorbike) | 0.77 | 0.017 | 0.518 | 0.097 | 0.090 |  |
| person (person) | 0.76 | 0.021 | 0.462 | 0.070 | 0.137 |  |
| person (person) | 0.72 | 0.662 | 0.487 | 0.086 | 0.174 |  |
| motorcycle (motorbike) | 0.65 | 0.774 | 0.523 | 0.096 | 0.117 |  |
| motorcycle (motorbike) | 0.62 | 0.893 | 0.468 | 0.081 | 0.071 |  |
| motorcycle (motorbike) | 0.47 | 0.933 | 0.487 | 0.065 | 0.070 |  |
| person (person) | 0.45 | 0.589 | 0.439 | 0.023 | 0.048 |  |
| person (person) | 0.42 | 0.775 | 0.456 | 0.091 | 0.147 |  |
| person (person) | 0.41 | 0.304 | 0.438 | 0.014 | 0.035 |  |

(YOLOX-S 640 cpuOnly: 30.4 ms)

**YOLOX-M 640 pal8** — 16.3 ms, 14 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.89 | 0.053 | 0.446 | 0.140 | 0.064 |  |
| motorcycle (motorbike) | 0.88 | 0.624 | 0.534 | 0.178 | 0.174 |  |
| motorcycle (motorbike) | 0.84 | 0.918 | 0.517 | 0.081 | 0.119 |  |
| motorcycle (motorbike) | 0.84 | 0.017 | 0.515 | 0.098 | 0.091 |  |
| person (person) | 0.82 | 0.024 | 0.466 | 0.056 | 0.135 |  |
| person (person) | 0.73 | 0.771 | 0.448 | 0.077 | 0.155 |  |
| motorcycle (motorbike) | 0.69 | 0.893 | 0.473 | 0.078 | 0.066 |  |
| motorcycle (motorbike) | 0.69 | 0.781 | 0.541 | 0.076 | 0.098 |  |
| person (person) | 0.68 | 0.672 | 0.490 | 0.073 | 0.169 |  |
| person (person) | 0.53 | 0.303 | 0.437 | 0.015 | 0.035 |  |
| person (person) | 0.52 | 0.589 | 0.445 | 0.021 | 0.042 |  |
| trafficLight (traffic light) | 0.45 | 0.569 | 0.300 | 0.018 | 0.020 | green (1.00) |
| person (person) | 0.45 | 0.693 | 0.476 | 0.087 | 0.180 |  |
| car (car) | 0.44 | 0.164 | 0.441 | 0.032 | 0.024 |  |

(YOLOX-M 640 pal8 cpuOnly: 57.0 ms)

**YOLOv3-Tiny (legacy)** — 9.9 ms, 3 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| motorcycle (motorbike) | 0.42 | 0.933 | 0.522 | 0.050 | 0.080 |  |
| person (person) | 0.40 | 0.794 | 0.512 | 0.054 | 0.088 |  |
| motorcycle (motorbike) | 0.39 | 0.681 | 0.580 | 0.077 | 0.099 |  |

(YOLOv3-Tiny (legacy) cpuOnly: 14.9 ms)

**YOLOv3 (legacy)** — 33.5 ms, 12 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.99 | 0.053 | 0.450 | 0.144 | 0.058 |  |
| bicycle (bicycle) | 0.99 | 0.629 | 0.559 | 0.172 | 0.143 |  |
| person (person) | 0.93 | 0.023 | 0.468 | 0.077 | 0.129 |  |
| motorcycle (motorbike) | 0.87 | 0.895 | 0.474 | 0.103 | 0.068 |  |
| motorcycle (motorbike) | 0.78 | 0.915 | 0.530 | 0.083 | 0.119 |  |
| person (person) | 0.63 | 0.305 | 0.442 | 0.015 | 0.031 |  |
| person (person) | 0.59 | 0.775 | 0.469 | 0.091 | 0.165 |  |
| motorcycle (motorbike) | 0.57 | 0.780 | 0.548 | 0.082 | 0.106 |  |
| person (person) | 0.54 | 0.590 | 0.449 | 0.020 | 0.038 |  |
| person (person) | 0.54 | 0.680 | 0.496 | 0.080 | 0.142 |  |
| person (person) | 0.53 | 0.937 | 0.497 | 0.058 | 0.130 |  |
| person (person) | 0.43 | 0.558 | 0.437 | 0.014 | 0.031 |  |

(YOLOv3 (legacy) cpuOnly: 108.6 ms)

**DETR segmentation** — 211.1 ms, 224×224 class map

| class | pixels % |
|---|---|
| none | 45.0 |
| person | 3.3 |
| motorcycle | 5.5 |
| car | 1.2 |
| road | 45.1 |

Letterbox comparison (objects, letterbox vs scaleFill): YOLOX-S 640 11 vs 12; YOLOX-M 640 pal8 12 vs 14; YOLOv3-Tiny (legacy) 3 vs 3; YOLOv3 (legacy) 11 vs 12.

### img10.jpg (1280×960)

**YOLOX-S 640** — 10.9 ms, 7 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.94 | 0.310 | 0.522 | 0.232 | 0.182 |  |
| car (car) | 0.92 | 0.710 | 0.488 | 0.287 | 0.247 |  |
| car (car) | 0.90 | 0.624 | 0.510 | 0.205 | 0.097 |  |
| car (car) | 0.90 | 0.473 | 0.492 | 0.158 | 0.130 |  |
| car (car) | 0.88 | 0.266 | 0.511 | 0.098 | 0.098 |  |
| trafficLight (traffic light) | 0.81 | 0.150 | 0.382 | 0.021 | 0.053 | red (1.00) |
| car (car) | 0.50 | 0.393 | 0.509 | 0.092 | 0.024 |  |

(YOLOX-S 640 cpuOnly: 31.0 ms)

**YOLOX-M 640 pal8** — 15.8 ms, 8 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.94 | 0.311 | 0.520 | 0.228 | 0.184 |  |
| car (car) | 0.93 | 0.712 | 0.481 | 0.286 | 0.257 |  |
| car (car) | 0.91 | 0.619 | 0.507 | 0.213 | 0.100 |  |
| car (car) | 0.91 | 0.267 | 0.511 | 0.098 | 0.098 |  |
| car (car) | 0.87 | 0.473 | 0.491 | 0.154 | 0.136 |  |
| trafficLight (traffic light) | 0.82 | 0.149 | 0.383 | 0.023 | 0.052 | red (1.00) |
| trafficLight (traffic light) | 0.72 | 0.491 | 0.401 | 0.016 | 0.042 | red (0.88) |
| car (car) | 0.42 | 0.265 | 0.515 | 0.022 | 0.022 |  |

(YOLOX-M 640 pal8 cpuOnly: 56.9 ms)

**YOLOv3-Tiny (legacy)** — 10.7 ms, 8 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.91 | 0.622 | 0.507 | 0.210 | 0.121 |  |
| car (car) | 0.91 | 0.334 | 0.524 | 0.216 | 0.159 |  |
| car (car) | 0.87 | 0.391 | 0.549 | 0.102 | 0.118 |  |
| car (car) | 0.69 | 0.670 | 0.531 | 0.097 | 0.070 |  |
| car (car) | 0.64 | 0.538 | 0.536 | 0.084 | 0.055 |  |
| car (car) | 0.62 | 0.725 | 0.490 | 0.275 | 0.201 |  |
| car (car) | 0.47 | 0.800 | 0.523 | 0.131 | 0.156 |  |
| car (car) | 0.39 | 0.309 | 0.537 | 0.031 | 0.031 |  |

(YOLOv3-Tiny (legacy) cpuOnly: 15.7 ms)

**YOLOv3 (legacy)** — 33.3 ms, 8 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 1.00 | 0.306 | 0.518 | 0.237 | 0.173 |  |
| car (car) | 1.00 | 0.463 | 0.490 | 0.171 | 0.135 |  |
| car (car) | 1.00 | 0.617 | 0.513 | 0.210 | 0.099 |  |
| car (car) | 0.99 | 0.706 | 0.493 | 0.293 | 0.264 |  |
| trafficLight (traffic light) | 0.96 | 0.153 | 0.380 | 0.019 | 0.056 | red (1.00) |
| car (car) | 0.95 | 0.262 | 0.514 | 0.111 | 0.099 |  |
| car (car) | 0.62 | 0.234 | 0.521 | 0.044 | 0.062 |  |
| trafficLight (traffic light) | 0.39 | 0.495 | 0.403 | 0.016 | 0.045 | red (0.78) |

(YOLOv3 (legacy) cpuOnly: 109.9 ms)

**DETR segmentation** — 199.5 ms, 224×224 class map

| class | pixels % |
|---|---|
| none | 51.7 |
| person | 0.1 |
| car | 12.4 |
| trafficLight | 0.2 |
| road | 35.5 |

Letterbox comparison (objects, letterbox vs scaleFill): YOLOX-S 640 8 vs 7; YOLOX-M 640 pal8 8 vs 8; YOLOv3-Tiny (legacy) 9 vs 8; YOLOv3 (legacy) 8 vs 8.

### img11.jpg (1200×1600)

**YOLOX-S 640** — 10.4 ms, 0 objects

_none_

(YOLOX-S 640 cpuOnly: 35.1 ms)

**YOLOX-M 640 pal8** — 15.7 ms, 1 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| trafficLight (traffic light) | 0.65 | 0.818 | 0.214 | 0.180 | 0.369 | yellow (0.59) |

(YOLOX-M 640 pal8 cpuOnly: 59.0 ms)

**YOLOv3-Tiny (legacy)** — 10.0 ms, 0 objects

_none_

(YOLOv3-Tiny (legacy) cpuOnly: 15.8 ms)

**YOLOv3 (legacy)** — 36.7 ms, 1 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| trafficLight (traffic light) | 0.96 | 0.862 | 0.251 | 0.138 | 0.329 | yellow (0.86) |

(YOLOv3 (legacy) cpuOnly: 112.6 ms)

**DETR segmentation** — 200.4 ms, 224×224 class map

| class | pixels % |
|---|---|
| none | 94.2 |
| trafficLight | 5.8 |

Letterbox comparison (objects, letterbox vs scaleFill): YOLOX-S 640 1 vs 0; YOLOX-M 640 pal8 1 vs 1; YOLOv3-Tiny (legacy) 2 vs 0; YOLOv3 (legacy) 1 vs 1.

### img12.jpg (1280×854)

**YOLOX-S 640** — 10.3 ms, 3 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.91 | 0.001 | 0.700 | 0.212 | 0.194 |  |
| person (person) | 0.50 | 0.771 | 0.672 | 0.059 | 0.144 |  |
| trafficLight (traffic light) | 0.39 | 0.043 | 0.320 | 0.036 | 0.110 | unknown (0.00) |

(YOLOX-S 640 cpuOnly: 34.1 ms)

**YOLOX-M 640 pal8** — 15.4 ms, 2 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.92 | 0.000 | 0.701 | 0.214 | 0.196 |  |
| motorcycle (motorbike) | 0.79 | 0.768 | 0.713 | 0.079 | 0.110 |  |

(YOLOX-M 640 pal8 cpuOnly: 57.2 ms)

**YOLOv3-Tiny (legacy)** — 10.5 ms, 4 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.92 | 0.007 | 0.698 | 0.213 | 0.198 |  |
| car (car) | 0.76 | 0.055 | 0.715 | 0.089 | 0.160 |  |
| person (person) | 0.44 | 0.785 | 0.718 | 0.017 | 0.060 |  |
| person (person) | 0.40 | 0.782 | 0.721 | 0.035 | 0.059 |  |

(YOLOv3-Tiny (legacy) cpuOnly: 14.8 ms)

**YOLOv3 (legacy)** — 34.1 ms, 3 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| motorcycle (motorbike) | 1.00 | 0.773 | 0.684 | 0.083 | 0.139 |  |
| car (car) | 0.99 | 0.000 | 0.702 | 0.234 | 0.192 |  |
| trafficLight (traffic light) | 0.42 | 0.232 | 0.503 | 0.024 | 0.043 | yellow (0.54) |

(YOLOv3 (legacy) cpuOnly: 104.2 ms)

**DETR segmentation** — 200.7 ms, 224×224 class map

| class | pixels % |
|---|---|
| none | 67.6 |
| person | 4.7 |
| motorcycle | 0.8 |
| car | 3.7 |
| trafficLight | 0.2 |
| road | 23.0 |

Letterbox comparison (objects, letterbox vs scaleFill): YOLOX-S 640 3 vs 3; YOLOX-M 640 pal8 6 vs 2; YOLOv3-Tiny (legacy) 4 vs 4; YOLOv3 (legacy) 3 vs 3.

### img13.jpg (1280×960)

**YOLOX-S 640** — 11.2 ms, 4 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| trafficLight (traffic light) | 0.58 | 0.089 | 0.512 | 0.047 | 0.137 | yellow (0.97) |
| trafficLight (traffic light) | 0.48 | 0.090 | 0.633 | 0.026 | 0.036 | red (0.73) |
| trafficLight (traffic light) | 0.48 | 0.706 | 0.375 | 0.034 | 0.074 | yellow (0.98) |
| trafficLight (traffic light) | 0.36 | 0.902 | 0.524 | 0.023 | 0.033 | red (1.00) |

(YOLOX-S 640 cpuOnly: 30.2 ms)

**YOLOX-M 640 pal8** — 15.8 ms, 4 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| trafficLight (traffic light) | 0.55 | 0.087 | 0.631 | 0.034 | 0.040 | red (0.75) |
| trafficLight (traffic light) | 0.53 | 0.735 | 0.387 | 0.028 | 0.058 | yellow (1.00) |
| trafficLight (traffic light) | 0.53 | 0.902 | 0.523 | 0.025 | 0.040 | red (1.00) |
| trafficLight (traffic light) | 0.35 | 0.707 | 0.366 | 0.036 | 0.086 | yellow (0.99) |

(YOLOX-M 640 pal8 cpuOnly: 55.3 ms)

**YOLOv3-Tiny (legacy)** — 10.0 ms, 3 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| trafficLight (traffic light) | 0.44 | 0.714 | 0.382 | 0.025 | 0.042 | yellow (0.99) |
| trafficLight (traffic light) | 0.42 | 0.746 | 0.184 | 0.025 | 0.037 | unknown (0.00) |
| trafficLight (traffic light) | 0.37 | 0.092 | 0.646 | 0.017 | 0.040 | red (0.63) |

(YOLOv3-Tiny (legacy) cpuOnly: 14.4 ms)

**YOLOv3 (legacy)** — 31.8 ms, 5 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| trafficLight (traffic light) | 0.69 | 0.901 | 0.524 | 0.025 | 0.034 | red (1.00) |
| trafficLight (traffic light) | 0.65 | 0.087 | 0.629 | 0.035 | 0.060 | red (0.79) |
| trafficLight (traffic light) | 0.47 | 0.918 | 0.568 | 0.025 | 0.034 | yellow (0.79) |
| trafficLight (traffic light) | 0.47 | 0.907 | 0.616 | 0.019 | 0.031 | red (0.62) |
| trafficLight (traffic light) | 0.43 | 0.719 | 0.376 | 0.040 | 0.072 | yellow (0.99) |

(YOLOv3 (legacy) cpuOnly: 105.8 ms)

**DETR segmentation** — 205.3 ms, 224×224 class map

| class | pixels % |
|---|---|
| none | 76.7 |
| car | 0.1 |
| trafficLight | 1.2 |
| road | 22.0 |

Letterbox comparison (objects, letterbox vs scaleFill): YOLOX-S 640 4 vs 4; YOLOX-M 640 pal8 3 vs 4; YOLOv3-Tiny (legacy) 1 vs 3; YOLOv3 (legacy) 4 vs 5.

