import AVFoundation
import Foundation
import ImageIO
import UniformTypeIdentifiers

// Platform-neutral (Foundation + AVFoundation + ImageIO).

/// File layout:
/// * `Application Support/Clips/<uuid>.mp4` + `<uuid>.jpg` + `<uuid>.json` (metadata sidecar).
///   Saved clips are user data: included in backups, never deleted automatically.
/// * `Application Support/Clips/<uuid>.mp4.partial` — export in progress (renamed atomically).
/// * `Caches/CorvistaBuffer/<runId>/seg-*.mp4` — rolling buffer segments of this process
///   (excluded from backup; stale run dirs are removed by `recorder.recover`).
enum ClipStore {
  /// Test hook (macOS self-tests): overrides both roots.
  static var rootOverride: URL?

  static var clipsDir: URL {
    let base = rootOverride ?? (FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first
      ?? URL(fileURLWithPath: NSTemporaryDirectory()))
    let d = base.appendingPathComponent("Clips", isDirectory: true)
    ensureDir(d, excludeFromBackup: false)
    return d
  }

  static var bufferRoot: URL {
    let base = rootOverride ?? (FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
      ?? URL(fileURLWithPath: NSTemporaryDirectory()))
    let d = base.appendingPathComponent("CorvistaBuffer", isDirectory: true)
    ensureDir(d, excludeFromBackup: true)
    return d
  }

  static var thumbnailsCacheDir: URL {
    let base = rootOverride ?? (FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
      ?? URL(fileURLWithPath: NSTemporaryDirectory()))
    let d = base.appendingPathComponent("CorvistaThumbnails", isDirectory: true)
    ensureDir(d, excludeFromBackup: true)
    return d
  }

  static func ensureDir(_ url: URL, excludeFromBackup: Bool) {
    let fm = FileManager.default
    if !fm.fileExists(atPath: url.path) {
      try? fm.createDirectory(at: url, withIntermediateDirectories: true)
    }
    if excludeFromBackup {
      var u = url
      var v = URLResourceValues()
      v.isExcludedFromBackup = true
      try? u.setResourceValues(v)
    }
  }

  static let partialSuffix = ".mp4.partial"

  static func clipURL(id: String) -> URL { clipsDir.appendingPathComponent("\(id).mp4") }
  static func partialURL(id: String) -> URL { clipsDir.appendingPathComponent("\(id)\(partialSuffix)") }
  static func thumbURL(id: String) -> URL { clipsDir.appendingPathComponent("\(id).jpg") }
  static func sidecarURL(id: String) -> URL { clipsDir.appendingPathComponent("\(id).json") }

  /// Clip id for `<dir>/<id>.mp4` or `<dir>/<id>.mp4.partial`.
  static func clipId(of url: URL) -> String {
    let name = url.lastPathComponent
    if name.hasSuffix(partialSuffix) { return String(name.dropLast(partialSuffix.count)) }
    return url.deletingPathExtension().lastPathComponent
  }

  static func isInsideClips(_ url: URL) -> Bool {
    let dir = clipsDir.standardizedFileURL.resolvingSymlinksInPath().path
    let p = url.standardizedFileURL.resolvingSymlinksInPath().path
    return p.hasPrefix(dir + "/")
  }

  // MARK: - Space

