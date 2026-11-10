import AVFoundation
import Flutter
import QuartzCore
import UIKit

/// App-level owner of the rolling buffer: tier gating, lifecycle, status events and
/// incident saving. All buffer state lives on `CorvistaQueues.capture` (the same queue
/// that delivers video and audio sample buffers), so the per-frame path takes no locks.
/// `@unchecked Sendable`: mutable state is confined to the capture queue (in-flight ids are lock-guarded).
final class RollingRecorder: @unchecked Sendable {
  static let shared = RollingRecorder()

  struct Requested {
    var profile = "standard"
    var bufferSeconds = 20.0
    var audio = false
    var watermark = true
    var timestamp = false
    var timestampFormat = "iso"
    var watermarkText: String?
  }

  private let queue = CorvistaQueues.capture
  /// Segments of this process live in Caches/CorvistaBuffer/<runId>/.
  let runId = UUID().uuidString
  private let buffer: RollingBuffer

  // capture-queue state
  private var requested = Requested()
  private var profileEffective = "standard"
  private var fallbackReason: String?
  private var active = false
  /// Where buffered frames come from; `.file` = TEST footage (camera.startFile).
  private var source: VideoFrame.Source = .camera
  private var saving = 0
  private var lastError: String?
  private var statusTimer: DispatchSourceTimer?
  private var observers: [NSObjectProtocol] = []
  /// Manual (continuous) recording session; capture-queue confined.
  fileprivate var manual: ManualSession?
  /// Parts written by the current/last manual recording.
  fileprivate var manualFiles = 0
  fileprivate var manualExportTail: Task<Void, Never>?
  /// Crash journal of the manual recording (capture-queue state; written on `journalIO`).
  fileprivate var journal: ManualJournal?
  fileprivate let journalIO = DispatchQueue(label: "app.corvista.recorder.journal", qos: .utility)

  /// Clip ids with an export in progress (recover must not touch their files).
  private let inFlightLock = NSLock()
  private var inFlight = Set<String>()
  private func setInFlight(_ id: String, _ on: Bool) {
    inFlightLock.lock()
    if on { inFlight.insert(id) } else { inFlight.remove(id) }
    inFlightLock.unlock()
  }
  private func isInFlight(_ id: String) -> Bool {
    inFlightLock.lock(); defer { inFlightLock.unlock() }
    return inFlight.contains(id)
  }

