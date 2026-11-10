import AVFoundation
import CoreMedia
import CoreVideo
import Foundation
import QuartzCore

// Platform-neutral (AVFoundation). Exercised on macOS by a self-test.

struct RecorderSettings: Equatable {
  var bufferSeconds: Double = 20
  /// Output long side (1280 standard, 1920 premium). Larger capture is downscaled.
  var maxLongSide: Int = 1280
  var audio = false
  var watermark = true
  var watermarkText = "Corvista"
  var timestamp = false
  var timestampFormat = "iso"

  var videoBitrate: Int { maxLongSide >= 1920 ? 10_000_000 : 6_000_000 }
}

/// A finished, playable buffer segment.
struct SegmentInfo {
  let url: URL
  let start: CMTime
  let end: CMTime
  let width: Int
  let height: Int
  let hasAudio: Bool
  var duration: Double { CMTimeSubtract(end, start).seconds }
}

/// One ~2 s MP4 being written. Every segment is its own file, so it begins with an
/// IDR keyframe and can be concatenated with AVMutableComposition without re-encoding.
final class SegmentWriter {
  let url: URL
  let writer: AVAssetWriter
  let videoInput: AVAssetWriterInput
  let adaptor: AVAssetWriterInputPixelBufferAdaptor
  let audioInput: AVAssetWriterInput?
  let width: Int
  let height: Int
  let bitrate: Int
  var start: CMTime = .invalid
  var lastVideo: CMTime = .invalid
  var end: CMTime = .invalid
  var frames = 0
  var videoFinished = false
  var hasAudio: Bool { audioInput != nil }

  init(url: URL, width: Int, height: Int, bitrate: Int, audio: Bool) throws {
    self.url = url
    self.width = width
    self.height = height
    self.bitrate = bitrate
    try? FileManager.default.removeItem(at: url)
    writer = try AVAssetWriter(outputURL: url, fileType: .mp4)
    writer.shouldOptimizeForNetworkUse = false
    let video: [String: Any] = [
      AVVideoCodecKey: AVVideoCodecType.h264,
      AVVideoWidthKey: width,
      AVVideoHeightKey: height,
      AVVideoCompressionPropertiesKey: [
        AVVideoAverageBitRateKey: bitrate,
        AVVideoMaxKeyFrameIntervalKey: 30,
        AVVideoMaxKeyFrameIntervalDurationKey: 1.0,
        AVVideoExpectedSourceFrameRateKey: 30,
        AVVideoProfileLevelKey: AVVideoProfileLevelH264HighAutoLevel,
        AVVideoAllowFrameReorderingKey: false,
      ] as [String: Any],
    ]
    videoInput = AVAssetWriterInput(mediaType: .video, outputSettings: video)
    videoInput.expectsMediaDataInRealTime = true
    adaptor = AVAssetWriterInputPixelBufferAdaptor(assetWriterInput: videoInput, sourcePixelBufferAttributes: nil)
    guard writer.canAdd(videoInput) else { throw CocoaError(.fileWriteUnknown) }
    writer.add(videoInput)
    if audio {
      let a = AVAssetWriterInput(mediaType: .audio, outputSettings: [
        AVFormatIDKey: kAudioFormatMPEG4AAC,
        AVSampleRateKey: 44_100,
        AVNumberOfChannelsKey: 1,
        AVEncoderBitRateKey: 64_000,
      ])
      a.expectsMediaDataInRealTime = true
      if writer.canAdd(a) { writer.add(a); audioInput = a } else { audioInput = nil }
    } else {
      audioInput = nil
    }
    // Pre-start: the session (timeline) starts with the first frame.
    guard writer.startWriting() else { throw writer.error ?? CocoaError(.fileWriteUnknown) }
  }

  func cancel() {
    if writer.status == .writing { writer.cancelWriting() }
    try? FileManager.default.removeItem(at: url)
  }
}

/// Disk-backed circular buffer of short MP4 segments.
///
/// All methods must be called on `queue` (the capture queue in the app). Writer
/// completion handlers hop back onto it.
///
/// * Rollover every `segmentDuration` seconds onto a pre-created writer, so no frames
///   are dropped while a new file is opened. The old segment ends exactly at the new
///   segment's first PTS (`endSession`), so segments tile the timeline without gaps.
/// * With audio, the old segment keeps receiving audio until audio PTS passes the
///   boundary (or 0.5 s), then finishes.
/// * A frame-size change (rotation, lens/quality change) closes the segment; the next
///   one uses the new size. Saves only use the trailing run of contiguous segments
///   that share the latest size (see `trailingContiguous`).
final class RollingBuffer {
  let directory: URL
  let queue: DispatchQueue
  var settings = RecorderSettings()
  /// True while audio sample buffers are being captured.
  var audioCaptureActive = false
  var segmentDuration: Double = 2.0
  var onWriterError: ((Error) -> Void)?
  /// Called on `queue` for every segment file that finished writing (manual-recording journal).
  var onSegmentFinished: ((SegmentInfo) -> Void)?

