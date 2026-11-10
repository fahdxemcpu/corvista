import Flutter
import Foundation

/// Shared dependencies handed to every module.
public final class ModuleContext {
  public let registrar: FlutterPluginRegistrar
  public let messenger: FlutterBinaryMessenger
  public let events: EventHub
  init(registrar: FlutterPluginRegistrar, messenger: FlutterBinaryMessenger, events: EventHub) {
    self.registrar = registrar
    self.messenger = messenger
    self.events = events
  }
}

/// One subsystem reachable as `<prefix>.<method>` on `corvista/engine`.
/// `handle` must call `result` exactly once, on any thread (Flutter hops to main).
public protocol ChannelModule: AnyObject {
  var prefix: String { get }
  func handle(method: String, args: [String: Any], result: @escaping FlutterResult)
  func dispose()
}

public extension ChannelModule {
  func dispose() {}
}

/// Standard error helpers so Dart sees consistent `PlatformException.code`s.
public enum BridgeError {
  public static func badArgs(_ msg: String) -> FlutterError {
    FlutterError(code: "bad_args", message: msg, details: nil)
  }
  public static func permission(_ what: String) -> FlutterError {
    FlutterError(code: "permission_denied", message: "\(what) permission not granted", details: nil)
  }
  public static func unavailable(_ msg: String) -> FlutterError {
    FlutterError(code: "unavailable", message: msg, details: nil)
  }
  public static func failure(_ code: String, _ error: Error) -> FlutterError {
    FlutterError(code: code, message: error.localizedDescription, details: String(describing: error))
  }
}

/// Typed argument access.
public extension Dictionary where Key == String, Value == Any {
  func double(_ k: String) -> Double? { (self[k] as? NSNumber)?.doubleValue }
  func int(_ k: String) -> Int? { (self[k] as? NSNumber)?.intValue }
  func bool(_ k: String) -> Bool? { (self[k] as? NSNumber)?.boolValue }
  func string(_ k: String) -> String? { self[k] as? String }
}
