import AVFoundation
import Foundation

// Platform-neutral (AVFoundation). Exercised on macOS by a self-test.

enum IncidentError: Error, LocalizedError {
  case notRunning(String)
  case storageFull
  case io(String)
  case failed(String)

  var code: String {
    switch self {
    case .notRunning: return "not_running"
    case .storageFull: return "storage_full"
    case .io: return "io_error"
    case .failed: return "failed"
    }
  }

  var errorDescription: String? {
    switch self {
    case .notRunning(let s): return s
    case .storageFull: return "Not enough free storage to save the clip"
    case .io(let s): return s
    case .failed(let s): return s
    }
  }
}

struct IncidentMeta {
  let id: String
  var reason: String
  let lat: Double?
  let lon: Double?
  let speed: Double?
  var title: String?
  let createdAt: Date
  /// `file` when the clip was recorded from TEST footage (camera.startFile).
  var source: String = "camera"
  /// `incident` | `emergency` | `test` | `manual` (derived from reason/source unless set).
  var kind: String?
  /// Extra sidecar/result fields (manual parts: part, startedAt, endedAt, sessionId…).
  var extra: [String: Any] = [:]

  var resolvedKind: String {
    if let kind { return kind }
    if reason == "emergency" { return "emergency" }
    if reason == "test" || source == "file" { return "test" }
    return "incident"
  }

  /// TEST footage is never mistaken for a real incident: marked in metadata and title.
  func markedAsTestFootage() -> IncidentMeta {
    var m = self
    m.source = "file"
    if let t = title, !t.isEmpty { if !t.hasPrefix("TEST") { m.title = "TEST · \(t)" } } else { m.title = "TEST footage" }
    return m
  }

  func toMap() -> [String: Any] {
    var m: [String: Any] = ["id": id, "reason": reason, "createdAt": (createdAt.timeIntervalSince1970 * 1000).rounded()]
    if let lat { m["lat"] = lat }
    if let lon { m["lon"] = lon }
    if let speed { m["speed"] = speed }
    if let title { m["title"] = title }
    m["source"] = source
    if source == "file" { m["testFootage"] = true }
    m["kind"] = resolvedKind
    m.merge(extra) { $1 }
    return m
  }
}

enum IncidentExporter {
  /// Composes `segments` (contiguous, same size, oldest first) into one MP4 holding the
  /// last `bufferSeconds`, exports it (passthrough, falling back to a re-encode preset)
  /// to `<id>.mp4.partial`, renames atomically to `<id>.mp4`, validates it and writes a
  /// JPEG thumbnail and a JSON sidecar. Returns the IncidentResult map.
  /// `trimStartSeconds` (manual parts): cut exactly this much from the start instead of
  /// keeping the last `bufferSeconds`.
  static func export(segments: [SegmentInfo], bufferSeconds: Double, meta: IncidentMeta,
                     fallbackPreset: String, trimStartSeconds: Double? = nil) async throws -> [String: Any] {
    guard !segments.isEmpty else { throw IncidentError.notRunning("No buffered footage") }
    ClipStore.writeSidecar(id: meta.id, meta.toMap())

    let composition = AVMutableComposition()
    guard let vTrack = composition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid) else {
      throw IncidentError.failed("Cannot create composition track")
    }
    var aTrack: AVMutableCompositionTrack?
    var cursor = CMTime.zero
    for seg in segments {
      let asset = AVURLAsset(url: seg.url)
      guard let vt = try await asset.loadTracks(withMediaType: .video).first else { continue }
      let vRange = try await vt.load(.timeRange)
      guard vRange.duration.seconds > 0 else { continue }
      try vTrack.insertTimeRange(vRange, of: vt, at: cursor)
      if let at = try await asset.loadTracks(withMediaType: .audio).first {
        let aRange = CMTimeRangeGetIntersection(try await at.load(.timeRange), otherRange: vRange)
        if aRange.duration.seconds > 0 {
          if aTrack == nil {
            aTrack = composition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
          }
          let offset = CMTimeSubtract(aRange.start, vRange.start)
          try aTrack?.insertTimeRange(aRange, of: at, at: CMTimeAdd(cursor, offset))
        }
      }
      cursor = CMTimeAdd(cursor, vRange.duration)
    }
    guard cursor.seconds > 0 else { throw IncidentError.failed("Buffered segments are empty") }
    // Keep only the last bufferSeconds (or trim an exact pre-roll for manual parts).
    let excess = trimStartSeconds.map { min($0, cursor.seconds - 0.6) } ?? (cursor.seconds - bufferSeconds)
    if excess > 0.05 {
      composition.removeTimeRange(CMTimeRange(start: .zero, duration: CMTime(seconds: excess, preferredTimescale: 600)))
    }
    vTrack.preferredTransform = .identity  // frames are already upright

