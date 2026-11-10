# Driving-simulation test footage

Used only for local QA on the iOS Simulator (TEST FOOTAGE mode); not shipped in the app.
Segments (60 s, re-encoded to 1280×720 H.264) are cut from these Wikimedia Commons files:

| Scenario | Source | Author | Licence |
|---|---|---|---|
| city_krakow (city, crosswalks, signs) | [City Driving 4K- Kraków Poland 2024](https://commons.wikimedia.org/wiki/File:City_Driving_4K-_Krak%C3%B3w_Poland_2024.webm) | Relaxing Roads 4K | CC BY 3.0 |
| rural_road (Canton: horizontal traffic lights, motorbikes, pedestrians) | [Car Driving Faadou 4K HDR- Rural road - Canton - 327](https://commons.wikimedia.org/wiki/File:Car_Driving_Faadou_4K_HDR-_Rural_road_-_Canton_-_327.webm) | CAN Driver | CC BY 3.0 |
| nz_left_traffic (left-hand traffic) | [Driving from Nelson City to Pelorus Bridge](https://commons.wikimedia.org/wiki/File:Driving_from_Nelson_City_to_Pelorus_Bridge_in_the_Nelson_Region_of_New_Zealand.webm) | NewZealandRoadTrips | CC BY 3.0 |
| night_traffic (night, headlights) | [Cars driving at night](https://commons.wikimedia.org/wiki/File:Cars_driving_at_night.webm) | Editor (YouTube) | CC BY 3.0 |
| rain_doha (night rain) | [Driving under rain - Doha, Qatar](https://commons.wikimedia.org/wiki/File:Driving_under_rain_-_Doha,_Qatar.webm) | Muhammad Basheer | CC BY 3.0 |
| dashcam_sample (real windshield dashcam) | [Dashcam recording example - Panorama II](https://commons.wikimedia.org/wiki/File:Dashcam_recording_example_-_Panorama_II_BlackBox_Dashcam_daylight.mp4.ogv) | Fernost | CC0 |

Plus `qa_drive.mp4`: slideshow of the 13 evaluation photos listed in `tools/model_eval/IMAGES.md`.
Screenshots made from CC BY footage must credit the author if published (e.g. in App Store screenshots — prefer own footage there).

## Parking footage (Parking view)

Slow manoeuvring in car parks, used for `test/fixtures/parking_sequences/` (detections) and the
parking render harness. Segments re-encoded to 1280×720 H.264 (no audio); only ranged prefixes of
the source files were downloaded (sequential requests, descriptive User-Agent).

| Scenario | Segment | Source | Author | Licence |
|---|---|---|---|---|
| garage_tuebingen (underground/automated car park, windscreen view, bonnet visible, parked cars, motorcycle, pillars) | 0–60 s | [Fahrt im automatischen Parkhaus im französischen Viertel in Tübingen](https://commons.wikimedia.org/wiki/File:Fahrt_im_automatischen_Parkhaus_im_franz%C3%B6sischen_Viertel_in_T%C3%BCbingen.webm) | Dktue | CC0 |
| garage_franconia (multi-storey garage at night, cars crossing very close, pillars) | 8–58 s | [Franconia-Springfield Metro Parking Traffic -throughglass](https://commons.wikimedia.org/wiki/File:Franconia-Springfield_Metro_Parking_Traffic_-throughglass.webm) | brownpau | CC BY 3.0 |
| lot_monmouth (open mall parking lot, parked cars passed at close range) | 72–108 s, bottom-aligned crop | [Monmouth Mall Exterior Drive-Around, Eatontown, NJ (July 2023)](https://commons.wikimedia.org/wiki/File:Monmouth_Mall_Exterior_Drive-Around,_Eatontown,_NJ_(July_2023).webm) | Nightcast Walks | CC BY 3.0 |

Franconia is filmed hand-held through the side/front glass and Monmouth with a side-facing wide
camera, so their geometry differs from a windscreen mount; Tübingen is the closest to the intended
use (phone behind the windscreen, bonnet in view).