  private(set) var segments: [SegmentInfo] = []
  private(set) var droppedFrames = 0
  // Per-frame cost accounting (reset by `takeTiming`).
  private var tFrames = 0
  private var tAppend = 0.0
  private var tRender = 0.0
  private var tNotReady = 0

  /// Average ms per frame spent in appendVideo / burn-in render since the last call,
  /// plus frames the encoder was not ready for.
  func takeTiming() -> (frames: Int, appendMs: Double, renderMs: Double, notReady: Int) {
    defer { tFrames = 0; tAppend = 0; tRender = 0; tNotReady = 0 }
    guard tFrames > 0 else { return (0, 0, 0, tNotReady) }
    return (tFrames, tAppend * 1000 / Double(tFrames), tRender * 1000 / Double(tFrames), tNotReady)
  }
  private var current: SegmentWriter?
  private var prepared: SegmentWriter?
  private var preparing = false
  private var draining: [SegmentWriter] = []
  private var pins: [URL: Int] = [:]
  /// Manual recording: segments ending after this time are never pruned (they belong to
  /// a manual recording that has not been exported yet). nil = no manual recording.
  var protectFrom: CMTime?
  private var pendingFinalize = 0
  private var waiters: [() -> Void] = []
  private var seq = 0
  private var frameDuration = CMTime(value: 1, timescale: 30)
  private let renderer = BurnInRenderer()
  private let prepQueue = DispatchQueue(label: "app.corvista.recorder.prepare", qos: .userInitiated)

  init(directory: URL, queue: DispatchQueue) {
    self.directory = directory
    self.queue = queue
    ClipStore.ensureDir(directory, excludeFromBackup: true)
  }

  private var wantsAudio: Bool { settings.audio && audioCaptureActive }

  var isRecording: Bool { current != nil }

  func outputSize(sourceWidth w: Int, sourceHeight h: Int) -> (w: Int, h: Int) {
    let long = max(w, h)
    let scale = long > settings.maxLongSide ? Double(settings.maxLongSide) / Double(long) : 1
    func even(_ v: Double) -> Int { max(2, Int((v / 2).rounded()) * 2) }
    return (even(Double(w) * scale), even(Double(h) * scale))
  }

  /// Opens the first segment writer ahead of the first frame (expected source size),
  /// so starting the buffer does not stall the capture queue.
  func prewarm(sourceWidth w: Int, sourceHeight h: Int) {
    guard w > 0, h > 0, current == nil else { return }
    let o = outputSize(sourceWidth: w, sourceHeight: h)
    prepareNext(o.w, o.h)
  }

  // MARK: - Append

  func appendVideo(_ pb: CVPixelBuffer, pts: CMTime, date: Date) {
    let t0 = CACurrentMediaTime()
    tFrames += 1
    defer { tAppend += CACurrentMediaTime() - t0 }
    let sw = CVPixelBufferGetWidth(pb), sh = CVPixelBufferGetHeight(pb)
    let (ow, oh) = outputSize(sourceWidth: sw, sourceHeight: sh)
    finalizeStaleDraining(now: pts)

    if let cur = current {
      if cur.lastVideo.isValid {
        let d = CMTimeSubtract(pts, cur.lastVideo)
        if d.seconds > 0.005 && d.seconds < 0.2 { frameDuration = d }
      }
      if cur.width != ow || cur.height != oh || cur.hasAudio != wantsAudio
          || CMTimeSubtract(pts, cur.start).seconds >= segmentDuration
          || (cur.lastVideo.isValid && CMTimeCompare(pts, cur.lastVideo) <= 0) {
        rollover(at: pts)
      }
    }
    if current == nil {
      guard let seg = takePrepared(ow, oh) ?? makeWriter(ow, oh) else { return }
      seg.writer.startSession(atSourceTime: pts)
      seg.start = pts
      current = seg
      prepareNext(ow, oh)
    }
    guard let cur = current else { return }

    let needsRender = settings.watermark || settings.timestamp || ow != sw || oh != sh
    var buffer = pb
    if needsRender {
      let r0 = CACurrentMediaTime()
      defer { tRender += CACurrentMediaTime() - r0 }
      if let r = renderer.render(source: pb, outWidth: ow, outHeight: oh,
                                 watermark: settings.watermark ? settings.watermarkText : nil,
                                 timestamp: settings.timestamp ? date : nil,
                                 timestampFormat: settings.timestampFormat) {
        buffer = r
      }
    }
    guard cur.videoInput.isReadyForMoreMediaData else { droppedFrames += 1; tNotReady += 1; return }
    if cur.adaptor.append(buffer, withPresentationTime: pts) {
      cur.frames += 1
      cur.lastVideo = pts
    } else {
      failCurrent(cur)
    }
  }

