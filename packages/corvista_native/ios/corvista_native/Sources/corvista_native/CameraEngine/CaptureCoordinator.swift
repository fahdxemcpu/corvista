import AVFoundation
import Flutter
import QuartzCore
import UIKit

/// Queues shared by the capture pipeline.
enum CorvistaQueues {
  /// Sample-buffer delegate queue for video AND audio. Everything on the per-frame
  /// path (preview texture, inference hand-off, recorder appends) runs here, so the
  /// recorder's state needs no locks.
  static let capture = DispatchQueue(label: "app.corvista.capture.frames", qos: .userInteractive)
}

struct CameraRequest {
  var deviceType = "wide"
  var quality = "hd720"
  var stabilization = "auto"
  var fps = 30
}

/// Owns the one shared AVCaptureSession used by camera, ai and recorder.
/// Session configuration runs on `sessionQueue`; frames arrive on `CorvistaQueues.capture`.
/// `@unchecked Sendable`: state is confined to `sessionQueue` / the capture queue or guarded by `lock`.
final class CaptureCoordinator: NSObject, @unchecked Sendable {
  static let shared = CaptureCoordinator()

  let sessionQueue = DispatchQueue(label: "app.corvista.capture.session", qos: .userInitiated)
  private var captureQueue: DispatchQueue { CorvistaQueues.capture }

  private let session = AVCaptureSession()
  private let videoOutput = AVCaptureVideoDataOutput()

  // --- sessionQueue-confined ---
  private var videoInput: AVCaptureDeviceInput?
  private var audioInput: AVCaptureDeviceInput?
  private var audioOutput: AVCaptureAudioDataOutput?
  private var request = CameraRequest()
  private var wantRunning = false
  private var audioWanted = false
  private var rotationAngle: CGFloat = 90
  private var appliedStabilization = "off"
  private var appliedDeviceType = "wide"
  private var presetSize = (w: 1280, h: 720)
  private var fileSource: FileFrameSource?
  /// File-mode test footage has an audio track feeding the recorder.
  private var fileHasAudio = false
  private var focusReset: DispatchWorkItem?
  private var restartAttempts = 0

  // --- lock-protected (read from any queue) ---
  private let lock = NSLock()
  private var source: VideoFrame.Source = .camera
  private var state = "stopped"
  private var stateReason: String?
  private var texture: PreviewTexture?
  private var textureId: Int64 = -1
  private weak var registry: FlutterTextureRegistry?
  private var dims = (w: 0, h: 0)
  /// Horizontal FOV (deg) of the active format along the sensor's long axis; 0 = unknown.
  private var sensorHFOV: Double = 0

  /// Horizontal FOV of the *upright* frame of size `d` (portrait frames use the
  /// sensor's short-axis FOV). Caller holds `lock`. Returns 0 when unknown.
  private func uprightHFOVLocked(_ d: (w: Int, h: Int)) -> Double {
    guard sensorHFOV > 0, d.w > 0, d.h > 0 else { return 0 }
    if d.w >= d.h { return sensorHFOV }
    let half = sensorHFOV * .pi / 360
    let v = 2 * atan(tan(half) * Double(d.w) / Double(d.h)) * 180 / .pi
    return (v * 10).rounded() / 10
  }
  private var fps = 0.0
  private var dropped = 0

  /// File frames dispatched to the capture queue but not yet processed (lock-guarded).
  /// Bounded like `alwaysDiscardsLateVideoFrames`: a slow pipeline drops frames instead
  /// of queueing them (which would delay timestamps and grow memory).
  private var fileFramesInFlight = 0
  /// Generation of the current file source; frames/audio/end events from a replaced
  /// source carry an older generation and are ignored (lock-guarded).
  private var fileGeneration = 0

  // --- capture-queue-confined ---
  private var windowStart: CFTimeInterval = 0
  private var windowFrames = 0
  private var lastFrameDims = (w: 0, h: 0)
  private var perfTimer: DispatchSourceTimer?

