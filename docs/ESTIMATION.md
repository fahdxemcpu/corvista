# Corvista — Monocular Range & Bearing Estimation

> **These are rough monocular estimates, not measurements.** A single camera
> cannot measure distance. Corvista infers an approximate range from the size
> of a detection box and an assumed real-world object height. Errors of
> ±30–50 % are normal and can be larger. Ranges are only used to bucket
> objects into coarse zones, to place approximate markers on the map, and to
> drive parking tones. The UI must never show them as precise distances.

Implementation: `lib/features/detection/spatial_estimator.dart`
(`SpatialEstimator`), consumed by `ObjectTracker` for every output track.

## Camera model

Ideal pinhole camera, square pixels, principal point at the image centre, no
lens distortion, camera axis roughly parallel to the road.

For an upright frame `W × H` pixels with horizontal field of view `HFOV`
(`AppSettings.cameraFov`, default 68°, the HFOV of the *upright* frame):

```
f_px = (W / 2) / tan(HFOV / 2)
```

The same focal length is used vertically (square pixels).

## Bearing

For a box with normalized centre `cx` (0 = left edge, 1 = right edge):

```
bearing = atan((cx − 0.5) · W / f_px)        (degrees, + = right of axis)
```

## Range

Each class has a nominal height `H_nominal` (`ObjectClass.nominalHeightM`):
person 1.7 m, bicycle 1.1 m, motorcycle 1.3 m, car 1.5 m, bus 3.1 m,
traffic light 0.9 m, stop sign 0.75 m. With box height `h_px = h_norm · H`:

```
range ≈ f_px · H_nominal / h_px
```

Example: 1280-px-wide frame, HFOV 68° → `f_px ≈ 949`. A car box 140 px tall
→ `range ≈ 949 · 1.5 / 140 ≈ 10 m`.

### Rejections / special cases

* **Truncation**: if the box touches the top or bottom frame edge (within
  1 % of the height) its height is not the object's full height, so
  `range = null`. Exception for zones only: a non-signal box cut by the
  bottom edge and taller than 45 % of the frame is classed `veryClose`
  (it can only be that large when very near the camera).
* Boxes shorter than 4 px → `range = null`, zone `far`.
* Ranges are clamped to 150 m.

## Zones

| zone        | approx. range |
|-------------|---------------|
| `veryClose` | < 4 m         |
| `close`     | < 10 m        |
| `medium`    | < 25 m        |
| `far`       | ≥ 25 m        |
| `unknown`   | not estimable |

## Parking (close range, `ParkingProximity`)

`lib/features/parking/parking_proximity.dart`. For slow manoeuvring (0–5 m)
with the phone facing the direction of travel. Supported classes: car,
bus/truck, person, bicycle, motorcycle. **Walls, pillars, poles, kerbs,
bollards and low obstacles are not detected** (single camera, COCO classes),
and a windscreen mount's bonnet hides the ground just ahead.

1. Camera distance from the shared `GroundProjector` (box-bottom ground
   contact, camera 1.3 m high, self-calibrated horizon, blended with the
   nominal-height estimate).
2. **Bottom edge**: a box cut by the bottom edge has its contact point below
   the frame → distance bounded by the frame-bottom ray (× 0.85), and the zone
   is at least *very close*. The bound alone never yields *stop*.
3. **Width cue** (height unusable, both sides visible):
   `f · W_min / w_px` with the narrowest plausible width (car 1.65 m,
   bus 2.3, person 0.45, bicycle 0.5, motorcycle 0.7) — conservative.
   A bottom-cut box ≥ 70 % wide and ≥ 60 % tall is touching distance.
4. **Own bonnet**: a vehicle box cut by the bottom edge, ≥ 40 % wide, whose
   top is ≥ 0.1 below the horizon (or below 62 % of the height) is ignored —
   a real vehicle is taller than the camera, so its top is above the horizon.
5. Clearance = distance − 1.5 m (assumed bonnet length for a windscreen mount).
6. Log-domain filter per track: approach gain 0.7, recession gain 0.3; a
   coasting (lost) box keeps its last value.
7. Zones on clearance: **stop** < 0.6 m, **very close** < 1.5 m, **close**
   < 3 m, otherwise **nothing close seen** (never "clear"); objects beyond
   5 m are ignored. A band is left only beyond threshold × 1.2; overall and
   per-side zones fall only after 0.6 s.
8. Side: the vehicle path (± 1 m) at the object's distance gives a central
   image band (10–20 % of the width each side of centre; 10 % for boxes cut by
   a side edge). Overlap → centre, else left / right.
9. Tone = zone level → `audio.proximity`: 3 continuous, 2 fast, 1 slow, 0 off.

