import CoreMotion
import Flutter
import Foundation

/// `motion.*`: device-motion samples (user acceleration in g with gravity removed,
/// rotation rate in rad/s) batched into a Float64List every ~200 ms on `corvista/motion`.
/// Record layout: `[t(ms since epoch), ax, ay, az, rx, ry, rz]`.
final class MotionModule: ChannelModule {
  let prefix = "motion"
  private let context: ModuleContext
  private let manager = CMMotionManager()
  private let queue: OperationQueue = {
    let q = OperationQueue()
    q.name = "corvista.motion"
    q.maxConcurrentOperationCount = 1
    q.qualityOfService = .userInitiated
    return q
  }()

  // Touched only on `queue` (and reset there via addOperation).
  private var buffer: [Double] = []
  private var lastFlush: TimeInterval = 0
  private var hz = 50
  /// Offset converting CMLogItem timestamps (seconds since boot) to Unix epoch seconds.
  private var epochOffset: TimeInterval = 0
  private static let recordSize = 7
  private static let batchInterval: TimeInterval = 0.2

  init(context: ModuleContext) { self.context = context }

  func dispose() { stop() }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    switch method {
    case "start":
      guard manager.isDeviceMotionAvailable else {
        result(BridgeError.unavailable("Device motion is not available on this device")); return
      }
      let requested = args.int("hz") ?? 50
      start(hz: min(max(requested, 1), 100))
      result(nil)
    case "stop":
      stop()
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func start(hz: Int) {
    if manager.isDeviceMotionActive { manager.stopDeviceMotionUpdates() }
    let offset = Date().timeIntervalSince1970 - ProcessInfo.processInfo.systemUptime
    queue.addOperation { [weak self] in
      guard let self else { return }
      self.hz = hz
      self.epochOffset = offset
      self.buffer.removeAll(keepingCapacity: true)
      self.buffer.reserveCapacity(Self.recordSize * (hz / 4 + 4))
      self.lastFlush = ProcessInfo.processInfo.systemUptime
    }
    manager.deviceMotionUpdateInterval = 1.0 / Double(hz)
    manager.startDeviceMotionUpdates(to: queue) { [weak self] motion, _ in
      guard let self, let m = motion else { return }
      let a = m.userAcceleration
      let r = m.rotationRate
      self.buffer.append(contentsOf: [(self.epochOffset + m.timestamp) * 1000, a.x, a.y, a.z, r.x, r.y, r.z])
      if m.timestamp - self.lastFlush >= Self.batchInterval { self.flush(now: m.timestamp) }
    }
  }

  /// Runs on `queue`.
  private func flush(now: TimeInterval) {
    lastFlush = now
    guard !buffer.isEmpty else { return }
    let data = buffer.withUnsafeBufferPointer { Data(buffer: $0) }
    buffer.removeAll(keepingCapacity: true)
    context.events.send(.motion, [
      "ts": Date().timeIntervalSince1970 * 1000,
      "hz": hz,
      "samples": FlutterStandardTypedData(float64: data),
    ])
  }

  private func stop() {
    if manager.isDeviceMotionActive { manager.stopDeviceMotionUpdates() }
    queue.addOperation { [weak self] in self?.buffer.removeAll() }
  }
}