  private var observers: [NSObjectProtocol] = []

  private override init() {
    super.init()
    // Audio session is configured explicitly (mixWithOthers) when audio capture is enabled,
    // so speech/proximity tones and other apps' audio are not interrupted.
    session.automaticallyConfiguresApplicationAudioSession = false
    observeSession()
    DispatchQueue.main.async { self.observeOrientation() }
  }

  // MARK: - Texture

  /// Main thread. Registers the preview texture once and returns its id.
  @discardableResult
  func ensureTexture(registry reg: FlutterTextureRegistry) -> Int64 {
    lock.lock(); defer { lock.unlock() }
    if textureId >= 0 { return textureId }
    let t = PreviewTexture()
    texture = t
    registry = reg
    textureId = reg.register(t)
    return textureId
  }

  /// Drops the preview's last frame (and with it the capture/decoder buffer pool slot).
  func clearPreview() {
    lock.lock(); let t = texture; lock.unlock()
    t?.clear()
  }

  func disposeTexture() {
    lock.lock()
    let id = textureId, reg = registry
    textureId = -1; texture = nil
    lock.unlock()
    if id >= 0 { reg?.unregisterTexture(id) }
  }

  // MARK: - Status

  func statusPayload() -> [String: Any] {
    lock.lock(); defer { lock.unlock() }
    var m: [String: Any] = [
      "type": "camera", "state": state, "source": source.rawValue,
      "fps": (fps * 10).rounded() / 10, "droppedFrames": dropped,
      "w": dims.w, "h": dims.h, "textureId": textureId,
      "hfov": source == .camera ? uprightHFOVLocked(dims) : 0,
      // Both sources feed the rolling recorder while running (file = TEST footage).
      "recording": state == "running",
    ]
    if let stateReason { m["reason"] = stateReason }
    return m
  }

  private func setState(_ s: String, reason: String? = nil, emit: Bool = true) {
    lock.lock(); state = s; stateReason = reason; lock.unlock()
    if emit { EventHub.shared.send(.status, statusPayload()) }
  }

  var currentSource: VideoFrame.Source {
    lock.lock(); defer { lock.unlock() }
    return source
  }

  var isRunning: Bool {
    lock.lock(); defer { lock.unlock() }
    return state == "running" || state == "interrupted"
  }

  /// Current upright frame size (0×0 when unknown).
  var frameSize: (w: Int, h: Int) {
    lock.lock(); defer { lock.unlock() }
    return dims
  }

  // MARK: - Start / stop

  func start(_ req: CameraRequest, completion: @escaping FlutterResult) {
    #if targetEnvironment(simulator)
    completion(BridgeError.unavailable("No camera on the iOS Simulator; use camera.startFile"))
    return
    #else
    let auth = AVCaptureDevice.authorizationStatus(for: .video)
    switch auth {
    case .authorized:
      sessionQueue.async { self.startOnSessionQueue(req, completion: completion) }
    case .notDetermined:
      AVCaptureDevice.requestAccess(for: .video) { ok in
        if ok { self.sessionQueue.async { self.startOnSessionQueue(req, completion: completion) } }
        else { completion(BridgeError.permission("Camera")) }
      }
    default:
      completion(BridgeError.permission("Camera"))
    }
    #endif
  }

