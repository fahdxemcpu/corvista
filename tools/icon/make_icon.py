"""Generates the original Corvista app icon (1024x1024, no alpha)."""
import math, sys
from PIL import Image, ImageDraw, ImageFilter

S = 1024
SS = 4  # supersampling
W = S * SS

def lerp(a, b, t): return tuple(int(a[i] + (b[i] - a[i]) * t) for i in range(3))

img = Image.new("RGB", (W, W), (8, 12, 18))
px = img.load()
# vertical gradient background: deep navy -> near black, slight radial glow at horizon
top, bot = (17, 27, 40), (6, 9, 14)
d = ImageDraw.Draw(img)
for y in range(0, W, SS):
    c = lerp(top, bot, y / W)
    d.rectangle([0, y, W, y + SS], fill=c)

glow = Image.new("L", (W, W), 0)
gd = ImageDraw.Draw(glow)
cx, hy = W // 2, int(W * 0.47)
for r in range(int(W * 0.55), 0, -SS * 4):
    a = int(110 * (1 - r / (W * 0.55)) ** 2)
    gd.ellipse([cx - r, hy - r * 0.62, cx + r, hy + r * 0.62], fill=a)
glow = glow.filter(ImageFilter.GaussianBlur(W * 0.02))
img = Image.composite(Image.new("RGB", (W, W), (56, 217, 232)), img, glow.point(lambda v: int(v * 0.35)))
d = ImageDraw.Draw(img)

# road: trapezoid converging to vanishing point
vp = (cx, hy)
road_bottom_half = W * 0.52
road = [(cx - road_bottom_half, W), (cx + road_bottom_half, W), (cx + W * 0.018, hy + W * 0.03), (cx - W * 0.018, hy + W * 0.03)]
d.polygon(road, fill=(20, 31, 43))
# road edges
edge = (76, 128, 255)
for sgn in (-1, 1):
    d.line([(cx + sgn * road_bottom_half * 0.93, W), (cx + sgn * W * 0.016, hy + W * 0.035)], fill=edge, width=int(W * 0.012))
# centre dashes with perspective
for i in range(7):
    t0 = (i / 7) ** 1.7; t1 = ((i + 0.5) / 7) ** 1.7
    y0 = hy + W * 0.04 + (W - hy) * t0; y1 = hy + W * 0.04 + (W - hy) * t1
    w0 = W * 0.004 + W * 0.02 * t0; w1 = W * 0.004 + W * 0.02 * t1
    d.polygon([(cx - w0, y0), (cx + w0, y0), (cx + w1, y1), (cx - w1, y1)], fill=(245, 248, 252))

# aperture / vision ring centred at vanishing point
R = W * 0.255
ring = Image.new("L", (W, W), 0)
rd = ImageDraw.Draw(ring)
rd.ellipse([cx - R, hy - R, cx + R, hy + R], outline=255, width=int(W * 0.022))
ring_glow = ring.filter(ImageFilter.GaussianBlur(W * 0.018))
img = Image.composite(Image.new("RGB", (W, W), (56, 217, 232)), img, ring_glow.point(lambda v: int(v * 0.7)))
img = Image.composite(Image.new("RGB", (W, W), (56, 217, 232)), img, ring)
d = ImageDraw.Draw(img)

# AI geometry: corner brackets (detection box) around a small node at VP
b = R * 0.34; L = b * 0.45; t = int(W * 0.011)
col = (101, 219, 170)
for sx in (-1, 1):
    for sy in (-1, 1):
        x0, y0 = cx + sx * b, hy + sy * b
        d.line([(x0, y0), (x0 - sx * L, y0)], fill=col, width=t)
        d.line([(x0, y0), (x0, y0 - sy * L)], fill=col, width=t)
nr = W * 0.022
d.ellipse([cx - nr, hy - nr, cx + nr, hy + nr], fill=(245, 248, 252))

img = img.resize((S, S), Image.LANCZOS)
out = sys.argv[1]
img.save(out, "PNG")
print("wrote", out, img.size, img.mode)
