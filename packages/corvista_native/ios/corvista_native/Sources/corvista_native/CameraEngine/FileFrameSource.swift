import AVFoundation
import CoreMedia
import Foundation
import QuartzCore

/// Test-mode frame source: decodes a local video with AVAssetReader at real-time
/// pace and hands upright BGRA frames (and the file's audio, if any) to the shared
/// pipeline: preview + inference + the rolling recorder, flagged `source: 'file'`.
/// The track's preferredTransform is applied by an AVVideoComposition so frames are
/// display-oriented like camera frames.
///
/// Timestamps are mapped onto the host clock (`CACurrentMediaTime` at playback start
/// + file offset) so video and audio share one monotonic timeline across loops and
/// pauses, like camera sample buffers do.
/// `@unchecked Sendable`: `prepare` completes before `start`; flags are lock-guarded.
final class FileFrameSource: @unchecked Sendable {
  typealias Deliver = (CVPixelBuffer, CMTime) -> Void
  typealias DeliverAudio = (CMSampleBuffer) -> Void

  private let url: URL
  private let loop: Bool
  private let deliver: Deliver
  private let deliverAudio: DeliverAudio
  private let onEnd: (Error?) -> Void
  private let queue = DispatchQueue(label: "app.corvista.file.reader", qos: .userInitiated)
  private let lock = NSLock()
  private let pauseCond = NSCondition()
  private var cancelled = false
  private var paused = false

  private var asset: AVURLAsset?
  private var track: AVAssetTrack?
  private var audioTrack: AVAssetTrack?
  private var composition: AVVideoComposition?
  /// True when the track needs no rotation: decode straight to BGRA without a
  /// compositor pass (saves a full-frame GPU copy per frame).
  private var identityTransform = true
  private(set) var size: (width: Int, height: Int) = (0, 0)
  var hasAudio: Bool { audioTrack != nil }

  init(url: URL, loop: Bool, deliver: @escaping Deliver, deliverAudio: @escaping DeliverAudio,
       onEnd: @escaping (Error?) -> Void) {
    self.url = url
    self.loop = loop
    self.deliver = deliver
    self.deliverAudio = deliverAudio
    self.onEnd = onEnd
  }

  private var isCancelled: Bool {
    lock.lock(); defer { lock.unlock() }
    return cancelled
  }

  func prepare() async throws {
    let asset = AVURLAsset(url: url)
    guard let track = try await asset.loadTracks(withMediaType: .video).first else {
      throw NSError(domain: "corvista.file", code: 1, userInfo: [NSLocalizedDescriptionKey: "No video track in \(url.lastPathComponent)"])
    }
    let comp = try await AVVideoComposition.videoComposition(withPropertiesOf: asset)
    identityTransform = (try await track.load(.preferredTransform)).isIdentity
    self.asset = asset
    self.track = track
    self.audioTrack = try await asset.loadTracks(withMediaType: .audio).first
    self.composition = comp
    size = (Int(comp.renderSize.width.rounded()), Int(comp.renderSize.height.rounded()))
  }

  func start() {
    queue.async { [self] in run() }
  }

  func stop() {
    lock.lock(); cancelled = true; lock.unlock()
    pauseCond.lock(); paused = false; pauseCond.broadcast(); pauseCond.unlock()
  }

  /// Background: stop delivering (iOS would interrupt a real camera the same way).
  func setPaused(_ p: Bool) {
    pauseCond.lock(); paused = p; pauseCond.broadcast(); pauseCond.unlock()
  }

  /// Blocks while paused. Returns the paused duration in seconds.
  private func waitIfPaused() -> Double {
    pauseCond.lock(); defer { pauseCond.unlock() }
    guard paused else { return 0 }
    let t = CACurrentMediaTime()
    while paused { pauseCond.wait() }
    return CACurrentMediaTime() - t
  }