  private init() {
    buffer = RollingBuffer(directory: ClipStore.bufferRoot.appendingPathComponent(runId, isDirectory: true),
                           queue: CorvistaQueues.capture)
    buffer.onSegmentFinished = { [weak self] info in self?.journalSegmentFinishedLocked(info) }
    buffer.onWriterError = { [weak self] e in
      self?.lastError = e.localizedDescription
      NSLog("[corvista] segment writer: \(e)")
    }
    let nc = NotificationCenter.default
    // iOS stops capture in the background: close segments cleanly (no background recording).
    observers.append(nc.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: .main) { [weak self] _ in
      self?.finishForLifecycle(name: "corvista.recorder.background")
    })
    observers.append(nc.addObserver(forName: UIApplication.willTerminateNotification, object: nil, queue: .main) { [weak self] _ in
      self?.finishForLifecycle(name: "corvista.recorder.terminate")
    })
    observers.append(nc.addObserver(forName: ProcessInfo.thermalStateDidChangeNotification, object: nil, queue: nil) { [weak self] _ in
      guard let self, ProcessInfo.processInfo.thermalState == .critical else { return }
      self.queue.async { self.stopManualLocked(reason: "thermal", notify: true) }
    })
  }

  private func finishForLifecycle(name: String) {
    let token = BackgroundTask.begin(name)
    queue.async {
      // iOS stops capture in the background: finalize a manual recording first.
      self.stopManualLocked(reason: "background", notify: true)
      self.buffer.finishAll { BackgroundTask.end(token) }
    }
  }

  // MARK: - Camera hooks (any thread)

  func cameraWillStart(source: VideoFrame.Source, expectedSize: (w: Int, h: Int) = (0, 0)) {
    queue.async {
      // Contract: the buffer is kept on disk after camera.stop until clearBuffer or the next start.
      self.buffer.clear()
      self.source = source
      self.active = true
      self.lastError = nil
      self.applyEffectiveLocked()
      self.buffer.prewarm(sourceWidth: expectedSize.w, sourceHeight: expectedSize.h)
      self.startStatusTimer()
    }
  }

  func cameraDidStop(_ completion: @escaping () -> Void) {
    queue.async {
      self.stopManualLocked(reason: "camera_stopped", notify: true)
      let wasActive = self.active
      self.active = false
      self.buffer.finishAll {
        // A new start may have happened meanwhile; only stop the timer if still idle.
        if !self.active { self.stopStatusTimer() }
        if wasActive { EventHub.shared.send(.status, self.statusLocked(event: true)) }
        completion()
        if wasActive && !self.active {
          Task.detached(priority: .utility) { _ = await self.cleanup(includePartials: false) }
        }
      }
    }
  }

  /// Interruption / runtime error: close the open segment so the gap is a segment boundary.
  func discontinuity() {
    queue.async { self.buffer.finishAll() }
  }

  func setAudioCaptureActive(_ on: Bool) {
    queue.async { self.buffer.audioCaptureActive = on }
  }

  // MARK: - Frame path (capture queue)

  func appendVideo(_ frame: VideoFrame) {
    guard active else { return }
    buffer.appendVideo(frame.pixelBuffer, pts: frame.pts, date: Date(timeIntervalSince1970: frame.wallMs / 1000))
  }

  func appendAudio(_ sb: CMSampleBuffer) {
    guard active else { return }
    buffer.appendAudio(sb)
  }

  // MARK: - Configuration

  func configure(_ r: Requested, completion: @escaping ([String: Any]) -> Void) {
    queue.async {
      self.requested = r
      let audio = self.applyEffectiveLocked()
      CaptureCoordinator.shared.setAudioEnabled(audio)
      completion(self.effectiveMapLocked())
    }
  }

  /// Applies the requested config (every feature is free: the profile only picks the
  /// resolution, 720p `standard` / 1080p `premium`). Only the microphone permission can
  /// turn audio off. Returns effective audio.
  @discardableResult
  private func applyEffectiveLocked() -> Bool {
    var reason: String?
    let hd = requested.profile == "premium"
    var s = RecorderSettings()
    s.bufferSeconds = min(max(requested.bufferSeconds, 5), 30)
    s.maxLongSide = hd ? 1920 : 1280
    s.watermark = requested.watermark
    s.timestamp = requested.timestamp
    s.timestampFormat = requested.timestampFormat == "local" ? "local" : "iso"
    let text = requested.watermarkText?.trimmingCharacters(in: .whitespacesAndNewlines)
    s.watermarkText = (text?.isEmpty == false ? text : nil) ?? "Corvista"
    var audio = requested.audio
    // Test footage brings its own audio track; only live capture needs the microphone.
    if audio && source == .camera && AVCaptureDevice.authorizationStatus(for: .audio) != .authorized {
      audio = false
      reason = "microphone_permission"
    }
    s.audio = audio
    if s != buffer.settings {
      // New settings take effect at a segment boundary.
      let bitrateOrSizeChanged = s.maxLongSide != buffer.settings.maxLongSide
      buffer.settings = s
      buffer.finishAll()
      if bitrateOrSizeChanged { buffer.prune() }
    }
    profileEffective = hd ? "premium" : "standard"
    fallbackReason = reason
    return audio
  }

  private func effectiveMapLocked() -> [String: Any] {
    let s = buffer.settings
    let (w, h) = sizeLocked()
    var m: [String: Any] = [
      "profile": profileEffective, "width": w, "height": h,
      "bufferSeconds": Int(s.bufferSeconds), "audio": s.audio, "watermark": s.watermark, "timestamp": s.timestamp,
    ]
    if let fallbackReason { m["fallbackReason"] = fallbackReason }
    m["source"] = source.rawValue
    return m
  }

  private func sizeLocked() -> (Int, Int) {
    if let cs = buffer.currentSize { return cs }
    let f = CaptureCoordinator.shared.frameSize
    if f.w > 0, f.h > 0 { let o = buffer.outputSize(sourceWidth: f.w, sourceHeight: f.h); return (o.w, o.h) }
    let long = buffer.settings.maxLongSide
    return (long, long * 9 / 16)
  }

  // MARK: - Status

  func status(_ completion: @escaping ([String: Any]) -> Void) {
    queue.async { completion(self.statusLocked(event: false)) }
  }

  private func statusLocked(event: Bool) -> [String: Any] {
    let state: String
    if saving > 0 { state = "saving" }
    else if active && lastError != nil && !buffer.isRecording { state = "error" }
    else if active { state = "buffering" }
    else { state = "idle" }
    let (w, h) = sizeLocked()
    var m: [String: Any] = [
      "state": state, "bufferedMs": (buffer.bufferedSeconds * 1000).rounded(),
      "segments": buffer.segmentCount, "width": w, "height": h, "audio": buffer.settings.audio,
    ]
    m["source"] = source.rawValue
    m["recording"] = active
    m["manual"] = manualMapLocked()
    if event { m["type"] = "recorder" }
    if let lastError, state == "error" { m["reason"] = lastError }
    return m
  }

  private func startStatusTimer() {
    guard statusTimer == nil else { return }
    let t = DispatchSource.makeTimerSource(queue: queue)
    t.schedule(deadline: .now() + 1, repeating: 1, leeway: .milliseconds(100))
    t.setEventHandler { [weak self] in
      guard let self else { return }
      self.manualTickLocked()
      var m = self.statusLocked(event: true)
      let t = self.buffer.takeTiming()
      m["appendMs"] = (t.appendMs * 10).rounded() / 10   // avg per frame on the capture queue
      m["renderMs"] = (t.renderMs * 10).rounded() / 10   // of which burn-in / scaling
      m["framesPerSec"] = t.frames
      m["encoderNotReady"] = t.notReady
      m["droppedFrames"] = self.buffer.droppedFrames
      EventHub.shared.send(.status, m)
    }
    t.resume()
    statusTimer = t
  }

  private func stopStatusTimer() {
    statusTimer?.cancel()
    statusTimer = nil
  }

  // MARK: - Memory

  func releaseCaches() {
    queue.async { self.buffer.releaseCaches() }
  }

  /// Releases idle recorder resources (only when not buffering); reports what remains.
  func releaseIdleResources(_ completion: @escaping ([String: Any]) -> Void) {
    queue.async {
      var r: [String: Any] = ["recorderActive": self.active]
      if !self.active { r.merge(self.buffer.releaseIdleResources()) { $1 } } else { self.buffer.releaseCaches() }
      completion(r)
    }
  }

  // MARK: - Storage hygiene

  /// Deletes what nobody needs: buffer dirs of previous processes, orphaned
  /// thumbnails/sidecars and hidden temp files in Clips, cached thumbnails and
  /// temporary (share/GPX) files older than 1 day. With `includePartials`, also runs
  /// `recover()` (valid `.partial` exports are finalized and returned, invalid ones
  /// deleted). Never deletes a saved clip or the current run's buffer.
  func cleanup(includePartials: Bool) async -> [String: Any] {
    let fm = FileManager.default
    let tmp = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
    let roots = [ClipStore.bufferRoot, ClipStore.clipsDir, ClipStore.thumbnailsCacheDir, tmp]
    let before = roots.reduce(Int64(0)) { $0 + ClipStore.size(of: $1) }
    var deleted = 0
    func remove(_ u: URL) { if (try? fm.removeItem(at: u)) != nil { deleted += 1 } }

    if let dirs = try? fm.contentsOfDirectory(at: ClipStore.bufferRoot, includingPropertiesForKeys: nil) {
      for d in dirs where d.lastPathComponent != runId {
        // A manual-recording journal waits for recover() (unless it is a week old).
        if ManualJournal.exists(in: d) {
          let m = (try? ManualJournal.url(in: d).resourceValues(forKeys: [.contentModificationDateKey]))?.contentModificationDate
          if let m, m > Date().addingTimeInterval(-7 * 86_400) { continue }
        }
        remove(d)
      }
    }
    var recovered: [[String: Any]] = []
    if includePartials { recovered = await recover() }
    let files = (try? fm.contentsOfDirectory(at: ClipStore.clipsDir, includingPropertiesForKeys: nil)) ?? []
    for f in files {
      let name = f.lastPathComponent
      if name.hasPrefix("."), name.hasSuffix(".tmp") || name.hasSuffix(".deleting") { remove(f); continue }
      guard ["jpg", "json"].contains(f.pathExtension) else { continue }
      let id = f.deletingPathExtension().lastPathComponent
      if isInFlight(id) { continue }
      if !fm.fileExists(atPath: ClipStore.clipURL(id: id).path),
         !fm.fileExists(atPath: ClipStore.partialURL(id: id).path) { remove(f) }
    }
    let dayAgo = Date().addingTimeInterval(-86_400)
    for dir in [ClipStore.thumbnailsCacheDir, tmp] {
      let items = (try? fm.contentsOfDirectory(at: dir, includingPropertiesForKeys: [.contentModificationDateKey])) ?? []
      for u in items {
        let m = (try? u.resourceValues(forKeys: [.contentModificationDateKey]))?.contentModificationDate ?? Date()
        if m < dayAgo { remove(u) }
      }
    }
    let after = roots.reduce(Int64(0)) { $0 + ClipStore.size(of: $1) }
    let freed = max(0, before - after)
    NSLog("[corvista] storage cleanup: \(deleted) items, \(freed) bytes")
    return ["bytesFreed": freed, "filesDeleted": deleted, "recovered": recovered]
  }

  // MARK: - Clear / save / recover

  func clearBuffer(_ completion: @escaping () -> Void) {
    queue.async {
      self.buffer.clear()
      completion()
    }
  }

  func saveIncident(meta: IncidentMeta, completion: @escaping (Result<[String: Any], IncidentError>) -> Void) {
    queue.async {
      guard self.buffer.isRecording || !self.buffer.segments.isEmpty else {
        completion(.failure(.notRunning(self.active ? "Buffer is still filling; try again in a moment"
                                                    : "Recorder is not buffering")))
        return
      }
      let s = self.buffer.settings
      let needed = Int64(Double(s.videoBitrate + (s.audio ? 64_000 : 0)) / 8 * s.bufferSeconds * 1.25) + 30_000_000
      guard ClipStore.freeBytes() >= needed else {
        completion(.failure(.storageFull))
        return
      }
      self.saving += 1
      self.setInFlight(meta.id, true)
      EventHub.shared.send(.status, self.statusLocked(event: true))
      let token = BackgroundTask.begin("corvista.recorder.save")
      let preset = s.maxLongSide >= 1920 ? AVAssetExportPreset1920x1080 : AVAssetExportPreset1280x720
      var meta = meta
      if self.source == .file { meta = meta.markedAsTestFootage() }
      self.buffer.finishAll {
        let segs = self.buffer.trailingContiguous(maxSeconds: s.bufferSeconds)
        // A clip must be > 0.5 s to validate; say "still filling" instead of failing.
        guard !segs.isEmpty, segs.reduce(0, { $0 + $1.duration }) >= 0.6 else {
          self.saving -= 1
          self.setInFlight(meta.id, false)
          BackgroundTask.end(token)
          completion(.failure(.notRunning("Buffer is still filling; try again in a moment")))
          return
        }
        self.buffer.pin(segs)
        Task.detached(priority: .userInitiated) {
          let r: Result<[String: Any], IncidentError>
          do {
            r = .success(try await IncidentExporter.export(segments: segs, bufferSeconds: s.bufferSeconds,
                                                         meta: meta, fallbackPreset: preset))
          } catch let e as IncidentError {
            r = .failure(e)
          } catch {
            r = .failure(.failed(error.localizedDescription))
          }
          if case .failure = r {
            // Leave no half-written clip behind (a saved clip is never deleted).
            try? FileManager.default.removeItem(at: ClipStore.partialURL(id: meta.id))
            if !FileManager.default.fileExists(atPath: ClipStore.clipURL(id: meta.id).path) {
              try? FileManager.default.removeItem(at: ClipStore.sidecarURL(id: meta.id))
            }
          }
          self.queue.async {
            self.buffer.unpin(segs)
            self.saving -= 1
            self.setInFlight(meta.id, false)
            EventHub.shared.send(.status, self.statusLocked(event: true))
            BackgroundTask.end(token)
            completion(r)
          }
        }
      }
    }
  }

  /// Launch-time recovery: removes stale buffer dirs from previous processes, finalizes
  /// valid `.partial` exports (rename + thumbnail) and deletes invalid ones.
  func recover() async -> [[String: Any]] {
    let fm = FileManager.default
    var out: [[String: Any]] = []
    defer {
      // Previous processes' buffers go only after their manual journals were exported.
      if let dirs = try? fm.contentsOfDirectory(at: ClipStore.bufferRoot, includingPropertiesForKeys: nil) {
        for d in dirs where d.lastPathComponent != runId { try? fm.removeItem(at: d) }
      }
    }
    let files = (try? fm.contentsOfDirectory(at: ClipStore.clipsDir, includingPropertiesForKeys: nil)) ?? []
    for f in files {
      let name = f.lastPathComponent
      if name.hasPrefix("."), name.hasSuffix(".tmp") || name.hasSuffix(".deleting") { try? fm.removeItem(at: f); continue }
      guard name.hasSuffix(ClipStore.partialSuffix) else { continue }
      let id = ClipStore.clipId(of: f)
      if isInFlight(id) { continue }
      let final = ClipStore.clipURL(id: id)
      let probe = try? await ClipStore.probe(f)
      guard let probe, probe.isValidClip, !fm.fileExists(atPath: final.path) else {
        try? fm.removeItem(at: f)
        if !fm.fileExists(atPath: final.path) { try? fm.removeItem(at: ClipStore.sidecarURL(id: id)) }
        continue
      }
      do {
        try fm.moveItem(at: f, to: final)
        var meta = ClipStore.readSidecar(id: id) ?? [:]
        if meta["reason"] == nil { meta["reason"] = "manual" }
        if meta["createdAt"] == nil {
          let created = (try? final.resourceValues(forKeys: [.creationDateKey]))?.creationDate ?? Date()
          meta["createdAt"] = (created.timeIntervalSince1970 * 1000).rounded()
        }
        meta["recovered"] = true
        out.append(try await IncidentExporter.finalizeClip(id: id, url: final, meta: meta))
      } catch {
        NSLog("[corvista] recover \(id): \(error)")
      }
    }
    // Orphan sidecars (no clip, no partial).
    for f in files where f.pathExtension == "json" {
      let id = f.deletingPathExtension().lastPathComponent
      if !isInFlight(id), !fm.fileExists(atPath: ClipStore.clipURL(id: id).path),
         !fm.fileExists(atPath: ClipStore.partialURL(id: id).path) {
        try? fm.removeItem(at: f)
      }
    }
    // Manual recordings interrupted by a kill/crash: export what the journal lists.
    if let dirs = try? fm.contentsOfDirectory(at: ClipStore.bufferRoot, includingPropertiesForKeys: nil) {
      for d in dirs where d.lastPathComponent != runId && ManualJournal.exists(in: d) {
        out += await ManualJournal.recover(dir: d)
      }
    }
    return out
  }
}