  static func freeBytes() -> Int64 {
    #if DEBUG
    if let o = DebugHooks.freeBytesOverride { return o }
    #endif
    let v = try? clipsDir.resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey, .volumeAvailableCapacityKey])
    if let important = v?.volumeAvailableCapacityForImportantUsage, important > 0 { return important }
    return Int64(v?.volumeAvailableCapacity ?? 0)
  }

  static func totalBytes() -> Int64 {
    let v = try? clipsDir.resourceValues(forKeys: [.volumeTotalCapacityKey])
    return Int64(v?.volumeTotalCapacity ?? 0)
  }

  static func size(of url: URL) -> Int64 {
    let fm = FileManager.default
    var isDir: ObjCBool = false
    guard fm.fileExists(atPath: url.path, isDirectory: &isDir) else { return 0 }
    if !isDir.boolValue {
      return Int64((try? url.resourceValues(forKeys: [.fileSizeKey]))?.fileSize ?? 0)
    }
    var total: Int64 = 0
    if let e = fm.enumerator(at: url, includingPropertiesForKeys: [.fileSizeKey, .isRegularFileKey]) {
      for case let f as URL in e {
        let v = try? f.resourceValues(forKeys: [.fileSizeKey, .isRegularFileKey])
        if v?.isRegularFile == true { total += Int64(v?.fileSize ?? 0) }
      }
    }
    return total
  }

  // MARK: - Probe / thumbnail

  struct Probe {
    var durationMs: Double
    var width: Int
    var height: Int
    var hasAudio: Bool
    var sizeBytes: Int64
    var playable: Bool

    var isValidClip: Bool { durationMs > 500 && sizeBytes > 0 && playable }

    func toMap() -> [String: Any] {
      ["durationMs": durationMs, "width": width, "height": height, "hasAudio": hasAudio,
       "sizeBytes": sizeBytes, "playable": playable]
    }
  }

  static func asset(for url: URL) -> AVURLAsset {
    // `.partial` files have no recognizable extension; tell AVFoundation they are MP4.
    if url.lastPathComponent.hasSuffix(partialSuffix) {
      return AVURLAsset(url: url, options: [AVURLAssetOverrideMIMETypeKey: "video/mp4"])
    }
    return AVURLAsset(url: url)
  }

  static func probe(_ url: URL) async throws -> Probe {
    let size = Self.size(of: url)
    guard size > 0 else { return Probe(durationMs: 0, width: 0, height: 0, hasAudio: false, sizeBytes: 0, playable: false) }
    let a = asset(for: url)
    let (duration, playable) = try await a.load(.duration, .isPlayable)
    var w = 0, h = 0
    if let vt = try await a.loadTracks(withMediaType: .video).first {
      let (natural, transform) = try await vt.load(.naturalSize, .preferredTransform)
      let r = CGRect(origin: .zero, size: natural).applying(transform)
      w = Int(abs(r.width).rounded()); h = Int(abs(r.height).rounded())
    }
    let hasAudio = !(try await a.loadTracks(withMediaType: .audio)).isEmpty
    let ms = duration.isNumeric ? duration.seconds * 1000 : 0
    return Probe(durationMs: (ms * 10).rounded() / 10, width: w, height: h, hasAudio: hasAudio, sizeBytes: size, playable: playable)
  }

  /// Writes a JPEG frame of `video` to `dest` (atomic replace). Returns `dest`.
  @discardableResult
  static func thumbnail(video: URL, to dest: URL, atSeconds: Double, maxSize: CGFloat = 640) async throws -> URL {
    let gen = AVAssetImageGenerator(asset: asset(for: video))
    gen.appliesPreferredTrackTransform = true
    gen.maximumSize = CGSize(width: maxSize, height: maxSize)
    gen.requestedTimeToleranceBefore = CMTime(seconds: 0.5, preferredTimescale: 600)
    gen.requestedTimeToleranceAfter = CMTime(seconds: 0.5, preferredTimescale: 600)
    let duration = try await gen.asset.load(.duration)
    let t = min(max(0, atSeconds), max(0, duration.seconds - 0.1))
    let (cg, _) = try await gen.image(at: CMTime(seconds: t, preferredTimescale: 600))
    let tmp = dest.deletingLastPathComponent().appendingPathComponent(".\(dest.lastPathComponent).tmp")
    try? FileManager.default.removeItem(at: tmp)
    guard let d = CGImageDestinationCreateWithURL(tmp as CFURL, UTType.jpeg.identifier as CFString, 1, nil) else {
      throw CocoaError(.fileWriteUnknown)
    }
    CGImageDestinationAddImage(d, cg, [kCGImageDestinationLossyCompressionQuality: 0.8] as CFDictionary)
    guard CGImageDestinationFinalize(d) else { throw CocoaError(.fileWriteUnknown) }
    if FileManager.default.fileExists(atPath: dest.path) {
      _ = try FileManager.default.replaceItemAt(dest, withItemAt: tmp)
    } else {
      try FileManager.default.moveItem(at: tmp, to: dest)
    }
    return dest
  }

  // MARK: - Sidecar

  static func writeSidecar(id: String, _ map: [String: Any]) {
    guard JSONSerialization.isValidJSONObject(map),
          let data = try? JSONSerialization.data(withJSONObject: map, options: [.sortedKeys]) else { return }
    try? data.write(to: sidecarURL(id: id), options: .atomic)
  }

  static func readSidecar(id: String) -> [String: Any]? {
    guard let data = try? Data(contentsOf: sidecarURL(id: id)) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
  }
}

#if DEBUG
/// QA-only fault injection (debug builds only; set via `recorder.debug`).
enum DebugHooks {
  private static let lock = NSLock()
  nonisolated(unsafe) private static var _free: Int64?
  nonisolated(unsafe) private static var _pause = 0
  /// Pretend the volume has this many free bytes (low-storage simulation).
  static var freeBytesOverride: Int64? {
    get { lock.lock(); defer { lock.unlock() }; return _free }
    set { lock.lock(); _free = newValue; lock.unlock() }
  }
  /// Sleep this long between writing `<id>.mp4.partial` and renaming it.
  static var pauseBeforeRenameMs: Int {
    get { lock.lock(); defer { lock.unlock() }; return _pause }
    set { lock.lock(); _pause = newValue; lock.unlock() }
  }
}
#endif
