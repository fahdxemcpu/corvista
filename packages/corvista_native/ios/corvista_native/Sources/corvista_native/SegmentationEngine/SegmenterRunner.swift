import CoreML
import CoreVideo
import Foundation
import ImageIO
import Vision

// Platform-neutral (CoreML + Vision). Shared with tools/model_eval.

/// DETR semantic segmenter. Not thread-safe: use from a single serial queue.
final class SegmenterRunner {
  static let mapSize = 224
  let computeUnits: MLComputeUnits
  private let vnModel: VNCoreMLModel
  private let request: VNCoreMLRequest
  /// nil when the label table matched the model metadata.
  let labelMismatch: String?

  init(url: URL, computeUnits: MLComputeUnits) throws {
    let cfg = MLModelConfiguration()
    cfg.computeUnits = computeUnits
    let model = try MLModel(contentsOf: url, configuration: cfg)
    labelMismatch = SegmentationLabels.verify(model: model)
    self.computeUnits = computeUnits
    vnModel = try VNCoreMLModel(for: model)
    request = VNCoreMLRequest(model: vnModel)
    request.imageCropAndScaleOption = .scaleFill   // class map covers the full frame
  }

  /// Returns a 224×224 row-major class map (values per BRIDGE.md).
  func segment(pixelBuffer: CVPixelBuffer, orientation: CGImagePropertyOrientation = .up) throws -> [UInt8] {
    let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: orientation, options: [:])
    try handler.perform([request])
    guard let fv = (request.results as? [VNCoreMLFeatureValueObservation])?.first?.featureValue.multiArrayValue else {
      throw InferenceError.badOutput("no semanticPredictions")
    }
    return try SegmenterRunner.downsample(fv)
  }

  /// 448×448 Int32 → 224×224 UInt8 using the 2×2 block mode (ties: object class,
  /// then road, then none).
  static func downsample(_ a: MLMultiArray) throws -> [UInt8] {
    guard a.dataType == .int32, a.shape.count >= 2 else { throw InferenceError.badOutput("dtype/shape") }
    let rank = a.shape.count
    let H = a.shape[rank - 2].intValue, W = a.shape[rank - 1].intValue
    let rs = a.strides[rank - 2].intValue, cs = a.strides[rank - 1].intValue
    let outW = W / 2, outH = H / 2
    guard outW > 0, outH > 0 else { throw InferenceError.badOutput("size") }
    let lut = SegmentationLabels.lut
    var out = [UInt8](repeating: 0, count: outW * outH)
    a.withUnsafeBufferPointer(ofType: Int32.self) { src in
      func v(_ y: Int, _ x: Int) -> UInt8 {
        let i = Int(src[y * rs + x * cs])
        return (i >= 0 && i < 256) ? lut[i] : 0
      }
      for oy in 0..<outH {
        let y = oy * 2
        for ox in 0..<outW {
          let x = ox * 2
          let a0 = v(y, x), a1 = v(y, x + 1), a2 = v(y + 1, x), a3 = v(y + 1, x + 1)
          var r: UInt8
          if a0 == a1 || a0 == a2 || a0 == a3 { r = a0 }
          else if a1 == a2 || a1 == a3 { r = a1 }
          else if a2 == a3 { r = a2 }
          else {
            // All different: prefer an object class (1..7), then road.
            r = 0
            for c in [a0, a1, a2, a3] where c >= 1 && c <= 7 { r = c; break }
            if r == 0 { for c in [a0, a1, a2, a3] where c == SegmentationLabels.road { r = c; break } }
          }
          out[oy * outW + ox] = r
        }
      }
    }
    return out
  }
}