Validated on real car-park footage (docs/TEST_FOOTAGE.md › Parking footage,
`test/logic/parking_sequences_test.dart`).

## Known error sources

* Real heights vary widely (children vs adults, SUVs vs hatchbacks, vans
  detected as "car").
* Partial occlusion shrinks boxes → overestimated range.
* Detector box jitter (a few px) is significant for distant objects.
* Camera pitch/roll and mount height are ignored; lens distortion (esp.
  ultra-wide) is ignored; HFOV is an assumption unless supplied by native.
* Portrait vs landscape changes `W` and the effective HFOV.

## Map placement

`MapProjector` converts (bearing, range) to latitude/longitude using a local
East-North-Up plane: `azimuth = travel direction + bearing`,
`Δnorth = r·cos(az)`, `Δeast = r·sin(az)`, `Δlat = Δnorth / R`,
`Δlon = Δeast / (R·cos(lat))`. It returns nothing when the fix accuracy is
worse than 30 m or no travel direction (course or heading) is known. Markers
are always flagged `approx: true`.

## Virtual view placement (ground plane)

Implementation: `lib/features/detection/ground_projector.dart`
(`GroundProjector`) and `lib/features/detection/placement_filter.dart`
(`PlacementFilter`, `LaneModel`), run on tracker output by
`lib/features/virtual_view/virtual_placement.dart`. Used only to draw the
stylized virtual scene; still never displayed as numbers.

### Ground-contact distance

Assumptions: flat road, camera at `h_cam ≈ 1.3 m` (phone on a windscreen),
square pixels, principal point at the image centre, no roll. The box
bottom-centre is the road contact point `(x_b, y_b)`; the horizon is row `y_h`.

```
d_ground  = h_cam · f_px / (y_b − y_h)
d_height  = f_px · H_nominal / h_px          (as above)
lateral   = (x_b − W/2) · d / f_px           (+ right)
```

Fusion: both usable and within a factor 1.8 → weighted geometric mean
(60 % ground). Otherwise the nearer one is kept (occlusion and a wrong horizon
both inflate a distance), but never below `d_height / 2` (a ground value that
low means the horizon is wrong, not that the object is near). Ground is not
used for traffic lights / stop signs (no visible road contact), when the box
bottom touches the frame edge, or when the bottom is above the horizon.
A box cut by the bottom edge (≥ 20 % of the frame tall) is placed at 85 % of
the frame-bottom ray distance `h_cam · f / ((1 − y_h) · H)` — "very near".
Distances beyond 90 m are rejected.

### Horizon self-calibration

The phone's mount pitch moves the horizon (e.g. ~0.83 of the frame height for
an upward-tilted dashcam). For a fully visible car/bus of nominal height `H`
on the road, `y_h = y_b − h_px · h_cam / H`. The median of the last 120 such
samples (accepted in 0.15…0.9 of the frame) is the horizon. Until 8 samples
exist, the default is the frame centre and the ground estimate is only a
fallback (height-based range is used when available).

### Temporal filtering & plausibility

Per track: alpha-beta filter on `ln(distance)` (α 0.35, β 0.04) and an EMA on
the lateral ratio `x / d` (α 0.45). Each update is clamped to a relative speed
of 40 m/s in range and 8 m/s laterally. New tracks start at their measured
position (fade in only); unseen tracks hold their last position — after 0.3 s
(or when the tracker marks them lost) they fade out in place. Zones use
hysteresis: a nearer zone is entered immediately, a farther one only beyond
its threshold × 1.15.

### Lanes, roadside, filtering

`LaneModel`: 3.5 m lanes in kerb-side coordinates (mirrored for left-hand
traffic, `AppSettings.drivingSide`): ego lane, one lane toward the kerb, one
same-direction lane on the far side, a centre line and two oncoming lanes,
with 2.8 m sidewalks. Vehicles snap to lane centres (switch only when 0.45 m
past the lane boundary). People / bicycles beyond a road edge stand on that
sidewalk strip; on the road they keep their filtered position. Traffic lights
and stop signs stand at the roadside of the side they are seen on. A person
whose box sits on a bicycle / motorcycle box is its rider and is not drawn
separately. Orientation is always "same direction" (oncoming vs. same is not
estimated). Shown: confirmed tracks with confidence ≥ 0.4, nearer than 60 m,
the 12 nearest.

Verification: `test/widget/virtual_replay_render_test.dart` replays detector
output recorded with `tools/model_eval` on real road footage
(`test/fixtures/drive_sequences/`) through tracker → placement → scene, and
checks left/right agreement with the camera image and motion bounds.
