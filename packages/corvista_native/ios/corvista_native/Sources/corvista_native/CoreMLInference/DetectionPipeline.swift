import CoreGraphics
import CoreML
import CoreVideo
import Foundation
import ImageIO
import Vision

// Platform-neutral (CoreML + Vision). Shared with tools/model_eval so the eval
// exercises exactly the post-processing the app ships.

struct Detection {
  var cls: Int
  var conf: Double
  /// Normalized, top-left origin, upright frame.
  var x: Double, y: Double, w: Double, h: Double
  var light: String?
  var lightConf: Double?
  var label: String

  func toMap() -> [String: Any] {
    var m: [String: Any] = ["cls": cls, "conf": conf, "x": x, "y": y, "w": w, "h": h]
    if let light { m["light"] = light; m["lightConf"] = lightConf ?? 0 }
    return m
  }
}

/// Supplies the optional NMS inputs of Apple's YOLOv3 pipelines through
/// `VNCoreMLModel.featureProvider`.
final class ThresholdFeatureProvider: NSObject, MLFeatureProvider {
  let confidence: Double
  let iou: Double
  init(confidence: Double, iou: Double) { self.confidence = confidence; self.iou = iou }
  var featureNames: Set<String> { ["confidenceThreshold", "iouThreshold"] }
  func featureValue(for featureName: String) -> MLFeatureValue? {
    switch featureName {
    case "confidenceThreshold": return MLFeatureValue(double: confidence)
    case "iouThreshold": return MLFeatureValue(double: iou)
    default: return nil
    }
  }
}

enum InferenceError: Error, LocalizedError {
  case modelMissing(String)
  case badOutput(String)
  case badImage(String)
  var errorDescription: String? {
    switch self {
    case .modelMissing(let s): return "Model not found: \(s)"
    case .badOutput(let s): return "Unexpected model output: \(s)"
    case .badImage(let s): return "Cannot read image: \(s)"
    }
  }
}

/// One loaded YOLO detector. Not thread-safe: use from a single serial queue.
final class DetectorRunner {
  let name: String
  let computeUnits: MLComputeUnits
  private(set) var mlModel: MLModel?
  private let vnModel: VNCoreMLModel
  private let request: VNCoreMLRequest
  private var lastConf = -1.0, lastIoU = -1.0

  init(url: URL, name: String, computeUnits: MLComputeUnits) throws {
    let cfg = MLModelConfiguration()
    cfg.computeUnits = computeUnits
    let model = try MLModel(contentsOf: url, configuration: cfg)
    self.mlModel = model
    self.name = name
    self.computeUnits = computeUnits
    vnModel = try VNCoreMLModel(for: model)
    request = VNCoreMLRequest(model: vnModel)
    // scaleFill: boxes map to the full frame (aspect is distorted for 16:9 input; see docs/MODELS.md).
    request.imageCropAndScaleOption = .scaleFill
  }

  /// Runs the detector. Returns only the 7 Corvista classes above `confidence`.
  func detect(pixelBuffer: CVPixelBuffer,
              orientation: CGImagePropertyOrientation = .up,
              confidence: Double, iou: Double,
              classifyLights: Bool = true) throws -> [Detection] {
    if confidence != lastConf || iou != lastIoU {
      vnModel.featureProvider = ThresholdFeatureProvider(confidence: confidence, iou: iou)
      lastConf = confidence; lastIoU = iou
    }
    let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: orientation, options: [:])
    try handler.perform([request])
    guard let obs = request.results as? [VNRecognizedObjectObservation] else { return [] }
    var out: [Detection] = []
    out.reserveCapacity(obs.count)
    for o in obs {
      guard let top = o.labels.first else { continue }
      // `o.confidence` is the box score from the pipeline's NMS (objectness × class);
      // label confidences are re-normalized by Vision to sum to 1, so they are only
      // used to pick the class.
      // The pipeline's box score can marginally exceed 1; clamp to a probability.
      let conf = min(1.0, max(0.0, Double(o.confidence)))
      guard conf >= confidence, let cls = CorvistaClass.fromYOLOLabel(top.identifier) else { continue }
      // Vision: normalized, bottom-left origin → top-left origin.
      let b = o.boundingBox
      let x = clamp01(Double(b.minX)), w = clamp01(Double(b.maxX)) - x
      let yTop = clamp01(1 - Double(b.maxY)), yBot = clamp01(1 - Double(b.minY))
      let h = yBot - yTop
      guard w > 0, h > 0 else { continue }
      var d = Detection(cls: cls.rawValue, conf: conf, x: x, y: yTop, w: w, h: h, label: top.identifier)
      if classifyLights, cls == .trafficLight, orientation == .up {
        let r = TrafficLightClassifier.classify(pixelBuffer: pixelBuffer, box: CGRect(x: x, y: yTop, width: w, height: h))
        d.light = r.light
        d.lightConf = r.conf
      }
      out.append(d)
    }
    return out
  }
}

@inline(__always) func clamp01(_ v: Double) -> Double { min(1, max(0, v)) }

enum PixelBufferUtil {
  /// Loads an image file (EXIF orientation applied) into an IOSurface-backed BGRA buffer.
  static func loadBGRA(path: String, maxDimension: Int = 4096) throws -> CVPixelBuffer {
    let url = URL(fileURLWithPath: path)
    guard let src = CGImageSourceCreateWithURL(url as CFURL, nil) else { throw InferenceError.badImage(path) }
    let opts: [CFString: Any] = [
      kCGImageSourceCreateThumbnailFromImageAlways: true,
      kCGImageSourceCreateThumbnailWithTransform: true,
      kCGImageSourceThumbnailMaxPixelSize: maxDimension,
    ]
    guard let img = CGImageSourceCreateThumbnailAtIndex(src, 0, opts as CFDictionary) else {
      throw InferenceError.badImage(path)
    }
    return try makeBGRA(from: img)
  }

  static func makeBGRA(from img: CGImage) throws -> CVPixelBuffer {
    let w = img.width, h = img.height
    var pb: CVPixelBuffer?
    let attrs: [CFString: Any] = [
      kCVPixelBufferIOSurfacePropertiesKey: [:] as CFDictionary,
      kCVPixelBufferCGImageCompatibilityKey: true,
      kCVPixelBufferCGBitmapContextCompatibilityKey: true,
    ]
    let st = CVPixelBufferCreate(kCFAllocatorDefault, w, h, kCVPixelFormatType_32BGRA, attrs as CFDictionary, &pb)
    guard st == kCVReturnSuccess, let buf = pb else { throw InferenceError.badImage("CVPixelBufferCreate \(st)") }
    CVPixelBufferLockBaseAddress(buf, [])
    defer { CVPixelBufferUnlockBaseAddress(buf, []) }
    guard let ctx = CGContext(
      data: CVPixelBufferGetBaseAddress(buf), width: w, height: h, bitsPerComponent: 8,
      bytesPerRow: CVPixelBufferGetBytesPerRow(buf), space: CGColorSpaceCreateDeviceRGB(),
      bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue | CGBitmapInfo.byteOrder32Little.rawValue)
    else { throw InferenceError.badImage("CGContext") }
    ctx.draw(img, in: CGRect(x: 0, y: 0, width: w, height: h))
    return buf
  }
}