  private func startOnSessionQueue(_ req: CameraRequest, completion: @escaping FlutterResult) {
    stopFileSourceLocked()
    let wasRunning = wantRunning && currentSource == .camera && session.isRunning
    request = req
    guard let device = Self.device(for: req.deviceType) ?? Self.device(for: "wide") else {
      setState("unavailable", reason: "no_camera")
      completion(BridgeError.unavailable("No rear camera available"))
      return
    }
    appliedDeviceType = Self.name(of: device.deviceType)

    session.beginConfiguration()
    if videoInput?.device.uniqueID != device.uniqueID {
      if let old = videoInput { session.removeInput(old); videoInput = nil }
      do {
        let input = try AVCaptureDeviceInput(device: device)
        guard session.canAddInput(input) else {
          session.commitConfiguration()
          completion(FlutterError(code: "failed", message: "Cannot add camera input", details: nil))
          return
        }
        session.addInput(input)
        videoInput = input
      } catch {
        session.commitConfiguration()
        completion(BridgeError.failure("failed", error))
        return
      }
    }

    let want1080 = req.quality == "fhd1080"
      && device.supportsSessionPreset(.hd1920x1080) && session.canSetSessionPreset(.hd1920x1080)
    let preset: AVCaptureSession.Preset = want1080 ? .hd1920x1080 : .hd1280x720
    if session.canSetSessionPreset(preset) { session.sessionPreset = preset }
    presetSize = want1080 ? (1920, 1080) : (1280, 720)
    if !wasRunning { RollingRecorder.shared.cameraWillStart(source: .camera, expectedSize: uprightSize()) }

    if !session.outputs.contains(videoOutput) {
      videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
      videoOutput.alwaysDiscardsLateVideoFrames = true
      videoOutput.setSampleBufferDelegate(self, queue: captureQueue)
      if session.canAddOutput(videoOutput) { session.addOutput(videoOutput) }
    }
    lock.lock(); source = .camera; lock.unlock()
    configureAudioLocked()
    if let c = videoOutput.connection(with: .video) {
      appliedStabilization = applyStabilization(c, device: device, mode: req.stabilization)
      if c.isVideoRotationAngleSupported(rotationAngle) { c.videoRotationAngle = rotationAngle }
    }
    session.commitConfiguration()

    configureDevice(device, fps: req.fps)
    lock.lock(); sensorHFOV = Double(device.activeFormat.videoFieldOfView); lock.unlock()

    wantRunning = true
    restartAttempts = 0
    if !session.isRunning { session.startRunning() }
    guard session.isRunning else {
      setState("error", reason: "start_failed")
      completion(FlutterError(code: "failed", message: "Capture session did not start", details: nil))
      return
    }
    let upright = uprightSize()
    lock.lock(); dims = upright; let hfov = uprightHFOVLocked(upright); lock.unlock()
    setState("running")
    startPerfTimer()
    let id: Int64 = { lock.lock(); defer { lock.unlock() }; return textureId }()
    completion([
      "textureId": id, "width": upright.w, "height": upright.h,
      "deviceType": appliedDeviceType, "stabilization": appliedStabilization,
      "hfov": hfov,
    ] as [String: Any])
  }

  func stop(completion: @escaping () -> Void) {
    sessionQueue.async {
      self.wantRunning = false
      self.stopFileSourceLocked()
      if self.session.isRunning { self.session.stopRunning() }
      // Release the microphone (and its audio-session claim) while stopped;
      // configureAudioLocked() re-adds it on the next start if still wanted.
      if self.audioInput != nil || self.audioOutput != nil {
        self.session.beginConfiguration()
        if let o = self.audioOutput { self.session.removeOutput(o); self.audioOutput = nil }
        if let i = self.audioInput {
          self.session.removeInput(i); self.audioInput = nil
          AudioSessionCoordinator.shared.release(.recording)
        }
        self.session.commitConfiguration()
        RollingRecorder.shared.setAudioCaptureActive(false)
      }
      self.stopPerfTimer()
      self.setState("stopped")
      RollingRecorder.shared.cameraDidStop {
        MemoryGuard.shared.releaseIdle(reason: "drive_stop")
        completion()
      }
    }
  }