  private func run() {
    guard let asset, let track, let composition else { onEnd(nil); return }
    let settings: [String: Any] = [
      kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA,
      kCVPixelBufferIOSurfacePropertiesKey as String: [String: Any](),
    ]
    let audioSettings: [String: Any] = [
      AVFormatIDKey: kAudioFormatLinearPCM,
      AVLinearPCMBitDepthKey: 16,
      AVLinearPCMIsFloatKey: false,
      AVLinearPCMIsBigEndianKey: false,
      AVLinearPCMIsNonInterleaved: false,
    ]
    var finalError: Error?
    // Host-clock time that file time 0 of the current loop maps to.
    var base = CACurrentMediaTime()
    repeat {
      let reader: AVAssetReader
      do { reader = try AVAssetReader(asset: asset) } catch { finalError = error; break }
      let out: AVAssetReaderOutput
      if identityTransform {
        out = AVAssetReaderTrackOutput(track: track, outputSettings: settings)
      } else {
        let c = AVAssetReaderVideoCompositionOutput(videoTracks: [track], videoSettings: settings)
        c.videoComposition = composition
        out = c
      }
      out.alwaysCopiesSampleData = false
      guard reader.canAdd(out) else { break }
      reader.add(out)
      var aOut: AVAssetReaderTrackOutput?
      if let audioTrack {
        let o = AVAssetReaderTrackOutput(track: audioTrack, outputSettings: audioSettings)
        o.alwaysCopiesSampleData = false
        if reader.canAdd(o) { reader.add(o); aOut = o }
      }
      guard reader.startReading() else { finalError = reader.error; break }

      var first: CMTime?
      var lastOffset = 0.0
      var pendingAudio: CMSampleBuffer?
      var audioDone = aOut == nil
      while !isCancelled, let sb = out.copyNextSampleBuffer() {
        guard let pb = CMSampleBufferGetImageBuffer(sb) else { continue }
        let pts = CMSampleBufferGetPresentationTimeStamp(sb)
        if first == nil { first = pts }
        let offset = CMTimeSubtract(pts, first ?? pts).seconds
        lastOffset = offset
        base += waitIfPaused()  // shift the timeline so a pause is not a jump
        let wait = base + offset - CACurrentMediaTime()
        if wait > 0 {
          Thread.sleep(forTimeInterval: wait)
        } else if wait < -0.1 {
          continue  // decoding fell behind: drop to stay real-time
        }
        // Audio up to this video frame (+100 ms), on the same host timeline.
        while !audioDone, let ao = aOut {
          guard let a = pendingAudio ?? ao.copyNextSampleBuffer() else { audioDone = true; break }
          let ap = CMTimeSubtract(CMSampleBufferGetPresentationTimeStamp(a), first ?? .zero).seconds
          if ap > offset + 0.1 { pendingAudio = a; break }
          pendingAudio = nil
          if let r = Self.retimed(a, to: base + ap) { deliverAudio(r) }
        }
        deliver(pb, CMTime(seconds: base + offset, preferredTimescale: 1_000_000_000))
      }
      let completed = reader.status == .completed
      if reader.status == .failed { finalError = reader.error }
      reader.cancelReading()
      if !completed { break }
      // Next loop starts one frame after this loop's last frame.
      base += lastOffset + 1.0 / 30
    } while loop && !isCancelled
    onEnd(isCancelled ? nil : finalError)
  }

  /// Copy of an audio sample buffer re-stamped onto the host timeline.
  private static func retimed(_ sb: CMSampleBuffer, to seconds: Double) -> CMSampleBuffer? {
    let sr = CMSampleBufferGetFormatDescription(sb)
      .flatMap { CMAudioFormatDescriptionGetStreamBasicDescription($0)?.pointee.mSampleRate } ?? 44_100
    let ts = CMTimeScale(sr > 0 ? sr : 44_100)
    var timing = CMSampleTimingInfo(duration: CMTime(value: 1, timescale: ts),
                                    presentationTimeStamp: CMTime(seconds: seconds, preferredTimescale: ts),
                                    decodeTimeStamp: .invalid)
    var out: CMSampleBuffer?
    let st = CMSampleBufferCreateCopyWithNewTiming(allocator: kCFAllocatorDefault, sampleBuffer: sb,
                                                   sampleTimingEntryCount: 1, sampleTimingArray: &timing,
                                                   sampleBufferOut: &out)
    return st == noErr ? out : nil
  }
}
