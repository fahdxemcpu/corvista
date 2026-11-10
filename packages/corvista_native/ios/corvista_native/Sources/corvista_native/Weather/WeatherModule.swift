import CoreLocation
import Flutter
import Foundation
import MapKit
import WeatherKit

/// `weather.get`: Apple WeatherKit current conditions + next 12 hours, with the
/// attribution WeatherKit requires. Cached 10 min per ~1 km cell. Never fabricates data:
/// any failure (missing entitlement, offline) is reported as `unavailable`.
final class WeatherModule: ChannelModule {
  let prefix = "weather"
  private let context: ModuleContext

  private struct CacheEntry { let payload: [String: Any]; let at: Date }
  private var cache: [String: CacheEntry] = [:]
  private var placeNames: [String: String] = [:]
  private let lock = NSLock()
  private static let ttl: TimeInterval = 600

  init(context: ModuleContext) { self.context = context }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    guard method == "get" else { result(FlutterMethodNotImplemented); return }
    guard let lat = args.double("lat"), let lon = args.double("lon"),
          CLLocationCoordinate2DIsValid(CLLocationCoordinate2D(latitude: lat, longitude: lon)) else {
      result(BridgeError.badArgs("lat, lon required")); return
    }
    let key = Self.cellKey(lat: lat, lon: lon)
    if let hit = cached(key) { result(hit); return }

    Task {
      do {
        let payload = try await self.fetch(lat: lat, lon: lon, key: key)
        self.store(key, payload)
        result(payload)
      } catch {
        let ns = error as NSError
        result(FlutterError(
          code: "unavailable",
          message: "Weather unavailable: \(ns.localizedDescription)",
          details: "\(ns.domain) \(ns.code)"))
      }
    }
  }

  // MARK: - Fetch

  private func fetch(lat: Double, lon: Double, key: String) async throws -> [String: Any] {
    let location = CLLocation(latitude: lat, longitude: lon)
    let service = WeatherService.shared
    async let weatherTask = service.weather(for: location, including: .current, .hourly)
    async let attributionTask = service.attribution
    let (current, hourly) = try await weatherTask
    let attribution = try await attributionTask

    let now = Date()
    // Hours from the one containing "now" onwards.
    let upcoming = hourly.forecast.filter { $0.date.addingTimeInterval(3600) > now }
    let next12 = Array(upcoming.prefix(12))

    var cur: [String: Any] = [
      "condition": current.condition.rawValue,
      "description": current.condition.description,
      "symbol": current.symbolName,
      "temperatureC": current.temperature.converted(to: .celsius).value,
      "apparentC": current.apparentTemperature.converted(to: .celsius).value,
      "humidity": current.humidity,
      "windKph": current.wind.speed.converted(to: .kilometersPerHour).value,
      "windDirectionDeg": current.wind.direction.converted(to: .degrees).value,
      "isDaylight": current.isDaylight,
      "asOf": current.date.timeIntervalSince1970 * 1000,
    ]
    let visibilityKm = current.visibility.converted(to: .kilometers).value
    if visibilityKm.isFinite && visibilityKm >= 0 { cur["visibilityKm"] = visibilityKm }
    // CurrentWeather has no precipitation chance; use the forecast for the current hour.
    cur["precipitationChance"] = next12.first?.precipitationChance ?? 0

    var payload: [String: Any] = [
      "current": cur,
      "hourly": next12.map { h -> [String: Any] in
        [
          "ts": h.date.timeIntervalSince1970 * 1000,
          "condition": h.condition.rawValue,
          "symbol": h.symbolName,
          "temperatureC": h.temperature.converted(to: .celsius).value,
          "precipitationChance": h.precipitationChance,
          "windKph": h.wind.speed.converted(to: .kilometersPerHour).value,
        ]
      },
      "attribution": [
        "serviceName": attribution.serviceName,
        "legalURL": attribution.legalPageURL.absoluteString,
        "logoLightURL": attribution.combinedMarkLightURL.absoluteString,
        "logoDarkURL": attribution.combinedMarkDarkURL.absoluteString,
      ],
    ]
    if let name = await placeName(for: location, key: key) { payload["locationName"] = name }
    return payload
  }

  /// Short locality name; failures simply omit the name.
  private func placeName(for location: CLLocation, key: String) async -> String? {
    let known = lock.withLock { placeNames[key] }
    if let known { return known }

    var name: String?
    if #available(iOS 26.0, *) {
      if let request = MKReverseGeocodingRequest(location: location),
         let item = try? await request.mapItems.first {
        name = item.addressRepresentations?.cityName ?? item.name
      }
    } else {
      if let placemark = try? await CLGeocoder().reverseGeocodeLocation(location).first {
        name = placemark.locality ?? placemark.subAdministrativeArea ?? placemark.administrativeArea
      }
    }
    if let name, !name.isEmpty {
      lock.withLock { placeNames[key] = name }
      return name
    }
    return nil
  }

  // MARK: - Cache

  /// ~1.1 km cells (0.01°).
  private static func cellKey(lat: Double, lon: Double) -> String {
    "\(Int((lat * 100).rounded())):\(Int((lon * 100).rounded()))"
  }

  private func cached(_ key: String) -> [String: Any]? {
    lock.lock(); defer { lock.unlock() }
    guard let e = cache[key], Date().timeIntervalSince(e.at) < Self.ttl else { return nil }
    return e.payload
  }

  private func store(_ key: String, _ payload: [String: Any]) {
    lock.lock(); defer { lock.unlock() }
    let now = Date()
    cache = cache.filter { now.timeIntervalSince($0.value.at) < Self.ttl }
    cache[key] = CacheEntry(payload: payload, at: now)
  }
}