  /// Test mode: decode a local video through the same pipeline, INCLUDING the rolling
  /// recorder (video + the file's audio track), so the whole dashcam path can be
  /// exercised on the Simulator. Everything is flagged `source: 'file'`.
  func startFile(path: String, loop: Bool, completion: @escaping FlutterResult) {
    let url = URL(fileURLWithPath: path)
    guard FileManager.default.isReadableFile(atPath: path) else {
      completion(BridgeError.badArgs("File not readable: \(path)"))
      return
    }
    sessionQueue.async {
      self.stopFileSourceLocked()
      if self.session.isRunning { self.session.stopRunning() }
      self.wantRunning = false
      RollingRecorder.shared.cameraDidStop {}
      self.lock.lock(); self.fileGeneration += 1; let gen = self.fileGeneration; self.lock.unlock()
      let fs = FileFrameSource(
        url: url, loop: loop,
        deliver: { pb, pts in
          self.lock.lock()
          if gen != self.fileGeneration { self.lock.unlock(); return }
          if self.fileFramesInFlight >= 2 {
            self.dropped += 1
            self.lock.unlock()
            return
          }
          self.fileFramesInFlight += 1
          self.lock.unlock()
          CorvistaQueues.capture.async {
            if self.isCurrentFile(gen) { self.deliver(pb, pts: pts, source: .file) }
            self.lock.lock(); self.fileFramesInFlight -= 1; self.lock.unlock()
          }
        },
        deliverAudio: { sb in
          CorvistaQueues.capture.async {
            guard self.currentSource == .file, self.isCurrentFile(gen) else { return }
            RollingRecorder.shared.appendAudio(sb)
          }
        },
        onEnd: { err in
          self.sessionQueue.async {
            // Only the current source may end the session (a replaced one ends silently).
            guard self.fileSource != nil, self.isCurrentFile(gen) else { return }
            self.fileSource = nil
            self.stopPerfTimer()
            RollingRecorder.shared.cameraDidStop {}
            self.setState(err == nil ? "stopped" : "error", reason: err == nil ? "file_ended" : err?.localizedDescription)
          }
        })
      self.fileSource = fs
      Task {
        do {
          try await fs.prepare()
          self.sessionQueue.async {
            guard self.fileSource === fs else { return }
            self.lock.lock()
            self.source = .file
            self.dims = (fs.size.width, fs.size.height)
            let id = self.textureId
            self.lock.unlock()
            self.fileHasAudio = fs.hasAudio
            RollingRecorder.shared.setAudioCaptureActive(fs.hasAudio)
            RollingRecorder.shared.cameraWillStart(source: .file, expectedSize: (fs.size.width, fs.size.height))
            fs.start()
            self.setState("running")
            self.startPerfTimer()
            completion([
              "textureId": id, "width": fs.size.width, "height": fs.size.height,
              "deviceType": "file", "stabilization": "off", "recording": true, "hasAudio": fs.hasAudio,
            ] as [String: Any])
          }
        } catch {
          self.sessionQueue.async { if self.fileSource === fs { self.fileSource = nil } }
          completion(BridgeError.failure("io_error", error))
        }
      }
    }
  }

  private func isCurrentFile(_ gen: Int) -> Bool {
    lock.lock(); defer { lock.unlock() }
    return gen == fileGeneration
  }

  private func stopFileSourceLocked() {
    if let fs = fileSource {
      fs.stop(); fileSource = nil
      lock.lock(); fileGeneration += 1; lock.unlock()
    }
    fileHasAudio = false
  }

  // MARK: - Audio

  /// Called by the recorder. Adds/removes the audio data output on the shared session.
  func setAudioEnabled(_ on: Bool) {
    sessionQueue.async {
      guard self.audioWanted != on else { return }
      self.audioWanted = on
      guard self.videoInput != nil else { return }
      self.session.beginConfiguration()
      self.configureAudioLocked()
      self.session.commitConfiguration()
    }
  }

