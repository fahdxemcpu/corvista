# Corvista model evaluation results (Mac)

- Generated: 2026-11-07T16:40:16Z
- Host: **Apple M1 Pro (arm64), macOS Version 26.6.2 (Build 25G83)** — these are Mac numbers, NOT iPhone numbers.
- Detector thresholds: confidence ≥ 0.35, NMS IoU 0.45 (passed via `VNCoreMLModel.featureProvider`, also filtered in code).
- Timing: median / p95 of 1 runs after 1 warm-up, wall clock around `VNImageRequestHandler.perform` (includes Vision scaling).
- Post-processing: `DetectionPipeline.swift`, `SegmenterRunner.swift`, `TrafficLightClassifier.swift` from the plugin sources.

## Models (computeUnits = all, first load includes ANE/GPU compilation)

| model | file | input | compiled size MB | load ms |
|---|---|---|---|---|
| YOLOX-S 640 | cv_detect_x | 640×640 | 17.3 | 144 |
| YOLOX-M 640 pal8 | cv_detect_xl | 640×640 | 24.5 | 63 |
| YOLOv3-Tiny (legacy) | cv_detect_s | 416×416 | 8.6 | 157 |
| YOLOv3 (legacy) | cv_detect_l | 416×416 | 59.7 | 95 |

## Summary

| image | YOLOX-S 640 | YOLOX-M 640 pal8 | YOLOv3-Tiny (legacy) | YOLOv3 (legacy) |
|---|---|---|---|---|
| x01.jpg | car×4 | car×3 | car×4 | car×5 |
| x02.jpg | car×8 | car×9, trafficLight×1 | car×2 | car×8 |
| x03.jpg | — | car×1 | — | — |
| x04.jpg | car×4, motorcycle×1, person×2, trafficLight×1 | car×3, motorcycle×2, person×2, stopSign×1, trafficLight×1 | car×2, motorcycle×2 | car×4, motorcycle×1, person×2 |
| x05.jpg | car×2 | car×1 | — | car×1 |
| x06.jpg | — | — | — | — |
| x07.jpg | car×4, motorcycle×11, person×14 | car×4, motorcycle×13, person×18, trafficLight×1 | motorcycle×2, person×3 | car×2, motorcycle×10, person×14 |
| x08.jpg | bicycle×1, car×7, person×1 | bicycle×1, car×6, person×3 | bicycle×1, car×1, person×1 | bicycle×1, car×5, person×2 |
| x09.jpg | person×9 | person×9 | person×6 | person×9 |
| x10.jpg | bus×1, car×4 | bus×1, car×3 | car×2 | bus×1, car×3 |
| x11.jpg | car×3, trafficLight×2 | car×3, trafficLight×2 | car×2 | car×4, trafficLight×2 |
| x12.jpg | car×7, motorcycle×6, person×7, trafficLight×2 | car×8, motorcycle×6, person×11, trafficLight×1 | car×6, person×3 | car×4, motorcycle×6, person×9 |
| x13.jpg | car×2, stopSign×2 | car×2, stopSign×2 | car×1, stopSign×2 | car×3, stopSign×2 |
| x14.jpg | — | — | — | — |

## Detections per class, all images (confidence ≥ 0.35; counts, not verified hits)

| class | YOLOX-S 640 | YOLOX-M 640 pal8 | YOLOv3-Tiny (legacy) | YOLOv3 (legacy) |
|---|---|---|---|---|
| person | 33 | 43 | 13 | 36 |
| bicycle | 1 | 1 | 1 | 1 |
| motorcycle | 18 | 21 | 4 | 17 |
| car | 45 | 43 | 20 | 39 |
| bus | 1 | 1 | 0 | 1 |
| trafficLight | 5 | 6 | 0 | 2 |
| stopSign | 2 | 3 | 2 | 2 |

## Timing across all images (Mac, ms)

| model | compute units | median | p95 |
|---|---|---|---|
| YOLOX-S 640 | all | 12.2 | 14.6 |
| YOLOX-S 640 | cpuOnly | 33.1 | 51.7 |
| YOLOX-M 640 pal8 | all | 15.9 | 19.2 |
| YOLOv3-Tiny (legacy) | all | 9.6 | 11.2 |
| YOLOv3 (legacy) | all | 33.8 | 40.4 |

## Per-image results

### x01.jpg (1280×720)

**YOLOX-S 640** — 12.2 ms, 4 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (truck) | 0.80 | 0.549 | 0.731 | 0.207 | 0.199 |  |
| car (car) | 0.67 | 0.312 | 0.756 | 0.061 | 0.073 |  |
| car (car) | 0.64 | 0.549 | 0.763 | 0.020 | 0.023 |  |
| car (car) | 0.56 | 0.906 | 0.732 | 0.082 | 0.055 |  |

(YOLOX-S 640 cpuOnly: 31.6 ms)

**YOLOX-M 640 pal8** — 15.2 ms, 3 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (truck) | 0.95 | 0.554 | 0.728 | 0.201 | 0.204 |  |
| car (truck) | 0.73 | 0.905 | 0.730 | 0.084 | 0.059 |  |
| car (car) | 0.64 | 0.310 | 0.756 | 0.063 | 0.075 |  |

**YOLOv3-Tiny (legacy)** — 8.8 ms, 4 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.80 | 0.928 | 0.745 | 0.035 | 0.027 |  |
| car (truck) | 0.72 | 0.554 | 0.733 | 0.194 | 0.182 |  |
| car (car) | 0.58 | 0.327 | 0.782 | 0.023 | 0.033 |  |
| car (truck) | 0.44 | 0.597 | 0.753 | 0.095 | 0.145 |  |