  func appendAudio(_ sb: CMSampleBuffer) {
    let t = CMSampleBufferGetPresentationTimeStamp(sb)
    guard t.isValid else { return }
    var consumed = false
    if !draining.isEmpty {
      for seg in draining where CMTimeCompare(t, seg.end) < 0 {
        if let a = seg.audioInput, a.isReadyForMoreMediaData { a.append(sb) }
        consumed = true
      }
      let done = draining.filter { CMTimeCompare(t, $0.end) >= 0 }
      if !done.isEmpty {
        draining.removeAll { CMTimeCompare(t, $0.end) >= 0 }
        done.forEach(finalize)
      }
    }
    if !consumed, let cur = current, let a = cur.audioInput, cur.start.isValid,
       CMTimeCompare(t, cur.start) >= 0, a.isReadyForMoreMediaData {
      a.append(sb)
    }
  }

  // MARK: - Segment lifecycle

  private func nextURL() -> URL {
    seq += 1
    return directory.appendingPathComponent(String(format: "seg-%06d.mp4", seq))
  }

  private func makeWriter(_ w: Int, _ h: Int) -> SegmentWriter? {
    do {
      return try SegmentWriter(url: nextURL(), width: w, height: h, bitrate: settings.videoBitrate, audio: wantsAudio)
    } catch {
      onWriterError?(error)
      return nil
    }
  }

  private func takePrepared(_ w: Int, _ h: Int) -> SegmentWriter? {
    guard let p = prepared else { return nil }
    prepared = nil
    if p.width == w, p.height == h, p.hasAudio == wantsAudio, p.bitrate == settings.videoBitrate,
       p.writer.status == .writing {
      return p
    }
    p.cancel()
    return nil
  }

  /// Opens the next writer off the capture queue so rollover only swaps pointers.
  private func prepareNext(_ w: Int, _ h: Int) {
    guard !preparing, prepared == nil else { return }
    preparing = true
    let url = nextURL(), bitrate = settings.videoBitrate, audio = wantsAudio
    prepQueue.async { [weak self] in
      let seg = try? SegmentWriter(url: url, width: w, height: h, bitrate: bitrate, audio: audio)
      guard let self else { seg?.cancel(); return }
      self.queue.async {
        self.preparing = false
        if let old = self.prepared { old.cancel() }
        self.prepared = seg
      }
    }
  }

  private func rollover(at boundary: CMTime) {
    guard let old = current else { return }
    current = nil
    if old.frames == 0 { old.cancel(); return }
    var end = boundary
    if CMTimeCompare(end, old.lastVideo) <= 0 { end = CMTimeAdd(old.lastVideo, frameDuration) }
    old.end = end
    old.videoInput.markAsFinished()
    old.videoFinished = true
    if old.audioInput != nil && audioCaptureActive {
      draining.append(old)
    } else {
      finalize(old)
    }
  }

  private func finalizeStaleDraining(now: CMTime) {
    guard !draining.isEmpty else { return }
    let stale = draining.filter { CMTimeSubtract(now, $0.end).seconds > 0.5 }
    guard !stale.isEmpty else { return }
    draining.removeAll { CMTimeSubtract(now, $0.end).seconds > 0.5 }
    stale.forEach(finalize)
  }

  private func failCurrent(_ seg: SegmentWriter) {
    if let e = seg.writer.error { onWriterError?(e) }
    seg.cancel()
    if current === seg { current = nil }
  }

  private func finalize(_ seg: SegmentWriter) {
    guard seg.writer.status == .writing else { seg.cancel(); return }
    pendingFinalize += 1
    seg.writer.endSession(atSourceTime: seg.end)
    if !seg.videoFinished { seg.videoInput.markAsFinished(); seg.videoFinished = true }
    seg.audioInput?.markAsFinished()
    seg.writer.finishWriting { [weak self] in
      guard let self else { return }
      self.queue.async {
        if seg.writer.status == .completed {
          let info = SegmentInfo(url: seg.url, start: seg.start, end: seg.end, width: seg.width,
                                 height: seg.height, hasAudio: seg.hasAudio)
          let i = self.segments.firstIndex { CMTimeCompare($0.start, info.start) > 0 } ?? self.segments.endIndex
          self.segments.insert(info, at: i)
          self.onSegmentFinished?(info)
        } else {
          if let e = seg.writer.error { self.onWriterError?(e) }
          try? FileManager.default.removeItem(at: seg.url)
        }
        self.pendingFinalize -= 1
        self.prune()
        if self.pendingFinalize == 0 {
          let w = self.waiters
          self.waiters.removeAll()
          w.forEach { $0() }
        }
      }
    }
  }