  private func configureAudioLocked() {
    let authorized = AVCaptureDevice.authorizationStatus(for: .audio) == .authorized
    if audioWanted && authorized && currentSource == .camera {
      if audioInput == nil, let mic = AVCaptureDevice.default(for: .audio),
         let input = try? AVCaptureDeviceInput(device: mic), session.canAddInput(input) {
        do {
          try AudioSessionCoordinator.shared.acquire(.recording)
        } catch {
          NSLog("[corvista] audio session: \(error)")
        }
        session.addInput(input)
        audioInput = input
      }
      if audioInput != nil, audioOutput == nil {
        let o = AVCaptureAudioDataOutput()
        if session.canAddOutput(o) {
          session.addOutput(o)
          o.setSampleBufferDelegate(self, queue: captureQueue)
          audioOutput = o
        }
      }
    } else {
      if let o = audioOutput { session.removeOutput(o); audioOutput = nil }
      if let i = audioInput {
        session.removeInput(i); audioInput = nil
        AudioSessionCoordinator.shared.release(.recording)
      }
    }
    RollingRecorder.shared.setAudioCaptureActive(currentSource == .file ? fileHasAudio : audioOutput != nil)
  }

  // MARK: - Device configuration

  private func configureDevice(_ device: AVCaptureDevice, fps: Int) {
    do {
      try device.lockForConfiguration()
      defer { device.unlockForConfiguration() }
      let f = Double(min(max(fps, 15), 30))
      if device.activeFormat.videoSupportedFrameRateRanges.contains(where: { $0.minFrameRate <= f && f <= $0.maxFrameRate }) {
        // Constant frame rate keeps recorder timing regular (low-light boost cannot drop below it).
        let d = CMTime(value: 1, timescale: CMTimeScale(f))
        device.activeVideoMinFrameDuration = d
        device.activeVideoMaxFrameDuration = d
      }
      if device.isFocusModeSupported(.continuousAutoFocus) { device.focusMode = .continuousAutoFocus }
      if device.isAutoFocusRangeRestrictionSupported { device.autoFocusRangeRestriction = .far }  // road ahead
      if device.isSmoothAutoFocusSupported { device.isSmoothAutoFocusEnabled = true }
      if device.isExposureModeSupported(.continuousAutoExposure) { device.exposureMode = .continuousAutoExposure }
      if device.isWhiteBalanceModeSupported(.continuousAutoWhiteBalance) { device.whiteBalanceMode = .continuousAutoWhiteBalance }
      if device.isLowLightBoostSupported { device.automaticallyEnablesLowLightBoostWhenAvailable = true }
      device.isSubjectAreaChangeMonitoringEnabled = false
    } catch {
      NSLog("[corvista] lockForConfiguration: \(error)")
    }
  }

  private func applyStabilization(_ c: AVCaptureConnection, device: AVCaptureDevice, mode: String) -> String {
    guard c.isVideoStabilizationSupported else { return "off" }
    let fmt = device.activeFormat
    let candidates: [(String, AVCaptureVideoStabilizationMode)]
    switch mode {
    case "off":
      c.preferredVideoStabilizationMode = .off
      return "off"
    case "cinematic": candidates = [("cinematic", .cinematic), ("standard", .standard)]
    case "standard": candidates = [("standard", .standard)]
    default:
      c.preferredVideoStabilizationMode = .auto
      return "auto"
    }
    for (name, m) in candidates where fmt.isVideoStabilizationModeSupported(m) {
      c.preferredVideoStabilizationMode = m
      return name
    }
    c.preferredVideoStabilizationMode = .off
    return "off"
  }

  private func uprightSize() -> (w: Int, h: Int) {
    let portrait = rotationAngle == 90 || rotationAngle == 270
    return portrait ? (presetSize.h, presetSize.w) : (presetSize.w, presetSize.h)
  }

  // MARK: - Focus / torch / devices

