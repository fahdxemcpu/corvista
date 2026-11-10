import MapKit
import UIKit

extension UIColor {
  convenience init(rgb: UInt32, alpha: CGFloat = 1) {
    self.init(
      red: CGFloat((rgb >> 16) & 0xFF) / 255,
      green: CGFloat((rgb >> 8) & 0xFF) / 255,
      blue: CGFloat(rgb & 0xFF) / 255,
      alpha: alpha)
  }
}

/// Shared visual identity per object class (ids from BRIDGE.md).
enum ObjectClassStyle {
  static func color(_ cls: Int) -> UIColor {
    switch cls {
    case 0: return UIColor(rgb: 0xFFCB65)  // person
    case 1: return UIColor(rgb: 0x65DBAA)  // bicycle
    case 2: return UIColor(rgb: 0xB794FF)  // motorcycle
    case 3: return UIColor(rgb: 0x38D9E8)  // car
    case 4: return UIColor(rgb: 0x4C80FF)  // bus
    case 5: return UIColor(rgb: 0xFF9F5A)  // traffic light
    case 6: return UIColor(rgb: 0xF16B70)  // stop sign
    default: return UIColor(rgb: 0xB0B8C4)
    }
  }

  /// First SF Symbol that exists on this OS, so a missing symbol never crashes or blanks.
  static func glyph(_ cls: Int) -> UIImage? {
    let candidates: [String]
    switch cls {
    case 0: candidates = ["figure.walk", "person.fill"]
    case 1: candidates = ["bicycle"]
    case 2: candidates = ["motorcycle", "scooter"]
    case 3: candidates = ["car.fill"]
    case 4: candidates = ["bus.fill"]
    case 5: candidates = ["light.beacon.max.fill", "lightbulb.fill"]
    case 6: candidates = ["octagon.fill", "hand.raised.fill"]
    default: candidates = []
    }
    let config = UIImage.SymbolConfiguration(pointSize: 11, weight: .bold)
    for name in candidates + ["circle.fill"] {
      if let img = UIImage(systemName: name, withConfiguration: config) { return img }
    }
    return nil
  }
}

/// Approximate on-map position of a detected object.
final class DetectionAnnotation: NSObject, MKAnnotation {
  let id: String
  var cls: Int
  var approx: Bool
  @objc dynamic var coordinate: CLLocationCoordinate2D

  init(id: String, cls: Int, approx: Bool, coordinate: CLLocationCoordinate2D) {
    self.id = id
    self.cls = cls
    self.approx = approx
    self.coordinate = coordinate
  }
}

final class DestinationAnnotation: NSObject, MKAnnotation {
  let coordinate: CLLocationCoordinate2D
  let title: String?
  init(coordinate: CLLocationCoordinate2D, title: String?) {
    self.coordinate = coordinate
    self.title = title
  }
}

/// Small round glyph marker; translucent to signal that the position is estimated.
final class DetectionMarkerView: MKAnnotationView {
  static let reuseId = "corvista.detection"
  private let disc = UIView()
  private let glyphView = UIImageView()
  private var configuredCls: Int?
  private static let size: CGFloat = 22

  override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
    super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    frame = CGRect(x: 0, y: 0, width: Self.size, height: Self.size)
    canShowCallout = false
    collisionMode = .circle
    displayPriority = .defaultLow
    disc.frame = bounds
    disc.layer.cornerRadius = Self.size / 2
    disc.layer.borderWidth = 1.5
    disc.layer.borderColor = UIColor.white.withAlphaComponent(0.85).cgColor
    disc.isUserInteractionEnabled = false
    glyphView.frame = bounds.insetBy(dx: 4, dy: 4)
    glyphView.contentMode = .scaleAspectFit
    glyphView.tintColor = UIColor(rgb: 0x10141A)
    addSubview(disc)
    disc.addSubview(glyphView)
    glyphView.frame = disc.bounds.insetBy(dx: 4, dy: 4)
  }

  required init?(coder: NSCoder) { nil }

  override var annotation: MKAnnotation? {
    didSet { configure() }
  }

  func configure() {
    guard let a = annotation as? DetectionAnnotation else { return }
    if configuredCls != a.cls {
      configuredCls = a.cls
      disc.backgroundColor = ObjectClassStyle.color(a.cls)
      glyphView.image = ObjectClassStyle.glyph(a.cls)?.withRenderingMode(.alwaysTemplate)
    }
    alpha = a.approx ? 0.7 : 1.0
    accessibilityLabel = Self.accessibilityName(a.cls)
  }

  private static let names = ["person", "bicycle", "motorcycle", "vehicle", "bus", "traffic light", "stop sign"]

  private static func accessibilityName(_ cls: Int) -> String {
    (names.indices.contains(cls) ? names[cls] : "object") + " (approximate position)"
  }
}

/// Route-snapped navigation puck (replaces the system blue dot while guiding).
final class NavPuckAnnotation: NSObject, MKAnnotation {
  @objc dynamic var coordinate: CLLocationCoordinate2D
  init(coordinate: CLLocationCoordinate2D) { self.coordinate = coordinate }
}

/// Arrow puck: white-rimmed cyan chevron with a soft shadow, rotated to the
/// course relative to the camera heading.
final class NavPuckView: MKAnnotationView {
  static let reuseId = "corvista.navPuck"
  private let arrow = UIImageView()

  override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
    super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    frame = CGRect(x: 0, y: 0, width: 46, height: 46)
    arrow.frame = bounds
    arrow.image = Self.render()
    addSubview(arrow)
    canShowCallout = false
    displayPriority = .required
    zPriority = .max
    collisionMode = .none
  }

  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

  func setRotation(degrees: Double) {
    arrow.transform = CGAffineTransform(rotationAngle: CGFloat(degrees * .pi / 180))
  }

  private static func render() -> UIImage {
    let size = CGSize(width: 46, height: 46)
    return UIGraphicsImageRenderer(size: size).image { ctx in
      let c = ctx.cgContext
      // Halo.
      c.setFillColor(UIColor(rgb: 0x38D9E8, alpha: 0.22).cgColor)
      c.fillEllipse(in: CGRect(x: 1, y: 1, width: 44, height: 44))
      // Chevron.
      let p = UIBezierPath()
      p.move(to: CGPoint(x: 23, y: 6))
      p.addLine(to: CGPoint(x: 37, y: 38))
      p.addLine(to: CGPoint(x: 23, y: 30))
      p.addLine(to: CGPoint(x: 9, y: 38))
      p.close()
      c.setShadow(offset: CGSize(width: 0, height: 1.5), blur: 3, color: UIColor.black.withAlphaComponent(0.5).cgColor)
      UIColor(rgb: 0x38D9E8).setFill()
      p.fill()
      c.setShadow(offset: .zero, blur: 0, color: nil)
      UIColor.white.setStroke()
      p.lineWidth = 2.5
      p.lineJoinStyle = .round
      p.stroke()
    }
  }
}