  /// Closes the open segment (ending one frame after its last frame) and all draining
  /// ones; `completion` runs on `queue` once every pending file is finished.
  /// The next appended frame starts a fresh segment.
  func finishAll(completion: (() -> Void)? = nil) {
    if let cur = current {
      current = nil
      if cur.frames == 0 {
        cur.cancel()
      } else {
        cur.end = CMTimeAdd(cur.lastVideo, frameDuration)
        finalize(cur)
      }
    }
    let d = draining
    draining.removeAll()
    d.forEach(finalize)
    if let completion {
      if pendingFinalize == 0 { completion() } else { waiters.append(completion) }
    }
  }

  // MARK: - Retention / save support

  /// Keeps enough finished segments to cover bufferSeconds + one segment; deletes the rest
  /// (oldest first, never a pinned one).
  func prune() {
    let keep = settings.bufferSeconds + segmentDuration
    var total = segments.reduce(0) { $0 + $1.duration }
    while let first = segments.first, total - first.duration >= keep, pins[first.url] == nil,
          !(protectFrom.map { CMTimeCompare(first.end, $0) > 0 } ?? false) {
      try? FileManager.default.removeItem(at: first.url)
      segments.removeFirst()
      total -= first.duration
    }
  }

  /// The newest run of finished segments that are time-contiguous (gap < 0.25 s) and share
  /// the latest segment's dimensions, covering at most ~`maxSeconds` (+ part of one segment).
  /// Largest gap (s) between consecutive segments that still counts as one
  /// continuous history. Under load (thermal throttling, 1080p burn-in) a
  /// rollover can land a few hundred ms late; a dashcam must keep the earlier
  /// footage rather than silently dropping it, so small gaps are tolerated.
  static let maxContiguityGap: Double = 1.0

  func trailingContiguous(maxSeconds: Double) -> [SegmentInfo] {
    guard let last = segments.last else { return [] }
    var out = [last]
    var dur = last.duration
    var i = segments.count - 2
    while i >= 0, dur < maxSeconds {
      let s = segments[i], next = out[0]
      guard s.width == last.width, s.height == last.height,
            abs(CMTimeSubtract(next.start, s.end).seconds) < Self.maxContiguityGap else { break }
      out.insert(s, at: 0)
      dur += s.duration
      i -= 1
    }
    return out
  }

  /// Seconds of saveable footage right now (contiguous finished + open segment), capped.
  var bufferedSeconds: Double {
    var total = 0.0
    var latestDims: (Int, Int)?
    var nextStart: CMTime?
    if let cur = current, cur.start.isValid, cur.lastVideo.isValid {
      total += CMTimeSubtract(cur.lastVideo, cur.start).seconds
      latestDims = (cur.width, cur.height)
      nextStart = cur.start
    }
    for s in segments.reversed() {
      if let d = latestDims, d != (s.width, s.height) { break }
      if let n = nextStart, abs(CMTimeSubtract(n, s.end).seconds) >= Self.maxContiguityGap { break }
      total += s.duration
      latestDims = (s.width, s.height)
      nextStart = s.start
      if total >= settings.bufferSeconds { break }
    }
    return min(total, settings.bufferSeconds)
  }

  var segmentCount: Int { segments.count + (current != nil ? 1 : 0) }
  var currentSize: (w: Int, h: Int)? { current.map { ($0.width, $0.height) } ?? segments.last.map { ($0.width, $0.height) } }

  func pin(_ segs: [SegmentInfo]) { for s in segs { pins[s.url, default: 0] += 1 } }

  func unpin(_ segs: [SegmentInfo]) {
    for s in segs {
      if let n = pins[s.url] { pins[s.url] = n > 1 ? n - 1 : nil }
    }
    prune()
  }

  /// Memory pressure: drop render caches (rebuilt on the next frame).
  func releaseCaches() { renderer.releaseCaches() }

  /// Idle (not recording): release the pre-opened writer and render resources.
  /// Returns what is still retained, for logging.
  func releaseIdleResources() -> [String: Any] {
    if current == nil {
      prepared?.cancel(); prepared = nil
    }
    renderer.releaseCaches()
    return ["openWriters": (current == nil ? 0 : 1) + draining.count + (prepared == nil ? 0 : 1),
            "pendingFinalize": pendingFinalize, "renderPool": renderer.hasPool,
            "bufferSegments": segments.count]
  }

  /// Drops everything (open, prepared, draining and finished segments) except pinned files.
  func clear() {
    current?.cancel(); current = nil
    prepared?.cancel(); prepared = nil
    draining.forEach { $0.cancel() }; draining.removeAll()
    let keep = segments.filter { pins[$0.url] != nil }
    for s in segments where pins[s.url] == nil { try? FileManager.default.removeItem(at: s.url) }
    segments = keep
    droppedFrames = 0
  }
}