  func focus(x: Double, y: Double, completion: @escaping (FlutterError?) -> Void) {
    sessionQueue.async {
      guard self.wantRunning, let device = self.videoInput?.device else {
        completion(FlutterError(code: "not_running", message: "Camera not running", details: nil)); return
      }
      // Upright normalized point → sensor (landscape-right) point of interest.
      let px = min(max(x, 0), 1), py = min(max(y, 0), 1)
      let p: CGPoint
      switch Int(self.rotationAngle) {
      case 90: p = CGPoint(x: py, y: 1 - px)
      case 180: p = CGPoint(x: 1 - px, y: 1 - py)
      case 270: p = CGPoint(x: 1 - py, y: px)
      default: p = CGPoint(x: px, y: py)
      }
      do {
        try device.lockForConfiguration()
        if device.isFocusPointOfInterestSupported, device.isFocusModeSupported(.autoFocus) {
          device.focusPointOfInterest = p
          device.focusMode = .autoFocus
        }
        if device.isExposurePointOfInterestSupported, device.isExposureModeSupported(.autoExpose) {
          device.exposurePointOfInterest = p
          device.exposureMode = .autoExpose
        }
        device.unlockForConfiguration()
      } catch {
        completion(BridgeError.failure("failed", error)); return
      }
      // Return to continuous AF/AE after the tap settles.
      self.focusReset?.cancel()
      let work = DispatchWorkItem { [weak device] in
        guard let device, self.videoInput?.device === device else { return }
        do {
          try device.lockForConfiguration()
          if device.isFocusModeSupported(.continuousAutoFocus) {
            device.focusPointOfInterest = CGPoint(x: 0.5, y: 0.5)
            device.focusMode = .continuousAutoFocus
          }
          if device.isExposureModeSupported(.continuousAutoExposure) {
            device.exposurePointOfInterest = CGPoint(x: 0.5, y: 0.5)
            device.exposureMode = .continuousAutoExposure
          }
          device.unlockForConfiguration()
        } catch {}
      }
      self.focusReset = work
      self.sessionQueue.asyncAfter(deadline: .now() + 3, execute: work)
      completion(nil)
    }
  }

  func setTorch(_ on: Bool, completion: @escaping (FlutterError?) -> Void) {
    sessionQueue.async {
      guard let device = self.videoInput?.device ?? Self.device(for: "wide"),
            device.hasTorch, device.isTorchModeSupported(on ? .on : .off) else {
        completion(BridgeError.unavailable("Torch not available")); return
      }
      do {
        try device.lockForConfiguration()
        if on { try device.setTorchModeOn(level: AVCaptureDevice.maxAvailableTorchLevel) } else { device.torchMode = .off }
        device.unlockForConfiguration()
        completion(nil)
      } catch {
        completion(BridgeError.failure("failed", error))
      }
    }
  }

  static func devices() -> [[String: Any]] {
    let ds = AVCaptureDevice.DiscoverySession(
      deviceTypes: [.builtInWideAngleCamera, .builtInUltraWideCamera, .builtInTelephotoCamera],
      mediaType: .video, position: .back)
    return ds.devices.map { d in
      var maxFps = 0.0
      var modes = Set<String>()
      for f in d.formats {
        for r in f.videoSupportedFrameRateRanges { maxFps = max(maxFps, r.maxFrameRate) }
        let dimsF = CMVideoFormatDescriptionGetDimensions(f.formatDescription)
        guard dimsF.width <= 1920 else { continue }
        if f.isVideoStabilizationModeSupported(.standard) { modes.insert("standard") }
        if f.isVideoStabilizationModeSupported(.cinematic) { modes.insert("cinematic") }
        if f.isVideoStabilizationModeSupported(.auto) { modes.insert("auto") }
      }
      modes.insert("off")
      let order = ["off", "standard", "cinematic", "auto"]
      return [
        "deviceType": name(of: d.deviceType), "name": d.localizedName, "maxFps": maxFps,
        "stabilizationModes": order.filter { modes.contains($0) },
        "supports1080": d.supportsSessionPreset(.hd1920x1080),
      ]
    }
  }

