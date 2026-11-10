import Flutter
import Foundation

/// Owns the app-wide event channels. Modules call `send(_:_:)`; payloads are
/// delivered on the main thread. Events emitted while Dart is not listening
/// are dropped (all streams are "latest state" streams).
public final class EventHub {
  public static let shared = EventHub()

  public enum Stream: String, CaseIterable {
    case detections = "corvista/detections"
    case status = "corvista/status"
    case location = "corvista/location"
    case motion = "corvista/motion"
    case voice = "corvista/voice"
  }

  private var sinks: [Stream: FlutterEventSink] = [:]
  private var handlers: [StreamHandler] = []
  private let lock = NSLock()

  /// Called when Dart starts/stops listening to a stream.
  public var onListenChanged: ((Stream, Bool) -> Void)?

  func attach(messenger: FlutterBinaryMessenger) {
    for s in Stream.allCases {
      let ch = FlutterEventChannel(name: s.rawValue, binaryMessenger: messenger)
      let h = StreamHandler(stream: s, hub: self)
      handlers.append(h)
      ch.setStreamHandler(h)
    }
  }

  public func isListening(_ s: Stream) -> Bool {
    lock.lock(); defer { lock.unlock() }
    return sinks[s] != nil
  }

  public func send(_ s: Stream, _ payload: Any) {
    let deliver = { [weak self] in
      guard let self else { return }
      self.lock.lock()
      let sink = self.sinks[s]
      self.lock.unlock()
      sink?(payload)
    }
    if Thread.isMainThread { deliver() } else { DispatchQueue.main.async(execute: deliver) }
  }

  fileprivate func set(_ s: Stream, _ sink: FlutterEventSink?) {
    lock.lock()
    sinks[s] = sink
    lock.unlock()
    onListenChanged?(s, sink != nil)
  }

  private final class StreamHandler: NSObject, FlutterStreamHandler {
    let stream: Stream
    weak var hub: EventHub?
    init(stream: Stream, hub: EventHub) { self.stream = stream; self.hub = hub }
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
      hub?.set(stream, events); return nil
    }
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
      hub?.set(stream, nil); return nil
    }
  }
}
