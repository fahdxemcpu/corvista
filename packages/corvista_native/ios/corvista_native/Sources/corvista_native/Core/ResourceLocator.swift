import Foundation

/// Finds bundled resources whether the plugin is built by CocoaPods
/// (resource bundle `corvista_native_models`) or Swift Package Manager (`Bundle.module`).
enum ResourceLocator {
  private final class Anchor {}

  static func compiledModelURL(named name: String) -> URL? {
    var candidates: [Bundle] = []
    let pluginBundle = Bundle(for: Anchor.self)
    if let url = pluginBundle.url(forResource: "corvista_native_models", withExtension: "bundle"),
       let b = Bundle(url: url) { candidates.append(b) }
    if let url = Bundle.main.url(forResource: "corvista_native_models", withExtension: "bundle"),
       let b = Bundle(url: url) { candidates.append(b) }
    #if SWIFT_PACKAGE
    candidates.append(Bundle.module)
    #endif
    candidates.append(pluginBundle)
    candidates.append(Bundle.main)
    for b in candidates {
      if let u = b.url(forResource: name, withExtension: "mlmodelc") { return u }
      if let u = b.url(forResource: name, withExtension: "mlmodelc", subdirectory: "Models") { return u }
    }
    return nil
  }
}
