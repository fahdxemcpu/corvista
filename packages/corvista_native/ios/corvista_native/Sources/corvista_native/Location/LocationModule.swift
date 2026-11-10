import CoreLocation
import Flutter
import Foundation
import UIKit

/// `location.*`: navigation-grade GPS + compass heading.
/// Streams `LocationFix` maps on `corvista/location` and `{type:'auth', status}` on
/// authorization changes. Invalid values are reported as -1 (see BRIDGE.md).
///
/// Foreground-only by default. `location.setBackground({on: true})` (Dart sends it only
/// while turn-by-turn navigation is active) keeps updates flowing when the app is
/// backgrounded / the screen locks: `allowsBackgroundLocationUpdates` + the blue
/// status-bar indicator + a `CLBackgroundActivitySession`. Authorization stays
/// When-In-Use (updates were started in the foreground).
final class LocationModule: NSObject, ChannelModule, CLLocationManagerDelegate {
  let prefix = "location"
  private let context: ModuleContext
  private var manager: CLLocationManager?
  private var running = false
  private var lastLocation: CLLocation?
  private var lastHeading: CLHeading?
  private var lastHeadingEmit: TimeInterval = 0
  private var lastAuthStatus: String?
  private var orientationObserver: NSObjectProtocol?
  private var backgroundEnabled = false
  private var backgroundSession: AnyObject?  // CLBackgroundActivitySession (iOS 17+)

  init(context: ModuleContext) {
    self.context = context
    super.init()
    UIKitHelpers.onMain { _ = self.ensureManager() }
  }

  func dispose() {
    UIKitHelpers.onMain { self.stop() }
  }