/// UIApplication background-task helper usable from any queue.
enum BackgroundTask {
  /// `id` is only read/written on the main thread.
  final class Token: @unchecked Sendable { var id: UIBackgroundTaskIdentifier = .invalid }

  static func begin(_ name: String) -> Token {
    let t = Token()
    let start = {
      t.id = UIApplication.shared.beginBackgroundTask(withName: name) {
        if t.id != .invalid { UIApplication.shared.endBackgroundTask(t.id); t.id = .invalid }
      }
    }
    if Thread.isMainThread { start() } else { DispatchQueue.main.async(execute: start) }
    return t
  }

  static func end(_ t: Token) {
    DispatchQueue.main.async {
      if t.id != .invalid { UIApplication.shared.endBackgroundTask(t.id); t.id = .invalid }
    }
  }
}

// MARK: - Manual (continuous) recording

/// A user-started recording on top of the rolling buffer. Segments from
/// (start − pre-roll) onward are protected from pruning; every `splitSeconds`, on a
/// frame-size change and on stop, the protected run is closed and exported as a clip
/// part (`kind: 'manual'`) through the incident exporter, then released. The incident
/// buffer keeps working meanwhile (Save Incident makes its own clip).
struct ManualSession {
  let id: String
  let startedWall: Date
  let startedHost: CMTime
  let preRollSeconds: Double
  let maxSeconds: Double        // 0 = unlimited
  let splitSeconds: Double
  /// Host time where the current (not yet exported) part begins.
  var partStart: CMTime
  var partIndex = 1
  var splitting = false
  var lat: Double?
  var lon: Double?
  var speed: Double?

