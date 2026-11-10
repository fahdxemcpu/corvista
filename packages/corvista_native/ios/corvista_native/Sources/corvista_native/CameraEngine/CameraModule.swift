import Flutter
import Foundation

/// `camera.*` — see docs/BRIDGE.md. Frames never cross the channel; the preview is a
/// Flutter external texture fed by the shared CaptureCoordinator.
final class CameraModule: ChannelModule {
  let prefix = "camera"
  private let context: ModuleContext
  private let coordinator = CaptureCoordinator.shared

  init(context: ModuleContext) {
    self.context = context
    // Touch singletons so lifecycle observers are installed early.
    _ = RollingRecorder.shared
    _ = InferenceEngine.shared
    _ = MemoryGuard.shared
  }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    switch method {
    case "start":
      var req = CameraRequest()
      if let t = args.string("deviceType") {
        guard ["wide", "ultraWide", "telephoto"].contains(t) else { return result(BridgeError.badArgs("deviceType")) }
        req.deviceType = t
      }
      if let q = args.string("quality") {
        guard ["hd720", "fhd1080"].contains(q) else { return result(BridgeError.badArgs("quality")) }
        req.quality = q
      }
      if let s = args.string("stabilization") {
        guard ["off", "standard", "cinematic", "auto"].contains(s) else { return result(BridgeError.badArgs("stabilization")) }
        req.stabilization = s
      }
      if let f = args.int("fps") { req.fps = f }
      coordinator.ensureTexture(registry: context.registrar.textures())
      coordinator.start(req, completion: result)

    case "startFile":
      guard let path = args.string("path") else { return result(BridgeError.badArgs("path required")) }
      coordinator.ensureTexture(registry: context.registrar.textures())
      coordinator.startFile(path: path, loop: args.bool("loop") ?? true, completion: result)

    case "stop":
      coordinator.stop { result(nil) }

    case "devices":
      DispatchQueue.global(qos: .userInitiated).async { result(CaptureCoordinator.devices()) }

    case "focus":
      guard let x = args.double("x"), let y = args.double("y") else { return result(BridgeError.badArgs("x, y required")) }
      coordinator.focus(x: x, y: y) { result($0) }

    case "setTorch":
      guard let on = args.bool("on") else { return result(BridgeError.badArgs("on required")) }
      coordinator.setTorch(on) { result($0) }

    case "status":
      result(coordinator.statusPayload())

    default:
      result(FlutterMethodNotImplemented)
    }
  }

  func dispose() {
    coordinator.stop {}
    coordinator.disposeTexture()
  }
}
