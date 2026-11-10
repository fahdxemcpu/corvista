import AVFoundation
import Flutter
import Foundation
import os

/// `audio.*`: generated proximity beeps and alert tones (AVAudioEngine + AVAudioSourceNode).
/// Tones are synthesised sine waves with ~5 ms attack/release envelopes (no clicks) and mix
/// with other audio. Priority: emergency alarm > chime > proximity pattern.
final class AudioModule: ChannelModule {
  let prefix = "audio"
  private let context: ModuleContext

  private let engine = AVAudioEngine()
  private var sourceNode: AVAudioSourceNode?
  private let generator = ToneGenerator()
  private var configObserver: NSObjectProtocol?

  // State — main thread only.
  private var proximityLevel = 0
  private var proximityVolume: Double = 0.8
  private var alarmVolume: Double?
  private var chimeVolume: Double?
  private var chimeWork: DispatchWorkItem?
  private var stopWork: DispatchWorkItem?
  private var sessionClient: AudioSessionCoordinator.Client?

  init(context: ModuleContext) {
    self.context = context
    configObserver = NotificationCenter.default.addObserver(
      forName: .AVAudioEngineConfigurationChange, object: engine, queue: .main
    ) { [weak self] _ in
      // Route/format changed (e.g. headphones, CarPlay); restart if we should be audible.
      guard let self else { return }
      self.rebuildGraph()
      self.reevaluate()
    }
  }

  func dispose() {
    UIKitHelpers.onMain {
      self.alarmVolume = nil
      self.chimeVolume = nil
      self.proximityLevel = 0
      self.stopEngine()
      if let o = self.configObserver { NotificationCenter.default.removeObserver(o) }
    }
  }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    UIKitHelpers.onMain { [self] in
      switch method {
      case "proximity":
        guard let level = args.int("level"), (0...3).contains(level) else {
          result(BridgeError.badArgs("level must be 0..3")); return
        }
        self.proximityLevel = level
        self.proximityVolume = Self.clamp(args.double("volume") ?? 0.8)
        result(self.reevaluate())
      case "alertTone":
        let volume = Self.clamp(args.double("volume") ?? 1)
        switch args.string("kind") {
        case "emergency":
          self.alarmVolume = volume
        case "chime":
          self.chimeVolume = volume
          self.chimeWork?.cancel()
          let work = DispatchWorkItem { [weak self] in
            self?.chimeVolume = nil
            _ = self?.reevaluate()
          }
          self.chimeWork = work
          DispatchQueue.main.asyncAfter(deadline: .now() + ToneProgram.chimeDuration + 0.05, execute: work)
        default:
          result(BridgeError.badArgs("kind must be emergency|chime")); return
        }
        result(self.reevaluate())
      case "stopAll":
        self.alarmVolume = nil
        self.chimeVolume = nil
        self.chimeWork?.cancel()
        self.proximityLevel = 0
        _ = self.reevaluate()
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
  }

  // MARK: - Program selection

  /// Applies the highest-priority active sound. Returns a FlutterError on failure, else nil.
  @discardableResult
  private func reevaluate() -> FlutterError? {
    let program: ToneProgram?
    var volume = 0.0
    let client: AudioSessionCoordinator.Client
    if let v = alarmVolume {
      program = .emergency; volume = v; client = .alarm
    } else if let v = chimeVolume {
      program = .chime; volume = v; client = .tones
    } else if proximityLevel > 0, proximityVolume > 0 {
      program = .proximity(level: proximityLevel); volume = proximityVolume; client = .tones
    } else {
      program = nil; client = .tones
    }

    guard let program else {
      generator.set(program: nil, volume: 0)
      // Let the release envelope finish before stopping the engine.
      scheduleStop()
      return nil
    }
    stopWork?.cancel()
    do {
      try switchSession(to: client)
      try startEngineIfNeeded()
    } catch {
      return BridgeError.failure("unavailable", error)
    }
    generator.set(program: program, volume: volume)
    return nil
  }

  private func switchSession(to client: AudioSessionCoordinator.Client) throws {
    guard sessionClient != client else { return }
    try AudioSessionCoordinator.shared.acquire(client)
    if let old = sessionClient { AudioSessionCoordinator.shared.release(old) }
    sessionClient = client
  }

  private func scheduleStop() {
    stopWork?.cancel()
    let work = DispatchWorkItem { [weak self] in self?.stopEngine() }
    stopWork = work
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.08, execute: work)
  }

  // MARK: - Engine

  private func rebuildGraph() {
    if let node = sourceNode {
      engine.stop()
      engine.detach(node)
      sourceNode = nil
    }
  }

