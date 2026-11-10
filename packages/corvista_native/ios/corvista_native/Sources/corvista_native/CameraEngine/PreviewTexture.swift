import CoreMedia
import CoreVideo
import Flutter
import Foundation

/// Flutter external texture backed by the latest camera/file frame.
/// `update` is called on the capture queue, `copyPixelBuffer` on Flutter's raster thread.
final class PreviewTexture: NSObject, FlutterTexture {
  private let lock = NSLock()
  private var latest: CVPixelBuffer?

  func update(_ pb: CVPixelBuffer) {
    lock.lock()
    latest = pb
    lock.unlock()
  }

  func clear() {
    lock.lock()
    latest = nil
    lock.unlock()
  }

  func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
    lock.lock()
    defer { lock.unlock() }
    guard let pb = latest else { return nil }
    return Unmanaged.passRetained(pb)
  }
}

/// A frame travelling through the shared pipeline (capture queue only).
struct VideoFrame {
  enum Source: String { case camera, file }
  let pixelBuffer: CVPixelBuffer
  /// Presentation time (host clock for camera; synthetic host-clock time for file playback).
  let pts: CMTime
  /// Wall-clock capture time, ms since epoch.
  let wallMs: Double
  let source: Source
}

enum ProcessStats {
  /// Physical footprint in MB (what jetsam uses), -1 if unavailable.
  static func memoryMB() -> Double {
    var info = task_vm_info_data_t()
    var count = mach_msg_type_number_t(MemoryLayout<task_vm_info_data_t>.size / MemoryLayout<natural_t>.size)
    let kr = withUnsafeMutablePointer(to: &info) {
      $0.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
        task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), $0, &count)
      }
    }
    guard kr == KERN_SUCCESS else { return -1 }
    return (Double(info.phys_footprint) / 1_048_576 * 10).rounded() / 10
  }
}