**YOLOv3 (legacy)** — 34.9 ms, 5 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (truck) | 1.00 | 0.537 | 0.735 | 0.223 | 0.193 |  |
| car (car) | 1.00 | 0.313 | 0.759 | 0.059 | 0.073 |  |
| car (truck) | 1.00 | 0.905 | 0.730 | 0.083 | 0.058 |  |
| car (car) | 0.80 | 0.903 | 0.728 | 0.074 | 0.057 |  |
| car (car) | 0.62 | 0.445 | 0.752 | 0.015 | 0.018 |  |

### x02.jpg (1280×720)

**YOLOX-S 640** — 11.7 ms, 8 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.86 | 0.463 | 0.747 | 0.034 | 0.038 |  |
| car (car) | 0.78 | 0.798 | 0.738 | 0.070 | 0.056 |  |
| car (car) | 0.74 | 0.119 | 0.686 | 0.147 | 0.249 |  |
| car (car) | 0.68 | 0.517 | 0.725 | 0.104 | 0.116 |  |
| car (car) | 0.62 | 0.441 | 0.738 | 0.022 | 0.024 |  |
| car (car) | 0.52 | 0.849 | 0.711 | 0.071 | 0.073 |  |
| car (car) | 0.49 | 0.409 | 0.737 | 0.018 | 0.022 |  |
| car (car) | 0.48 | 0.495 | 0.747 | 0.025 | 0.022 |  |

(YOLOX-S 640 cpuOnly: 38.8 ms)

**YOLOX-M 640 pal8** — 16.4 ms, 10 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.91 | 0.118 | 0.687 | 0.144 | 0.244 |  |
| car (car) | 0.85 | 0.796 | 0.739 | 0.067 | 0.054 |  |
| car (car) | 0.84 | 0.462 | 0.745 | 0.035 | 0.039 |  |
| car (car) | 0.71 | 0.441 | 0.738 | 0.019 | 0.024 |  |
| car (car) | 0.61 | 0.519 | 0.727 | 0.098 | 0.122 |  |
| car (car) | 0.50 | 0.408 | 0.735 | 0.019 | 0.025 |  |
| car (car) | 0.47 | 0.496 | 0.747 | 0.022 | 0.021 |  |
| car (car) | 0.45 | 0.922 | 0.730 | 0.029 | 0.028 |  |
| car (truck) | 0.44 | 0.853 | 0.709 | 0.068 | 0.075 |  |
| trafficLight (traffic light) | 0.40 | 0.949 | 0.601 | 0.024 | 0.032 | unknown (0.00) |

**YOLOv3-Tiny (legacy)** — 9.8 ms, 2 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.86 | 0.473 | 0.747 | 0.025 | 0.022 |  |
| car (car) | 0.60 | 0.538 | 0.769 | 0.060 | 0.052 |  |

**YOLOv3 (legacy)** — 35.8 ms, 8 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 1.00 | 0.114 | 0.698 | 0.149 | 0.230 |  |
| car (car) | 1.00 | 0.521 | 0.724 | 0.094 | 0.123 |  |
| car (car) | 0.90 | 0.471 | 0.744 | 0.028 | 0.036 |  |
| car (car) | 0.82 | 0.796 | 0.734 | 0.076 | 0.056 |  |
| car (car) | 0.72 | 0.442 | 0.734 | 0.023 | 0.025 |  |
| car (car) | 0.67 | 0.795 | 0.714 | 0.134 | 0.068 |  |
| car (car) | 0.67 | 0.406 | 0.733 | 0.020 | 0.024 |  |
| car (car) | 0.38 | 0.500 | 0.744 | 0.023 | 0.021 |  |

### x03.jpg (1280×853)

**YOLOX-S 640** — 12.6 ms, 0 objects

_none_

(YOLOX-S 640 cpuOnly: 51.7 ms)

**YOLOX-M 640 pal8** — 18.1 ms, 1 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.64 | 0.246 | 0.836 | 0.110 | 0.133 |  |

**YOLOv3-Tiny (legacy)** — 11.2 ms, 0 objects

_none_

**YOLOv3 (legacy)** — 40.4 ms, 0 objects

_none_

### x04.jpg (1280×853)

**YOLOX-S 640** — 14.0 ms, 8 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| motorcycle (motorbike) | 0.83 | 0.449 | 0.652 | 0.198 | 0.153 |  |
| car (car) | 0.82 | 0.652 | 0.594 | 0.064 | 0.042 |  |
| car (car) | 0.76 | 0.582 | 0.578 | 0.074 | 0.054 |  |
| car (car) | 0.76 | 0.230 | 0.587 | 0.023 | 0.028 |  |
| car (truck) | 0.67 | 0.792 | 0.579 | 0.169 | 0.082 |  |
| person (person) | 0.65 | 0.483 | 0.582 | 0.079 | 0.180 |  |
| trafficLight (traffic light) | 0.60 | 0.354 | 0.364 | 0.019 | 0.055 | red (0.83) |
| person (person) | 0.45 | 0.551 | 0.590 | 0.039 | 0.078 |  |

(YOLOX-S 640 cpuOnly: 35.8 ms)

**YOLOX-M 640 pal8** — 15.9 ms, 9 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.88 | 0.649 | 0.595 | 0.068 | 0.041 |  |
| car (car) | 0.83 | 0.579 | 0.579 | 0.077 | 0.053 |  |
| person (person) | 0.77 | 0.488 | 0.590 | 0.068 | 0.163 |  |
| motorcycle (motorbike) | 0.76 | 0.448 | 0.646 | 0.194 | 0.156 |  |
| car (car) | 0.67 | 0.803 | 0.576 | 0.161 | 0.087 |  |
| stopSign (stop sign) | 0.63 | 0.134 | 0.504 | 0.021 | 0.053 |  |
| trafficLight (traffic light) | 0.62 | 0.355 | 0.364 | 0.020 | 0.054 | red (0.81) |
| motorcycle (motorbike) | 0.59 | 0.228 | 0.587 | 0.026 | 0.027 |  |
| person (person) | 0.49 | 0.552 | 0.591 | 0.037 | 0.077 |  |

