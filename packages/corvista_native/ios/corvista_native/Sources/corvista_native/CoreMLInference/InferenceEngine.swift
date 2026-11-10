import CoreML
import CoreVideo
import Flutter
import Foundation
import QuartzCore

/// Runs detection / segmentation on frames from the shared pipeline.
///
/// * `offer` is called on the capture queue for every frame. It never blocks: a frame
///   is taken only when the detector is idle and the throttle interval has elapsed;
///   otherwise it is dropped.
/// * Detection runs on `detectQueue`, segmentation (DETR) on `segQueue`, so the slow
///   segmenter never delays boxes.
/// * Effective rate = min(maxHz, …) halved at thermal `.serious`/`.critical`;
///   segmentation is skipped at `.critical`.
/// `@unchecked Sendable`: shared state is guarded by `lock`; runners are used on one queue each.
final class InferenceEngine: @unchecked Sendable {
  static let shared = InferenceEngine()

  struct Config {
    var confidence = 0.35
    var iou = 0.45
    var maxHz = 15.0
    var segmentationHz = 4.0
    var paused = false
    var computeUnits: MLComputeUnits = .all
  }

  let detectQueue = DispatchQueue(label: "app.corvista.ai.detect", qos: .userInitiated)
  let segQueue = DispatchQueue(label: "app.corvista.ai.segment", qos: .utility)
  let modelQueue = DispatchQueue(label: "app.corvista.ai.model", qos: .userInitiated)

  private let lock = NSLock()
  // lock-protected
  private var config = Config()
  private var activeId = "none"
  /// Model set the app asked for (`ai.setModel`). Models may be released (drive stop,
  /// background, memory warning) and are reloaded on demand from this.
  private var wantedId = "none"
  private var reloading = false
  /// After a memory warning the segmenter stays unloaded until this time.
  private var segSuppressedUntil: CFTimeInterval = 0
  private var descriptor: ModelDescriptor?
  private var detector: DetectorRunner?
  private var segmenter: SegmenterRunner?
  private var detectBusy = false
  private var segBusy = false
  private var segErrorReported = false
  private var lastDetectStart: CFTimeInterval = 0
  private var lastSegStart: CFTimeInterval = 0
  private var thermal: ProcessInfo.ThermalState = ProcessInfo.processInfo.thermalState
  private var lastInferenceMs = 0.0
  private var lastSegMs: Double?
  private var detectTimes: [CFTimeInterval] = []
  private var perfNote: String?

  private var thermalObserver: NSObjectProtocol?

  private init() {
    thermalObserver = NotificationCenter.default.addObserver(
      forName: ProcessInfo.thermalStateDidChangeNotification, object: nil, queue: nil
    ) { [weak self] _ in self?.thermalChanged() }
  }

  // MARK: - Config

  func configure(_ update: (inout Config) -> Void) -> (unitsChanged: Bool, Config) {
    lock.lock(); defer { lock.unlock() }
    let before = config.computeUnits
    update(&config)
    return (before != config.computeUnits, config)
  }

  var currentConfig: Config { lock.lock(); defer { lock.unlock() }; return config }
  var activeModelId: String { lock.lock(); defer { lock.unlock() }; return wantedId }

  // MARK: - Models

  /// Loads a model set (or `none`). Must run on `modelQueue`. Releases the previous
  /// models before loading so peak memory holds only one set.
  func load(id: String) throws -> Double {
    lock.lock(); wantedId = id; segSuppressedUntil = 0; lock.unlock()
    return try loadSet(id: id, includeSegmenter: true)
  }

