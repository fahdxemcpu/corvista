import AVFoundation
import Flutter
import Foundation
import Speech

/// `voice.*`: listens (on-device where supported) for a spoken cancel phrase during the
/// emergency countdown. Events on `corvista/voice`:
/// `{type:'listening'|'partial'|'matched'|'ended'|'error', text?, phrase?, message?}`.
final class VoiceCancelModule: ChannelModule {
  let prefix = "voice"
  private let context: ModuleContext

  // Main-thread state.
  private var recognizer: SFSpeechRecognizer?
  private var request: SFSpeechAudioBufferRecognitionRequest?
  private var task: SFSpeechRecognitionTask?
  private var engine: AVAudioEngine?
  private var timeoutWork: DispatchWorkItem?
  private var phrases: [(original: String, normalized: String)] = []
  private var locale = Locale.current
  private var session = 0
  private var active = false
  private var holdsAudioSession = false

  init(context: ModuleContext) { self.context = context }

  func dispose() { UIKitHelpers.onMain { self.finish(emitEnded: false) } }

  func handle(method: String, args: [String: Any], result: @escaping FlutterResult) {
    UIKitHelpers.onMain {
      switch method {
      case "start": self.start(args, result)
      case "stop":
        self.finish(emitEnded: true)
        result(nil)
      default: result(FlutterMethodNotImplemented)
      }
    }
  }

  private func start(_ args: [String: Any], _ result: @escaping FlutterResult) {
    let rawPhrases = (args["phrases"] as? [Any] ?? []).compactMap { $0 as? String }
    guard !rawPhrases.isEmpty else { result(BridgeError.badArgs("phrases required")); return }
    guard SFSpeechRecognizer.authorizationStatus() == .authorized else {
      result(BridgeError.permission("Speech recognition")); return
    }
    guard AVAudioApplication.shared.recordPermission == .granted else {
      result(BridgeError.permission("Microphone")); return
    }

    finish(emitEnded: false)  // restart cleanly

    let loc = Locale(identifier: args.string("locale") ?? Locale.current.identifier)
    guard let rec = SFSpeechRecognizer(locale: loc) else {
      result(BridgeError.unavailable("Speech recognition is not supported for \(loc.identifier)")); return
    }
    guard rec.isAvailable else {
      result(BridgeError.unavailable("Speech recognition is currently unavailable")); return
    }
    locale = rec.locale
    phrases = rawPhrases.map { ($0, Self.normalize($0, locale: rec.locale)) }.filter { !$0.normalized.isEmpty }

    let req = SFSpeechAudioBufferRecognitionRequest()
    req.shouldReportPartialResults = true
    req.taskHint = .confirmation
    req.contextualStrings = rawPhrases
    if rec.supportsOnDeviceRecognition { req.requiresOnDeviceRecognition = true }

    do {
      try AudioSessionCoordinator.shared.acquire(.voice)
      holdsAudioSession = true
    } catch {
      result(BridgeError.failure("unavailable", error)); return
    }

    let eng = AVAudioEngine()
    let input = eng.inputNode
    let format = input.outputFormat(forBus: 0)
    guard format.sampleRate > 0, format.channelCount > 0 else {
      releaseAudioSession()
      result(BridgeError.unavailable("No microphone input available")); return
    }
    input.installTap(onBus: 0, bufferSize: 1024, format: format) { buffer, _ in
      req.append(buffer)
    }
    eng.prepare()
    do {
      try eng.start()
    } catch {
      input.removeTap(onBus: 0)
      releaseAudioSession()
      result(BridgeError.failure("unavailable", error)); return
    }

    session += 1
    let current = session
    recognizer = rec
    request = req
    engine = eng
    active = true
    task = rec.recognitionTask(with: req) { [weak self] res, error in
      let text = res?.bestTranscription.formattedString
      let isFinal = res?.isFinal ?? false
      DispatchQueue.main.async {
        self?.onRecognition(session: current, text: text, isFinal: isFinal, error: error)
      }
    }

    let timeoutS = min(max(args.double("timeoutS") ?? 30, 1), 120)
    let work = DispatchWorkItem { [weak self] in
      guard let self, self.session == current else { return }
      self.finish(emitEnded: true)
    }
    timeoutWork = work
    DispatchQueue.main.asyncAfter(deadline: .now() + timeoutS, execute: work)

    context.events.send(.voice, ["type": "listening"])
    result(nil)
  }

  private func onRecognition(session s: Int, text: String?, isFinal: Bool, error: Error?) {
    guard s == session, active else { return }
    if let text, !text.isEmpty {
      context.events.send(.voice, ["type": "partial", "text": text])
      let normalized = " " + Self.normalize(text, locale: locale) + " "
      if let hit = phrases.first(where: { normalized.contains(" " + $0.normalized + " ") }) {
        context.events.send(.voice, ["type": "matched", "text": text, "phrase": hit.original])
        finish(emitEnded: true)
        return
      }
    }
    if let error {
      let ns = error as NSError
      // 1110 = no speech detected; 216/301 = cancelled. Not worth surfacing as errors.
      let benign = ns.domain == "kAFAssistantErrorDomain" && [1110, 216, 301].contains(ns.code)
      if !benign { context.events.send(.voice, ["type": "error", "message": ns.localizedDescription]) }
      finish(emitEnded: true)
      return
    }
    if isFinal { finish(emitEnded: true) }
  }

  /// Stops recognition and releases the microphone. Idempotent.
  private func finish(emitEnded: Bool) {
    timeoutWork?.cancel()
    timeoutWork = nil
    let wasActive = active
    active = false
    session += 1
    if let eng = engine {
      if eng.isRunning { eng.stop() }
      eng.inputNode.removeTap(onBus: 0)
    }
    engine = nil
    request?.endAudio()
    task?.cancel()
    task = nil
    request = nil
    recognizer = nil
    releaseAudioSession()
    if wasActive && emitEnded { context.events.send(.voice, ["type": "ended"]) }
  }

  private func releaseAudioSession() {
    guard holdsAudioSession else { return }
    holdsAudioSession = false
    AudioSessionCoordinator.shared.release(.voice)
  }

  /// Lowercased, diacritics/width folded, punctuation → spaces, whitespace collapsed.
  static func normalize(_ s: String, locale: Locale) -> String {
    let folded = s.folding(options: [.caseInsensitive, .diacriticInsensitive, .widthInsensitive], locale: locale)
      .lowercased(with: locale)
    let mapped = folded.unicodeScalars.map { CharacterSet.alphanumerics.contains($0) ? Character($0) : " " }
    return String(mapped).split(separator: " ").joined(separator: " ")
  }
}