**YOLOv3-Tiny (legacy)** — 9.2 ms, 4 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| motorcycle (motorbike) | 0.67 | 0.451 | 0.639 | 0.196 | 0.170 |  |
| car (car) | 0.56 | 0.885 | 0.617 | 0.039 | 0.032 |  |
| car (car) | 0.55 | 0.842 | 0.610 | 0.045 | 0.034 |  |
| motorcycle (motorbike) | 0.54 | 0.507 | 0.647 | 0.092 | 0.138 |  |

**YOLOv3 (legacy)** — 32.5 ms, 7 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (truck) | 1.00 | 0.793 | 0.571 | 0.167 | 0.082 |  |
| car (car) | 1.00 | 0.581 | 0.577 | 0.078 | 0.055 |  |
| motorcycle (motorbike) | 0.92 | 0.451 | 0.648 | 0.197 | 0.166 |  |
| person (person) | 0.86 | 0.482 | 0.596 | 0.079 | 0.162 |  |
| car (car) | 0.56 | 0.230 | 0.586 | 0.023 | 0.026 |  |
| car (car) | 0.55 | 0.651 | 0.599 | 0.068 | 0.036 |  |
| person (person) | 0.36 | 0.552 | 0.587 | 0.036 | 0.080 |  |

### x05.jpg (1280×605)

**YOLOX-S 640** — 11.7 ms, 2 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.64 | 0.795 | 0.760 | 0.075 | 0.051 |  |
| car (car) | 0.40 | 0.938 | 0.741 | 0.041 | 0.039 |  |

(YOLOX-S 640 cpuOnly: 30.8 ms)

**YOLOX-M 640 pal8** — 15.4 ms, 1 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.58 | 0.799 | 0.759 | 0.068 | 0.050 |  |

**YOLOv3-Tiny (legacy)** — 8.8 ms, 0 objects

_none_

**YOLOv3 (legacy)** — 31.5 ms, 1 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.64 | 0.806 | 0.762 | 0.067 | 0.048 |  |

### x06.jpg (1280×853)

**YOLOX-S 640** — 11.9 ms, 0 objects

_none_

(YOLOX-S 640 cpuOnly: 30.5 ms)

**YOLOX-M 640 pal8** — 14.7 ms, 0 objects

_none_

**YOLOv3-Tiny (legacy)** — 8.1 ms, 0 objects

_none_

**YOLOv3 (legacy)** — 31.7 ms, 0 objects

_none_

### x07.jpg (1280×960)

**YOLOX-S 640** — 14.4 ms, 29 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| person (person) | 0.87 | 0.885 | 0.490 | 0.044 | 0.129 |  |
| person (person) | 0.82 | 0.137 | 0.544 | 0.127 | 0.343 |  |
| person (person) | 0.79 | 0.232 | 0.563 | 0.210 | 0.340 |  |
| car (car) | 0.78 | 0.231 | 0.478 | 0.217 | 0.093 |  |
| person (person) | 0.76 | 0.064 | 0.465 | 0.081 | 0.202 |  |
| person (person) | 0.75 | 0.580 | 0.525 | 0.079 | 0.193 |  |
| person (person) | 0.75 | 0.652 | 0.511 | 0.056 | 0.142 |  |
| motorcycle (motorbike) | 0.73 | 0.000 | 0.430 | 0.057 | 0.064 |  |
| person (person) | 0.72 | 0.443 | 0.532 | 0.104 | 0.236 |  |
| motorcycle (motorbike) | 0.72 | 0.430 | 0.646 | 0.119 | 0.173 |  |
| car (car) | 0.69 | 0.120 | 0.455 | 0.160 | 0.056 |  |
| motorcycle (motorbike) | 0.67 | 0.701 | 0.568 | 0.046 | 0.079 |  |
| motorcycle (motorbike) | 0.64 | 0.646 | 0.587 | 0.063 | 0.092 |  |
| person (person) | 0.60 | 0.000 | 0.760 | 0.112 | 0.236 |  |
| motorcycle (motorbike) | 0.55 | 0.558 | 0.618 | 0.093 | 0.127 |  |
| person (person) | 0.54 | 0.342 | 0.502 | 0.086 | 0.134 |  |
| person (person) | 0.52 | 0.614 | 0.489 | 0.047 | 0.111 |  |
| car (car) | 0.50 | 0.271 | 0.441 | 0.130 | 0.039 |  |
| person (person) | 0.48 | 0.555 | 0.508 | 0.041 | 0.111 |  |
| motorcycle (motorbike) | 0.45 | 0.728 | 0.499 | 0.038 | 0.092 |  |
| motorcycle (motorbike) | 0.44 | 0.767 | 0.502 | 0.047 | 0.074 |  |
| motorcycle (motorbike) | 0.41 | 0.534 | 0.588 | 0.052 | 0.109 |  |
| person (person) | 0.41 | 0.428 | 0.495 | 0.045 | 0.120 |  |
| motorcycle (motorbike) | 0.40 | 0.028 | 0.695 | 0.230 | 0.189 |  |
| car (car) | 0.39 | 0.507 | 0.469 | 0.052 | 0.038 |  |
| motorcycle (motorbike) | 0.38 | 0.352 | 0.574 | 0.086 | 0.114 |  |
| motorcycle (motorbike) | 0.36 | 0.210 | 0.552 | 0.077 | 0.115 |  |
| person (person) | 0.36 | 0.300 | 0.483 | 0.062 | 0.097 |  |
| person (person) | 0.36 | 0.000 | 0.534 | 0.084 | 0.228 |  |

(YOLOX-S 640 cpuOnly: 42.9 ms)

