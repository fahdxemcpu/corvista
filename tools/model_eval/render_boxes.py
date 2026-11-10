"""Draw the detections from `main.swift --json` onto the eval images, one panel per
model, stacked vertically, so misses and false positives can be checked by eye.

  python3 -I tools/model_eval/render_boxes.py --json dets.json --images tools/model_eval/images \
      --out /tmp/annotated [--models "YOLOv3-Tiny,YOLOX-S 640"] [--width 1100]
"""
import argparse
import json
import os

from PIL import Image, ImageDraw, ImageFont

COLORS = {
    "person": (255, 64, 64), "bicycle": (255, 160, 0), "motorcycle": (255, 0, 255),
    "car": (0, 200, 255), "bus": (0, 255, 0), "trafficLight": (255, 255, 0), "stopSign": (255, 255, 255),
}
ABBR = {"person": "P", "bicycle": "BIC", "motorcycle": "MC", "car": "car", "bus": "BUS", "trafficLight": "TL", "stopSign": "STOP"}

p = argparse.ArgumentParser()
p.add_argument("--json", required=True)
p.add_argument("--images", required=True)
p.add_argument("--out", required=True)
p.add_argument("--models", default="")
p.add_argument("--width", type=int, default=1100)
a = p.parse_args()

data = json.load(open(a.json))
models = [m for m in a.models.split(",") if m] or data["models"]
os.makedirs(a.out, exist_ok=True)
try:
    font = ImageFont.truetype("/System/Library/Fonts/Supplemental/Arial.ttf", 15)
    big = ImageFont.truetype("/System/Library/Fonts/Supplemental/Arial Bold.ttf", 22)
except OSError:
    font = big = ImageFont.load_default()

for entry in data["images"]:
    src = Image.open(os.path.join(a.images, entry["image"])).convert("RGB")
    scale = a.width / src.width
    base = src.resize((a.width, round(src.height * scale)))
    panels = []
    for m in models:
        img = base.copy()
        d = ImageDraw.Draw(img)
        dets = entry["detections"].get(m, [])
        for o in dets:
            x0, y0 = o["x"] * img.width, o["y"] * img.height
            x1, y1 = x0 + o["w"] * img.width, y0 + o["h"] * img.height
            c = COLORS.get(o["key"], (200, 200, 200))
            d.rectangle([x0, y0, x1, y1], outline=c, width=2)
            t = f'{ABBR.get(o["key"], o["key"])} {o["conf"]:.2f}'
            if o.get("light"):
                t += f' {o["light"][0]}'
            tw = d.textlength(t, font=font)
            ty = max(0, y0 - 17)
            d.rectangle([x0, ty, x0 + tw + 4, ty + 17], fill=(0, 0, 0))
            d.text((x0 + 2, ty), t, fill=c, font=font)
        title = f'{m}: {len(dets)}'
        d.rectangle([0, 0, d.textlength(title, font=big) + 12, 30], fill=(0, 0, 0))
        d.text((6, 3), title, fill=(255, 255, 255), font=big)
        panels.append(img)
    canvas = Image.new("RGB", (a.width, sum(pn.height for pn in panels) + 6 * (len(panels) - 1)), (40, 40, 40))
    y = 0
    for pn in panels:
        canvas.paste(pn, (0, y))
        y += pn.height + 6
    out = os.path.join(a.out, os.path.splitext(entry["image"])[0] + "_boxes.jpg")
    canvas.save(out, quality=88)
    print(out)
