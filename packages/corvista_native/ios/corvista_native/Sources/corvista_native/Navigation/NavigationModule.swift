import CoreLocation
import Flutter
import Foundation
import MapKit

/// `nav.*`: MapKit autocomplete, place search and driving directions (no map view needed).
final class NavigationModule: NSObject, ChannelModule, MKLocalSearchCompleterDelegate {
  let prefix = "nav"
  private let context: ModuleContext

  // Completer state — main thread only (MKLocalSearchCompleter is main-thread bound).
  private var completer: MKLocalSearchCompleter?
  private var completions: [String: MKLocalSearchCompletion] = [:]
  private var currentResultIds: [String] = []
  private var nextId = 0
  private var pending: [(result: FlutterResult, timeout: DispatchWorkItem)] = []
  private var lastRegionCenter: CLLocationCoordinate2D?

  private static let completeTimeout: TimeInterval = 4.0
  private static let searchRadiusM: CLLocationDistance = 50_000

  init(context: ModuleContext) {
    self.context = context
    super.init()
  }

  func dispose() {
    UIKitHelpers.onMain {
      self.completer?.cancel()
      self.completer?.delegate = nil
      self.answerPending()
    }
  }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    UIKitHelpers.onMain {
      switch method {
      case "complete": self.complete(args, result)
      case "resolve": self.resolve(args, result)
      case "search": self.search(args, result)
      case "route": self.route(args, result)
      default: result(FlutterMethodNotImplemented)
      }
    }
  }

  // MARK: - Autocomplete

  private func complete(_ args: [String: Any], _ result: @escaping FlutterResult) {
    let query = (args.string("query") ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
    let c = ensureCompleter()
    guard !query.isEmpty else {
      c.cancel()
      answerPending()
      result([[String: Any]]())
      return
    }
    var regionChanged = false
    if let lat = args.double("lat"), let lon = args.double("lon"), CLLocationCoordinate2DIsValid(.init(latitude: lat, longitude: lon)) {
      let center = CLLocationCoordinate2D(latitude: lat, longitude: lon)
      if lastRegionCenter.map({ Self.distance($0, center) > 1000 }) ?? true {
        c.region = MKCoordinateRegion(center: center, latitudinalMeters: Self.searchRadiusM, longitudinalMeters: Self.searchRadiusM)
        lastRegionCenter = center
        regionChanged = true
      }
    }
    // Same fragment and nothing in flight: MapKit will not fire another update.
    if query == c.queryFragment && !regionChanged && !c.isSearching {
      result(currentPayload())
      return
    }
    // Only the newest request waits for MapKit: superseded callers (Dart drops
    // them anyway) are answered now, so an *older* request's timeout can never
    // answer the newest one early with stale / empty results.
    answerPending()
    let timeout = DispatchWorkItem { [weak self] in self?.answerPending() }
    pending.append((result, timeout))
    DispatchQueue.main.asyncAfter(deadline: .now() + Self.completeTimeout, execute: timeout)
    if query != c.queryFragment {
      c.queryFragment = query  // MapKit debounces internally.
    } else if regionChanged {
      // Force a refresh for the new region.
      c.queryFragment = query + " "
      c.queryFragment = query
    }
  }

  private func ensureCompleter() -> MKLocalSearchCompleter {
    if let c = completer { return c }
    let c = MKLocalSearchCompleter()
    c.resultTypes = [.address, .pointOfInterest]
    c.delegate = self
    completer = c
    return c
  }

  func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
    // Bound memory, but keep ids from the previous update resolvable for a while.
    if completions.count > 300 {
      let keep = Set(currentResultIds)
      completions = completions.filter { keep.contains($0.key) }
    }
    currentResultIds = completer.results.map { completion in
      nextId += 1
      let id = "c\(nextId)"
      completions[id] = completion
      return id
    }
    answerPending()
  }

  func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
    if (error as? MKError)?.code == .placemarkNotFound {
      currentResultIds = []
      answerPending()
      return
    }
    let err = Self.unavailable(error)
    let waiters = pending
    pending.removeAll()
    for w in waiters { w.timeout.cancel(); w.result(err) }
  }

  private func currentPayload() -> [[String: Any]] {
    currentResultIds.compactMap { id in
      guard let c = completions[id] else { return nil }
      return ["id": id, "title": c.title, "subtitle": c.subtitle]
    }
  }

  private func answerPending() {
    guard !pending.isEmpty else { return }
    let payload = currentPayload()
    let waiters = pending
    pending.removeAll()
    for w in waiters { w.timeout.cancel(); w.result(payload) }
  }

  // MARK: - Resolve / search

  private func resolve(_ args: [String: Any], _ result: @escaping FlutterResult) {
    guard let id = args.string("id") else { result(BridgeError.badArgs("id required")); return }
    guard let completion = completions[id] else {
      result(BridgeError.badArgs("Unknown or expired completion id")); return
    }
    let request = MKLocalSearch.Request(completion: completion)
    request.resultTypes = [.address, .pointOfInterest]
    run(MKLocalSearch(request: request), result)
  }

  private func search(_ args: [String: Any], _ result: @escaping FlutterResult) {
    let query = (args.string("query") ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
    guard !query.isEmpty else { result(BridgeError.badArgs("query required")); return }
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = query
    request.resultTypes = [.address, .pointOfInterest]
    if let lat = args.double("lat"), let lon = args.double("lon") {
      request.region = MKCoordinateRegion(
        center: .init(latitude: lat, longitude: lon),
        latitudinalMeters: Self.searchRadiusM, longitudinalMeters: Self.searchRadiusM)
    }
    run(MKLocalSearch(request: request), result)
  }

  private func run(_ search: MKLocalSearch, _ result: @escaping FlutterResult) {
    search.start { response, error in
      if let error {
        if (error as? MKError)?.code == .placemarkNotFound { result([[String: Any]]()); return }
        result(Self.unavailable(error)); return
      }
      result((response?.mapItems ?? []).map(Self.place))
    }
  }

  static func place(_ item: MKMapItem) -> [String: Any] {
    let coord = coordinate(of: item)
    var out: [String: Any] = [
      "name": item.name ?? "",
      "address": address(of: item),
      "lat": coord.latitude,
      "lon": coord.longitude,
    ]
    if let cat = item.pointOfInterestCategory {
      var raw = cat.rawValue
      if raw.hasPrefix("MKPOICategory") { raw.removeFirst("MKPOICategory".count) }
      if let first = raw.first { out["category"] = first.lowercased() + raw.dropFirst() }
    }
    return out
  }

  static func coordinate(of item: MKMapItem) -> CLLocationCoordinate2D {
    if #available(iOS 26.0, *) { return item.location.coordinate }
    return item.placemark.coordinate
  }

  static func address(of item: MKMapItem) -> String {
    if #available(iOS 26.0, *) {
      if let a = item.address?.fullAddress, !a.isEmpty { return a.replacingOccurrences(of: "\n", with: ", ") }
      return item.address?.shortAddress ?? ""
    }
    let p = item.placemark
    var parts: [String] = []
    let street = [p.subThoroughfare, p.thoroughfare].compactMap { $0 }.joined(separator: " ")
    if !street.isEmpty { parts.append(street) }
    for v in [p.locality, p.administrativeArea, p.country] { if let v, !v.isEmpty, !parts.contains(v) { parts.append(v) } }
    return parts.joined(separator: ", ")
  }

  // MARK: - Directions

  private func route(_ args: [String: Any], _ result: @escaping FlutterResult) {
    guard let fLat = args.double("fromLat"), let fLon = args.double("fromLon"),
          let tLat = args.double("toLat"), let tLon = args.double("toLon") else {
      result(BridgeError.badArgs("fromLat, fromLon, toLat, toLon required")); return
    }
    let from = CLLocationCoordinate2D(latitude: fLat, longitude: fLon)
    let to = CLLocationCoordinate2D(latitude: tLat, longitude: tLon)
    guard CLLocationCoordinate2DIsValid(from), CLLocationCoordinate2DIsValid(to) else {
      result(BridgeError.badArgs("Invalid coordinates")); return
    }
    let request = MKDirections.Request()
    request.source = Self.mapItem(from)
    request.destination = Self.mapItem(to)
    request.transportType = .automobile
    request.requestsAlternateRoutes = true
    MKDirections(request: request).calculate { response, error in
      if let error {
        if let mk = error as? MKError, mk.code == .directionsNotFound {
          // No driving directions here (unsupported region / no road link).
          result(FlutterError(code: "no_route", message: error.localizedDescription, details: nil)); return
        }
        result(Self.unavailable(error)); return
      }
      let routes = response?.routes ?? []
      guard !routes.isEmpty else { result(BridgeError.unavailable("No route found")); return }
      result(routes.enumerated().map { Self.routePayload($0.element, index: $0.offset) })
    }
  }

  static func mapItem(_ c: CLLocationCoordinate2D) -> MKMapItem {
    if #available(iOS 26.0, *) {
      return MKMapItem(location: CLLocation(latitude: c.latitude, longitude: c.longitude), address: nil)
    }
    return MKMapItem(placemark: MKPlacemark(coordinate: c))
  }

  static func routePayload(_ r: MKRoute, index: Int) -> [String: Any] {
    var steps: [[String: Any]] = []
    var carried: CLLocationDistance = 0
    for (i, step) in r.steps.enumerated() {
      let text = step.instructions.trimmingCharacters(in: .whitespacesAndNewlines)
      if i == 0 && text.isEmpty {
        // The initial "depart" step has no instruction; fold its distance into the
        // first real maneuver so step distances still sum to the route distance.
        carried = step.distance
        continue
      }
      // A step's instruction is performed at the END of its polyline (the
      // polyline is the stretch driven before the maneuver; verified against
      // the route geometry: turn angles at the polyline start match the
      // *previous* instruction). So the maneuver point is the last coordinate.
      let at = lastCoordinate(of: step.polyline)
      var s: [String: Any] = [
        "instructions": text,
        "distanceM": step.distance + carried,
        "lat": at.latitude,
        "lon": at.longitude,
      ]
      carried = 0
      if let notice = step.notice, !notice.isEmpty { s["notice"] = notice }
      // MapKit appends walking steps when the destination needs a final walk.
      if step.transportType == .walking { s["walking"] = true }
      steps.append(s)
    }
    return [
      "id": "r\(index)",
      "name": r.name,
      "distanceM": r.distance,
      "expectedTravelTimeS": r.expectedTravelTime,
      "advisories": r.advisoryNotices,
      "polyline": FlutterStandardTypedData(float64: latLonData(r.polyline)),
      "steps": steps,
    ]
  }

  static func firstCoordinate(of polyline: MKPolyline) -> CLLocationCoordinate2D {
    guard polyline.pointCount > 0 else { return polyline.coordinate }
    return polyline.points()[0].coordinate
  }

  static func lastCoordinate(of polyline: MKPolyline) -> CLLocationCoordinate2D {
    guard polyline.pointCount > 0 else { return polyline.coordinate }
    return polyline.points()[polyline.pointCount - 1].coordinate
  }

  /// Flat `[lat0, lon0, lat1, lon1, ...]` as raw Float64 bytes.
  static func latLonData(_ polyline: MKPolyline) -> Data {
    let n = polyline.pointCount
    var flat = [Double]()
    flat.reserveCapacity(n * 2)
    let pts = polyline.points()
    for i in 0..<n {
      let c = pts[i].coordinate
      flat.append(c.latitude)
      flat.append(c.longitude)
    }
    return flat.withUnsafeBufferPointer { Data(buffer: $0) }
  }

  // MARK: - Helpers

  static func unavailable(_ error: Error) -> FlutterError {
    let ns = error as NSError
    var msg = ns.localizedDescription
    if let reason = ns.localizedFailureReason, !reason.isEmpty, !msg.contains(reason) { msg += " " + reason }
    return FlutterError(code: "unavailable", message: msg, details: "\(ns.domain) \(ns.code)")
  }

  static func distance(_ a: CLLocationCoordinate2D, _ b: CLLocationCoordinate2D) -> CLLocationDistance {
    CLLocation(latitude: a.latitude, longitude: a.longitude).distance(from: CLLocation(latitude: b.latitude, longitude: b.longitude))
  }
}