  private func loadSet(id: String, includeSegmenter: Bool) throws -> Double {
    let units = currentConfig.computeUnits
    lock.lock()
    detector = nil
    segmenter = nil
    descriptor = nil
    activeId = "none"
    lock.unlock()
    // In-flight inference holds its own strong reference; the old MLModel is freed when it finishes.
    guard id != "none" else { return 0 }
    guard let d = ModelCatalog.descriptor(id: id) else { throw InferenceError.modelMissing(id) }
    let t0 = CACurrentMediaTime()
    var det: DetectorRunner?
    var seg: SegmenterRunner?
    if let f = d.detectorFile {
      guard let url = ResourceLocator.compiledModelURL(named: f) else { throw InferenceError.modelMissing(f) }
      det = try DetectorRunner(url: url, name: d.id, computeUnits: units)
    }
    if includeSegmenter, let f = d.segmenterFile {
      guard let url = ResourceLocator.compiledModelURL(named: f) else { throw InferenceError.modelMissing(f) }
      let s = try SegmenterRunner(url: url, computeUnits: units)
      if let mismatch = s.labelMismatch { throw InferenceError.badOutput("scene labels: \(mismatch)") }
      seg = s
    }
    let ms = (CACurrentMediaTime() - t0) * 1000
    lock.lock()
    detector = det
    segmenter = seg
    descriptor = d
    activeId = d.id
    detectTimes.removeAll()
    lastSegMs = nil
    segErrorReported = false
    lock.unlock()
    return ms
  }

  // MARK: - Release / memory pressure

  /// Drops the loaded models (keeps the wanted id; they reload on the next frame that
  /// needs them). Returns true if anything was loaded.
  @discardableResult
  func releaseModels() -> Bool {
    lock.lock(); defer { lock.unlock() }
    let had = detector != nil || segmenter != nil
    detector = nil
    segmenter = nil
    descriptor = nil
    activeId = "none"
    return had
  }

  /// Memory warning: idle → release everything; in use → drop only the segmenter
  /// (the heaviest model) for 60 s. Returns what was released.
  func handleMemoryWarning() -> [String] {
    let listening = EventHub.shared.isListening(.detections)
    lock.lock(); defer { lock.unlock() }
    if config.paused || !listening {
      guard detector != nil || segmenter != nil else { return [] }
      detector = nil; segmenter = nil; descriptor = nil; activeId = "none"
      return ["models"]
    }
    segSuppressedUntil = CACurrentMediaTime() + 60
    guard segmenter != nil else { return [] }
    segmenter = nil
    lastSegMs = nil
    return ["segmenter"]
  }

  /// Caller holds `lock`. Schedules an async reload of what is wanted but not loaded.
  private func reloadIfNeededLocked(now: CFTimeInterval) {
    guard !reloading, wantedId != "none", let want = ModelCatalog.descriptor(id: wantedId) else { return }
    let needAll = descriptor == nil
    let needSeg = !needAll && want.supportsSegmentation && segmenter == nil && now >= segSuppressedUntil
    guard needAll || needSeg else { return }
    reloading = true
    let id = wantedId
    let withSeg = now >= segSuppressedUntil
    modelQueue.async { [self] in
      lock.lock(); let stillWanted = wantedId == id; lock.unlock()
      if stillWanted {
        if needAll {
          _ = try? loadSet(id: id, includeSegmenter: withSeg)
        } else if let f = want.segmenterFile, let url = ResourceLocator.compiledModelURL(named: f),
                  let s = try? SegmenterRunner(url: url, computeUnits: currentConfig.computeUnits),
                  s.labelMismatch == nil {
          lock.lock(); if wantedId == id, descriptor?.id == id { segmenter = s }; lock.unlock()
        }
      }
      lock.lock(); reloading = false; lock.unlock()
    }
  }

  // MARK: - Frame path

