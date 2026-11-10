import Flutter
import UIKit

/// Small UIKit helpers shared by modules that present system UI.
enum UIKitHelpers {
  /// Foreground-active window scene (falls back to any connected window scene).
  static var activeScene: UIWindowScene? {
    let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
    return scenes.first(where: { $0.activationState == .foregroundActive }) ?? scenes.first
  }

  static var keyWindow: UIWindow? {
    guard let scene = activeScene else { return nil }
    return scene.windows.first(where: { $0.isKeyWindow }) ?? scene.windows.first
  }

  /// The view controller currently on top of the presentation stack. Main thread only.
  static func topViewController() -> UIViewController? {
    top(from: keyWindow?.rootViewController, depth: 0)
  }

  private static func top(from vc: UIViewController?, depth: Int) -> UIViewController? {
    guard let vc else { return nil }
    if depth > 16 { return vc }
    if let presented = vc.presentedViewController, !presented.isBeingDismissed {
      return top(from: presented, depth: depth + 1)
    }
    if let nav = vc as? UINavigationController, let top = nav.topViewController {
      return self.top(from: top, depth: depth + 1)
    }
    if let tab = vc as? UITabBarController, let selected = tab.selectedViewController {
      return top(from: selected, depth: depth + 1)
    }
    return vc
  }

  /// Runs `work` on the main thread (synchronously if already there).
  static func onMain(_ work: @escaping () -> Void) {
    if Thread.isMainThread { work() } else { DispatchQueue.main.async(execute: work) }
  }

  static func nowMs() -> Double { Date().timeIntervalSince1970 * 1000 }
}