  func wall(_ host: CMTime) -> Date {
    startedWall.addingTimeInterval(CMTimeSubtract(host, startedHost).seconds)
  }
}

private struct ManualPartJob {
  let segments: [SegmentInfo]
  let trim: Double
  let meta: IncidentMeta
}

extension RollingRecorder {
  private static var hostNow: CMTime { CMClockGetTime(CMClockGetHostTimeClock()) }

  /// Free space below which a manual recording stops (finalizing what it has).
  private var manualStorageFloor: Int64 {
    let s = buffer.settings
    let perSecond = Double(s.videoBitrate + (s.audio ? 64_000 : 0)) / 8
    return Int64(perSecond * (manual?.splitSeconds ?? 300) * 1.5) + 300_000_000
  }

  // MARK: Public API (any thread)

  func startManual(preRollSeconds: Double, maxMinutes: Double, splitMinutes: Double,
                   lat: Double?, lon: Double?, speed: Double?,
                   completion: @escaping (Result<[String: Any], IncidentError>) -> Void) {
    queue.async {
      guard self.active else { completion(.failure(.notRunning("Camera is not running"))); return }
      if self.manual != nil { completion(.success(self.manualMapLocked())); return }
      guard ClipStore.freeBytes() >= self.manualStorageFloor else { completion(.failure(.storageFull)); return }
      let now = Self.hostNow
      let pre = min(max(preRollSeconds, 0), self.buffer.settings.bufferSeconds)
      #if DEBUG
      let minSplit = 0.25   // QA can force fast part splits
      #else
      let minSplit = 1.0
      #endif
      let split = max(splitMinutes, minSplit) * 60
      let start = CMTimeSubtract(now, CMTime(seconds: pre, preferredTimescale: 600))
      self.manual = ManualSession(
        id: UUID().uuidString, startedWall: Date(), startedHost: now, preRollSeconds: pre,
        maxSeconds: max(0, maxMinutes) * 60, splitSeconds: split, partStart: start,
        lat: lat, lon: lon, speed: speed)
      self.buffer.protectFrom = start
      self.manualFiles = 0
      if let m = self.manual {
        var j = ManualJournal(
          sessionId: m.id, startedWallMs: (m.startedWall.timeIntervalSince1970 * 1000).rounded(),
          startedHost: now.seconds, preRollSeconds: pre, partStartHost: start.seconds, partIndex: 1,
          lat: lat, lon: lon, speed: speed, source: self.source.rawValue,
          maxLongSide: self.buffer.settings.maxLongSide)
        // Pre-roll segments that are already finished.
        for seg in self.buffer.segments where CMTimeCompare(seg.end, start) > 0 {
          j.segments.append(Self.journalEntry(seg))
        }
        self.journal = j
        self.persistJournalLocked()
      }
      let m = self.manualMapLocked()
      EventHub.shared.send(.status, self.statusLocked(event: true))
      completion(.success(m))
    }
  }