  /// Capture queue. Non-blocking.
  func offer(_ frame: VideoFrame) {
    guard EventHub.shared.isListening(.detections) else { return }
    let now = CACurrentMediaTime()
    lock.lock()
    guard !config.paused else { lock.unlock(); return }
    reloadIfNeededLocked(now: now)
    guard let d = descriptor else { lock.unlock(); return }
    let factor = (thermal == .serious || thermal == .critical) ? 0.5 : 1.0
    let detHz = max(0.5, min(config.maxHz, 30)) * factor
    let segHz = thermal == .critical ? 0 : max(0, min(config.segmentationHz, 15)) * factor
    var runDetect = false, runSeg = false
    let det = detector, seg = segmenter
    let conf = config.confidence, iou = config.iou
    if det != nil, !detectBusy, now - lastDetectStart >= 1 / detHz - 0.002 {
      detectBusy = true; lastDetectStart = now; runDetect = true
    }
    if seg != nil, segHz > 0, !segBusy, now - lastSegStart >= 1 / segHz - 0.002 {
      segBusy = true; lastSegStart = now; runSeg = true
    }
    let modelId = activeId
    lock.unlock()

    let pb = frame.pixelBuffer
    let w = CVPixelBufferGetWidth(pb), h = CVPixelBufferGetHeight(pb)
    if runDetect, let det {
      detectQueue.async { [self] in
        let t0 = CACurrentMediaTime()
        let objects = (try? det.detect(pixelBuffer: pb, confidence: conf, iou: iou)) ?? []
        let ms = (CACurrentMediaTime() - t0) * 1000
        lock.lock()
        detectBusy = false
        lastInferenceMs = ms
        detectTimes.append(t0)
        if detectTimes.count > 30 { detectTimes.removeFirst(detectTimes.count - 30) }
        let hz = measuredHzLocked()
        lock.unlock()
        EventHub.shared.send(.detections, [
          "type": "detections", "ts": Date().timeIntervalSince1970 * 1000, "frameTs": frame.wallMs,
          "w": w, "h": h, "model": modelId, "inferenceMs": round1(ms), "hz": round1(hz),
          "objects": objects.map { $0.toMap() },
        ] as [String: Any])
      }
    }
    if runSeg, let seg {
      segQueue.async { [self] in
        let t0 = CACurrentMediaTime()
        var map: [UInt8]?
        var segError: Error?
        do { map = try seg.segment(pixelBuffer: pb) } catch { segError = error }
        let ms = (CACurrentMediaTime() - t0) * 1000
        lock.lock()
        segBusy = false
        lastSegMs = ms
        let reportError = segError != nil && !segErrorReported
        if reportError { segErrorReported = true }
        lock.unlock()
        if reportError, let segError {
          // Surface once per model load instead of failing silently.
          NSLog("[corvista] segmentation failed: \(segError)")
          EventHub.shared.send(.status, [
            "type": "perf", "note": "segmentation_error",
            "message": segError.localizedDescription,
          ] as [String: Any])
        }
        guard let map else { return }
        EventHub.shared.send(.detections, [
          "type": "segmentation", "ts": Date().timeIntervalSince1970 * 1000, "frameTs": frame.wallMs,
          "w": w, "h": h, "inferenceMs": round1(ms),
          "mapW": SegmenterRunner.mapSize, "mapH": SegmenterRunner.mapSize,
          "classMap": FlutterStandardTypedData(bytes: Data(map)),
        ] as [String: Any])
      }
    }
  }

  private func measuredHzLocked() -> Double {
    guard detectTimes.count >= 2, let first = detectTimes.first, let last = detectTimes.last, last > first else { return 0 }
    // Decay to 0 when inference has stopped.
    if CACurrentMediaTime() - last > 2 { return 0 }
    return Double(detectTimes.count - 1) / (last - first)
  }

  /// Fields for the `{type:'perf'}` status event.
  func perfSnapshot() -> [String: Any] {
    lock.lock(); defer { lock.unlock() }
    var m: [String: Any] = [
      "inferenceMs": round1(lastInferenceMs),
      "detectHz": round1(measuredHzLocked()),
      "thermal": Self.thermalName(thermal),
      "model": activeId,
    ]
    if let s = lastSegMs, segmenter != nil { m["segmentationMs"] = round1(s) }
    if let n = perfNote { m["note"] = n }
    return m
  }

  private func thermalChanged() {
    let t = ProcessInfo.processInfo.thermalState
    lock.lock()
    thermal = t
    switch t {
    case .serious: perfNote = "thermal_serious: inference rate halved"
    case .critical: perfNote = "thermal_critical: inference rate halved, segmentation paused"
    default: perfNote = nil
    }
    var p = perfSnapshotUnlocked()
    lock.unlock()
    p["type"] = "perf"
    p["memoryMB"] = ProcessStats.memoryMB()
    EventHub.shared.send(.status, p)
  }

