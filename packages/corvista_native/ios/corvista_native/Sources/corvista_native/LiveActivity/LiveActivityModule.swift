import ActivityKit
import Flutter
import Foundation
import UIKit

/// `liveActivity.*`: turn-by-turn Live Activity (Lock Screen + Dynamic Island) rendered by
/// the `CorvistaLiveActivity` widget extension. One activity at a time.
///
/// * Updates are de-duplicated and throttled to ≤ 1 per second (the newest pending state
///   is flushed when the interval elapses).
/// * Activities left over from a previous process are ended at launch; the running one is
///   ended (with an `ended` state) when the app terminates.
/// State is confined to the main thread.
final class LiveActivityModule: ChannelModule {
  let prefix = "liveActivity"
  private let context: ModuleContext
  private var driver: AnyObject?
  private var terminateObserver: NSObjectProtocol?

  init(context: ModuleContext) {
    self.context = context
    if #available(iOS 16.2, *) {
      let d = LiveActivityDriver()
      driver = d
      d.endStale()
      terminateObserver = NotificationCenter.default.addObserver(
        forName: UIApplication.willTerminateNotification, object: nil, queue: .main
      ) { _ in d.endAllBlocking() }
    }
  }

  func dispose() {
    if let o = terminateObserver { NotificationCenter.default.removeObserver(o) }
    UIKitHelpers.onMain {
      if #available(iOS 16.2, *), let d = self.driver as? LiveActivityDriver {
        d.end(final: nil, immediate: false)
      }
    }
  }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    UIKitHelpers.onMain {
      guard #available(iOS 16.2, *), let d = self.driver as? LiveActivityDriver else {
        if method == "status" {
          result(["supported": false, "enabled": false, "active": false])
        } else {
          result(BridgeError.unavailable("Live Activities need iOS 16.2"))
        }
        return
      }
      switch method {
      case "status":
        result(["supported": true, "enabled": d.enabled, "active": d.isActive])
      case "start":
        guard d.enabled else {
          result(BridgeError.unavailable("Live Activities are turned off for Corvista")); return
        }
        let attrs = CorvistaNavAttributes(
          destination: args.string("destination") ?? "",
          etaLabel: args.string("etaLabel") ?? "")
        do {
          let id = try d.start(attributes: attrs, state: Self.state(args))
          result(["id": id])
        } catch {
          result(BridgeError.failure("failed", error))
        }
      case "update":
        d.update(Self.state(args))
        result(nil)
      case "end":
        let final = args["final"] is [String: Any] ? Self.state(args["final"] as! [String: Any]) : nil
        d.end(final: final, immediate: args.bool("immediate") ?? false)
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
  }

  @available(iOS 16.2, *)
  static func state(_ a: [String: Any]) -> CorvistaNavAttributes.ContentState {
    CorvistaNavAttributes.ContentState(
      maneuver: a.string("maneuver") ?? "straight",
      distance: a.string("distance") ?? "",
      instruction: a.string("instruction") ?? "",
      etaMs: a.double("etaMs") ?? Date().timeIntervalSince1970 * 1000,
      remaining: a.string("remaining") ?? "",
      progress: min(max(a.double("progress") ?? 0, 0), 1),
      dashcam: a.string("dashcam") ?? "off",
      dashcamLabel: a.string("dashcamLabel") ?? "",
      phase: a.string("phase") ?? "navigating")
  }
}

@available(iOS 16.2, *)
final class LiveActivityDriver {
  typealias State = CorvistaNavAttributes.ContentState
  static let minInterval: TimeInterval = 1.0

  private var activity: Activity<CorvistaNavAttributes>?
  private var lastSent: State?
  private var lastSentAt = Date.distantPast
  private var pending: State?
  private var flushWork: DispatchWorkItem?

  var enabled: Bool { ActivityAuthorizationInfo().areActivitiesEnabled }
  var isActive: Bool { activity != nil }

  func start(attributes: CorvistaNavAttributes, state: State) throws -> String {
    if activity != nil { end(final: nil, immediate: true) }
    let a = try Activity.request(
      attributes: attributes, content: ActivityContent(state: state, staleDate: nil), pushType: nil)
    activity = a
    lastSent = state
    lastSentAt = Date()
    NSLog("[corvista] live activity started %@", a.id)
    return a.id
  }

  func update(_ state: State) {
    guard activity != nil else { return }
    if state == lastSent {
      // Back to what is already shown: drop any queued change.
      pending = nil
      flushWork?.cancel(); flushWork = nil
      return
    }
    let elapsed = Date().timeIntervalSince(lastSentAt)
    if elapsed >= Self.minInterval, flushWork == nil {
      send(state)
      return
    }
    pending = state
    guard flushWork == nil else { return }
    let work = DispatchWorkItem { [weak self] in
      guard let self else { return }
      self.flushWork = nil
      if let p = self.pending { self.pending = nil; self.send(p) }
    }
    flushWork = work
    DispatchQueue.main.asyncAfter(deadline: .now() + max(0.05, Self.minInterval - elapsed), execute: work)
  }

  private func send(_ state: State) {
    guard let a = activity else { return }
    lastSent = state
    lastSentAt = Date()
    let content = ActivityContent(state: state, staleDate: nil)
    Task { await a.update(content) }
  }

  func end(final: State?, immediate: Bool) {
    flushWork?.cancel(); flushWork = nil
    pending = nil
    guard let a = activity else { return }
    activity = nil
    let state = final ?? lastSent ?? a.content.state
    lastSent = nil
    let content = ActivityContent(state: state, staleDate: nil)
    let policy: ActivityUIDismissalPolicy = immediate ? .immediate : .default
    Task { await a.end(content, dismissalPolicy: policy) }
    NSLog("[corvista] live activity ended (%@)", state.phase)
  }

  /// Activities that survived a crash / kill of a previous process.
  func endStale() {
    for a in Activity<CorvistaNavAttributes>.activities {
      Task { await a.end(nil, dismissalPolicy: .immediate) }
    }
  }

  /// App termination: end everything before the process exits (bounded wait).
  func endAllBlocking() {
    flushWork?.cancel(); flushWork = nil
    let finalState: State? = (lastSent ?? activity?.content.state).map {
      var s = $0
      s.phase = "ended"
      s.dashcam = "off"
      return s
    }
    activity = nil
    let all = Activity<CorvistaNavAttributes>.activities
    guard !all.isEmpty else { return }
    let sem = DispatchSemaphore(value: 0)
    Task.detached {
      for a in all {
        let content = finalState.map { ActivityContent(state: $0, staleDate: nil) }
        await a.end(content, dismissalPolicy: .default)
      }
      sem.signal()
    }
    _ = sem.wait(timeout: .now() + 1.5)
  }
}
