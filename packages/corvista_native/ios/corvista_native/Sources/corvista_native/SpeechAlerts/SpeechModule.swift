import AVFoundation
import Flutter
import Foundation

/// `speech.*`: on-device text-to-speech alerts (AVSpeechSynthesizer) that duck other audio.
// State is confined to the main thread; delegate callbacks hop there.
final class SpeechModule: NSObject, ChannelModule, AVSpeechSynthesizerDelegate, @unchecked Sendable {
  let prefix = "speech"
  private let context: ModuleContext
  private let synthesizer = AVSpeechSynthesizer()
  private var holdsSession = false
  private var releaseWork: DispatchWorkItem?

  init(context: ModuleContext) {
    self.context = context
    super.init()
    synthesizer.delegate = self
    synthesizer.usesApplicationAudioSession = true
  }

  func dispose() {
    UIKitHelpers.onMain {
      self.synthesizer.stopSpeaking(at: .immediate)
      self.releaseSession()
    }
  }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    UIKitHelpers.onMain {
      switch method {
      case "voices":
        // speechVoices() synchronously waits on an accessibility service that
        // needs the main thread (iOS 26 Simulator deadlocks) — query off-main.
        DispatchQueue.global(qos: .userInitiated).async {
          let v = Self.voices()
          DispatchQueue.main.async { result(v) }
        }
      case "speak": self.speak(args, result)
      case "stop":
        self.synthesizer.stopSpeaking(at: .immediate)
        result(nil)
      default: result(FlutterMethodNotImplemented)
      }
    }
  }

  private static func voices() -> [[String: Any]] {
    AVSpeechSynthesisVoice.speechVoices().map { v in
      let quality: String
      switch v.quality {
      case .enhanced: quality = "enhanced"
      case .premium: quality = "premium"
      default: quality = "default"
      }
      return ["id": v.identifier, "name": v.name, "language": v.language, "quality": quality]
    }
  }

  private func speak(_ args: [String: Any], _ result: @escaping FlutterResult) {
    guard let text = args.string("text")?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty else {
      result(BridgeError.badArgs("text required")); return
    }
    let utterance = AVSpeechUtterance(string: text)
    if let id = args.string("voiceId"), let voice = AVSpeechSynthesisVoice(identifier: id) {
      utterance.voice = voice
    } else if let lang = args.string("language") {
      utterance.voice = AVSpeechSynthesisVoice(language: lang)
        ?? AVSpeechSynthesisVoice(language: String(lang.prefix(2)))
    }
    utterance.volume = Float(min(max(args.double("volume") ?? 1, 0), 1))
    let r = Float(min(max(args.double("rate") ?? 0.5, 0), 1))
    utterance.rate = AVSpeechUtteranceMinimumSpeechRate + (AVSpeechUtteranceMaximumSpeechRate - AVSpeechUtteranceMinimumSpeechRate) * r
    utterance.prefersAssistiveTechnologySettings = true

    releaseWork?.cancel()
    if !holdsSession {
      do {
        try AudioSessionCoordinator.shared.acquire(.speech)
        holdsSession = true
      } catch {
        result(BridgeError.failure("unavailable", error)); return
      }
    }
    if args.bool("interrupt") == true, synthesizer.isSpeaking {
      synthesizer.stopSpeaking(at: .immediate)
    }
    synthesizer.speak(utterance)
    result(nil)
  }

  // MARK: - Session lifetime

  private func scheduleRelease() {
    releaseWork?.cancel()
    let work = DispatchWorkItem { [weak self] in
      guard let self, !self.synthesizer.isSpeaking else { return }
      self.releaseSession()
    }
    releaseWork = work
    // Short grace period so queued utterances don't bounce the session (and ducking).
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: work)
  }

  private func releaseSession() {
    guard holdsSession else { return }
    holdsSession = false
    AudioSessionCoordinator.shared.release(.speech)
  }

  func speechSynthesizer(_ s: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
    UIKitHelpers.onMain { self.scheduleRelease() }
  }

  func speechSynthesizer(_ s: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
    UIKitHelpers.onMain { self.scheduleRelease() }
  }
}
