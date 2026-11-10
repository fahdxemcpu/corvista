import Foundation
import UIKit

/// Frees memory the pipeline does not need right now:
/// * **Memory warning**: idle → release all Core ML models; in use → drop the
///   segmenter for 60 s. Clears burn-in caches/pools; clears the preview buffer when
///   the camera is stopped. Emits `{type:'memory', event:'warning', …}` so Dart can
///   clear its image cache.
/// * **Drive stop / background**: releases models (they reload on demand), the
///   prepared segment writer, burn-in pool and CIContext caches, and the preview's
///   last pixel buffer. Emits `{type:'memory', event:'released', …}` with what is
///   still retained (should be nothing).
/// `@unchecked Sendable`: stateless apart from NotificationCenter tokens set in init.
final class MemoryGuard: @unchecked Sendable {
  static let shared = MemoryGuard()
  private var observers: [NSObjectProtocol] = []

  private init() {
    let nc = NotificationCenter.default
    observers.append(nc.addObserver(forName: UIApplication.didReceiveMemoryWarningNotification, object: nil, queue: nil) { [weak self] _ in
      self?.memoryWarning()
    })
    observers.append(nc.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { [weak self] _ in
      // Let the recorder close its segment first (it observes the same notification).
      CorvistaQueues.capture.async { self?.releaseIdle(reason: "background") }
    })
  }

  func memoryWarning() {
    let before = ProcessStats.memoryMB()
    var released = InferenceEngine.shared.handleMemoryWarning()
    RollingRecorder.shared.releaseCaches()
    released.append("render_caches")
    if !CaptureCoordinator.shared.isRunning {
      CaptureCoordinator.shared.clearPreview()
      released.append("preview_buffer")
    }
    NSLog("[corvista] memory warning: released \(released)")
    emitLater(["type": "memory", "event": "warning", "released": released, "memoryMBBefore": before])
  }

  /// Drive stopped or app backgrounded: release everything that reloads on demand.
  func releaseIdle(reason: String) {
    let before = ProcessStats.memoryMB()
    let models = InferenceEngine.shared.releaseModels()
    CaptureCoordinator.shared.clearPreview()
    RollingRecorder.shared.releaseIdleResources { retained in
      var m: [String: Any] = ["type": "memory", "event": "released", "reason": reason,
                              "modelsReleased": models, "memoryMBBefore": before]
      m.merge(retained) { $1 }
      NSLog("[corvista] released for \(reason): models=\(models) retained=\(retained)")
      self.emitLater(m)
    }
  }

  private func emitLater(_ m: [String: Any]) {
    // Give the allocator a moment so the reported footprint reflects the release.
    DispatchQueue.global(qos: .utility).asyncAfter(deadline: .now() + 0.5) {
      var m = m
      m["memoryMB"] = ProcessStats.memoryMB()
      EventHub.shared.send(.status, m)
    }
  }
}
