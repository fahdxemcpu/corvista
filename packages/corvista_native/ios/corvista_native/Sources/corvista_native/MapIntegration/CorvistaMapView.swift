import Flutter
import MapKit
import UIKit

/// MKMapView-backed platform view with a speed-sensitive driving camera.
/// Channel `corvista/map_<viewId>`; methods per docs/BRIDGE.md.
final class CorvistaMapView: NSObject, FlutterPlatformView, MKMapViewDelegate, UIGestureRecognizerDelegate {
  private enum CameraMode: String { case follow, overview, free }

  private let mapView: MKMapView
  private let channel: FlutterMethodChannel

  // Style
  private var style = "standard"
  private var dark = true
  private var showsTraffic = false
  private var elevationRealistic = true

  // Camera
  private var mode: CameraMode = .free
  private var maxPitch: Double = 60
  private var zoomFactor: Double = 1
  private var smoothedDistance: Double = 250
  private var smoothedPitch: Double = 60
  private var smoothedHeading: Double = 0
  private var hasFollowState = false
  private var lastCameraUpdate: CFTimeInterval = 0
  private static let minUpdateInterval: CFTimeInterval = 0.5  // ~2 Hz
  private static let maxAnimation: TimeInterval = 1.0

  // Content
  private var routeLine: MKPolyline?
  private var routeCasing: MKPolyline?
  private var routePassed: MKPolyline?
  private var routeCoords: [CLLocationCoordinate2D] = []
  private var routeCum: [Double] = []  // cumulative MKMapPoint length per vertex
  private var progressFraction: CGFloat = 0
  private var renderers: [String: MKPolylineRenderer] = [:]

  // Turn-by-turn context
  private var navigating = false
  private var distanceToManeuver: Double?
  // Dart guidance frames (route-snapped, dead-reckoned, ~15 Hz).
  private var frameCoord: CLLocationCoordinate2D?
  private var frameCourse: Double = 0
  private var frameSpeed: Double = 0
  private var lastFrame: CFTimeInterval = 0
  private var puck: NavPuckAnnotation?
  /// Map area covered by Flutter chrome (points).
  private var chromeInsets = UIEdgeInsets.zero
  private var destination: DestinationAnnotation?
  private var objects: [String: DetectionAnnotation] = [:]

  init(frame: CGRect, viewId: Int64, params: [String: Any], messenger: FlutterBinaryMessenger) {
    mapView = MKMapView(frame: frame)
    channel = FlutterMethodChannel(name: "corvista/map_\(viewId)", binaryMessenger: messenger)
    super.init()

    dark = params.bool("dark") ?? true
    showsTraffic = params.bool("showsTraffic") ?? false
    elevationRealistic = (params.string("elevation") ?? "realistic") == "realistic"
    style = params.string("style") ?? "standard"
    // The follow camera always interpolates 60° → 45° (until `setPitch` moves the band);
    // the creation `pitch` is the initial pitch for the free / non-follow camera.
    let initialPitch = min(max(params.double("pitch") ?? 55, 0), 75)

    mapView.delegate = self
    mapView.showsUserLocation = true
    mapView.showsCompass = true
    mapView.showsScale = true
    mapView.isPitchEnabled = true
    mapView.isRotateEnabled = true
    mapView.showsBuildings = params.bool("showsBuildings") ?? true
    mapView.register(DetectionMarkerView.self, forAnnotationViewWithReuseIdentifier: DetectionMarkerView.reuseId)
    mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "corvista.destination")
    mapView.register(NavPuckView.self, forAnnotationViewWithReuseIdentifier: NavPuckView.reuseId)
    applyStyle()
    installGestureDetection()

    channel.setMethodCallHandler { [weak self] call, result in
      guard let self else { result(nil); return }
      self.handle(call, result)
    }