**YOLOX-M 640 pal8** — 18.1 ms, 36 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| person (person) | 0.90 | 0.578 | 0.525 | 0.087 | 0.191 |  |
| person (person) | 0.89 | 0.885 | 0.488 | 0.042 | 0.134 |  |
| person (person) | 0.88 | 0.237 | 0.564 | 0.216 | 0.336 |  |
| person (person) | 0.86 | 0.132 | 0.549 | 0.130 | 0.329 |  |
| motorcycle (motorbike) | 0.85 | 0.233 | 0.701 | 0.229 | 0.288 |  |
| car (car) | 0.82 | 0.228 | 0.475 | 0.211 | 0.099 |  |
| person (person) | 0.80 | 0.652 | 0.512 | 0.059 | 0.142 |  |
| motorcycle (motorbike) | 0.78 | 0.000 | 0.439 | 0.056 | 0.055 |  |
| car (car) | 0.76 | 0.119 | 0.455 | 0.159 | 0.076 |  |
| person (person) | 0.76 | 0.441 | 0.529 | 0.104 | 0.244 |  |
| motorcycle (motorbike) | 0.75 | 0.431 | 0.639 | 0.118 | 0.181 |  |
| car (car) | 0.75 | 0.268 | 0.440 | 0.130 | 0.049 |  |
| motorcycle (motorbike) | 0.74 | 0.560 | 0.625 | 0.075 | 0.118 |  |
| person (person) | 0.73 | 0.062 | 0.467 | 0.079 | 0.199 |  |
| motorcycle (motorbike) | 0.67 | 0.646 | 0.589 | 0.060 | 0.090 |  |
| motorcycle (motorbike) | 0.65 | 0.764 | 0.507 | 0.042 | 0.069 |  |
| motorcycle (motorbike) | 0.62 | 0.702 | 0.562 | 0.046 | 0.085 |  |
| motorcycle (motorbike) | 0.60 | 0.039 | 0.710 | 0.221 | 0.190 |  |
| person (person) | 0.58 | 0.614 | 0.490 | 0.047 | 0.107 |  |
| person (person) | 0.57 | 0.000 | 0.753 | 0.117 | 0.244 |  |
| person (person) | 0.55 | 0.706 | 0.511 | 0.044 | 0.115 |  |
| motorcycle (motorbike) | 0.54 | 0.540 | 0.587 | 0.046 | 0.110 |  |
| motorcycle (motorbike) | 0.53 | 0.022 | 0.776 | 0.177 | 0.221 |  |
| motorcycle (motorbike) | 0.49 | 0.027 | 0.618 | 0.107 | 0.135 |  |
| person (person) | 0.48 | 0.351 | 0.497 | 0.078 | 0.126 |  |
| motorcycle (motorbike) | 0.47 | 0.191 | 0.580 | 0.069 | 0.100 |  |
| person (person) | 0.44 | 0.729 | 0.494 | 0.035 | 0.098 |  |
| person (person) | 0.44 | 0.555 | 0.503 | 0.039 | 0.109 |  |
| car (car) | 0.43 | 0.476 | 0.445 | 0.080 | 0.044 |  |
| trafficLight (traffic light) | 0.42 | 0.868 | 0.407 | 0.017 | 0.036 | red (0.95) |
| person (person) | 0.41 | 0.000 | 0.546 | 0.085 | 0.212 |  |
| person (person) | 0.40 | 0.199 | 0.475 | 0.083 | 0.182 |  |
| person (person) | 0.40 | 0.432 | 0.494 | 0.041 | 0.117 |  |
| person (person) | 0.40 | 0.292 | 0.481 | 0.068 | 0.097 |  |
| motorcycle (motorbike) | 0.39 | 0.517 | 0.523 | 0.041 | 0.069 |  |
| person (person) | 0.38 | 0.067 | 0.420 | 0.026 | 0.078 |  |

**YOLOv3-Tiny (legacy)** — 9.8 ms, 5 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| person (person) | 0.61 | 0.654 | 0.560 | 0.042 | 0.072 |  |
| motorcycle (motorbike) | 0.54 | 0.013 | 0.773 | 0.168 | 0.218 |  |
| person (person) | 0.53 | 0.898 | 0.526 | 0.015 | 0.061 |  |
| motorcycle (motorbike) | 0.50 | 0.569 | 0.652 | 0.055 | 0.050 |  |
| person (person) | 0.45 | 0.455 | 0.554 | 0.047 | 0.079 |  |

**YOLOv3 (legacy)** — 35.8 ms, 26 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| motorcycle (motorbike) | 1.00 | 0.227 | 0.651 | 0.244 | 0.320 |  |
| person (person) | 0.99 | 0.111 | 0.546 | 0.145 | 0.333 |  |
| person (person) | 0.97 | 0.886 | 0.479 | 0.044 | 0.150 |  |
| person (person) | 0.95 | 0.436 | 0.531 | 0.107 | 0.269 |  |
| person (person) | 0.95 | 0.220 | 0.582 | 0.234 | 0.312 |  |
| motorcycle (motorbike) | 0.88 | 0.012 | 0.738 | 0.161 | 0.257 |  |
| person (person) | 0.86 | 0.652 | 0.513 | 0.057 | 0.156 |  |
| motorcycle (motorbike) | 0.85 | 0.553 | 0.620 | 0.088 | 0.122 |  |
| person (person) | 0.83 | 0.056 | 0.463 | 0.096 | 0.272 |  |
| motorcycle (motorbike) | 0.81 | 0.422 | 0.649 | 0.128 | 0.200 |  |
| person (person) | 0.77 | 0.568 | 0.525 | 0.079 | 0.197 |  |
| person (person) | 0.73 | 0.003 | 0.516 | 0.107 | 0.245 |  |
| car (car) | 0.67 | 0.089 | 0.454 | 0.184 | 0.066 |  |
| person (person) | 0.67 | 0.356 | 0.534 | 0.075 | 0.137 |  |
| person (person) | 0.63 | 0.699 | 0.497 | 0.052 | 0.139 |  |
| motorcycle (motorbike) | 0.63 | 0.354 | 0.564 | 0.084 | 0.132 |  |
| car (car) | 0.58 | 0.263 | 0.442 | 0.141 | 0.045 |  |
| person (person) | 0.57 | 0.617 | 0.501 | 0.043 | 0.090 |  |
| person (person) | 0.56 | 0.002 | 0.735 | 0.126 | 0.260 |  |
| motorcycle (motorbike) | 0.53 | 0.001 | 0.443 | 0.059 | 0.054 |  |
| motorcycle (motorbike) | 0.50 | 0.701 | 0.568 | 0.042 | 0.081 |  |
| motorcycle (motorbike) | 0.49 | 0.766 | 0.510 | 0.037 | 0.066 |  |
| person (person) | 0.44 | 0.143 | 0.488 | 0.134 | 0.129 |  |
| motorcycle (motorbike) | 0.44 | 0.202 | 0.574 | 0.075 | 0.120 |  |
| motorcycle (motorbike) | 0.38 | 0.652 | 0.571 | 0.060 | 0.121 |  |
| person (person) | 0.36 | 0.423 | 0.495 | 0.053 | 0.135 |  |

