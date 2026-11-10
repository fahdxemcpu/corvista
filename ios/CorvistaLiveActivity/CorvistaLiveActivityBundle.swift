import SwiftUI
import WidgetKit

/// Widget extension entry point. Only the navigation Live Activity — Corvista has no
/// Home Screen widgets.
@main
struct CorvistaLiveActivityBundle: WidgetBundle {
  var body: some Widget {
    CorvistaNavLiveActivity()
  }
}