    let partial = ClipStore.partialURL(id: meta.id)
    let final = ClipStore.clipURL(id: meta.id)
    try? FileManager.default.removeItem(at: partial)
    do {
      try await runExport(composition, preset: AVAssetExportPresetPassthrough, to: partial)
    } catch {
      if Self.isOutOfSpace(error) { try? FileManager.default.removeItem(at: partial); throw IncidentError.storageFull }
      try? FileManager.default.removeItem(at: partial)
      do {
        try await runExport(composition, preset: fallbackPreset, to: partial)
      } catch {
        try? FileManager.default.removeItem(at: partial)
        if Self.isOutOfSpace(error) { throw IncidentError.storageFull }
        throw IncidentError.io("Export failed: \(error.localizedDescription)")
      }
    }

    #if DEBUG
    // QA hook: hold the finished .partial so a test can kill the app mid-save.
    if DebugHooks.pauseBeforeRenameMs > 0 {
      try? await Task.sleep(nanoseconds: UInt64(DebugHooks.pauseBeforeRenameMs) * 1_000_000)
    }
    #endif
    // Atomic rename (same directory/volume).
    do {
      try? FileManager.default.removeItem(at: final)
      try FileManager.default.moveItem(at: partial, to: final)
    } catch {
      throw IncidentError.io("Rename failed: \(error.localizedDescription)")
    }
    return try await finalizeClip(id: meta.id, url: final, meta: meta.toMap())
  }

  /// Validates a clip, writes its thumbnail and sidecar, returns the IncidentResult map.
  /// Invalid clips are deleted (they never were a saved clip).
  static func finalizeClip(id: String, url: URL, meta: [String: Any]) async throws -> [String: Any] {
    let probe = try await ClipStore.probe(url)
    guard probe.isValidClip else {
      try? FileManager.default.removeItem(at: url)
      throw IncidentError.failed("Exported clip failed validation (duration \(probe.durationMs) ms, size \(probe.sizeBytes), playable \(probe.playable))")
    }
    let thumb = ClipStore.thumbURL(id: id)
    var thumbPath: Any = NSNull()
    if (try? await ClipStore.thumbnail(video: url, to: thumb, atSeconds: min(1.0, probe.durationMs / 2000))) != nil {
      thumbPath = thumb.path
    }
    var result = meta
    result["id"] = id
    result["path"] = url.path
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

  static func runExport(_ asset: AVAsset, preset: String, to url: URL) async throws {
    guard let s = AVAssetExportSession(asset: asset, presetName: preset) else {
      throw IncidentError.failed("Export preset \(preset) unavailable")
    }
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

  static func isOutOfSpace(_ error: Error) -> Bool {
    let ns = error as NSError
    if ns.domain == NSCocoaErrorDomain && ns.code == NSFileWriteOutOfSpaceError { return true }
    if ns.domain == AVFoundationErrorDomain && ns.code == AVError.diskFull.rawValue { return true }
    if ns.domain == NSPOSIXErrorDomain && ns.code == Int(ENOSPC) { return true }
    if let u = ns.userInfo[NSUnderlyingErrorKey] as? Error { return isOutOfSpace(u) }
    return false
  }
}
