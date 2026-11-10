import Darwin
import Flutter
import Foundation
import UIKit

/// `system.*`: device health (thermal, battery, memory), keep-awake, settings and URL opening.
/// Also publishes `{type:'thermal', state}` on `corvista/status` when the thermal state changes.
final class SystemModule: ChannelModule {
  let prefix = "system"
  private let context: ModuleContext
  private var thermalObserver: NSObjectProtocol?

  private static let allowedSchemes: Set<String> = ["http", "https", "tel", "sms", "mailto"]

  init(context: ModuleContext) {
    self.context = context
    thermalObserver = NotificationCenter.default.addObserver(
      forName: ProcessInfo.thermalStateDidChangeNotification, object: nil, queue: .main
    ) { [weak self] _ in
      self?.context.events.send(.status, ["type": "thermal", "state": Self.thermalString()])
    }
  }

  func dispose() {
    if let o = thermalObserver { NotificationCenter.default.removeObserver(o) }
    thermalObserver = nil
  }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    switch method {
    case "info":
      UIKitHelpers.onMain { result(Self.info()) }
    case "keepAwake":
      guard let on = args.bool("on") else { result(BridgeError.badArgs("on (bool) required")); return }
      UIKitHelpers.onMain {
        UIApplication.shared.isIdleTimerDisabled = on
        result(nil)
      }
    case "openSettings":
      UIKitHelpers.onMain {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
          result(BridgeError.unavailable("Settings URL unavailable")); return
        }
        UIApplication.shared.open(url, options: [:]) { _ in result(nil) }
      }
    case "openURL":
      guard let raw = args.string("url"), let url = URL(string: raw),
            let scheme = url.scheme?.lowercased() else {
        result(BridgeError.badArgs("url (String) required")); return
      }
      guard Self.allowedSchemes.contains(scheme) else {
        result(BridgeError.badArgs("URL scheme '\(scheme)' is not allowed")); return
      }
      UIKitHelpers.onMain {
        UIApplication.shared.open(url, options: [:]) { ok in
          if ok { result(nil) } else { result(BridgeError.unavailable("Could not open \(scheme) URL")) }
        }
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  // MARK: - Info

  /// Main thread only (UIDevice).
  private static func info() -> [String: Any] {
    let device = UIDevice.current
    if !device.isBatteryMonitoringEnabled { device.isBatteryMonitoringEnabled = true }
    let level = device.batteryLevel  // -1 when unknown (e.g. Simulator)
    let state = device.batteryState
    let bundle = Bundle.main
    return [
      "thermal": thermalString(),
      "battery": level < 0 ? -1.0 : Double(level),
      "charging": state == .charging || state == .full,
      "lowPower": ProcessInfo.processInfo.isLowPowerModeEnabled,
      "memoryMB": memoryFootprintMB(),
      "model": modelIdentifier(),
      "osVersion": device.systemVersion,
      "appVersion": bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "",
      "build": bundle.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "",
    ]
  }

  static func thermalString() -> String {
    switch ProcessInfo.processInfo.thermalState {
    case .nominal: return "nominal"
    case .fair: return "fair"
    case .serious: return "serious"
    case .critical: return "critical"
    @unknown default: return "nominal"
    }
  }

  /// Physical memory footprint (what jetsam accounts against), in MB.
  static func memoryFootprintMB() -> Double {
    var info = task_vm_info_data_t()
    var count = mach_msg_type_number_t(MemoryLayout<task_vm_info_data_t>.size / MemoryLayout<integer_t>.size)
    let kr = withUnsafeMutablePointer(to: &info) { ptr in
      ptr.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
        task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), $0, &count)
      }
    }
    guard kr == KERN_SUCCESS else { return -1 }
    return Double(info.phys_footprint) / 1_048_576.0
  }

  static func modelIdentifier() -> String {
    if let sim = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"] { return sim }
    var sys = utsname()
    uname(&sys)
    let machine = withUnsafeBytes(of: &sys.machine) { raw -> String in
      let bytes = raw.prefix(while: { $0 != 0 })
      return String(decoding: bytes, as: UTF8.self)
    }
    return machine
  }
}
