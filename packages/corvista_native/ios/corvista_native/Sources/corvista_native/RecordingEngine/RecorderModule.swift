import Flutter
import Foundation
import UIKit

/// `recorder.*` — rolling buffer + incident clips. See docs/BRIDGE.md.
final class RecorderModule: ChannelModule {
  let prefix = "recorder"
  private let context: ModuleContext
  private let recorder = RollingRecorder.shared

  init(context: ModuleContext) {
    self.context = context
    // Launch-time storage hygiene, after Dart's recover() has had its chance at .partial files.
    DispatchQueue.global(qos: .utility).asyncAfter(deadline: .now() + 20) {
      Task.detached(priority: .utility) { _ = await RollingRecorder.shared.cleanup(includePartials: false) }
    }
  }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    switch method {
    case "configure":
      var r = RollingRecorder.Requested()
      if let p = args.string("profile") {
        guard ["standard", "premium"].contains(p) else { return result(BridgeError.badArgs("profile")) }
        r.profile = p
      }
      if let b = args.double("bufferSeconds") {
        guard b > 0 else { return result(BridgeError.badArgs("bufferSeconds")) }
        r.bufferSeconds = b
      }
      r.audio = args.bool("audio") ?? false
      r.watermark = args.bool("watermark") ?? true
      r.timestamp = args.bool("timestamp") ?? false
      r.timestampFormat = args.string("timestampFormat") ?? "iso"
      r.watermarkText = args.string("watermarkText")
      recorder.configure(r) { result($0) }

    case "status":
      recorder.status { result($0) }

    case "saveIncident":
      let reason = args.string("reason") ?? "manual"
      // 'test' = TEST footage from camera.startFile (also forced natively when source is file).
      guard ["manual", "emergency", "test"].contains(reason) else { return result(BridgeError.badArgs("reason")) }
      let meta = IncidentMeta(id: UUID().uuidString, reason: reason, lat: args.double("lat"), lon: args.double("lon"),
                              speed: args.double("speed"), title: args.string("title"), createdAt: Date())
      recorder.saveIncident(meta: meta) { r in
        switch r {
        case .success(let m): result(m)
        case .failure(let e): result(FlutterError(code: e.code, message: e.localizedDescription, details: nil))
        }
      }

    case "startManual":
      // Manual (continuous) recording on top of the rolling buffer. See docs/BRIDGE.md.
      let pre = args.double("preRollSeconds") ?? 5
      let maxMin = args.double("maxMinutes") ?? 0
      let split = args.double("splitMinutes") ?? 5
      guard pre >= 0, maxMin >= 0, split > 0 else { return result(BridgeError.badArgs("preRollSeconds/maxMinutes/splitMinutes")) }
      recorder.startManual(preRollSeconds: pre, maxMinutes: maxMin, splitMinutes: split,
                           lat: args.double("lat"), lon: args.double("lon"), speed: args.double("speed")) { r in
        switch r {
        case .success(let m): result(m)
        case .failure(let e): result(FlutterError(code: e.code, message: e.localizedDescription, details: nil))
        }
      }

    case "stopManual":
      recorder.stopManual(lat: args.double("lat"), lon: args.double("lon"), speed: args.double("speed")) { result($0) }

    case "clearBuffer":
      recorder.clearBuffer { result(nil) }

    case "recover":
      Task.detached(priority: .utility) { [recorder] in
        let r = await recorder.recover()
        result(r)
      }

    #if DEBUG
    case "debug":
      // QA fault injection, debug builds only:
      // {freeBytes: int|null (null clears), pauseBeforeRenameMs: int}
      if args.keys.contains("freeBytes") {
        DebugHooks.freeBytesOverride = (args["freeBytes"] as? NSNumber)?.int64Value
      }
      if let ms = args.int("pauseBeforeRenameMs") { DebugHooks.pauseBeforeRenameMs = max(0, ms) }
      if args.bool("memoryWarning") == true {
        // Same path as a real warning (UIKit posts this on the main thread).
        DispatchQueue.main.async {
          NotificationCenter.default.post(name: UIApplication.didReceiveMemoryWarningNotification, object: UIApplication.shared)
        }
      }
      result(["freeBytes": DebugHooks.freeBytesOverride.map { NSNumber(value: $0) } ?? NSNull(),
              "pauseBeforeRenameMs": DebugHooks.pauseBeforeRenameMs] as [String: Any])
    #endif

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