### x08.jpg (1280×853)

**YOLOX-S 640** — 12.4 ms, 9 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| bicycle (bicycle) | 0.96 | 0.166 | 0.435 | 0.646 | 0.551 |  |
| person (person) | 0.90 | 0.298 | 0.085 | 0.367 | 0.777 |  |
| car (car) | 0.89 | 0.629 | 0.107 | 0.198 | 0.254 |  |
| car (car) | 0.82 | 0.000 | 0.477 | 0.189 | 0.482 |  |
| car (car) | 0.80 | 0.225 | 0.115 | 0.501 | 0.311 |  |
| car (car) | 0.73 | 0.928 | 0.074 | 0.065 | 0.154 |  |
| car (car) | 0.67 | 0.216 | 0.128 | 0.223 | 0.354 |  |
| car (car) | 0.41 | 0.732 | 0.069 | 0.096 | 0.104 |  |
| car (car) | 0.39 | 0.728 | 0.062 | 0.250 | 0.162 |  |

(YOLOX-S 640 cpuOnly: 33.1 ms)

**YOLOX-M 640 pal8** — 16.0 ms, 10 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| bicycle (bicycle) | 0.96 | 0.177 | 0.440 | 0.635 | 0.547 |  |
| car (car) | 0.93 | 0.631 | 0.108 | 0.195 | 0.257 |  |
| person (person) | 0.92 | 0.300 | 0.045 | 0.363 | 0.837 |  |
| car (car) | 0.91 | 0.558 | 0.118 | 0.177 | 0.294 |  |
| car (car) | 0.87 | 0.001 | 0.469 | 0.196 | 0.523 |  |
| car (car) | 0.84 | 0.217 | 0.109 | 0.427 | 0.379 |  |
| car (car) | 0.67 | 0.928 | 0.071 | 0.066 | 0.159 |  |
| car (car) | 0.55 | 0.727 | 0.060 | 0.100 | 0.116 |  |
| person (person) | 0.38 | 0.635 | 0.068 | 0.029 | 0.048 |  |
| person (person) | 0.36 | 0.610 | 0.072 | 0.028 | 0.048 |  |

**YOLOv3-Tiny (legacy)** — 9.3 ms, 3 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| person (person) | 0.93 | 0.331 | 0.126 | 0.320 | 0.730 |  |
| bicycle (bicycle) | 0.61 | 0.136 | 0.384 | 0.720 | 0.567 |  |
| car (car) | 0.52 | 0.601 | 0.110 | 0.239 | 0.263 |  |

**YOLOv3 (legacy)** — 33.8 ms, 8 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| person (person) | 1.00 | 0.297 | 0.068 | 0.385 | 0.838 |  |
| bicycle (bicycle) | 1.00 | 0.177 | 0.371 | 0.649 | 0.611 |  |
| car (car) | 0.97 | 0.663 | 0.109 | 0.162 | 0.262 |  |
| car (car) | 0.97 | 0.556 | 0.121 | 0.174 | 0.283 |  |
| car (car) | 0.75 | 0.225 | 0.126 | 0.418 | 0.342 |  |
| car (car) | 0.67 | 0.916 | 0.073 | 0.075 | 0.137 |  |
| car (car) | 0.63 | 0.002 | 0.429 | 0.196 | 0.571 |  |
| person (person) | 0.59 | 0.689 | 0.077 | 0.022 | 0.035 |  |

### x09.jpg (1280×853)

**YOLOX-S 640** — 12.1 ms, 9 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| person (person) | 0.91 | 0.851 | 0.361 | 0.122 | 0.469 |  |
| person (person) | 0.90 | 0.268 | 0.176 | 0.136 | 0.489 |  |
| person (person) | 0.90 | 0.609 | 0.325 | 0.129 | 0.482 |  |
| person (person) | 0.89 | 0.048 | 0.260 | 0.121 | 0.467 |  |
| person (person) | 0.88 | 0.151 | 0.251 | 0.103 | 0.446 |  |
| person (person) | 0.85 | 0.412 | 0.182 | 0.105 | 0.462 |  |
| person (person) | 0.83 | 0.533 | 0.285 | 0.104 | 0.479 |  |
| person (person) | 0.81 | 0.453 | 0.350 | 0.104 | 0.469 |  |
| person (person) | 0.76 | 0.837 | 0.289 | 0.069 | 0.174 |  |

(YOLOX-S 640 cpuOnly: 31.5 ms)

