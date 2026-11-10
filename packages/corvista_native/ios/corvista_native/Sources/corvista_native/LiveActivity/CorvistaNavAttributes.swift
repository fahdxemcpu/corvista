// SHARED FILE — compiled into two targets:
//   * the `corvista_native` plugin (Swift package), which starts/updates/ends the activity;
//   * the `CorvistaLiveActivity` widget extension (ios/Runner.xcodeproj), which renders it.
// ActivityKit matches the two by type name and Codable shape, so keep this file
// self-contained (Foundation + ActivityKit only) and change both sides together.
// Contract: docs/BRIDGE.md › liveActivity.

import ActivityKit
import Foundation

@available(iOS 16.2, *)
struct CorvistaNavAttributes: ActivityAttributes {
  /// Dynamic part, sent by `liveActivity.update` (strings are pre-formatted by Dart in the
  /// user's units and language).
  struct ContentState: Codable, Hashable {
    /// `ManeuverType` name from Dart (`left`, `slightRight`, `uTurnLeft`, `roundabout`,
    /// `arrive`, ...). Mapped to an SF Symbol by `symbol`.
    var maneuver: String
    /// Distance to the next maneuver, e.g. "350 m" / "0.2 mi".
    var distance: String
    /// Short instruction ("Turn left onto Bd Zerktouni").
    var instruction: String
    /// Estimated arrival, milliseconds since the Unix epoch.
    var etaMs: Double
    /// Remaining route distance, e.g. "12 km".
    var remaining: String
    /// Route progress 0...1.
    var progress: Double
    /// `recording` | `paused` | `off`.
    var dashcam: String
    /// Localized dashcam badge text ("REC", "Paused", ...).
    var dashcamLabel: String
    /// `navigating` | `rerouting` | `arrived` | `ended`.
    var phase: String

    var eta: Date { Date(timeIntervalSince1970: etaMs / 1000) }

    var symbol: String { CorvistaNavAttributes.symbol(for: maneuver, phase: phase) }
  }

  /// Destination name shown on the Lock Screen.
  var destination: String
  /// Localized "Arrival" label for the ETA.
  var etaLabel: String

  /// SF Symbol for a maneuver. Kept to symbols available on iOS 16+.
  static func symbol(for maneuver: String, phase: String) -> String {
    switch phase {
    case "arrived": return "flag.checkered"
    case "rerouting": return "arrow.triangle.2.circlepath"
    case "ended": return "location.slash"
    default: break
    }
    switch maneuver {
    case "left", "sharpLeft": return "arrow.turn.up.left"
    case "right", "sharpRight": return "arrow.turn.up.right"
    case "slightLeft", "keepLeft": return "arrow.up.left"
    case "slightRight", "keepRight": return "arrow.up.right"
    case "mergeLeft", "mergeRight": return "arrow.merge"
    case "uTurnLeft": return "arrow.uturn.left"
    case "uTurnRight": return "arrow.uturn.right"
    case "roundabout": return "arrow.triangle.turn.up.right.circle"
    case "arrive": return "flag.checkered"
    default: return "arrow.up"  // straight, depart, unknown
    }
  }
}