  static func device(for type: String) -> AVCaptureDevice? {
    let t: AVCaptureDevice.DeviceType
    switch type {
    case "ultraWide": t = .builtInUltraWideCamera
    case "telephoto": t = .builtInTelephotoCamera
    default: t = .builtInWideAngleCamera
    }
    return AVCaptureDevice.default(t, for: .video, position: .back)
  }

  static func name(of t: AVCaptureDevice.DeviceType) -> String {
    switch t {
    case .builtInUltraWideCamera: return "ultraWide"
    case .builtInTelephotoCamera: return "telephoto"
    default: return "wide"
    }
  }

  // MARK: - Orientation

  private func observeOrientation() {
    UIDevice.current.beginGeneratingDeviceOrientationNotifications()
    let o = NotificationCenter.default.addObserver(
      forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main
    ) { [weak self] _ in
      self?.refreshInterfaceOrientation()
      // The interface rotates slightly after the device notification; re-check once it settles.
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { self?.refreshInterfaceOrientation() }
    }
    observers.append(o)
    refreshInterfaceOrientation()
    // Test footage mirrors the camera: iOS interrupts capture in the background, so the
    // file source pauses too (the recorder closes its segment on didEnterBackground).
    observers.append(NotificationCenter.default.addObserver(
      forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: .main
    ) { [weak self] _ in
      guard let self else { return }
      self.sessionQueue.async {
        guard let fs = self.fileSource else { return }
        fs.setPaused(true)
        self.setState("interrupted", reason: "background")
      }
    })
    observers.append(NotificationCenter.default.addObserver(
      forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main
    ) { [weak self] _ in
      guard let self else { return }
      self.sessionQueue.async {
        guard let fs = self.fileSource else { return }
        fs.setPaused(false)
        self.setState("running")
      }
    })
  }

  /// Main thread.
  private func refreshInterfaceOrientation() {
    let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
    guard let scene = scenes.first(where: { $0.activationState == .foregroundActive }) ?? scenes.first else { return }
    let angle: CGFloat
    switch scene.interfaceOrientation {
    case .landscapeRight: angle = 0
    case .portraitUpsideDown: angle = 270
    case .landscapeLeft: angle = 180
    default: angle = 90
    }
    sessionQueue.async {
      guard angle != self.rotationAngle else { return }
      self.rotationAngle = angle
      if let c = self.videoOutput.connection(with: .video), c.isVideoRotationAngleSupported(angle) {
        c.videoRotationAngle = angle  // buffers become upright; new w/h → status event on next frame
      }
    }
  }

  // MARK: - Session notifications

  private func observeSession() {
    let nc = NotificationCenter.default
    observers.append(nc.addObserver(forName: AVCaptureSession.wasInterruptedNotification, object: session, queue: nil) { [weak self] n in
      guard let self else { return }
      let raw = (n.userInfo?[AVCaptureSessionInterruptionReasonKey] as? NSNumber)?.intValue ?? -1
      let reason: String
      switch AVCaptureSession.InterruptionReason(rawValue: raw) {
      case .videoDeviceNotAvailableInBackground: reason = "background"
      case .audioDeviceInUseByAnotherClient: reason = "audio_in_use"
      case .videoDeviceInUseByAnotherClient: reason = "camera_in_use"
      case .videoDeviceNotAvailableWithMultipleForegroundApps: reason = "multitasking"
      case .videoDeviceNotAvailableDueToSystemPressure: reason = "system_pressure"
      default: reason = "unknown"
      }
      self.setState("interrupted", reason: reason)
      RollingRecorder.shared.discontinuity()
    })
    observers.append(nc.addObserver(forName: AVCaptureSession.interruptionEndedNotification, object: session, queue: nil) { [weak self] _ in
      guard let self else { return }
      self.sessionQueue.async {
        guard self.wantRunning else { return }
        self.setState("running")
      }
    })
    observers.append(nc.addObserver(forName: AVCaptureSession.runtimeErrorNotification, object: session, queue: nil) { [weak self] n in
      guard let self else { return }
      let err = n.userInfo?[AVCaptureSessionErrorKey] as? AVError
      RollingRecorder.shared.discontinuity()
      self.sessionQueue.async {
        guard self.wantRunning else { return }
        if err?.code == .mediaServicesWereReset || self.restartAttempts < 1 {
          // Media services reset (or a first transient failure): restart the session.
          self.restartAttempts += 1
          self.session.startRunning()
          if self.session.isRunning { self.setState("running"); return }
        }
        self.setState("error", reason: err?.localizedDescription ?? "runtime_error")
      }
    })
  }