**YOLOX-M 640 pal8** — 15.6 ms, 9 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| person (person) | 0.91 | 0.049 | 0.256 | 0.122 | 0.479 |  |
| person (person) | 0.91 | 0.269 | 0.179 | 0.137 | 0.493 |  |
| person (person) | 0.90 | 0.852 | 0.368 | 0.120 | 0.486 |  |
| person (person) | 0.89 | 0.613 | 0.318 | 0.126 | 0.502 |  |
| person (person) | 0.89 | 0.152 | 0.239 | 0.103 | 0.457 |  |
| person (person) | 0.88 | 0.411 | 0.178 | 0.104 | 0.475 |  |
| person (person) | 0.88 | 0.456 | 0.349 | 0.103 | 0.471 |  |
| person (person) | 0.87 | 0.537 | 0.273 | 0.107 | 0.504 |  |
| person (person) | 0.83 | 0.836 | 0.290 | 0.067 | 0.175 |  |

**YOLOv3-Tiny (legacy)** — 9.8 ms, 6 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| person (person) | 0.89 | 0.295 | 0.172 | 0.114 | 0.498 |  |
| person (person) | 0.89 | 0.626 | 0.328 | 0.105 | 0.458 |  |
| person (person) | 0.74 | 0.040 | 0.260 | 0.134 | 0.464 |  |
| person (person) | 0.73 | 0.512 | 0.233 | 0.100 | 0.570 |  |
| person (person) | 0.67 | 0.841 | 0.302 | 0.123 | 0.546 |  |
| person (person) | 0.40 | 0.650 | 0.419 | 0.053 | 0.268 |  |

**YOLOv3 (legacy)** — 38.6 ms, 9 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| person (person) | 1.00 | 0.846 | 0.356 | 0.132 | 0.491 |  |
| person (person) | 1.00 | 0.540 | 0.263 | 0.100 | 0.521 |  |
| person (person) | 1.00 | 0.276 | 0.188 | 0.121 | 0.481 |  |
| person (person) | 1.00 | 0.614 | 0.323 | 0.125 | 0.487 |  |
| person (person) | 1.00 | 0.054 | 0.219 | 0.110 | 0.540 |  |
| person (person) | 1.00 | 0.150 | 0.244 | 0.102 | 0.447 |  |
| person (person) | 1.00 | 0.455 | 0.350 | 0.103 | 0.473 |  |
| person (person) | 0.99 | 0.408 | 0.182 | 0.098 | 0.462 |  |
| person (person) | 0.83 | 0.840 | 0.284 | 0.074 | 0.169 |  |

### x10.jpg (1280×843)

**YOLOX-S 640** — 12.3 ms, 5 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| bus (bus) | 0.94 | 0.108 | 0.267 | 0.618 | 0.632 |  |
| car (car) | 0.84 | 0.709 | 0.567 | 0.110 | 0.127 |  |
| car (car) | 0.52 | 0.839 | 0.547 | 0.056 | 0.095 |  |
| car (car) | 0.51 | 0.900 | 0.541 | 0.063 | 0.115 |  |
| car (car) | 0.37 | 0.709 | 0.551 | 0.024 | 0.055 |  |

(YOLOX-S 640 cpuOnly: 33.9 ms)

**YOLOX-M 640 pal8** — 15.8 ms, 4 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| bus (bus) | 0.95 | 0.111 | 0.266 | 0.618 | 0.635 |  |
| car (car) | 0.93 | 0.710 | 0.566 | 0.105 | 0.127 |  |
| car (car) | 0.57 | 0.841 | 0.546 | 0.054 | 0.091 |  |
| car (car) | 0.40 | 0.892 | 0.539 | 0.071 | 0.118 |  |

**YOLOv3-Tiny (legacy)** — 9.6 ms, 2 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.75 | 0.733 | 0.601 | 0.061 | 0.058 |  |
| car (car) | 0.40 | 0.744 | 0.585 | 0.035 | 0.028 |  |

**YOLOv3 (legacy)** — 31.2 ms, 4 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| bus (bus) | 1.00 | 0.094 | 0.257 | 0.628 | 0.667 |  |
| car (car) | 1.00 | 0.711 | 0.570 | 0.125 | 0.126 |  |
| car (car) | 0.59 | 0.839 | 0.548 | 0.127 | 0.090 |  |
| car (car) | 0.50 | 0.002 | 0.627 | 0.029 | 0.071 |  |

### x11.jpg (1280×960)

**YOLOX-S 640** — 12.1 ms, 5 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (truck) | 0.81 | 0.314 | 0.603 | 0.085 | 0.107 |  |
| car (car) | 0.77 | 0.460 | 0.621 | 0.069 | 0.078 |  |
| trafficLight (traffic light) | 0.77 | 0.381 | 0.452 | 0.034 | 0.020 | red (0.59) |
| car (car) | 0.76 | 0.207 | 0.624 | 0.143 | 0.123 |  |
| trafficLight (traffic light) | 0.69 | 0.467 | 0.455 | 0.036 | 0.020 | red (0.38) |

(YOLOX-S 640 cpuOnly: 31.6 ms)

**YOLOX-M 640 pal8** — 19.2 ms, 5 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.91 | 0.460 | 0.620 | 0.069 | 0.080 |  |
| car (car) | 0.91 | 0.208 | 0.625 | 0.141 | 0.122 |  |
| car (truck) | 0.83 | 0.313 | 0.605 | 0.085 | 0.104 |  |
| trafficLight (traffic light) | 0.60 | 0.467 | 0.456 | 0.035 | 0.020 | yellow (0.40) |
| trafficLight (traffic light) | 0.46 | 0.381 | 0.451 | 0.034 | 0.021 | red (0.59) |

**YOLOv3-Tiny (legacy)** — 9.8 ms, 2 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.54 | 0.237 | 0.660 | 0.087 | 0.057 |  |
| car (car) | 0.43 | 0.353 | 0.641 | 0.024 | 0.048 |  |