  private func perfSnapshotUnlocked() -> [String: Any] {
    var m: [String: Any] = ["inferenceMs": round1(lastInferenceMs), "detectHz": round1(measuredHzLocked()),
                            "thermal": Self.thermalName(thermal), "model": activeId]
    if let n = perfNote { m["note"] = n }
    return m
  }

  static func thermalName(_ t: ProcessInfo.ThermalState) -> String {
    switch t {
    case .nominal: return "nominal"
    case .fair: return "fair"
    case .serious: return "serious"
    case .critical: return "critical"
    @unknown default: return "nominal"
    }
  }

  // MARK: - Still-image diagnostics (run on detectQueue to share the request safely)

  func analyze(path: String) throws -> [String: Any] {
    lock.lock()
    let det = detector, cfg = config
    lock.unlock()
    guard let det else { throw EngineError.notRunning("No active detector; call ai.setModel first") }
    let pb = try PixelBufferUtil.loadBGRA(path: path)
    let t0 = CACurrentMediaTime()
    let objects = try det.detect(pixelBuffer: pb, confidence: cfg.confidence, iou: cfg.iou)
    let ms = (CACurrentMediaTime() - t0) * 1000
    return ["width": CVPixelBufferGetWidth(pb), "height": CVPixelBufferGetHeight(pb),
            "inferenceMs": round1(ms), "objects": objects.map { $0.toMap() }]
  }

  func benchmark(path: String, iterations: Int) throws -> [String: Any] {
    lock.lock()
    let det = detector, seg = segmenter, cfg = config, id = activeId
    lock.unlock()
    guard let det else { throw EngineError.notRunning("No active detector; call ai.setModel first") }
    let pb = try PixelBufferUtil.loadBGRA(path: path)
    let n = min(max(iterations, 1), 500)
    _ = try det.detect(pixelBuffer: pb, confidence: cfg.confidence, iou: cfg.iou)  // warm-up
    var times: [Double] = []
    for _ in 0..<n {
      let t0 = CACurrentMediaTime()
      _ = try det.detect(pixelBuffer: pb, confidence: cfg.confidence, iou: cfg.iou)
      times.append((CACurrentMediaTime() - t0) * 1000)
    }
    var out = Self.stats(times)
    out["model"] = id
    out["iterations"] = n
    out["computeUnits"] = ModelCatalog.name(of: det.computeUnits)
    if let seg {
      var segTimes: [Double] = []
      var segError: Error?
      segQueue.sync {
        do {
          _ = try seg.segment(pixelBuffer: pb)
          for _ in 0..<min(n, 20) {
            let t0 = CACurrentMediaTime()
            _ = try seg.segment(pixelBuffer: pb)
            segTimes.append((CACurrentMediaTime() - t0) * 1000)
          }
        } catch { segError = error }
      }
      if let segError { throw segError }
      let s = Self.stats(segTimes)
      out["segmentationMeanMs"] = s["meanMs"]
      out["segmentationP95Ms"] = s["p95Ms"]
    }
    return out
  }

  private static func stats(_ t: [Double]) -> [String: Any] {
    guard !t.isEmpty else { return ["meanMs": 0.0, "p95Ms": 0.0] }
    let sorted = t.sorted()
    let p95 = sorted[min(sorted.count - 1, Int((Double(sorted.count) * 0.95).rounded(.up)) - 1)]
    return ["meanMs": round1(t.reduce(0, +) / Double(t.count)), "p95Ms": round1(p95)]
  }
}

enum EngineError: Error, LocalizedError {
  case notRunning(String)
  var errorDescription: String? {
    switch self { case .notRunning(let s): return s }
  }
}

@inline(__always) func round1(_ v: Double) -> Double { (v * 10).rounded() / 10 }