  private func startEngineIfNeeded() throws {
    if sourceNode == nil {
      var sampleRate = engine.outputNode.outputFormat(forBus: 0).sampleRate
      if sampleRate <= 0 { sampleRate = 48_000 }
      guard let format = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1) else {
        throw NSError(domain: "corvista.audio", code: 1, userInfo: [NSLocalizedDescriptionKey: "Unsupported audio format"])
      }
      generator.sampleRate = sampleRate
      let gen = generator
      let node = AVAudioSourceNode(format: format) { _, _, frameCount, audioBufferList -> OSStatus in
        let buffers = UnsafeMutableAudioBufferListPointer(audioBufferList)
        guard let first = buffers.first, let data = first.mData else { return noErr }
        let out = data.assumingMemoryBound(to: Float.self)
        gen.render(into: out, frames: Int(frameCount))
        if buffers.count > 1 {
          for i in 1..<buffers.count {
            if let d = buffers[i].mData { d.copyMemory(from: data, byteCount: Int(first.mDataByteSize)) }
          }
        }
        return noErr
      }
      engine.attach(node)
      engine.connect(node, to: engine.mainMixerNode, format: format)
      sourceNode = node
    }
    if !engine.isRunning {
      engine.prepare()
      try engine.start()
    }
  }

  private func stopEngine() {
    if engine.isRunning { engine.stop() }
    generator.reset()
    if let c = sessionClient {
      AudioSessionCoordinator.shared.release(c)
      sessionClient = nil
    }
  }

  private static func clamp(_ v: Double) -> Double { min(max(v, 0), 1) }
}

// MARK: - Tone synthesis

/// A looping or one-shot sequence of (frequency, duration, gain) segments.
/// `id` identifies the pattern so repeated identical requests don't restart it.
struct ToneProgram: Sendable {
  struct Segment: Sendable { let freq: Double; let duration: Double; let gain: Double }
  let id: String
  let segments: [Segment]
  let loops: Bool

  static let chimeDuration: Double = 0.56

  static func proximity(level: Int) -> ToneProgram {
    let g = 0.55
    switch level {
    case 1: return ToneProgram(id: "p1", segments: [.init(freq: 1000, duration: 0.12, gain: g), .init(freq: 1000, duration: 0.78, gain: 0)], loops: true)
    case 2: return ToneProgram(id: "p2", segments: [.init(freq: 1000, duration: 0.12, gain: g), .init(freq: 1000, duration: 0.23, gain: 0)], loops: true)
    default: return ToneProgram(id: "p3", segments: [.init(freq: 1000, duration: 1.0, gain: g)], loops: true)
    }
  }

  /// Alternating hi-lo two-tone alarm, loud, until stopped.
  static let emergency = ToneProgram(
    id: "emergency",
    segments: [.init(freq: 960, duration: 0.4, gain: 0.9), .init(freq: 770, duration: 0.4, gain: 0.9)],
    loops: true)

  /// Short rising two-note chime, played once.
  static let chime = ToneProgram(
    id: "chime",
    segments: [
      .init(freq: 880, duration: 0.16, gain: 0.5),
      .init(freq: 880, duration: 0.04, gain: 0),
      .init(freq: 1318.5, duration: 0.30, gain: 0.5),
      .init(freq: 1318.5, duration: 0.06, gain: 0),
    ],
    loops: false)
}

/// Real-time sine generator. `set(program:volume:)` runs on the main thread; `render` runs on
/// the audio I/O thread and picks up changes with a non-blocking try-lock (never waits).
final class ToneGenerator {
  private struct Shared: Sendable {
    var program: ToneProgram?
    var version = 0
    var volume: Double = 0
  }

  private let shared = OSAllocatedUnfairLock(initialState: Shared())
  private var currentId: String?  // main thread

  // Render-thread state.
  private var sr: Double = 48_000
  private var program: ToneProgram?
  private var version = 0
  private var volume: Double = 0
  private var segmentIndex = 0
  private var segmentSamplesLeft = 0
  private var phase: Double = 0
  private var envelope: Double = 0
  private var finished = true

  var sampleRate: Double {
    get { sr }
    set { sr = newValue }
  }

  /// Restarts the pattern only when its id changes; volume always updates smoothly.
  func set(program: ToneProgram?, volume: Double) {
    let restart = program?.id != currentId
    currentId = program?.id
    shared.withLock { s in
      s.volume = volume
      if restart {
        s.program = program
        s.version &+= 1
      }
    }
  }

  func reset() { set(program: nil, volume: 0) }

  func render(into out: UnsafeMutablePointer<Float>, frames: Int) {
    if let snap = shared.withLockIfAvailable({ $0 }) {
      volume = snap.volume
      if snap.version != version {
        version = snap.version
        program = snap.program
        segmentIndex = 0
        segmentSamplesLeft = 0
        finished = snap.program == nil
      }
    }
    let rate = sr
    let k = 1 - exp(-1 / (0.005 * rate))  // ~5 ms one-pole attack/release
    let step = 2 * Double.pi / rate
    var freq = 1000.0
    for i in 0..<frames {
      var target = 0.0
      if let p = program, !finished, !p.segments.isEmpty {
        if segmentSamplesLeft <= 0 {
          if segmentIndex >= p.segments.count {
            if p.loops { segmentIndex = 0 } else { finished = true }
          }
          if !finished {
            segmentSamplesLeft = max(Int(p.segments[segmentIndex].duration * rate), 1)
            segmentIndex += 1
          }
        }
        if !finished {
          let seg = p.segments[segmentIndex - 1]
          target = seg.gain * volume
          freq = seg.freq
          segmentSamplesLeft -= 1
        }
      }
      envelope += (target - envelope) * k
      phase += step * freq
      if phase > 2 * Double.pi { phase -= 2 * Double.pi }
      out[i] = Float(sin(phase) * envelope)
    }
  }
}