**YOLOv3 (legacy)** — 31.1 ms, 6 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 1.00 | 0.210 | 0.627 | 0.139 | 0.117 |  |
| car (car) | 1.00 | 0.464 | 0.623 | 0.064 | 0.076 |  |
| car (truck) | 1.00 | 0.318 | 0.600 | 0.081 | 0.101 |  |
| trafficLight (traffic light) | 0.95 | 0.469 | 0.456 | 0.033 | 0.022 | yellow (0.36) |
| trafficLight (traffic light) | 0.77 | 0.381 | 0.449 | 0.031 | 0.021 | red (0.55) |
| car (car) | 0.66 | 0.316 | 0.605 | 0.077 | 0.082 |  |

### x12.jpg (1280×1867)

**YOLOX-S 640** — 14.6 ms, 22 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| motorcycle (motorbike) | 0.89 | 0.332 | 0.727 | 0.284 | 0.231 |  |
| person (person) | 0.83 | 0.125 | 0.759 | 0.146 | 0.241 |  |
| person (person) | 0.83 | 0.000 | 0.715 | 0.209 | 0.280 |  |
| car (car) | 0.81 | 0.521 | 0.612 | 0.123 | 0.042 |  |
| person (person) | 0.81 | 0.401 | 0.685 | 0.176 | 0.207 |  |
| car (car) | 0.81 | 0.137 | 0.613 | 0.204 | 0.060 |  |
| motorcycle (motorbike) | 0.80 | 0.881 | 0.670 | 0.106 | 0.082 |  |
| car (car) | 0.77 | 0.640 | 0.604 | 0.132 | 0.046 |  |
| motorcycle (motorbike) | 0.74 | 0.782 | 0.656 | 0.092 | 0.094 |  |
| car (car) | 0.71 | 0.315 | 0.630 | 0.264 | 0.103 |  |
| person (person) | 0.71 | 0.172 | 0.647 | 0.092 | 0.120 |  |
| motorcycle (motorbike) | 0.68 | 0.173 | 0.691 | 0.166 | 0.157 |  |
| person (person) | 0.66 | 0.801 | 0.615 | 0.075 | 0.110 |  |
| motorcycle (motorbike) | 0.65 | 0.003 | 0.836 | 0.300 | 0.163 |  |
| trafficLight (traffic light) | 0.65 | 0.723 | 0.284 | 0.106 | 0.035 | unknown (0.16) |
| car (car) | 0.64 | 0.303 | 0.617 | 0.060 | 0.037 |  |
| person (person) | 0.60 | 0.404 | 0.614 | 0.101 | 0.112 |  |
| person (person) | 0.53 | 0.008 | 0.645 | 0.088 | 0.075 |  |
| car (car) | 0.52 | 0.834 | 0.614 | 0.166 | 0.062 |  |
| car (car) | 0.48 | 0.000 | 0.621 | 0.063 | 0.047 |  |
| motorcycle (motorbike) | 0.42 | 0.304 | 0.676 | 0.118 | 0.068 |  |
| trafficLight (traffic light) | 0.39 | 0.659 | 0.295 | 0.074 | 0.032 | red (0.97) |

(YOLOX-S 640 cpuOnly: 34.0 ms)

**YOLOX-M 640 pal8** — 16.8 ms, 26 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| motorcycle (motorbike) | 0.91 | 0.335 | 0.725 | 0.281 | 0.234 |  |
| person (person) | 0.88 | 0.008 | 0.717 | 0.196 | 0.281 |  |
| car (car) | 0.87 | 0.168 | 0.615 | 0.166 | 0.057 |  |
| person (person) | 0.87 | 0.402 | 0.683 | 0.179 | 0.203 |  |
| motorcycle (motorbike) | 0.83 | 0.000 | 0.832 | 0.301 | 0.165 |  |
| car (car) | 0.83 | 0.519 | 0.611 | 0.123 | 0.043 |  |
| motorcycle (motorbike) | 0.83 | 0.784 | 0.668 | 0.092 | 0.079 |  |
| person (person) | 0.82 | 0.126 | 0.751 | 0.158 | 0.246 |  |
| person (person) | 0.81 | 0.894 | 0.625 | 0.087 | 0.110 |  |
| person (person) | 0.80 | 0.800 | 0.615 | 0.077 | 0.106 |  |
| motorcycle (motorbike) | 0.79 | 0.882 | 0.678 | 0.105 | 0.075 |  |
| car (car) | 0.77 | 0.624 | 0.604 | 0.144 | 0.048 |  |
| trafficLight (traffic light) | 0.75 | 0.656 | 0.283 | 0.173 | 0.043 | red (0.94) |
| car (car) | 0.75 | 0.302 | 0.616 | 0.063 | 0.038 |  |
| car (car) | 0.75 | 0.844 | 0.611 | 0.154 | 0.072 |  |
| person (person) | 0.74 | 0.349 | 0.629 | 0.071 | 0.084 |  |
| person (person) | 0.73 | 0.414 | 0.616 | 0.088 | 0.108 |  |
| person (person) | 0.70 | 0.173 | 0.649 | 0.139 | 0.120 |  |
| motorcycle (motorbike) | 0.69 | 0.306 | 0.686 | 0.111 | 0.058 |  |
| car (car) | 0.60 | 0.417 | 0.619 | 0.162 | 0.084 |  |
| car (car) | 0.58 | 0.777 | 0.613 | 0.099 | 0.042 |  |
| person (person) | 0.57 | 0.076 | 0.633 | 0.039 | 0.079 |  |
| person (person) | 0.54 | 0.012 | 0.643 | 0.079 | 0.075 |  |
| motorcycle (motorbike) | 0.52 | 0.180 | 0.694 | 0.153 | 0.152 |  |
| car (car) | 0.51 | 0.000 | 0.620 | 0.053 | 0.048 |  |
| person (person) | 0.39 | 0.031 | 0.620 | 0.054 | 0.055 |  |