  /// Stops and finalizes; `completion` gets the parts exported by this stop.
  func stopManual(lat: Double?, lon: Double?, speed: Double?,
                  completion: @escaping ([String: Any]) -> Void) {
    queue.async {
      if lat != nil || lon != nil { self.manual?.lat = lat; self.manual?.lon = lon; self.manual?.speed = speed }
      guard self.manual != nil else {
        completion(["parts": [Any](), "manual": self.manualMapLocked(), "reason": "not_active"])
        return
      }
      self.stopManualLocked(reason: "user", notify: false) { parts in
        completion(["parts": parts, "manual": self.manualMapLocked(), "reason": "user"])
      }
    }
  }

  // MARK: Capture-queue internals

  func manualMapLocked() -> [String: Any] {
    guard let s = manual else {
      return ["active": false, "files": manualFiles, "elapsedMs": 0]
    }
    let elapsed = max(0, CMTimeSubtract(Self.hostNow, s.startedHost).seconds)
    return [
      "active": true, "id": s.id,
      "startedAt": (s.startedWall.timeIntervalSince1970 * 1000).rounded(),
      "elapsedMs": (elapsed * 1000).rounded(), "files": manualFiles, "part": s.partIndex,
      "preRollSeconds": s.preRollSeconds, "maxMinutes": s.maxSeconds / 60, "splitMinutes": s.splitSeconds / 60,
    ]
  }