    if let cam = mapView.camera.copy() as? MKMapCamera {
      cam.pitch = CGFloat(initialPitch)
      mapView.setCamera(cam, animated: false)
    }
    if params.bool("followUser") ?? true { setMode(.follow, notify: false) }
  }

  deinit {
    channel.setMethodCallHandler(nil)
    mapView.delegate = nil
  }

  func view() -> UIView { mapView }

  // MARK: - Channel

  private func handle(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any] ?? [:]
    switch call.method {
    case "setCameraMode":
      guard let raw = args.string("mode"), let m = CameraMode(rawValue: raw) else {
        result(BridgeError.badArgs("mode must be follow|overview|free")); return
      }
      setMode(m, notify: true)
      result(nil)
    case "recenter":
      setMode(.follow, notify: true)
      result(nil)
    case "zoom":
      zoom(delta: args.int("delta") ?? 0)
      result(nil)
    case "setPitch":
      guard let deg = args.double("deg") else { result(BridgeError.badArgs("deg required")); return }
      setPitch(deg)
      result(nil)
    case "setStyle":
      if let s = args.string("style") { style = s }
      if let d = args.bool("dark") { dark = d }
      if let t = args.bool("showsTraffic") { showsTraffic = t }
      applyStyle()
      result(nil)
    case "setRoute":
      setRoute(args, result)
    case "clearRoute":
      clearRoute()
      result(nil)
    case "setRouteProgress":
      setRouteProgress(args)
      result(nil)
    case "setNavContext":
      let was = navigating
      navigating = args.bool("navigating") ?? false
      distanceToManeuver = args.double("distanceToManeuverM")
      if was && !navigating { endFrames() }
      result(nil)
    case "navFrame":
      navFrame(args)
      result(nil)
    case "setCameraInsets":
      chromeInsets = UIEdgeInsets(top: CGFloat(args.double("top") ?? 0), left: CGFloat(args.double("left") ?? 0),
                                  bottom: CGFloat(args.double("bottom") ?? 0), right: CGFloat(args.double("right") ?? 0))
      result(nil)
    case "setObjects":
      setObjects(args["objects"] as? [Any] ?? [])
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  // MARK: - Style

  private func applyStyle() {
    let elevation: MKMapConfiguration.ElevationStyle = elevationRealistic ? .realistic : .flat
    let config: MKMapConfiguration
    switch style {
    case "hybrid":
      let c = MKHybridMapConfiguration(elevationStyle: elevation)
      c.showsTraffic = showsTraffic
      config = c
    case "muted":
      let c = MKStandardMapConfiguration(elevationStyle: elevation, emphasisStyle: .muted)
      c.showsTraffic = showsTraffic
      config = c
    default:
      let c = MKStandardMapConfiguration(elevationStyle: elevation, emphasisStyle: .default)
      c.showsTraffic = showsTraffic
      config = c
    }
    mapView.preferredConfiguration = config
    mapView.overrideUserInterfaceStyle = dark ? .dark : .light
  }

  // MARK: - Camera modes

  private func setMode(_ m: CameraMode, notify: Bool) {
    let changed = m != mode
    mode = m
    switch m {
    case .follow:
      zoomFactor = 1
      if navigating && frameCoord != nil {
        hasFollowState = false
        frameCamera()
      } else {
        updateFollowCamera(force: true)
      }
    case .overview:
      showOverview()
    case .free:
      break
    }
    if changed && notify { channel.invokeMethod("onCameraMode", arguments: ["mode": m.rawValue]) }
  }

  /// User took control of the map: drop out of the managed camera and tell Dart.
  private func userInteracted() {
    if mode != .free {
      mode = .free
      channel.invokeMethod("onCameraMode", arguments: ["mode": CameraMode.free.rawValue])
    }
    channel.invokeMethod("onUserGesture", arguments: [String: Any]())
  }

  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    guard mode == .follow else { return }
    // While guiding, Dart frames (snapped + dead-reckoned) drive the camera.
    if navigating && CACurrentMediaTime() - lastFrame < 1.5 { return }
    updateFollowCamera(force: !hasFollowState)
  }

  // MARK: - Guidance frames

  /// Per-frame puck / camera / travelled-route update from Dart guidance.
  private func navFrame(_ args: [String: Any]) {
    guard let lat = args.double("lat"), let lon = args.double("lon") else { return }
    let coord = CLLocationCoordinate2D(latitude: lat, longitude: lon)
    guard CLLocationCoordinate2DIsValid(coord) else { return }
    navigating = true
    frameCoord = coord
    if let c = args.double("course"), c >= 0 { frameCourse = c }
    frameSpeed = max(args.double("speed") ?? 0, 0)
    distanceToManeuver = args.double("distanceToManeuverM")
    lastFrame = CACurrentMediaTime()

    if let p = puck {
      p.coordinate = coord
    } else {
      let p = NavPuckAnnotation(coordinate: coord)
      puck = p
      mapView.addAnnotation(p)
    }
    mapView.view(for: mapView.userLocation)?.isHidden = true
    if let v = mapView.view(for: puck!) as? NavPuckView {
      v.setRotation(degrees: frameCourse - Double(mapView.camera.heading))
    }
    if let seg = args.int("segment") {
      setRouteProgress(["segment": seg, "lat": lat, "lon": lon])
    }
    if mode == .follow { frameCamera() }
  }

  private func endFrames() {
    if let p = puck { mapView.removeAnnotation(p) }
    puck = nil
    frameCoord = nil
    mapView.view(for: mapView.userLocation)?.isHidden = false
  }

  /// Google-Maps-like follow camera from guidance frames: heading-up, puck in
  /// the lower part of the free map area, zoom/pitch by speed and by the
  /// distance to the next maneuver. Smoothed per frame (no animations).
  private func frameCamera() {
    guard let coord = frameCoord else { return }
    let t = min(frameSpeed * 3.6 / 130.0, 1.0)
    var targetDistance = (650.0 + t * (1800.0 - 650.0)) * zoomFactor
    var targetPitch = max(maxPitch - t * 12.0, 0)
    if let d = distanceToManeuver, d < 400 {
      let k = max(0, min(1, (d - 50) / 350))
      targetDistance *= 0.6 + 0.4 * k
      targetPitch = min(targetPitch + (1 - k) * 5, 70)
    }
    if !hasFollowState {
      smoothedDistance = targetDistance
      smoothedPitch = targetPitch
      smoothedHeading = frameCourse
      hasFollowState = true
    } else {
      smoothedDistance += 0.06 * (targetDistance - smoothedDistance)
      smoothedPitch += 0.06 * (targetPitch - smoothedPitch)
      var delta = (frameCourse - smoothedHeading).truncatingRemainder(dividingBy: 360)
      if delta > 180 { delta -= 360 } else if delta < -180 { delta += 360 }
      // Ignore heading jitter when crawling; turn smoothly otherwise.
      let gain = frameSpeed < 1.5 ? 0.0 : 0.18
      smoothedHeading = (smoothedHeading + gain * delta + 360).truncatingRemainder(dividingBy: 360)
    }
    // 1) Camera looking at the puck. 2) Shift it so the puck lands ~70 % down
    // the free (un-covered) area — the route ahead stays visible.
    let camera = MKMapCamera(lookingAtCenter: coord, fromDistance: smoothedDistance,
                             pitch: CGFloat(smoothedPitch), heading: smoothedHeading)
    mapView.setCamera(camera, animated: false)
    let b = mapView.bounds
    let free = b.inset(by: chromeInsets)
    guard free.width > 40, free.height > 40 else { return }
    let target = CGPoint(x: free.midX, y: free.minY + free.height * 0.7)
    let c = CGPoint(x: b.midX, y: b.midY)
    let look = CGPoint(x: 2 * c.x - target.x, y: 2 * c.y - target.y)
    let shifted = mapView.convert(look, toCoordinateFrom: mapView)
    guard CLLocationCoordinate2DIsValid(shifted) else { return }
    camera.centerCoordinate = shifted
    mapView.setCamera(camera, animated: false)
  }

  /// Heading-up driving camera. Distance and pitch follow speed (650 m @ 0 km/h — a
  /// comfortable ~350 m view at standstill — → 1800 m @ 130 km/h, pitch max → max-15°),
  /// smoothed and throttled to ~2 Hz to avoid jitter.
  private func updateFollowCamera(force: Bool) {
    guard let loc = mapView.userLocation.location, loc.horizontalAccuracy >= 0 else { return }
    let now = CACurrentMediaTime()
    let elapsed = now - lastCameraUpdate
    if !force && elapsed < Self.minUpdateInterval { return }
    lastCameraUpdate = now

    let speed = max(loc.speed, 0)
    let t = min(speed * 3.6 / 130.0, 1.0)
    var targetDistance = (650.0 + t * (1800.0 - 650.0)) * zoomFactor
    var targetPitch = max(maxPitch - t * 15.0, 0)
    if navigating {
      // Turn-by-turn: a little more context ahead, then zoom in while
      // approaching the next maneuver (down to ~55% within the last 50 m).
      if let d = distanceToManeuver, d < 400 {
        let k = max(0, min(1, (d - 50) / 350))
        targetDistance *= 0.6 + 0.4 * k
        targetPitch = min(targetPitch + (1 - k) * 5, 70)
      }
    }

    var targetHeading = smoothedHeading
    if loc.speed > 2, loc.course >= 0 {
      targetHeading = loc.course
    } else if let h = mapView.userLocation.heading, h.headingAccuracy >= 0 {
      targetHeading = h.trueHeading >= 0 ? h.trueHeading : h.magneticHeading
    }

    if force || !hasFollowState {
      smoothedDistance = targetDistance
      smoothedPitch = targetPitch
      smoothedHeading = targetHeading
      hasFollowState = true
    } else {
      let a = 0.3
      smoothedDistance += a * (targetDistance - smoothedDistance)
      smoothedPitch += a * (targetPitch - smoothedPitch)
      var delta = (targetHeading - smoothedHeading).truncatingRemainder(dividingBy: 360)
      if delta > 180 { delta -= 360 } else if delta < -180 { delta += 360 }
      smoothedHeading = (smoothedHeading + 0.6 * delta + 360).truncatingRemainder(dividingBy: 360)
    }

    // Look slightly ahead so the car sits in the lower part of the screen.
    let center = Self.offset(loc.coordinate, bearing: smoothedHeading,
                             meters: smoothedDistance * (navigating ? 0.06 : 0.2))
    let camera = MKMapCamera(lookingAtCenter: center, fromDistance: smoothedDistance,
                             pitch: CGFloat(smoothedPitch), heading: smoothedHeading)
    let duration = force ? 0.6 : min(max(elapsed, 0.3), Self.maxAnimation)
    UIView.animate(withDuration: duration, delay: 0,
                   options: [.beginFromCurrentState, .allowUserInteraction, .curveLinear]) {
      self.mapView.setCamera(camera, animated: false)
    }
  }

  private func showOverview() {
    guard let line = routeLine else {
      // No route: a calm top-down view around the user.
      guard let loc = mapView.userLocation.location else { return }
      let cam = MKMapCamera(lookingAtCenter: loc.coordinate, fromDistance: 4000, pitch: 0, heading: 0)
      mapView.setCamera(cam, animated: true)
      return
    }
    var rect = line.boundingMapRect
    if let loc = mapView.userLocation.location {
      let p = MKMapPoint(loc.coordinate)
      rect = rect.union(MKMapRect(x: p.x, y: p.y, width: 0, height: 0))
    }
    let b = mapView.bounds
    // Keep the route clear of the Flutter chrome: HUD strip + search / maneuver banner on
    // top, route card / trip bar + drive controls at the bottom.
    let landscape = b.width > b.height
    let top = b.height * (navigating ? 0.34 : 0.2)
    let bottom = b.height * (navigating ? 0.36 : (landscape ? 0.3 : 0.5))
    let side = max(b.width * 0.08, 28)
    let padding = UIEdgeInsets(top: max(top, 60), left: landscape && navigating ? b.width * 0.45 : side,
                               bottom: max(bottom, 120), right: side)
    let flat = MKMapCamera(lookingAtCenter: MKMapPoint(x: rect.midX, y: rect.midY).coordinate,
                           fromDistance: mapView.camera.centerCoordinateDistance, pitch: 0, heading: 0)
    UIView.animate(withDuration: 0.8, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction]) {
      self.mapView.setCamera(flat, animated: false)
      self.mapView.setVisibleMapRect(rect, edgePadding: padding, animated: false)
    }
  }

  private func zoom(delta: Int) {
    guard delta != 0 else { return }
    let factor = pow(0.5, Double(delta))
    switch mode {
    case .follow:
      zoomFactor = min(max(zoomFactor * factor, 0.25), 4)
      // While guiding, the next frame applies the new zoom smoothly.
      if !(navigating && frameCoord != nil) { updateFollowCamera(force: true) }
    case .overview, .free:
      if mode == .overview { setMode(.free, notify: true) }
      guard let cam = mapView.camera.copy() as? MKMapCamera else { return }
      cam.centerCoordinateDistance = min(max(cam.centerCoordinateDistance * factor, 80), 4_000_000)
      mapView.setCamera(cam, animated: true)
    }
  }

  private func setPitch(_ deg: Double) {
    maxPitch = min(max(deg, 0), 75)
    if mode == .follow {
      updateFollowCamera(force: true)
    } else if let cam = mapView.camera.copy() as? MKMapCamera {
      cam.pitch = CGFloat(maxPitch)
      mapView.setCamera(cam, animated: true)
    }
  }

  // MARK: - Gestures

  private func installGestureDetection() {
    let pan = UIPanGestureRecognizer(target: self, action: #selector(onGesture(_:)))
    let pinch = UIPinchGestureRecognizer(target: self, action: #selector(onGesture(_:)))
    let rotate = UIRotationGestureRecognizer(target: self, action: #selector(onGesture(_:)))
    let doubleTap = UITapGestureRecognizer(target: self, action: #selector(onGesture(_:)))
    doubleTap.numberOfTapsRequired = 2
    for g in [pan, pinch, rotate, doubleTap] as [UIGestureRecognizer] {
      g.delegate = self
      g.cancelsTouchesInView = false
      g.delaysTouchesBegan = false
      g.delaysTouchesEnded = false
      mapView.addGestureRecognizer(g)
    }
  }

  @objc private func onGesture(_ g: UIGestureRecognizer) {
    if g.state == .began || (g is UITapGestureRecognizer && g.state == .ended) { userInteracted() }
  }

  func gestureRecognizer(_ g: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith other: UIGestureRecognizer) -> Bool {
    true
  }

  // MARK: - Route

  private func setRoute(_ args: [String: Any], _ result: @escaping FlutterResult) {
    guard let typed = args["polyline"] as? FlutterStandardTypedData else {
      result(BridgeError.badArgs("polyline (Float64List) required")); return
    }
    let values: [Double] = typed.data.withUnsafeBytes { raw in Array(raw.bindMemory(to: Double.self)) }
    guard values.count >= 4 else { result(BridgeError.badArgs("polyline needs at least two points")); return }
    var coords: [CLLocationCoordinate2D] = []
    coords.reserveCapacity(values.count / 2)
    var i = 0
    while i + 1 < values.count {
      let c = CLLocationCoordinate2D(latitude: values[i], longitude: values[i + 1])
      if CLLocationCoordinate2DIsValid(c) { coords.append(c) }
      i += 2
    }
    guard coords.count >= 2 else { result(BridgeError.badArgs("polyline has no valid coordinates")); return }

    clearRoute()
    let casing = MKPolyline(coordinates: coords, count: coords.count)
    casing.title = "casing"
    let passed = MKPolyline(coordinates: coords, count: coords.count)
    passed.title = "passed"
    let line = MKPolyline(coordinates: coords, count: coords.count)
    line.title = "route"
    mapView.addOverlay(casing, level: .aboveRoads)
    mapView.addOverlay(passed, level: .aboveRoads)
    mapView.addOverlay(line, level: .aboveRoads)
    routeCasing = casing
    routePassed = passed
    routeLine = line
    routeCoords = coords
    routeCum = [0]
    routeCum.reserveCapacity(coords.count)
    for i in 1..<coords.count {
      routeCum.append(routeCum[i - 1] + MKMapPoint(coords[i - 1]).distance(to: MKMapPoint(coords[i])))
    }
    progressFraction = 0

    if let d = args["destination"] as? [String: Any], let lat = d.double("lat"), let lon = d.double("lon") {
      let coord = CLLocationCoordinate2D(latitude: lat, longitude: lon)
      if CLLocationCoordinate2DIsValid(coord) {
        let ann = DestinationAnnotation(coordinate: coord, title: d.string("name"))
        mapView.addAnnotation(ann)
        destination = ann
      }
    }
    if mode == .overview { showOverview() }
    result(nil)
  }

  private func clearRoute() {
    let overlays = [routeCasing, routePassed, routeLine].compactMap { $0 }
    if !overlays.isEmpty { mapView.removeOverlays(overlays) }
    if let d = destination { mapView.removeAnnotation(d) }
    routeCasing = nil
    routePassed = nil
    routeLine = nil
    destination = nil
    routeCoords = []
    routeCum = []
    renderers = [:]
    progressFraction = 0
  }

  /// Travelled part = [0, fraction] of the line (by map-point length): drawn
  /// dimmed; the remaining part keeps the bright colour.
  private func setRouteProgress(_ args: [String: Any]) {
    guard routeCoords.count >= 2, let total = routeCum.last, total > 0,
          let seg = args.int("segment"), let lat = args.double("lat"), let lon = args.double("lon") else { return }
    let i = max(0, min(seg, routeCoords.count - 2))
    let along = routeCum[i] + MKMapPoint(routeCoords[i]).distance(to: MKMapPoint(CLLocationCoordinate2D(latitude: lat, longitude: lon)))
    let f = CGFloat(max(0, min(1, along / total)))
    guard abs(f - progressFraction) > 0.0005 else { return }
    progressFraction = f
    applyProgress()
  }

  private func applyProgress() {
    let f = progressFraction
    if let r = renderers["route"] { r.strokeStart = f; r.setNeedsDisplay() }
    if let r = renderers["casing"] { r.strokeStart = f; r.setNeedsDisplay() }
    if let r = renderers["passed"] { r.strokeEnd = f; r.setNeedsDisplay() }
  }

  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    guard let line = overlay as? MKPolyline else { return MKOverlayRenderer(overlay: overlay) }
    let r = MKPolylineRenderer(polyline: line)
    let kind = line.title ?? "route"
    switch kind {
    case "casing":
      r.strokeColor = UIColor(rgb: 0x06323B)
      r.lineWidth = 13
      r.strokeStart = progressFraction
    case "passed":
      r.strokeColor = UIColor(rgb: 0x5B6B78).withAlphaComponent(0.85)
      r.lineWidth = 8
      r.strokeEnd = progressFraction
    default:
      r.strokeColor = UIColor(rgb: 0x38D9E8)
      r.lineWidth = 8
      r.strokeStart = progressFraction
    }
    r.lineCap = .round
    r.lineJoin = .round
    renderers[kind] = r
    return r
  }

  // MARK: - Detection markers

  private func setObjects(_ raw: [Any]) {
    var incoming: [String: (cls: Int, approx: Bool, coord: CLLocationCoordinate2D)] = [:]
    for item in raw {
      guard let m = item as? [String: Any], let idValue = m["id"],
            let cls = m.int("cls"), let lat = m.double("lat"), let lon = m.double("lon") else { continue }
      let coord = CLLocationCoordinate2D(latitude: lat, longitude: lon)
      guard CLLocationCoordinate2DIsValid(coord) else { continue }
      incoming["\(idValue)"] = (cls, m.bool("approx") ?? true, coord)
    }

    let removed = objects.filter { incoming[$0.key] == nil }
    if !removed.isEmpty {
      mapView.removeAnnotations(Array(removed.values))
      for k in removed.keys { objects[k] = nil }
    }

    var added: [DetectionAnnotation] = []
    var moved: [(DetectionAnnotation, CLLocationCoordinate2D)] = []
    for (id, v) in incoming {
      if let existing = objects[id] {
        if existing.cls != v.cls || existing.approx != v.approx {
          existing.cls = v.cls
          existing.approx = v.approx
          (mapView.view(for: existing) as? DetectionMarkerView)?.configure()
        }
        if existing.coordinate.latitude != v.coord.latitude || existing.coordinate.longitude != v.coord.longitude {
          moved.append((existing, v.coord))
        }
      } else {
        let a = DetectionAnnotation(id: id, cls: v.cls, approx: v.approx, coordinate: v.coord)
        objects[id] = a
        added.append(a)
      }
    }
    if !moved.isEmpty {
      UIView.animate(withDuration: 0.25, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction]) {
        for (a, c) in moved { a.coordinate = c }
      }
    }
    if !added.isEmpty { mapView.addAnnotations(added) }
  }

  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    if annotation is MKUserLocation { return nil }
    if annotation is DetectionAnnotation {
      let v = mapView.dequeueReusableAnnotationView(withIdentifier: DetectionMarkerView.reuseId, for: annotation)
      (v as? DetectionMarkerView)?.configure()
      return v
    }
    if annotation is NavPuckAnnotation {
      return mapView.dequeueReusableAnnotationView(withIdentifier: NavPuckView.reuseId, for: annotation)
    }
    if annotation is DestinationAnnotation {
      let v = mapView.dequeueReusableAnnotationView(withIdentifier: "corvista.destination", for: annotation)
      if let marker = v as? MKMarkerAnnotationView {
        marker.markerTintColor = UIColor(rgb: 0x38D9E8)
        marker.glyphImage = UIImage(systemName: "flag.checkered") ?? UIImage(systemName: "flag.fill")
        marker.displayPriority = .required
        marker.canShowCallout = true
      }
      return v
    }
    return nil
  }

  // MARK: - Geometry

  /// Coordinate `meters` away from `c` along `bearing` (degrees, spherical earth).
  static func offset(_ c: CLLocationCoordinate2D, bearing: Double, meters: Double) -> CLLocationCoordinate2D {
    let r = 6_371_000.0
    let d = meters / r
    let b = bearing * .pi / 180
    let lat1 = c.latitude * .pi / 180
    let lon1 = c.longitude * .pi / 180
    let lat2 = asin(sin(lat1) * cos(d) + cos(lat1) * sin(d) * cos(b))
    let lon2 = lon1 + atan2(sin(b) * sin(d) * cos(lat1), cos(d) - sin(lat1) * sin(lat2))
    return CLLocationCoordinate2D(latitude: lat2 * 180 / .pi, longitude: lon2 * 180 / .pi)
  }
}