  /// Main thread only. CLLocationManager must be created on a thread with a run loop.
  private func ensureManager() -> CLLocationManager {
    if let m = manager { return m }
    let m = CLLocationManager()
    m.delegate = self
    m.desiredAccuracy = kCLLocationAccuracyBestForNavigation
    m.activityType = .automotiveNavigation
    m.pausesLocationUpdatesAutomatically = false
    m.distanceFilter = kCLDistanceFilterNone
    m.headingFilter = 1
    m.headingOrientation = .portrait
    manager = m
    return m
  }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    UIKitHelpers.onMain {
      switch method {
      case "start": self.start(args, result)
      case "stop": self.stop(); result(nil)
      case "setBackground": self.setBackground(args.bool("on") ?? false, result)
      case "current":
        let m = self.ensureManager()
        if let loc = self.lastLocation ?? m.location { result(self.payload(loc)) } else { result(nil) }
      default: result(FlutterMethodNotImplemented)
      }
    }
  }

  private func start(_ args: [String: Any], _ result: @escaping FlutterResult) {
    let m = ensureManager()
    switch m.authorizationStatus {
    case .denied, .restricted:
      result(BridgeError.permission("Location")); return
    case .notDetermined:
      // Updates begin as soon as the user answers the prompt.
      m.requestWhenInUseAuthorization()
    default: break
    }
    m.desiredAccuracy = args.string("accuracy") == "best" ? kCLLocationAccuracyBest : kCLLocationAccuracyBestForNavigation
    if let df = args.double("distanceFilter"), df > 0 { m.distanceFilter = df } else { m.distanceFilter = kCLDistanceFilterNone }
    running = true
    m.startUpdatingLocation()
    if CLLocationManager.headingAvailable() {
      observeOrientation()
      m.startUpdatingHeading()
    }
    result(nil)
  }

  /// Turns background navigation updates on/off. Only allowed with the `location`
  /// UIBackgroundMode (setting the flag without it raises an exception).
  private func setBackground(_ on: Bool, _ result: @escaping FlutterResult) {
    let m = ensureManager()
    if on {
      let modes = Bundle.main.object(forInfoDictionaryKey: "UIBackgroundModes") as? [String] ?? []
      guard modes.contains("location") else {
        result(BridgeError.unavailable("UIBackgroundModes does not include location")); return
      }
      switch m.authorizationStatus {
      case .authorizedWhenInUse, .authorizedAlways: break
      default:
        result(BridgeError.permission("Location")); return
      }
    }
    applyBackground(on)
    AudioSessionCoordinator.shared.setNavigating(on)
    result(["on": backgroundEnabled, "running": running])
  }

  private func applyBackground(_ on: Bool) {
    guard let m = manager, on != backgroundEnabled else { return }
    backgroundEnabled = on
    m.allowsBackgroundLocationUpdates = on
    m.showsBackgroundLocationIndicator = on
    m.pausesLocationUpdatesAutomatically = false
    if on {
      // Must be created while the app is in the foreground (Dart enables background
      // mode when guidance starts). Keeps a When-In-Use session alive in the background.
      if backgroundSession == nil, UIApplication.shared.applicationState != .background {
        backgroundSession = CLBackgroundActivitySession()
      }
    } else {
      (backgroundSession as? CLBackgroundActivitySession)?.invalidate()
      backgroundSession = nil
    }
    NSLog("[corvista] background location %@", on ? "ON" : "OFF")
  }

  /// Keeps compass heading relative to the top of the device as it is mounted
  /// (dashcam use is typically landscape).
  private func observeOrientation() {
    guard orientationObserver == nil else { return }
    UIDevice.current.beginGeneratingDeviceOrientationNotifications()
    applyOrientation()
    orientationObserver = NotificationCenter.default.addObserver(
      forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main
    ) { [weak self] _ in self?.applyOrientation() }
  }

  private func applyOrientation() {
    guard let m = manager else { return }
    switch UIDevice.current.orientation {
    case .portrait: m.headingOrientation = .portrait
    case .portraitUpsideDown: m.headingOrientation = .portraitUpsideDown
    case .landscapeLeft: m.headingOrientation = .landscapeLeft
    case .landscapeRight: m.headingOrientation = .landscapeRight
    default: break  // faceUp/faceDown/unknown: keep the last useful orientation
    }
  }

  private func stop() {
    guard let m = manager else { return }
    running = false
    // Background mode is owned by Dart (navigation phase) and survives stop/start.
    m.stopUpdatingLocation()
    m.stopUpdatingHeading()
    if let o = orientationObserver {
      NotificationCenter.default.removeObserver(o)
      UIDevice.current.endGeneratingDeviceOrientationNotifications()
      orientationObserver = nil
    }
  }

  // MARK: - CLLocationManagerDelegate

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let loc = locations.last else { return }
    lastLocation = loc
    guard running else { return }
    context.events.send(.location, payload(loc))
  }

  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    lastHeading = newHeading
    // Re-emit the last fix with the new heading so a stationary car still turns on the map;
    // throttled to ~5 Hz because heading can update very fast.
    guard running, let loc = lastLocation else { return }
    let now = Date().timeIntervalSince1970
    guard now - lastHeadingEmit >= 0.2 else { return }
    lastHeadingEmit = now
    context.events.send(.location, payload(loc))
  }

  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    // `locationUnknown` is transient; denial arrives via the authorization callback.
  }

  func locationManagerShouldDisplayHeadingCalibration(_ manager: CLLocationManager) -> Bool { false }

  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    let status = PermissionsModule.locationStatus(manager)
    if status != lastAuthStatus {
      let first = lastAuthStatus == nil
      lastAuthStatus = status
      if !first { context.events.send(.location, ["type": "auth", "status": status]) }
    }
    if running, status == "granted" || status == "limited" {
      manager.startUpdatingLocation()
      if CLLocationManager.headingAvailable() { manager.startUpdatingHeading() }
    }
  }

  // MARK: - Payload

  private func payload(_ loc: CLLocation) -> [String: Any] {
    let valid = loc.horizontalAccuracy >= 0
    var heading = -1.0
    var headingAcc = -1.0
    if let h = lastHeading, h.headingAccuracy >= 0 {
      if h.trueHeading >= 0 { heading = h.trueHeading } else if h.magneticHeading >= 0 { heading = h.magneticHeading }
      if heading >= 0 { headingAcc = h.headingAccuracy }
    }
    return [
      "lat": loc.coordinate.latitude,
      "lon": loc.coordinate.longitude,
      "alt": loc.altitude,
      "hAcc": valid ? loc.horizontalAccuracy : -1.0,
      "vAcc": loc.verticalAccuracy >= 0 ? loc.verticalAccuracy : -1.0,
      "speed": loc.speed >= 0 ? loc.speed : -1.0,
      "speedAcc": loc.speedAccuracy >= 0 ? loc.speedAccuracy : -1.0,
      "course": loc.course >= 0 ? loc.course : -1.0,
      "courseAcc": loc.courseAccuracy >= 0 ? loc.courseAccuracy : -1.0,
      "heading": heading,
      "headingAcc": headingAcc,
      "ts": loc.timestamp.timeIntervalSince1970 * 1000,
    ]
  }
}