  /// 1 Hz from the status timer: auto-stop rules and part splits.
  func manualTickLocked() {
    guard let s = manual else { return }
    let now = Self.hostNow
    if s.maxSeconds > 0, CMTimeSubtract(now, s.startedHost).seconds >= s.maxSeconds {
      stopManualLocked(reason: "max_duration", notify: true); return
    }
    if ClipStore.freeBytes() < manualStorageFloor {
      stopManualLocked(reason: "storage", notify: true); return
    }
    guard !s.splitting else { return }
    let partDims = buffer.segments.last { CMTimeCompare($0.end, s.partStart) > 0 }.map { ($0.width, $0.height) }
    let dimsChanged = partDims != nil && buffer.currentSize.map { $0 != partDims! } == true
    if CMTimeSubtract(now, s.partStart).seconds >= s.splitSeconds || dimsChanged {
      manual?.splitting = true
      buffer.finishAll {
        guard self.manual != nil else { return }   // stopped meanwhile: the stop exports
        let jobs = self.cutPartsLocked()
        self.manual?.splitting = false
        if let m = self.manual { self.buffer.protectFrom = m.partStart }
        self.runManualExports(jobs) { _ in }
      }
    }
  }

  /// Ends the session (if any), exporting everything recorded. Idempotent.
  func stopManualLocked(reason: String, notify: Bool, completion: (([[String: Any]]) -> Void)? = nil) {
    guard manual != nil else { completion?([]); return }
    let token = BackgroundTask.begin("corvista.manual.stop")
    buffer.finishAll {
      let jobs = self.manual != nil ? self.cutPartsLocked() : []
      self.manual = nil
      if jobs.isEmpty { self.journal = nil; self.persistJournalLocked() }   // nothing left to recover
      self.buffer.protectFrom = nil   // exported segments are pinned until written
      self.buffer.prune()
      EventHub.shared.send(.status, self.statusLocked(event: true))
      self.runManualExports(jobs) { parts in
        if notify {
          var m = self.statusLocked(event: true)
          m["note"] = "manual_stopped_\(reason)"
          EventHub.shared.send(.status, m)
        }
        BackgroundTask.end(token)
        completion?(parts)
      }
    }
  }

