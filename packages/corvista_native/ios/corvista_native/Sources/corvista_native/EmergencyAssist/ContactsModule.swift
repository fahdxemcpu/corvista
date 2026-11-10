import Contacts
import ContactsUI
import Flutter
import UIKit

/// `contacts.pick`: system contact picker limited to phone numbers. The picker runs out of
/// process, so no Contacts permission (and no NSContactsUsageDescription) is needed.
final class ContactsModule: NSObject, ChannelModule, CNContactPickerDelegate {
  let prefix = "contacts"
  private let context: ModuleContext
  private var pending: FlutterResult?

  init(context: ModuleContext) {
    self.context = context
    super.init()
  }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    guard method == "pick" else { result(FlutterMethodNotImplemented); return }
    UIKitHelpers.onMain { self.present(result) }
  }

  private func present(_ result: @escaping FlutterResult) {
    guard pending == nil else {
      result(FlutterError(code: "failed", message: "A contact picker is already open", details: nil)); return
    }
    guard let top = UIKitHelpers.topViewController() else {
      result(BridgeError.unavailable("No view controller to present from")); return
    }
    let picker = CNContactPickerViewController()
    picker.delegate = self
    picker.displayedPropertyKeys = [CNContactPhoneNumbersKey]
    picker.predicateForEnablingContact = NSPredicate(format: "phoneNumbers.@count > 0")
    // Always drill into the contact so the user chooses which number.
    picker.predicateForSelectionOfContact = NSPredicate(value: false)
    picker.predicateForSelectionOfProperty = NSPredicate(format: "key == 'phoneNumbers'")
    pending = result
    top.present(picker, animated: true)
  }

  private func complete(_ value: Any?) {
    let r = pending
    pending = nil
    r?(value)
  }

  func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
    complete(nil)
  }

  func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
    guard let number = contactProperty.value as? CNPhoneNumber else { complete(nil); return }
    complete(payload(contactProperty.contact, phone: number.stringValue))
  }

  func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
    guard let number = contact.phoneNumbers.first?.value else { complete(nil); return }
    complete(payload(contact, phone: number.stringValue))
  }

  private func payload(_ c: CNContact, phone: String) -> [String: Any] {
    var name = CNContactFormatter.string(from: c, style: .fullName) ?? ""
    if name.isEmpty { name = c.organizationName }
    if name.isEmpty { name = phone }
    return ["identifier": c.identifier, "name": name, "phone": phone]
  }
}
