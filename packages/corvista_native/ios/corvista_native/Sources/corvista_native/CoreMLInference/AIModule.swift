import CoreML
import Flutter
import Foundation

/// `ai.*` — see docs/BRIDGE.md and docs/MODELS.md.
final class AIModule: ChannelModule {
  let prefix = "ai"
  private let context: ModuleContext
  private let engine = InferenceEngine.shared

  init(context: ModuleContext) { self.context = context }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    switch method {
    case "models":
      DispatchQueue.global(qos: .utility).async { result(Self.models()) }

    case "setModel":
      guard let id = args.string("id") else { return result(BridgeError.badArgs("id required")) }
      guard id == "none" || ModelCatalog.descriptor(id: id) != nil else { return result(BridgeError.badArgs("unknown model \(id)")) }
      engine.modelQueue.async { [engine] in
        do {
          let ms = try engine.load(id: id)
          result(["id": id, "loadMs": round1(ms)])
        } catch {
          result(BridgeError.failure("model_error", error))
        }
      }

    case "configure":
      if let c = args.double("confidence"), !(0...1).contains(c) { return result(BridgeError.badArgs("confidence 0..1")) }
      if let c = args.double("iou"), !(0...1).contains(c) { return result(BridgeError.badArgs("iou 0..1")) }
      var units: MLComputeUnits?
      if let s = args.string("computeUnits") {
        guard let u = ModelCatalog.computeUnits(from: s) else { return result(BridgeError.badArgs("computeUnits")) }
        units = u
      }
      let (unitsChanged, _) = engine.configure { c in
        if let v = args.double("confidence") { c.confidence = v }
        if let v = args.double("iou") { c.iou = v }
        if let v = args.double("maxHz") { c.maxHz = max(0.5, min(v, 30)) }
        if let v = args.double("segmentationHz") { c.segmentationHz = max(0, min(v, 15)) }
        if let v = args.bool("paused") { c.paused = v }
        if let u = units { c.computeUnits = u }
      }
      if unitsChanged {
        // Reload the active set with the new compute units; reply once it is live.
        engine.modelQueue.async { [engine] in
          let id = engine.activeModelId
          do { _ = try engine.load(id: id); result(nil) } catch { result(BridgeError.failure("model_error", error)) }
        }
      } else {
        result(nil)
      }

    case "analyzeImage":
      guard let path = args.string("path") else { return result(BridgeError.badArgs("path required")) }
      engine.detectQueue.async { [engine] in
        do { result(try engine.analyze(path: path)) } catch { result(Self.flutterError(error)) }
      }

    case "benchmark":
      guard let path = args.string("path") else { return result(BridgeError.badArgs("path required")) }
      let n = args.int("iterations") ?? 20
      engine.detectQueue.async { [engine] in
        do { result(try engine.benchmark(path: path, iterations: n)) } catch { result(Self.flutterError(error)) }
      }

    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private static func flutterError(_ e: Error) -> FlutterError {
    if case EngineError.notRunning(let m) = e { return FlutterError(code: "not_running", message: m, details: nil) }
    if case InferenceError.badImage = e { return BridgeError.failure("io_error", e) }
    return BridgeError.failure("model_error", e)
  }

  static func models() -> [[String: Any]] {
    ModelCatalog.all.map { d in
      var size: Int64 = 0
      var installed = true
      for f in d.files {
        if let url = ResourceLocator.compiledModelURL(named: f) { size += ModelCatalog.directorySize(url) } else { installed = false }
      }
      return [
        "id": d.id, "name": d.name, "version": d.version, "installed": installed,
        "sizeBytes": size, "inputSize": d.inputSize,
        "labels": CorvistaClass.allCases.map(\.rawValue),
        "supportsSegmentation": d.supportsSegmentation,
        // License/source stay internal (docs/MODELS.md); the app UI never
        // names the underlying models.
      ]
    }
  }
}