  /// Splits the finished segments after `partStart` into parts (one per frame size),
  /// pins them, advances `partStart`. Call after `finishAll` completed.
  private func cutPartsLocked() -> [ManualPartJob] {
    guard var s = manual else { return [] }
    var cand = buffer.segments.filter { CMTimeCompare($0.end, s.partStart) > 0 }
    var jobs: [ManualPartJob] = []
    while let first = cand.first {
      let run = Array(cand.prefix { $0.width == first.width && $0.height == first.height })
      cand.removeFirst(run.count)
      guard let last = run.last else { break }
      let begin = CMTimeMaximum(s.partStart, first.start)
      let trim = max(0, CMTimeSubtract(s.partStart, first.start).seconds)
      let total = run.reduce(0) { $0 + $1.duration } - trim
      s.partStart = last.end
      guard total >= 0.6 else { continue }   // too short to be a valid clip
      var meta = IncidentMeta(id: UUID().uuidString, reason: "recording", lat: s.lat, lon: s.lon,
                              speed: s.speed, title: nil, createdAt: s.wall(begin))
      if source == .file { meta = meta.markedAsTestFootage() }
      meta.kind = "manual"
      meta.extra = [
        "sessionId": s.id, "part": s.partIndex,
        "startedAt": (s.wall(begin).timeIntervalSince1970 * 1000).rounded(),
        "endedAt": (s.wall(last.end).timeIntervalSince1970 * 1000).rounded(),
        "manualStartedAt": (s.startedWall.timeIntervalSince1970 * 1000).rounded(),
      ]
      let files = Set(run.map(\.url.lastPathComponent))
      for i in journal?.segments.indices ?? 0..<0 where files.contains(journal!.segments[i].file) {
        journal!.segments[i].partId = meta.id
        journal!.segments[i].part = s.partIndex
        journal!.segments[i].partStart = begin.seconds
      }
      s.partIndex += 1
      buffer.pin(run)
      jobs.append(ManualPartJob(segments: run, trim: trim, meta: meta))
    }
    manual = s
    if journal != nil {
      journal!.partStartHost = s.partStart.seconds
      journal!.partIndex = s.partIndex
      // Unassigned leftovers before the new part start (too short to export) are dropped.
      journal!.segments.removeAll { $0.partId == nil && $0.end <= s.partStart.seconds + 0.001 }
      persistJournalLocked()
    }
    return jobs
  }

