import AVFoundation
import CoreLocation
import Flutter
import Foundation
import Speech
import UserNotifications

/// `permissions.status` / `permissions.request` for the runtime permissions Corvista uses.
/// Results: 'granted' | 'denied' | 'restricted' | 'notDetermined' | 'limited'.
final class PermissionsModule: NSObject, ChannelModule, CLLocationManagerDelegate {
  let prefix = "permissions"
  private let context: ModuleContext

  /// Dedicated manager used only to request When-In-Use authorization and await the answer.
  private var locationManager: CLLocationManager?
  private var pendingLocation: [FlutterResult] = []

  init(context: ModuleContext) {
    self.context = context
    super.init()
  }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    guard let kind = args.string("kind") else { result(BridgeError.badArgs("kind required")); return }
    switch method {
    case "status": status(kind, result)
    case "request": request(kind, result)
    default: result(FlutterMethodNotImplemented)
    }
  }

  // MARK: - Status

  private func status(_ kind: String, _ result: @escaping FlutterResult) {
    switch kind {
    case "camera":
      result(Self.map(AVCaptureDevice.authorizationStatus(for: .video)))
    case "microphone":
      result(Self.map(AVAudioApplication.shared.recordPermission))
    case "locationWhenInUse":
      UIKitHelpers.onMain { result(Self.locationStatus(CLLocationManager())) }
    case "speech":
      result(Self.map(SFSpeechRecognizer.authorizationStatus()))
    case "notifications":
      UNUserNotificationCenter.current().getNotificationSettings { s in
        result(Self.map(s.authorizationStatus))
      }
    default:
      result(BridgeError.badArgs("Unknown permission kind '\(kind)'"))
    }
  }

  // MARK: - Request

  private func request(_ kind: String, _ result: @escaping FlutterResult) {
    switch kind {
    case "camera":
      let current = AVCaptureDevice.authorizationStatus(for: .video)
      guard current == .notDetermined else { result(Self.map(current)); return }
      AVCaptureDevice.requestAccess(for: .video) { _ in
        result(Self.map(AVCaptureDevice.authorizationStatus(for: .video)))
      }
    case "microphone":
      let current = AVAudioApplication.shared.recordPermission
      guard current == .undetermined else { result(Self.map(current)); return }
      AVAudioApplication.requestRecordPermission { _ in
        result(Self.map(AVAudioApplication.shared.recordPermission))
      }
    case "locationWhenInUse":
      UIKitHelpers.onMain { self.requestLocation(result) }
    case "speech":
      let current = SFSpeechRecognizer.authorizationStatus()
      guard current == .notDetermined else { result(Self.map(current)); return }
      SFSpeechRecognizer.requestAuthorization { s in result(Self.map(s)) }
    case "notifications":
      let center = UNUserNotificationCenter.current()
      center.getNotificationSettings { s in
        guard s.authorizationStatus == .notDetermined else { result(Self.map(s.authorizationStatus)); return }
        center.requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in
          center.getNotificationSettings { s2 in result(Self.map(s2.authorizationStatus)) }
        }
      }
    default:
      result(BridgeError.badArgs("Unknown permission kind '\(kind)'"))
    }
  }

  /// Main thread. Awaits the delegate callback that follows the system prompt.
  private func requestLocation(_ result: @escaping FlutterResult) {
    let manager = locationManager ?? {
      let m = CLLocationManager()
      m.delegate = self
      locationManager = m
      return m
    }()
    guard manager.authorizationStatus == .notDetermined else {
      result(Self.locationStatus(manager)); return
    }
    pendingLocation.append(result)
    if pendingLocation.count == 1 { manager.requestWhenInUseAuthorization() }
  }

  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    // Delivered on the main thread (manager was created there). Ignore the initial
    // `notDetermined` callback that fires right after the delegate is set.
    guard manager.authorizationStatus != .notDetermined, !pendingLocation.isEmpty else { return }
    let status = Self.locationStatus(manager)
    let waiters = pendingLocation
    pendingLocation.removeAll()
    for r in waiters { r(status) }
  }

  // MARK: - Mapping

  static func locationStatus(_ m: CLLocationManager) -> String {
    switch m.authorizationStatus {
    case .notDetermined: return "notDetermined"
    case .restricted: return "restricted"
    case .denied: return "denied"
    case .authorizedAlways, .authorizedWhenInUse:
      return m.accuracyAuthorization == .reducedAccuracy ? "limited" : "granted"
    @unknown default: return "denied"
    }
  }

  static func map(_ s: AVAuthorizationStatus) -> String {
    switch s {
    case .authorized: return "granted"
    case .denied: return "denied"
    case .restricted: return "restricted"
    case .notDetermined: return "notDetermined"
    @unknown default: return "denied"
    }
  }

  static func map(_ s: AVAudioApplication.recordPermission) -> String {
    switch s {
    case .granted: return "granted"
    case .denied: return "denied"
    case .undetermined: return "notDetermined"
    @unknown default: return "denied"
    }
  }

  static func map(_ s: SFSpeechRecognizerAuthorizationStatus) -> String {
    switch s {
    case .authorized: return "granted"
    case .denied: return "denied"
    case .restricted: return "restricted"
    case .notDetermined: return "notDetermined"
    @unknown default: return "denied"
    }
  }

  static func map(_ s: UNAuthorizationStatus) -> String {
    switch s {
    case .authorized: return "granted"
    case .provisional, .ephemeral: return "limited"
    case .denied: return "denied"
    case .notDetermined: return "notDetermined"
    @unknown default: return "denied"
    }
  }
}
