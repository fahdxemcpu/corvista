import CoreLocation
import CryptoKit
import Flutter
import Foundation

/// `media.*` — clip thumbnails, probing, storage accounting, deletion, trimming, Photos export.
final class MediaModule: ChannelModule {
  let prefix = "media"
  private let context: ModuleContext

  init(context: ModuleContext) { self.context = context }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    switch method {
    case "thumbnail":
      guard let path = args.string("path") else { return result(BridgeError.badArgs("path required")) }
      let url = URL(fileURLWithPath: path)
      let at = (args.double("atMs") ?? 1000) / 1000
      Task.detached(priority: .utility) {
        guard FileManager.default.fileExists(atPath: path) else {
          return result(FlutterError(code: "io_error", message: "No such file", details: path))
        }
        let dest: URL
        if ClipStore.isInsideClips(url) {
          dest = ClipStore.thumbURL(id: ClipStore.clipId(of: url))
        } else {
          let digest = SHA256.hash(data: Data("\(url.standardizedFileURL.path)|\(at)".utf8))
          let name = digest.prefix(12).map { String(format: "%02x", $0) }.joined()
          dest = ClipStore.thumbnailsCacheDir.appendingPathComponent("\(name).jpg")
        }
        do {
          try await ClipStore.thumbnail(video: url, to: dest, atSeconds: at)
          result(dest.path)
        } catch {
          result(BridgeError.failure("io_error", error))
        }
      }

    case "probe":
      guard let path = args.string("path") else { return result(BridgeError.badArgs("path required")) }
      Task.detached(priority: .utility) {
        guard FileManager.default.fileExists(atPath: path) else {
          return result(FlutterError(code: "io_error", message: "No such file", details: path))
        }
        do { result(try await ClipStore.probe(URL(fileURLWithPath: path)).toMap()) }
        catch { result(BridgeError.failure("io_error", error)) }
      }

    case "storage":
      DispatchQueue.global(qos: .utility).async {
        result([
          "freeBytes": ClipStore.freeBytes(),
          "totalBytes": ClipStore.totalBytes(),
          "clipsBytes": ClipStore.size(of: ClipStore.clipsDir),
          "bufferBytes": ClipStore.size(of: ClipStore.bufferRoot),
        ])
      }

    case "cleanup":
      Task.detached(priority: .utility) {
        result(await RollingRecorder.shared.cleanup(includePartials: true))
      }

    case "delete":
      guard let path = args.string("path") else { return result(BridgeError.badArgs("path required")) }
      let url = URL(fileURLWithPath: path)
      // Only user clips may be deleted through the bridge.
      guard ClipStore.isInsideClips(url), url.pathExtension == "mp4" else {
        return result(BridgeError.badArgs("Only clips in the app's Clips folder can be deleted"))
      }
      DispatchQueue.global(qos: .utility).async {
        let fm = FileManager.default
        let id = ClipStore.clipId(of: url)
        // Move the clip aside first so a crash never leaves a clip without its files
        // half-deleted; then remove thumbnail, sidecar and the clip.
        let trash = ClipStore.clipsDir.appendingPathComponent(".\(id).deleting")
        do {
          if fm.fileExists(atPath: url.path) { try fm.moveItem(at: url, to: trash) }
        } catch {
          return result(BridgeError.failure("io_error", error))
        }
        try? fm.removeItem(at: ClipStore.thumbURL(id: id))
        try? fm.removeItem(at: ClipStore.sidecarURL(id: id))
        try? fm.removeItem(at: trash)
        result(nil)
      }

    case "trim":
      guard let path = args.string("path"), let startMs = args.double("startMs"), let endMs = args.double("endMs") else {
        return result(BridgeError.badArgs("path, startMs and endMs required"))
      }
      guard startMs >= 0, endMs - startMs >= ClipTrimmer.minDurationMs else {
        return result(BridgeError.badArgs("Range must be at least \(Int(ClipTrimmer.minDurationMs)) ms"))
      }
      // Optional event metadata for the new clip (title, reason, kind, createdAt, lat, lon, speed).
      let overrides = (args["meta"] as? [String: Any]) ?? [:]
      Task.detached(priority: .userInitiated) {
        do {
          result(try await ClipTrimmer.trim(source: URL(fileURLWithPath: path), startMs: startMs,
                                            endMs: endMs, overrides: overrides))
        } catch let e as IncidentError {
          result(FlutterError(code: e.code, message: e.localizedDescription, details: nil))
        } catch {
          result(BridgeError.failure("io_error", error))
        }
      }

    case "saveToPhotos":
      guard let path = args.string("path") else { return result(BridgeError.badArgs("path required")) }
      guard FileManager.default.fileExists(atPath: path) else {
        return result(FlutterError(code: "io_error", message: "No such file", details: path))
      }
      let createdAt = args.double("createdAt").map { Date(timeIntervalSince1970: $0 / 1000) }
      var location: CLLocation?
      if let lat = args.double("lat"), let lon = args.double("lon") {
        location = CLLocation(latitude: lat, longitude: lon)
      }
      let loc = location
      Task.detached(priority: .userInitiated) {
        result(await PhotosSaver.save(video: URL(fileURLWithPath: path), createdAt: createdAt, location: loc))
      }

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
