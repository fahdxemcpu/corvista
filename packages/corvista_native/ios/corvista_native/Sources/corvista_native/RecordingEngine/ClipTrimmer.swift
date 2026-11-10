import AVFoundation
import Foundation

// Platform-neutral (AVFoundation).

/// `media.trim` — exports `[startMs, endMs]` of an existing clip as a NEW clip in
/// `Application Support/Clips/` (the source is never modified).
///
/// Same durability rules as incident saves: sidecar first, export to
/// `<id>.mp4.partial` (passthrough + timeRange, falling back to a re-encode
/// preset), atomic rename to `<id>.mp4`, validation, JPEG thumbnail, final sidecar.
/// Returns the IncidentResult map.
enum ClipTrimmer {
  /// Shortest clip a trim may produce (same floor as `ClipStore.Probe.isValidClip`).
  static let minDurationMs = 1000.0

  /// Keys of the source sidecar that describe the file itself, not the event.
  private static let fileKeys = ["id", "path", "thumbnailPath", "durationMs", "width", "height",
                                 "sizeBytes", "hasAudio", "trimmedFrom", "trimStartMs", "trimEndMs"]

  static func trim(source: URL, startMs: Double, endMs: Double,
                   overrides: [String: Any]) async throws -> [String: Any] {
    let fm = FileManager.default
    guard fm.fileExists(atPath: source.path) else { throw IncidentError.io("No such file: \(source.path)") }
    let asset = ClipStore.asset(for: source)
    let duration = try await asset.load(.duration)
    let durMs = duration.isNumeric ? duration.seconds * 1000 : 0
    guard durMs > 0 else { throw IncidentError.failed("Source clip has no duration") }
    let start = min(max(0, startMs), durMs)
    let end = min(max(0, endMs), durMs)
    guard end - start >= minDurationMs else {
      throw IncidentError.failed("Trimmed range is shorter than \(Int(minDurationMs)) ms")
    }

    // Space: proportional share of the source + headroom for the moov atom / re-encode.
    let sourceBytes = Double(ClipStore.size(of: source))
    let needed = Int64(sourceBytes * (end - start) / durMs * 1.2) + 20_000_000
    if ClipStore.freeBytes() < needed { throw IncidentError.storageFull }

    // Event metadata is inherited from the source (location, speed, reason, kind…);
    // explicit overrides from Dart win.
    let sourceId = ClipStore.clipId(of: source)
    var meta: [String: Any] = ClipStore.isInsideClips(source) ? (ClipStore.readSidecar(id: sourceId) ?? [:]) : [:]
    for k in fileKeys { meta.removeValue(forKey: k) }
    for (k, v) in overrides where !(v is NSNull) { meta[k] = v }
    let id = UUID().uuidString
    meta["id"] = id
    meta["trimmedFrom"] = sourceId
    meta["trimStartMs"] = start.rounded()
    meta["trimEndMs"] = end.rounded()
    if meta["reason"] == nil { meta["reason"] = "manual" }
    if meta["createdAt"] == nil { meta["createdAt"] = (Date().timeIntervalSince1970 * 1000).rounded() }
    ClipStore.writeSidecar(id: id, meta)

    let partial = ClipStore.partialURL(id: id)
    let final = ClipStore.clipURL(id: id)
    func discard() {
      try? fm.removeItem(at: partial)
      try? fm.removeItem(at: final)
      try? fm.removeItem(at: ClipStore.sidecarURL(id: id))
    }
    let range = CMTimeRange(start: CMTime(seconds: start / 1000, preferredTimescale: 600),
                            end: CMTime(seconds: end / 1000, preferredTimescale: 600))
    try? fm.removeItem(at: partial)
    do {
      try await export(asset, preset: AVAssetExportPresetPassthrough, range: range, to: partial)
    } catch {
      try? fm.removeItem(at: partial)
      if isOutOfSpace(error) { discard(); throw IncidentError.storageFull }
      do {
        try await export(asset, preset: AVAssetExportPresetHighestQuality, range: range, to: partial)
      } catch {
        discard()
        if isOutOfSpace(error) { throw IncidentError.storageFull }
        throw IncidentError.io("Trim export failed: \(error.localizedDescription)")
      }
    }

    // Atomic rename (same directory/volume).
    do {
      try fm.moveItem(at: partial, to: final)
    } catch {
      discard()
      throw IncidentError.io("Rename failed: \(error.localizedDescription)")
    }

    let probe = try await ClipStore.probe(final)
    guard probe.isValidClip else {
      discard()
      throw IncidentError.failed("Trimmed clip failed validation (duration \(probe.durationMs) ms, size \(probe.sizeBytes))")
    }
    let thumb = ClipStore.thumbURL(id: id)
    var thumbPath: Any = NSNull()
    if (try? await ClipStore.thumbnail(video: final, to: thumb, atSeconds: min(1.0, probe.durationMs / 2000))) != nil {
      thumbPath = thumb.path
    }
    var result = meta
    result["path"] = final.path
    result["thumbnailPath"] = thumbPath
    result["durationMs"] = probe.durationMs
    result["width"] = probe.width
    result["height"] = probe.height
    result["sizeBytes"] = probe.sizeBytes
    result["hasAudio"] = probe.hasAudio
    var sidecar = result
    if sidecar["thumbnailPath"] is NSNull { sidecar.removeValue(forKey: "thumbnailPath") }
    ClipStore.writeSidecar(id: id, sidecar)
    return result
  }

  private static func export(_ asset: AVAsset, preset: String, range: CMTimeRange, to url: URL) async throws {
    guard let s = AVAssetExportSession(asset: asset, presetName: preset) else {
      throw IncidentError.failed("Export preset \(preset) unavailable")
    }
    s.timeRange = range
    s.shouldOptimizeForNetworkUse = true
    if #available(iOS 18.0, macOS 15.0, *) {
      try await s.export(to: url, as: .mp4)
    } else {
      s.outputURL = url
      s.outputFileType = .mp4
      await withCheckedContinuation { (c: CheckedContinuation<Void, Never>) in
        s.exportAsynchronously { c.resume() }
      }
      if s.status != .completed {
        throw s.error ?? IncidentError.failed("Export status \(s.status.rawValue)")
      }
    }
  }

  private static func isOutOfSpace(_ error: Error) -> Bool {
    let ns = error as NSError
    if ns.domain == NSCocoaErrorDomain && ns.code == NSFileWriteOutOfSpaceError { return true }
    if ns.domain == AVFoundationErrorDomain && ns.code == AVError.diskFull.rawValue { return true }
    if ns.domain == NSPOSIXErrorDomain && ns.code == Int(ENOSPC) { return true }
    if let u = ns.userInfo[NSUnderlyingErrorKey] as? Error { return isOutOfSpace(u) }
    return false
  }
}
