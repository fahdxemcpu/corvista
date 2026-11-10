import Flutter
import MessageUI
import UIKit

/// `emergency.*`: user-confirmed phone call and pre-filled SMS. Nothing is ever sent
/// automatically — iOS shows its own call confirmation and the user taps Send.
final class EmergencyModule: NSObject, ChannelModule, MFMessageComposeViewControllerDelegate {
  let prefix = "emergency"
  private let context: ModuleContext
  private var pendingCompose: FlutterResult?

  private static let dialable = CharacterSet(charactersIn: "0123456789+*#")

  init(context: ModuleContext) {
    self.context = context
    super.init()
  }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    UIKitHelpers.onMain {
      switch method {
      case "call": self.call(args, result)
      case "compose": self.compose(args, result)
      default: result(FlutterMethodNotImplemented)
      }
    }
  }

  private func call(_ args: [String: Any], _ result: @escaping FlutterResult) {
    guard let raw = args.string("number") else { result(BridgeError.badArgs("number required")); return }
    let digits = String(raw.unicodeScalars.filter { Self.dialable.contains($0) })
    guard !digits.isEmpty,
          let encoded = digits.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "0123456789+*")),
          let url = URL(string: "tel://\(encoded)") else {
      result(BridgeError.badArgs("number has no dialable digits")); return
    }
    guard UIApplication.shared.canOpenURL(url) else { result(false); return }
    UIApplication.shared.open(url, options: [:]) { ok in result(ok) }
  }

  private func compose(_ args: [String: Any], _ result: @escaping FlutterResult) {
    guard MFMessageComposeViewController.canSendText() else { result("unavailable"); return }
    guard pendingCompose == nil else {
      result(FlutterError(code: "failed", message: "A message composer is already open", details: nil)); return
    }
    guard let top = UIKitHelpers.topViewController() else { result("unavailable"); return }
    let vc = MFMessageComposeViewController()
    vc.messageComposeDelegate = self
    vc.recipients = (args["recipients"] as? [Any] ?? []).compactMap { $0 as? String }
    vc.body = args.string("body") ?? ""
    pendingCompose = result
    top.present(vc, animated: true)
  }

  func messageComposeViewController(_ controller: MFMessageComposeViewController,
                                    didFinishWith result: MessageComposeResult) {
    let value: String
    switch result {
    case .sent: value = "sent"
    case .cancelled: value = "cancelled"
    case .failed: value = "failed"
    @unknown default: value = "failed"
    }
    controller.dismiss(animated: true)
    let r = pendingCompose
    pendingCompose = nil
    r?(value)
  }
}
