import AVFoundation
import Foundation

/// Reference-counts the shared AVAudioSession between spoken alerts, generated tones and
/// the voice-cancel recognizer so one client never deactivates the session under another.
///
/// * speech: `.playback` + `.voicePrompt`, ducks and interrupts spoken audio of other apps.
/// * tones: `.playback`, mixes with other audio (ducks only while speech or an alarm plays).
/// * voice: `.playAndRecord` (mic) while listening for the cancel phrase; output still mixes.
/// * recording: `.playAndRecord` + `.videoRecording` while clip audio is captured by the camera session.
/// The session is deactivated with `.notifyOthersOnDeactivation` when the last client leaves.
///
/// Background navigation (`setNavigating(true)`, UIBackgroundModes `audio`): prompts keep a
/// *mixable* session (`.mixWithOthers` + ducking) so it may be (re)activated from the
/// background for each prompt and released afterwards (other audio un-ducks between
/// prompts). Interruptions (phone call, Siri) and media-services resets clear `active`,
/// so the next prompt re-activates the session instead of speaking into a dead one.
final class AudioSessionCoordinator {
  static let shared = AudioSessionCoordinator()

  enum Client: Hashable { case speech, tones, alarm, voice, recording }

  private var clients: Set<Client> = []
  private var active = false
  private var navigating = false
  private let lock = NSLock()
  private var observers: [NSObjectProtocol] = []

  private init() {
    let nc = NotificationCenter.default
    let session = AVAudioSession.sharedInstance()
    observers.append(nc.addObserver(
      forName: AVAudioSession.interruptionNotification, object: session, queue: nil
    ) { [weak self] note in
      guard let self,
            let raw = note.userInfo?[AVAudioSessionInterruptionTypeKey] as? UInt,
            let type = AVAudioSession.InterruptionType(rawValue: raw) else { return }
      self.lock.lock(); defer { self.lock.unlock() }
      switch type {
      case .began:
        // The system deactivated our session.
        self.active = false
      case .ended:
        // Re-activate for clients that are still mid-prompt (e.g. a long instruction).
        if !self.clients.isEmpty { try? self.apply() }
      @unknown default: break
      }
    })
    observers.append(nc.addObserver(
      forName: AVAudioSession.mediaServicesWereResetNotification, object: session, queue: nil
    ) { [weak self] _ in
      guard let self else { return }
      self.lock.lock(); defer { self.lock.unlock() }
      self.active = false
      if !self.clients.isEmpty { try? self.apply() }
    })
  }

  /// Turn-by-turn navigation is running and may speak while the app is in the background.
  func setNavigating(_ on: Bool) {
    lock.lock(); defer { lock.unlock() }
    navigating = on
  }

  var isNavigating: Bool {
    lock.lock(); defer { lock.unlock() }
    return navigating
  }

  func acquire(_ client: Client) throws {
    lock.lock(); defer { lock.unlock() }
    let inserted = clients.insert(client).inserted
    do {
      try apply()
    } catch {
      if inserted { clients.remove(client) }
      throw error
    }
  }

  func release(_ client: Client) {
    lock.lock(); defer { lock.unlock() }
    guard clients.remove(client) != nil else { return }
    try? apply()
  }

  /// Caller holds `lock`.
  private func apply() throws {
    let session = AVAudioSession.sharedInstance()
    if clients.isEmpty {
      if active {
        try? session.setActive(false, options: .notifyOthersOnDeactivation)
        active = false
      }
      return
    }
    let duck = clients.contains(.speech) || clients.contains(.alarm)
    var options: AVAudioSession.CategoryOptions = [.mixWithOthers]
    if duck { options.formUnion([.duckOthers, .interruptSpokenAudioAndMixWithOthers]) }

    if clients.contains(.voice) || clients.contains(.recording) {
      // Microphone in use (clip audio and/or cancel phrase): never fall back to
      // playback-only while a recording client holds the session.
      options.formUnion([.defaultToSpeaker, .allowBluetoothA2DP])
      let mode: AVAudioSession.Mode = clients.contains(.recording) ? .videoRecording : .default
      try session.setCategory(.playAndRecord, mode: mode, options: options)
    } else {
      let mode: AVAudioSession.Mode = clients.contains(.speech) ? .voicePrompt : .default
      try session.setCategory(.playback, mode: mode, options: options)
    }
    if !active {
      do {
        try session.setActive(true)
      } catch {
        if navigating { NSLog("[corvista] audio session activation failed in navigation: %@", "\(error)") }
        throw error
      }
      active = true
    }
  }
}