  // MARK: Crash journal

  static func journalEntry(_ seg: SegmentInfo) -> ManualJournal.Segment {
    ManualJournal.Segment(file: seg.url.lastPathComponent, start: seg.start.seconds, end: seg.end.seconds,
                          w: seg.width, h: seg.height, audio: seg.hasAudio)
  }

  /// Every finished segment of an active manual recording goes into the journal.
  func journalSegmentFinishedLocked(_ seg: SegmentInfo) {
    guard manual != nil, var j = journal, seg.end.seconds > j.partStartHost,
          !j.segments.contains(where: { $0.file == seg.url.lastPathComponent }) else { return }
    j.segments.append(Self.journalEntry(seg))
    journal = j
    persistJournalLocked()
  }

  /// Atomic write of the current journal (or deletion when nil), in order, off the capture queue.
  func persistJournalLocked() {
    let snapshot = journal, dir = buffer.directory
    journalIO.async {
      if let snapshot { ManualJournal.write(snapshot, in: dir) } else { ManualJournal.delete(in: dir) }
    }
  }

  /// Exports parts one after another (never two manual exports at once), emitting
  /// `{type:'recorder', event:'manual_part', part}` per finished clip.
  private func runManualExports(_ jobs: [ManualPartJob], completion: @escaping ([[String: Any]]) -> Void) {
    guard !jobs.isEmpty else { completion([]); return }
    let prev = manualExportTail
    let preset = buffer.settings.maxLongSide >= 1920 ? AVAssetExportPreset1920x1080 : AVAssetExportPreset1280x720
    // Not counted in `saving`: Save Incident must stay available during manual recording.
    manualExportTail = Task.detached(priority: .utility) {
      await prev?.value
      var results: [[String: Any]] = []
      for j in jobs {
        self.setInFlight(j.meta.id, true)
        do {
          let r = try await IncidentExporter.export(segments: j.segments, bufferSeconds: .greatestFiniteMagnitude,
                                                    meta: j.meta, fallbackPreset: preset, trimStartSeconds: j.trim)
          results.append(r)
          EventHub.shared.send(.status, ["type": "recorder", "event": "manual_part", "part": r])
        } catch {
          let code = (error as? IncidentError)?.code ?? "failed"
          try? FileManager.default.removeItem(at: ClipStore.partialURL(id: j.meta.id))
          if !FileManager.default.fileExists(atPath: ClipStore.clipURL(id: j.meta.id).path) {
            try? FileManager.default.removeItem(at: ClipStore.sidecarURL(id: j.meta.id))
          }
          EventHub.shared.send(.status, ["type": "recorder", "event": "manual_part_failed", "code": code,
                                         "message": error.localizedDescription])
        }
        self.setInFlight(j.meta.id, false)
      }
      self.queue.async {
        for j in jobs { self.buffer.unpin(j.segments) }
        if self.journal != nil {
          let done = Set(jobs.map(\.meta.id))
          self.journal!.segments.removeAll { $0.partId.map(done.contains) ?? false }
          if self.manual == nil { self.journal = nil }   // recording fully exported
          self.persistJournalLocked()
        }
        self.manualFiles += results.count
        completion(results)
      }
    }
  }
}
