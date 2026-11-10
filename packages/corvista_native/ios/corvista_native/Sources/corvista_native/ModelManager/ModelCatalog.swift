import CoreML
import Foundation

// Platform-neutral (Foundation + CoreML only) so tools/model_eval can compile it on macOS.

/// Shared object class ids (docs/BRIDGE.md "Object classes").
enum CorvistaClass: Int, CaseIterable {
  case person = 0, bicycle, motorcycle, car, bus, trafficLight, stopSign

  var key: String {
    switch self {
    case .person: return "person"
    case .bicycle: return "bicycle"
    case .motorcycle: return "motorcycle"
    case .car: return "car"
    case .bus: return "bus"
    case .trafficLight: return "trafficLight"
    case .stopSign: return "stopSign"
    }
  }

  /// Detector COCO label (Darknet spelling, e.g. `motorbike`, shared by all bundled detector
  /// pipelines) → class id. Trucks are shown as `car` (vehicle).
  static func fromYOLOLabel(_ label: String) -> CorvistaClass? {
    switch label {
    case "person": return .person
    case "bicycle": return .bicycle
    case "motorbike", "motorcycle": return .motorcycle
    case "car", "truck": return .car
    case "bus": return .bus
    case "traffic light": return .trafficLight
    case "stop sign": return .stopSign
    default: return nil
    }
  }
}

/// DETR panoptic label indices, verified against the compiled model's
/// `com.apple.coreml.model.preview.params` labels list (201 entries):
/// 1 person, 2 bicycle, 3 car, 4 motorcycle, 6 bus, 8 truck, 10 traffic light,
/// 13 stop sign, 149 road, 191 pavement.
enum SegmentationLabels {
  static let labelCount = 201
  static let road: UInt8 = 8

  /// DETR class index → class-map value (0 none, 1..7 = class id + 1, 8 road).
  static let lut: [UInt8] = {
    var t = [UInt8](repeating: 0, count: 256)
    func set(_ i: Int, _ c: CorvistaClass) { t[i] = UInt8(c.rawValue + 1) }
    set(1, .person)
    set(2, .bicycle)
    set(3, .car)
    set(8, .car)        // truck → car
    set(4, .motorcycle)
    set(6, .bus)
    set(10, .trafficLight)
    set(13, .stopSign)
    t[149] = road        // road
    t[191] = road        // pavement
    return t
  }()

  /// Expected names at the indices above, used to verify a model at load time.
  static let expectedNames: [Int: String] = [
    1: "person", 2: "bicycle", 3: "car", 4: "motorcycle", 6: "bus", 8: "truck",
    10: "traffic light", 13: "stop sign", 149: "road", 191: "pavement",
  ]

  /// Returns nil when the model metadata matches our table, else a description of the mismatch.
  static func verify(model: MLModel) -> String? {
    let md = model.modelDescription.metadata[.creatorDefinedKey] as? [String: String]
    guard let json = md?["com.apple.coreml.model.preview.params"],
          let data = json.data(using: .utf8),
          let obj = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
          let labels = obj["labels"] as? [String]
    else { return "labels metadata missing" }
    for (i, name) in expectedNames where i >= labels.count || labels[i] != name {
      return "label \(i) expected '\(name)' got '\(i < labels.count ? labels[i] : "<oob>")'"
    }
    return nil
  }
}

struct ModelDescriptor {
  let id: String
  let name: String
  let version: String
  /// Compiled model base names (`.mlmodelc`), detector first.
  let files: [String]
  let inputSize: Int
  let supportsSegmentation: Bool
  let license: String
  let source: String

  var detectorFile: String? { files.first }
  var segmenterFile: String? { supportsSegmentation ? files.last : nil }
}

enum ModelCatalog {
  // Neutral bundle names: users never see which upstream models ship
  // (provenance is documented in docs/MODELS.md, not in the app).
  static let small = "cv_detect_x"   // YOLOX-S, 640x640, FP16 (Apache-2.0)
  static let large = "cv_detect_xl"  // YOLOX-M, 640x640, FP16 + 8-bit palettized weights (Apache-2.0)
  static let detr = "cv_scene"       // DETR ResNet-50 segmentation F16P8

  static let detectorInputSize = 640

  static let yoloxLicense = "Apache-2.0 (Megvii-BaseDetection/YOLOX code and released COCO weights); COCO annotations CC BY 4.0"
  static let detrLicense = "Apache-2.0 (facebookresearch/detr); COCO annotations CC BY 4.0"
  static let yoloxSource = "github.com/Megvii-BaseDetection/YOLOX (release 0.1.1rc0 weights), converted with tools/model_convert"

  static let all: [ModelDescriptor] = [
    ModelDescriptor(
      id: "efficient", name: "Efficient", version: "", files: [small],
      inputSize: detectorInputSize, supportsSegmentation: false, license: yoloxLicense,
      source: yoloxSource),
    ModelDescriptor(
      id: "enhanced", name: "Enhanced", version: "", files: [large],
      inputSize: detectorInputSize, supportsSegmentation: false, license: yoloxLicense,
      source: yoloxSource),
    // Segmentation runs DETR next to a detector on the same frames, so it uses the
    // fast detector (detector file first).
    ModelDescriptor(
      id: "segmentation", name: "Scene", version: "",
      files: [small, detr], inputSize: detectorInputSize, supportsSegmentation: true,
      license: yoloxLicense + "; " + detrLicense,
      source: yoloxSource + "; github.com/facebookresearch/detr"),
  ]

  static func descriptor(id: String) -> ModelDescriptor? { all.first { $0.id == id } }

  static func computeUnits(from s: String?) -> MLComputeUnits? {
    switch s {
    case "all": return .all
    case "cpuAndNeuralEngine": return .cpuAndNeuralEngine
    case "cpuAndGPU": return .cpuAndGPU
    case "cpuOnly": return .cpuOnly
    default: return nil
    }
  }

  static func name(of units: MLComputeUnits) -> String {
    switch units {
    case .cpuOnly: return "cpuOnly"
    case .cpuAndGPU: return "cpuAndGPU"
    case .cpuAndNeuralEngine: return "cpuAndNeuralEngine"
    default: return "all"
    }
  }

  static func directorySize(_ url: URL) -> Int64 {
    let fm = FileManager.default
    guard let e = fm.enumerator(at: url, includingPropertiesForKeys: [.totalFileAllocatedSizeKey, .fileSizeKey, .isRegularFileKey]) else { return 0 }
    var total: Int64 = 0
    for case let f as URL in e {
      let v = try? f.resourceValues(forKeys: [.fileSizeKey, .isRegularFileKey])
      if v?.isRegularFile == true { total += Int64(v?.fileSize ?? 0) }
    }
    return total
  }
}
