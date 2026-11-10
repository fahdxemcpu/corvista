import AVFoundation
import Foundation

// Platform-neutral (Foundation + AVFoundation). Exercised on macOS by a harness.

/// Crash journal of a manual (continuous) recording: everything needed to turn the
/// not-yet-exported segments into clip parts after the app was killed. Lives at
/// `<buffer run dir>/manual.json`, rewritten atomically whenever it changes (start,
/// each finished segment, each part cut, each finished export) and deleted when the
/// recording has been fully exported.
struct ManualJournal: Codable {
  struct Segment: Codable {
    var file: String          // file name inside the run directory
    var start: Double         // host-clock seconds
    var end: Double
    var w: Int
    var h: Int
    var audio: Bool
    /// Set when the segment was assigned to a part (export started).
    var partId: String?
    var part: Int?
    /// Host time the assigned part begins at (pre-roll / split boundary).
    var partStart: Double?
  }

  var version = 1
  var sessionId: String
  var startedWallMs: Double
  var startedHost: Double
  var preRollSeconds: Double
  /// Start of the current (unassigned) part, host seconds.
  var partStartHost: Double
  var partIndex: Int
  var lat: Double?
  var lon: Double?
  var speed: Double?
  var source: String
  var maxLongSide: Int
  var segments: [Segment] = []

  static let fileName = "manual.json"

  static func url(in dir: URL) -> URL { dir.appendingPathComponent(fileName) }
  static func exists(in dir: URL) -> Bool { FileManager.default.fileExists(atPath: url(in: dir).path) }

  static func write(_ j: ManualJournal, in dir: URL) {
    guard let data = try? JSONEncoder().encode(j) else { return }
    try? data.write(to: url(in: dir), options: .atomic)
  }

  static func load(in dir: URL) -> ManualJournal? {
    guard let data = try? Data(contentsOf: url(in: dir)) else { return nil }
    return try? JSONDecoder().decode(ManualJournal.self, from: data)
  }

  static func delete(in dir: URL) { try? FileManager.default.removeItem(at: url(in: dir)) }

  func wall(_ host: Double) -> Date {
    Date(timeIntervalSince1970: startedWallMs / 1000 + (host - startedHost))
  }

  /// Exports what a killed process left behind in `dir` as `kind:'manual'` parts.
  /// Parts already finalized (clip or `.partial` present — `.partial`s are handled
  /// by the regular recovery) are skipped; segments that are not playable (the
  /// truncated one being written at the kill) are dropped. Returns IncidentResult
  /// maps flagged `recovered: true, recoveredAfterCrash: true`. Does not delete `dir`.
  static func recover(dir: URL) async -> [[String: Any]] {
    guard var j = load(in: dir) else { return [] }
    let fm = FileManager.default
    // Groups in timeline order: assigned parts by id, then the open (unassigned) part.
    var order: [String] = []
    var groups: [String: [Segment]] = [:]
    for s in j.segments.sorted(by: { $0.start < $1.start }) {
      let key = s.partId ?? "open"
      if groups[key] == nil { order.append(key) }
      groups[key, default: []].append(s)
    }
    var out: [[String: Any]] = []
    var nextIndex = j.partIndex
    for key in order {
      guard let segs = groups[key], let firstSeg = segs.first else { continue }
      let assignedId = firstSeg.partId
      if let id = assignedId,
         fm.fileExists(atPath: ClipStore.clipURL(id: id).path) || fm.fileExists(atPath: ClipStore.partialURL(id: id).path) {
        continue
      }
      var valid: [SegmentInfo] = []
      for s in segs {
        let u = dir.appendingPathComponent(s.file)
        guard fm.fileExists(atPath: u.path) else { continue }
        let asset = AVURLAsset(url: u)
        guard let info = try? await asset.load(.duration, .isPlayable), info.1, info.0.seconds > 0.1,
              let vt = try? await asset.loadTracks(withMediaType: .video).first,
              (try? await vt.load(.timeRange)).map({ $0.duration.seconds > 0.1 }) == true
        else { continue }
        valid.append(SegmentInfo(url: u, start: CMTime(seconds: s.start, preferredTimescale: 1_000_000_000),
                                 end: CMTime(seconds: s.end, preferredTimescale: 1_000_000_000),
                                 width: s.w, height: s.h, hasAudio: s.audio))
      }
      guard let first = valid.first, let last = valid.last else { continue }
      let partStart = firstSeg.partStart ?? j.partStartHost
      let begin = max(partStart, first.start.seconds)
      let trim = max(0, partStart - first.start.seconds)
      guard last.end.seconds - begin >= 0.6 else { continue }
      let partNo = firstSeg.part ?? nextIndex
      nextIndex = max(nextIndex, partNo + 1)
      var meta = IncidentMeta(id: assignedId ?? UUID().uuidString, reason: "recording", lat: j.lat, lon: j.lon,
                              speed: j.speed, title: nil, createdAt: j.wall(begin))
      if j.source == "file" { meta = meta.markedAsTestFootage() }
      meta.kind = "manual"
      meta.extra = [
        "sessionId": j.sessionId, "part": partNo,
        "startedAt": (j.wall(begin).timeIntervalSince1970 * 1000).rounded(),
        "endedAt": (j.wall(last.end.seconds).timeIntervalSince1970 * 1000).rounded(),
        "manualStartedAt": j.startedWallMs.rounded(),
        "recoveredAfterCrash": true,
      ]
      // Idempotent if recovery itself is interrupted: the open part gets its id now.
      if assignedId == nil {
        for i in j.segments.indices where j.segments[i].partId == nil {
          j.segments[i].partId = meta.id
          j.segments[i].part = partNo
          j.segments[i].partStart = partStart
        }
        write(j, in: dir)
      }
      let preset = j.maxLongSide >= 1920 ? AVAssetExportPreset1920x1080 : AVAssetExportPreset1280x720
      do {
        var r = try await IncidentExporter.export(segments: valid, bufferSeconds: .greatestFiniteMagnitude,
                                                  meta: meta, fallbackPreset: preset, trimStartSeconds: trim)
        r["recovered"] = true
        out.append(r)
      } catch {
        try? fm.removeItem(at: ClipStore.partialURL(id: meta.id))
        if !fm.fileExists(atPath: ClipStore.clipURL(id: meta.id).path) {
          try? fm.removeItem(at: ClipStore.sidecarURL(id: meta.id))
        }
        NSLog("[corvista] manual recovery failed for part \(partNo): \(error)")
      }
    }
    return out
  }
}