  // MARK: - Frame path (capture queue)

  fileprivate func deliver(_ pb: CVPixelBuffer, pts: CMTime, source frameSource: VideoFrame.Source) {
    let wallMs = Date().timeIntervalSince1970 * 1000
    let now = CACurrentMediaTime()
    if windowStart == 0 { windowStart = now }
    windowFrames += 1
    let w = CVPixelBufferGetWidth(pb), h = CVPixelBufferGetHeight(pb)
    var dimsChanged = false
    if w != lastFrameDims.w || h != lastFrameDims.h { lastFrameDims = (w, h); dimsChanged = true }

    lock.lock()
    if now - windowStart >= 1 {
      fps = Double(windowFrames) / (now - windowStart)
      windowFrames = 0
      windowStart = now
    }
    if dimsChanged { dims = (w, h) }
    let tex = texture, id = textureId, reg = registry
    let currentSource = source
    lock.unlock()
    // Drop stragglers from a source that has been switched away from.
    guard frameSource == currentSource else { return }
    if dimsChanged { EventHub.shared.send(.status, statusPayload()) }

    tex?.update(pb)
    if id >= 0 { reg?.textureFrameAvailable(id) }

    let frame = VideoFrame(pixelBuffer: pb, pts: pts, wallMs: wallMs, source: frameSource)
    InferenceEngine.shared.offer(frame)
    RollingRecorder.shared.appendVideo(frame)
  }

  private func startPerfTimer() {
    captureQueue.async {
      guard self.perfTimer == nil else { return }
      let t = DispatchSource.makeTimerSource(queue: self.captureQueue)
      t.schedule(deadline: .now() + 1, repeating: 1, leeway: .milliseconds(100))
      t.setEventHandler { self.emitPerf() }  // singleton: strong capture is fine
      t.resume()
      self.perfTimer = t
    }
  }

  private func stopPerfTimer() {
    captureQueue.async {
      self.perfTimer?.cancel()
      self.perfTimer = nil
      self.windowStart = 0
      self.windowFrames = 0
      self.lastFrameDims = (0, 0)
    }
  }

  private func emitPerf() {
    var p = InferenceEngine.shared.perfSnapshot()
    lock.lock()
    p["droppedFrames"] = dropped
    p["fps"] = (fps * 10).rounded() / 10
    lock.unlock()
    p["type"] = "perf"
    p["memoryMB"] = ProcessStats.memoryMB()
    EventHub.shared.send(.status, p)
  }
}

extension CaptureCoordinator: AVCaptureVideoDataOutputSampleBufferDelegate, AVCaptureAudioDataOutputSampleBufferDelegate {
  func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
    if output is AVCaptureAudioDataOutput {
      RollingRecorder.shared.appendAudio(sampleBuffer)
      return
    }
    guard let pb = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
    deliver(pb, pts: CMSampleBufferGetPresentationTimeStamp(sampleBuffer), source: .camera)
  }

  func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
    guard output is AVCaptureVideoDataOutput else { return }
    lock.lock(); dropped += 1; lock.unlock()
  }
}
