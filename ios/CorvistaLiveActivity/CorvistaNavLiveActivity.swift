import ActivityKit
import SwiftUI
import WidgetKit

/// Turn-by-turn Live Activity: Lock Screen banner + Dynamic Island. All text arrives
/// pre-formatted from Dart (units / language); the ETA is rendered with the device's
/// time format. Tapping opens Corvista (default behaviour).
struct CorvistaNavLiveActivity: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: CorvistaNavAttributes.self) { context in
      LockScreenView(attributes: context.attributes, state: context.state)
        .activityBackgroundTint(Palette.background)
        .activitySystemActionForegroundColor(Palette.accent)
    } dynamicIsland: { context in
      let s = context.state
      return DynamicIsland {
        DynamicIslandExpandedRegion(.leading) {
          ManeuverBadge(symbol: s.symbol, size: 52)
            .padding(.leading, 4)
            .padding(.top, 4)
        }
        DynamicIslandExpandedRegion(.trailing) {
          VStack(alignment: .trailing, spacing: 1) {
            Text(s.eta, style: .time)
              .font(.system(size: 20, weight: .bold, design: .rounded))
              .monospacedDigit()
              .foregroundStyle(.white)
            Text(context.attributes.etaLabel)
              .font(.system(size: 11, weight: .medium))
              .foregroundStyle(Palette.secondary)
          }
          .padding(.trailing, 4)
          .padding(.top, 6)
        }
        DynamicIslandExpandedRegion(.center) {
          Text(s.distance.isEmpty ? " " : s.distance)
            .font(.system(size: 28, weight: .bold, design: .rounded))
            .monospacedDigit()
            .foregroundStyle(.white)
            .lineLimit(1)
            .minimumScaleFactor(0.6)
            .padding(.top, 4)
        }
        DynamicIslandExpandedRegion(.bottom) {
          VStack(alignment: .leading, spacing: 8) {
            Text(s.instruction)
              .font(.system(size: 15, weight: .semibold))
              .foregroundStyle(.white.opacity(0.9))
              .lineLimit(2)
              .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 10) {
              RouteProgress(value: s.progress)
              Text(s.remaining)
                .font(.system(size: 13, weight: .semibold, design: .rounded))
                .monospacedDigit()
                .foregroundStyle(Palette.secondary)
              DashcamBadge(state: s.dashcam, label: s.dashcamLabel, compact: true)
            }
          }
          .padding(.horizontal, 6)
          .padding(.bottom, 2)
        }
      } compactLeading: {
        Image(systemName: s.symbol)
          .font(.system(size: 15, weight: .bold))
          .foregroundStyle(Palette.accent)
      } compactTrailing: {
        HStack(spacing: 4) {
          Text(s.distance)
            .font(.system(size: 15, weight: .semibold, design: .rounded))
            .monospacedDigit()
            .foregroundStyle(Palette.accent)
            .lineLimit(1)
          if s.dashcam == "recording" {
            Circle().fill(Palette.rec).frame(width: 6, height: 6)
          }
        }
      } minimal: {
        Image(systemName: s.symbol)
          .font(.system(size: 14, weight: .bold))
          .foregroundStyle(Palette.accent)
      }
      .keylineTint(Palette.accent)
    }
  }
}

// MARK: - Lock Screen

private struct LockScreenView: View {
  let attributes: CorvistaNavAttributes
  let state: CorvistaNavAttributes.ContentState

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack(alignment: .center, spacing: 12) {
        ManeuverBadge(symbol: state.symbol, size: 58)
        VStack(alignment: .leading, spacing: 2) {
          HStack(alignment: .firstTextBaseline) {
            if !state.distance.isEmpty {
              Text(state.distance)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .monospacedDigit()
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            }
            Spacer(minLength: 6)
            DashcamBadge(state: state.dashcam, label: state.dashcamLabel, compact: false)
          }
          Text(state.instruction)
            .font(.system(size: 15, weight: .semibold))
            .foregroundStyle(.white.opacity(0.88))
            .lineLimit(2)
            .fixedSize(horizontal: false, vertical: true)
        }
      }
      RouteProgress(value: state.progress)
      HStack(spacing: 6) {
        if state.phase != "arrived" && state.phase != "ended" {
          Text(attributes.etaLabel)
            .foregroundStyle(Palette.secondary)
          Text(state.eta, style: .time)
            .foregroundStyle(.white)
            .monospacedDigit()
          if !state.remaining.isEmpty {
            Text("·").foregroundStyle(Palette.secondary)
            Text(state.remaining)
              .foregroundStyle(.white)
              .monospacedDigit()
          }
        }
        Spacer(minLength: 8)
        if !attributes.destination.isEmpty {
          Image(systemName: "mappin.circle.fill")
            .foregroundStyle(Palette.accent)
          Text(attributes.destination)
            .foregroundStyle(Palette.secondary)
            .lineLimit(1)
            .truncationMode(.tail)
        }
      }
      .font(.system(size: 13, weight: .semibold, design: .rounded))
    }
    .padding(16)
  }
}

// MARK: - Pieces

private enum Palette {
  static let background = Color(red: 8 / 255, green: 12 / 255, blue: 18 / 255)  // #080C12
  static let accent = Color(red: 56 / 255, green: 217 / 255, blue: 232 / 255)  // #38D9E8
  static let secondary = Color.white.opacity(0.6)
  static let rec = Color(red: 1, green: 0.27, blue: 0.27)
  static let paused = Color(red: 1, green: 0.74, blue: 0.2)
}

private struct ManeuverBadge: View {
  let symbol: String
  let size: CGFloat

  var body: some View {
    RoundedRectangle(cornerRadius: size * 0.26, style: .continuous)
      .fill(Palette.accent.opacity(0.16))
      .overlay(
        RoundedRectangle(cornerRadius: size * 0.26, style: .continuous)
          .strokeBorder(Palette.accent.opacity(0.45), lineWidth: 1)
      )
      .overlay(
        Image(systemName: symbol)
          .font(.system(size: size * 0.52, weight: .bold))
          .foregroundStyle(Palette.accent)
      )
      .frame(width: size, height: size)
  }
}

private struct RouteProgress: View {
  let value: Double

  var body: some View {
    GeometryReader { g in
      ZStack(alignment: .leading) {
        Capsule().fill(Color.white.opacity(0.14))
        Capsule().fill(Palette.accent)
          .frame(width: max(4, g.size.width * min(max(value, 0), 1)))
      }
    }
    .frame(height: 4)
  }
}

private struct DashcamBadge: View {
  let state: String
  let label: String
  let compact: Bool

  private var color: Color {
    switch state {
    case "recording": return Palette.rec
    case "paused": return Palette.paused
    default: return Color.white.opacity(0.45)
    }
  }

  private var icon: String {
    switch state {
    case "recording": return "record.circle.fill"
    case "paused": return "pause.circle.fill"
    default: return "video.slash.fill"
    }
  }

  var body: some View {
    HStack(spacing: 4) {
      Image(systemName: icon)
        .font(.system(size: compact ? 11 : 12, weight: .bold))
      if !label.isEmpty {
        Text(label)
          .font(.system(size: compact ? 11 : 12, weight: .bold, design: .rounded))
          .lineLimit(1)
      }
    }
    .foregroundStyle(color)
    .padding(.horizontal, 7)
    .padding(.vertical, 3)
    .background(Capsule().fill(color.opacity(0.16)))
    .fixedSize()
  }
}
