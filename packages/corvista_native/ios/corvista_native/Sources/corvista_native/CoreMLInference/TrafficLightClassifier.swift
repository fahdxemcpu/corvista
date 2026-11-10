import CoreGraphics
import CoreVideo
import Foundation

// Platform-neutral (CoreVideo only). Shared with tools/model_eval.

/// Cheap CPU lamp-state classifier for a traffic-light crop of a BGRA frame.
///
/// Counts bright, saturated red / amber / green pixels on a subsampled grid inside
/// the box and weights them by where that colour's lamp sits in the housing:
/// vertical housings (h ≥ 1.3·w) expect red top, amber middle, green bottom.
/// Horizontal housings get no position prior because the red side differs by
/// country (red is left in North America, right in Japan). Near-square boxes get
/// a weak prior. Returns `unknown` when the evidence is weak.
enum TrafficLightClassifier {
  struct Result {
    let light: String   // red | yellow | green | unknown
    let conf: Double
  }

  /// Hue bands in degrees, minimum value/saturation for a "lit" pixel.
  static let minValue: Int = 110          // of 255
  static let minSaturation: Double = 0.40
  static let minLitRatio: Double = 0.008  // weighted fraction of sampled pixels
  static let fullStrengthRatio: Double = 0.04
  static let minConfidence: Double = 0.35
  /// Fraction trimmed from each side so the housing border / yellow backplate is ignored.
  static let inset: Double = 0.12

  /// `box` is normalized [0,1], top-left origin, in the buffer's (upright) frame.
  static func classify(pixelBuffer pb: CVPixelBuffer, box: CGRect) -> Result {
    guard CVPixelBufferGetPixelFormatType(pb) == kCVPixelFormatType_32BGRA else {
      return Result(light: "unknown", conf: 0)
    }
    let W = CVPixelBufferGetWidth(pb), H = CVPixelBufferGetHeight(pb)
    let r = box.insetBy(dx: box.width * inset, dy: box.height * inset)
    let x0 = max(0, Int((r.minX * Double(W)).rounded(.down)))
    let y0 = max(0, Int((r.minY * Double(H)).rounded(.down)))
    let x1 = min(W, Int((r.maxX * Double(W)).rounded(.up)))
    let y1 = min(H, Int((r.maxY * Double(H)).rounded(.up)))
    let bw = x1 - x0, bh = y1 - y0
    guard bw >= 3, bh >= 3 else { return Result(light: "unknown", conf: 0) }

    CVPixelBufferLockBaseAddress(pb, .readOnly)
    defer { CVPixelBufferUnlockBaseAddress(pb, .readOnly) }
    guard let base = CVPixelBufferGetBaseAddress(pb) else { return Result(light: "unknown", conf: 0) }
    let bpr = CVPixelBufferGetBytesPerRow(pb)
    let p = base.assumingMemoryBound(to: UInt8.self)

    // ≤ 24 × 48 samples regardless of box size.
    let sx = max(1, bw / 24), sy = max(1, bh / 48)

    enum Housing { case vertical, horizontal, square }
    let housing: Housing = Double(bh) >= 1.3 * Double(bw) ? .vertical
      : (Double(bw) >= 1.3 * Double(bh) ? .horizontal : .square)
    let offWeight: Double = housing == .vertical ? 0.3 : (housing == .square ? 0.6 : 1.0)

    var score = [0.0, 0.0, 0.0]  // red, amber, green (weighted)
    var raw = [0, 0, 0]
    var samples = 0

    var y = y0
    while y < y1 {
      let row = p + y * bpr
      // Region (0 top/left third, 1 middle, 2 bottom/right) along the housing axis.
      let ry = Double(y - y0) / Double(bh)
      var x = x0
      while x < x1 {
        samples += 1
        let px = row + x * 4
        let b = Int(px[0]), g = Int(px[1]), r = Int(px[2])
        let mx = max(r, max(g, b)), mn = min(r, min(g, b))
        if mx >= minValue {
          let delta = mx - mn
          let sat = Double(delta) / Double(mx)
          if sat >= minSaturation, delta > 0 {
            var hue: Double
            if mx == r { hue = 60 * Double(g - b) / Double(delta) }
            else if mx == g { hue = 60 * (2 + Double(b - r) / Double(delta)) }
            else { hue = 60 * (4 + Double(r - g) / Double(delta)) }
            if hue < 0 { hue += 360 }
            var c = -1
            // Red 330–20°, amber 20–52°, green 90–180° (stops before sky blue ≈ 195–215°).
            if hue >= 330 || hue < 20 { c = 0 }
            else if hue < 52 { c = 1 }
            else if hue >= 90 && hue < 180 { c = 2 }
            if c >= 0 {
              let pos = housing == .horizontal ? -1.0 : ry
              let region = pos < 0 ? c : (pos < 1.0 / 3 ? 0 : (pos < 2.0 / 3 ? 1 : 2))
              // Lit lamps are both saturated and the brightest thing in the crop:
              // weight by saturation × value² so dull paint/backplates count less.
              let v = Double(mx) / 255
              score[c] += (region == c ? 1.0 : offWeight) * sat * v * v
              raw[c] += 1
            }
          }
        }
        x += sx
      }
      y += sy
    }
    guard samples > 0 else { return Result(light: "unknown", conf: 0) }
    let ratios = score.map { $0 / Double(samples) }
    var best = 0
    for i in 1..<3 where ratios[i] > ratios[best] { best = i }
    let sum = ratios.reduce(0, +)
    let share = sum > 0 ? ratios[best] / sum : 0
    let strength = min(1.0, ratios[best] / fullStrengthRatio)
    let conf = share * strength
    if raw[best] < 3 || ratios[best] < minLitRatio || conf < minConfidence {
      return Result(light: "unknown", conf: conf)
    }
    return Result(light: ["red", "yellow", "green"][best], conf: conf)
  }
}
