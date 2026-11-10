import Flutter
import UIKit

/// Entry point. Routes `corvista/engine` method calls to modules by prefix
/// (`camera.*`, `ai.*`, ...). Each module owns one subsystem. See docs/BRIDGE.md.
public class CorvistaNativePlugin: NSObject, FlutterPlugin {
  private var modules: [String: ChannelModule] = [:]

  public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = CorvistaNativePlugin()
    let messenger = registrar.messenger()
    let channel = FlutterMethodChannel(name: "corvista/engine", binaryMessenger: messenger)
    registrar.addMethodCallDelegate(instance, channel: channel)

    let hub = EventHub.shared
    hub.attach(messenger: messenger)

    let context = ModuleContext(registrar: registrar, messenger: messenger, events: hub)
    let all: [ChannelModule] = [
      CameraModule(context: context),
      AIModule(context: context),
      RecorderModule(context: context),
      LocationModule(context: context),
      MotionModule(context: context),
      NavigationModule(context: context),
      WeatherModule(context: context),
      SpeechModule(context: context),
      AudioModule(context: context),
      VoiceCancelModule(context: context),
      ContactsModule(context: context),
      EmergencyModule(context: context),
      PermissionsModule(context: context),
      SystemModule(context: context),
      MediaModule(context: context),
      LiveActivityModule(context: context),
    ]
    for m in all { instance.modules[m.prefix] = m }

    registrar.register(MapViewFactory(messenger: messenger), withId: "corvista/map")
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let parts = call.method.split(separator: ".", maxSplits: 1).map(String.init)
    guard parts.count == 2, let module = modules[parts[0]] else {
      result(FlutterMethodNotImplemented)
      return
    }
    let args = call.arguments as? [String: Any] ?? [:]
    module.handle(method: parts[1], args: args, result: result)
  }

  public func detachFromEngine(for registrar: FlutterPluginRegistrar) {
    for m in modules.values { m.dispose() }
  }
}
