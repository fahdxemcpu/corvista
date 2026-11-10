import CoreGraphics
import CoreImage
import CoreText
import CoreVideo
import Foundation
import Metal

// Platform-neutral (CoreImage + CoreText + Metal).

/// Burns a watermark and/or timestamp into frames for the recorder, optionally
/// downscaling (e.g. 1080p capture → 720p standard profile). Output buffers come
/// from a CVPixelBufferPool; rendering uses a Metal-backed CIContext with colour
/// management disabled so camera pixels pass through unchanged.
///
/// Not thread-safe: use from the recorder's queue only.
final class BurnInRenderer {
  private let context: CIContext
  private var pool: CVPixelBufferPool?
  private var poolSize = (w: 0, h: 0)

  private var watermarkKey = ""
  private var watermarkImage: CIImage?
  private var timestampKey = ""
  private var timestampImage: CIImage?

  private static let isoFormatter: ISO8601DateFormatter = {
    let f = ISO8601DateFormatter()
    f.formatOptions = [.withInternetDateTime]
    f.timeZone = .current
    return f
  }()
  private static let localFormatter: DateFormatter = {
    let f = DateFormatter()
    f.dateStyle = .medium
    f.timeStyle = .medium
    return f
  }()

  init() {
    let opts: [CIContextOption: Any] = [.workingColorSpace: NSNull(), .outputColorSpace: NSNull(), .cacheIntermediates: false]
    if let dev = MTLCreateSystemDefaultDevice() {
      context = CIContext(mtlDevice: dev, options: opts)
    } else {
      context = CIContext(options: opts)
    }
  }

  /// Frees the output pool, cached text images and CIContext caches (memory pressure / idle).
  func releaseCaches() {
    pool = nil
    poolSize = (0, 0)
    watermarkImage = nil; watermarkKey = ""
    timestampImage = nil; timestampKey = ""
    context.clearCaches()
  }

  var hasPool: Bool { pool != nil }

  func render(source: CVPixelBuffer, outWidth: Int, outHeight: Int,
              watermark: String?, timestamp: Date?, timestampFormat: String) -> CVPixelBuffer? {
    guard let out = makeBuffer(outWidth, outHeight) else { return nil }
    let sw = CVPixelBufferGetWidth(source), sh = CVPixelBufferGetHeight(source)
    var img = CIImage(cvPixelBuffer: source)
    if sw != outWidth || sh != outHeight {
      img = img.transformed(by: CGAffineTransform(scaleX: CGFloat(outWidth) / CGFloat(sw), y: CGFloat(outHeight) / CGFloat(sh)))
    }
    let minSide = CGFloat(min(outWidth, outHeight))
    let margin = (minSide * 0.025).rounded()
    let fontSize = max(12, (minSide * 0.032).rounded())

    if let text = watermark, !text.isEmpty {
      let key = "\(text)|\(fontSize)"
      if key != watermarkKey { watermarkImage = Self.textImage(text, fontSize: fontSize, alpha: 0.75); watermarkKey = key }
      if let wm = watermarkImage {
        let x = CGFloat(outWidth) - wm.extent.width - margin
        img = wm.transformed(by: CGAffineTransform(translationX: x, y: margin)).composited(over: img)
      }
    }
    if let date = timestamp {
      // Re-render the text only when the displayed second changes.
      let key = "\(Int(date.timeIntervalSince1970))|\(timestampFormat)|\(fontSize)"
      if key != timestampKey {
        let s = timestampFormat == "local" ? Self.localFormatter.string(from: date) : Self.isoFormatter.string(from: date)
        timestampImage = Self.textImage(s, fontSize: fontSize, alpha: 0.9)
        timestampKey = key
      }
      if let ts = timestampImage {
        img = ts.transformed(by: CGAffineTransform(translationX: margin, y: margin)).composited(over: img)
      }
    }
    context.render(img, to: out, bounds: CGRect(x: 0, y: 0, width: outWidth, height: outHeight), colorSpace: nil)
    return out
  }

  private func makeBuffer(_ w: Int, _ h: Int) -> CVPixelBuffer? {
    if pool == nil || poolSize.w != w || poolSize.h != h {
      let attrs: [String: Any] = [
        kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA,
        kCVPixelBufferWidthKey as String: w,
        kCVPixelBufferHeightKey as String: h,
        kCVPixelBufferIOSurfacePropertiesKey as String: [String: Any](),
        kCVPixelBufferMetalCompatibilityKey as String: true,
      ]
      var p: CVPixelBufferPool?
      CVPixelBufferPoolCreate(kCFAllocatorDefault, [kCVPixelBufferPoolMinimumBufferCountKey as String: 4] as CFDictionary,
                              attrs as CFDictionary, &p)
      pool = p
      poolSize = (w, h)
    }
    guard let pool else { return nil }
    var pb: CVPixelBuffer?
    CVPixelBufferPoolCreatePixelBuffer(kCFAllocatorDefault, pool, &pb)
    return pb
  }

  /// White text with a dark shadow on a transparent background, via CoreText.
  static func textImage(_ text: String, fontSize: CGFloat, alpha: CGFloat) -> CIImage? {
    let font = CTFontCreateUIFontForLanguage(.emphasizedSystem, fontSize, nil)
      ?? CTFontCreateWithName("Helvetica-Bold" as CFString, fontSize, nil)
    let white = CGColor(red: 1, green: 1, blue: 1, alpha: alpha)
    let attrs: [NSAttributedString.Key: Any] = [
      NSAttributedString.Key(kCTFontAttributeName as String): font,
      NSAttributedString.Key(kCTForegroundColorAttributeName as String): white,
    ]
    let line = CTLineCreateWithAttributedString(NSAttributedString(string: text, attributes: attrs))
    var ascent: CGFloat = 0, descent: CGFloat = 0, leading: CGFloat = 0
    let width = CGFloat(CTLineGetTypographicBounds(line, &ascent, &descent, &leading))
    let pad = (fontSize * 0.25).rounded()
    let w = Int((width + pad * 2).rounded(.up)), h = Int((ascent + descent + pad * 2).rounded(.up))
    guard w > 0, h > 0,
          let ctx = CGContext(data: nil, width: w, height: h, bitsPerComponent: 8, bytesPerRow: 0,
                              space: CGColorSpaceCreateDeviceRGB(),
                              bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue | CGBitmapInfo.byteOrder32Little.rawValue)
    else { return nil }
    ctx.setShadow(offset: CGSize(width: 0, height: -1), blur: fontSize * 0.15, color: CGColor(red: 0, green: 0, blue: 0, alpha: 0.85))
    ctx.textPosition = CGPoint(x: pad, y: pad + descent)
    CTLineDraw(line, ctx)
    guard let cg = ctx.makeImage() else { return nil }
    return CIImage(cgImage: cg)
  }
}