**YOLOv3-Tiny (legacy)** — 10.5 ms, 9 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 0.71 | 0.217 | 0.626 | 0.070 | 0.023 |  |
| person (person) | 0.62 | 0.070 | 0.759 | 0.228 | 0.227 |  |
| car (car) | 0.62 | 0.793 | 0.621 | 0.199 | 0.117 |  |
| car (car) | 0.55 | 0.652 | 0.615 | 0.055 | 0.021 |  |
| person (person) | 0.53 | 0.187 | 0.681 | 0.060 | 0.056 |  |
| person (person) | 0.51 | 0.126 | 0.781 | 0.098 | 0.168 |  |
| car (car) | 0.44 | 0.310 | 0.626 | 0.034 | 0.020 |  |
| car (car) | 0.42 | 0.260 | 0.629 | 0.048 | 0.021 |  |
| car (car) | 0.41 | 0.186 | 0.623 | 0.053 | 0.017 |  |

**YOLOv3 (legacy)** — 34.7 ms, 19 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| person (person) | 1.00 | 0.004 | 0.745 | 0.243 | 0.255 |  |
| car (car) | 1.00 | 0.628 | 0.603 | 0.144 | 0.048 |  |
| motorcycle (motorbike) | 1.00 | 0.044 | 0.774 | 0.262 | 0.218 |  |
| motorcycle (motorbike) | 1.00 | 0.339 | 0.777 | 0.271 | 0.177 |  |
| person (person) | 0.99 | 0.888 | 0.618 | 0.093 | 0.125 |  |
| person (person) | 0.98 | 0.789 | 0.619 | 0.091 | 0.117 |  |
| person (person) | 0.90 | 0.408 | 0.688 | 0.167 | 0.204 |  |
| car (car) | 0.89 | 0.135 | 0.609 | 0.231 | 0.064 |  |
| person (person) | 0.87 | 0.123 | 0.751 | 0.177 | 0.240 |  |
| car (car) | 0.87 | 0.527 | 0.611 | 0.120 | 0.038 |  |
| motorcycle (motorbike) | 0.86 | 0.880 | 0.686 | 0.103 | 0.065 |  |
| person (person) | 0.85 | 0.171 | 0.655 | 0.146 | 0.120 |  |
| motorcycle (motorbike) | 0.80 | 0.794 | 0.670 | 0.075 | 0.076 |  |
| person (person) | 0.69 | 0.006 | 0.649 | 0.116 | 0.106 |  |
| motorcycle (motorbike) | 0.60 | 0.221 | 0.723 | 0.125 | 0.127 |  |
| person (person) | 0.54 | 0.394 | 0.624 | 0.167 | 0.096 |  |
| motorcycle (motorbike) | 0.47 | 0.306 | 0.693 | 0.101 | 0.054 |  |
| person (person) | 0.43 | 0.325 | 0.632 | 0.084 | 0.108 |  |
| car (car) | 0.37 | 0.000 | 0.618 | 0.065 | 0.053 |  |

### x13.jpg (1280×720)

**YOLOX-S 640** — 11.4 ms, 4 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| stopSign (stop sign) | 0.95 | 0.045 | 0.519 | 0.077 | 0.176 |  |
| stopSign (stop sign) | 0.90 | 0.678 | 0.583 | 0.048 | 0.101 |  |
| car (car) | 0.66 | 0.092 | 0.783 | 0.080 | 0.062 |  |
| car (truck) | 0.53 | 0.734 | 0.765 | 0.075 | 0.056 |  |

(YOLOX-S 640 cpuOnly: 31.0 ms)

**YOLOX-M 640 pal8** — 15.4 ms, 4 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| stopSign (stop sign) | 0.95 | 0.045 | 0.520 | 0.077 | 0.175 |  |
| stopSign (stop sign) | 0.93 | 0.678 | 0.582 | 0.047 | 0.103 |  |
| car (truck) | 0.83 | 0.734 | 0.763 | 0.074 | 0.057 |  |
| car (truck) | 0.62 | 0.095 | 0.783 | 0.078 | 0.064 |  |

**YOLOv3-Tiny (legacy)** — 8.1 ms, 3 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| stopSign (stop sign) | 0.98 | 0.061 | 0.567 | 0.052 | 0.072 |  |
| stopSign (stop sign) | 0.82 | 0.692 | 0.612 | 0.021 | 0.047 |  |
| car (truck) | 0.72 | 0.118 | 0.799 | 0.028 | 0.029 |  |

**YOLOv3 (legacy)** — 29.5 ms, 5 objects

| class (COCO) | conf | x | y | w | h | light |
|---|---|---|---|---|---|---|
| car (car) | 1.00 | 0.099 | 0.779 | 0.076 | 0.065 |  |
| car (truck) | 1.00 | 0.735 | 0.763 | 0.073 | 0.057 |  |
| stopSign (stop sign) | 1.00 | 0.047 | 0.523 | 0.074 | 0.166 |  |
| stopSign (stop sign) | 0.98 | 0.677 | 0.579 | 0.051 | 0.103 |  |
| car (truck) | 0.63 | 0.980 | 0.622 | 0.020 | 0.118 |  |

### x14.jpg (1280×853)

**YOLOX-S 640** — 11.6 ms, 0 objects

_none_

(YOLOX-S 640 cpuOnly: 31.0 ms)

**YOLOX-M 640 pal8** — 14.6 ms, 0 objects

_none_

**YOLOv3-Tiny (legacy)** — 7.9 ms, 0 objects

_none_

**YOLOv3 (legacy)** — 32.7 ms, 0 objects

_none_

