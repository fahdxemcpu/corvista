import 'dart:convert';

enum DriveView { detection, virtual, maps, parking, segmentation }

enum SpeedUnit { kmh, mph }

enum ThemePref { system, dark, light }

enum PowerMode { balanced, performance, powerSaver }

enum AlertSensitivity { low, medium, high }

enum VirtualStyle { minimal, perspective, highContrast }

/// Which side of the road traffic drives on; [auto] follows the device
/// region (see `resolveDrivingSide`).
enum DrivingSide { auto, right, left }

/// Regions with left-hand traffic.
const leftHandTrafficRegions = {
  'GB', 'IE', 'JP', 'IN', 'AU', 'NZ', 'ZA', 'HK', 'MO', 'SG', 'MY', 'TH', //
  'ID', 'PK', 'BD', 'LK', 'KE', 'UG', 'TZ', 'ZM', 'ZW', 'MT', 'CY', 'JM',
  'BS', 'BB', 'TT', 'GY', 'SR', 'NP', 'BT', 'BN', 'MU', 'FJ', 'PG', 'WS',
  'TO', 'MW', 'MZ', 'NA', 'BW', 'LS', 'SZ', 'IM', 'JE', 'GG', 'KY', 'BM',
  'VG', 'VI', 'AI', 'MS', 'TC', 'FK',
};

/// Resolves [side] to right/left; `auto` uses [regionCode] (ISO 3166-1
/// alpha-2, e.g. from the device locale) and defaults to right-hand traffic.
DrivingSide resolveDrivingSide(DrivingSide side, String? regionCode) {
  if (side != DrivingSide.auto) return side;
  final r = regionCode?.toUpperCase();
  return r != null && leftHandTrafficRegions.contains(r)
      ? DrivingSide.left
      : DrivingSide.right;
}

enum SegmentationMode { original, boxes, masks, road, combined }

/// HUD styles.
enum HudStyle {
  classic,
  grid,
  minimal,
  performance,
  navigation,
  night,
  highContrast,
}

enum RecordingProfile { standard, premium }

/// All persisted user preferences. Stored as one JSON document in Drift
/// (`settings` table, key 'app'). Unknown/missing keys fall back to defaults.
class AppSettings {
  const AppSettings({
    this.onboardingDone = false,
    this.tourDone = false,
    this.localeTag,
    this.themePref = ThemePref.dark,
    this.reduceMotion = false,
    // Camera
    this.cameraDevice = 'wide',
    this.stabilization = 'auto',
    this.overlayOpacity = 1.0,
    this.showFps = false,
    // AI
    this.modelId = 'efficient',
    this.confidenceThreshold = 0.35,
    this.trackingEnabled = true,
    this.showLabels = true,
    this.showConfidence = true,
    this.segmentationOpacity = 0.75,
    this.segmentationMode = SegmentationMode.combined,
    // Alerts
    this.voiceAlerts = true,
    this.voiceLanguage,
    this.voiceId,
    this.voiceVolume = 1.0,
    this.alertSensitivity = AlertSensitivity.medium,
    this.alertCooldownS = 12,
    this.alertPedestrian = true,
    this.alertCyclist = true,
    this.alertMotorcycle = true,
    this.alertBus = true,
    this.alertVehicleClose = true,
    this.alertTrafficLight = true,
    this.alertTrafficMoving = true,
    this.alertStopSign = false,
    this.quietMode = false,
    this.parkingBeeps = true,
    this.beepVolume = 0.7,
    // Recording
    this.recordingProfile = RecordingProfile.standard,
    this.bufferSeconds = 20,
    this.recordAudio = false,
    this.manualMaxMinutes = 30,
    this.watermark = true,
    this.timestamp = true,
    this.saveLocation = true,
    // Driving / HUD
    this.defaultView = DriveView.detection,
    this.speedUnit = SpeedUnit.kmh,
    this.showCompass = true,
    this.hudStyle = HudStyle.classic,
    this.hudScale = 1.0,
    this.hudOpacity = 0.9,
    this.hudShowSpeed = true,
    this.hudShowHeading = true,
    this.hudShowClock = true,
    this.hudShowBattery = true,
    this.hudShowDetections = true,
    this.hudShowWeather = true,
    this.virtualStyle = VirtualStyle.perspective,
    this.drivingSide = DrivingSide.auto,
    this.autoRecenter = true,
    this.mapPitch = 55,
    this.navVoice = true,
    this.liveActivity = true,
    this.powerMode = PowerMode.balanced,
    this.keepScreenOn = true,
    // Emergency
    this.emergencyEnabled = false,
    this.emergencyCountdownS = 30,
    this.emergencyVoiceCancel = false,
    this.emergencyMessage = '',
    this.emergencyNumber = '112',
    this.emergencyAutoSaveClip = true,
    // Diagnostics
    this.cameraFov = 68,
    this.saveDetectionLog = false,
    // Trip log
    this.tripLogEnabled = true,
    this.tripRetentionDays = 90,
  });

  final bool onboardingDone;

  /// The Drive-screen coach-mark tour has been completed or skipped.
  final bool tourDone;
  final String? localeTag;
  final ThemePref themePref;
  final bool reduceMotion;

  final String cameraDevice;
  final String stabilization;
  final double overlayOpacity;
  final bool showFps;

  final String modelId;
  final double confidenceThreshold;
  final bool trackingEnabled;
  final bool showLabels;
  final bool showConfidence;
  final double segmentationOpacity;
  final SegmentationMode segmentationMode;

  final bool voiceAlerts;
  final String? voiceLanguage;
  final String? voiceId;
  final double voiceVolume;
  final AlertSensitivity alertSensitivity;
  final int alertCooldownS;
  final bool alertPedestrian;
  final bool alertCyclist;
  final bool alertMotorcycle;
  final bool alertBus;
  final bool alertVehicleClose;
  final bool alertTrafficLight;
  final bool alertTrafficMoving;
  final bool alertStopSign;
  final bool quietMode;
  final bool parkingBeeps;
  final double beepVolume;

  final RecordingProfile recordingProfile;
  final int bufferSeconds;
  final bool recordAudio;

  /// Manual (continuous) recording auto-stops after this many minutes; 0 = unlimited.
  /// Allowed: 15 / 30 / 60 / 0.
  final int manualMaxMinutes;
  final bool watermark;
  final bool timestamp;
  final bool saveLocation;

  final DriveView defaultView;
  final SpeedUnit speedUnit;
  final bool showCompass;
  final HudStyle hudStyle;
  final double hudScale;
  final double hudOpacity;
  final bool hudShowSpeed;
  final bool hudShowHeading;
  final bool hudShowClock;
  final bool hudShowBattery;
  final bool hudShowDetections;
  final bool hudShowWeather;
  final VirtualStyle virtualStyle;

  /// Traffic side for the stylized road (auto = from device region).
  final DrivingSide drivingSide;
  final bool autoRecenter;
  final double mapPitch;

  /// Spoken turn-by-turn navigation guidance.
  final bool navVoice;

  /// Turn-by-turn Live Activity on the Lock Screen / Dynamic Island.
  final bool liveActivity;
  final PowerMode powerMode;
  final bool keepScreenOn;

  final bool emergencyEnabled;
  final int emergencyCountdownS;
  final bool emergencyVoiceCancel;
  final String emergencyMessage;
  final String emergencyNumber;
  final bool emergencyAutoSaveClip;

  /// Assumed horizontal field of view of the selected camera in degrees
  /// (overridden by native `camera.start` result when available).
  final double cameraFov;

  /// Diagnostics: persist raw detections to the local DB (capped, off by default).
  final bool saveDetectionLog;

  /// Record trips (GPS track + summary) locally while driving.
  final bool tripLogEnabled;

  /// Trips older than this are purged on launch; 0 = keep forever.
  /// Options: 7 / 30 / 90 / 365 / 0.
  final int tripRetentionDays;

  AppSettings copyWith({
    bool? onboardingDone,
    bool? tourDone,
    String? Function()? localeTag,
    ThemePref? themePref,
    bool? reduceMotion,
    String? cameraDevice,
    String? stabilization,
    double? overlayOpacity,
    bool? showFps,
    String? modelId,
    double? confidenceThreshold,
    bool? trackingEnabled,
    bool? showLabels,
    bool? showConfidence,
    double? segmentationOpacity,
    SegmentationMode? segmentationMode,
    bool? voiceAlerts,
    String? Function()? voiceLanguage,
    String? Function()? voiceId,
    double? voiceVolume,
    AlertSensitivity? alertSensitivity,
    int? alertCooldownS,
    bool? alertPedestrian,
    bool? alertCyclist,
    bool? alertMotorcycle,
    bool? alertBus,
    bool? alertVehicleClose,
    bool? alertTrafficLight,
    bool? alertTrafficMoving,
    bool? alertStopSign,
    bool? quietMode,
    bool? parkingBeeps,
    double? beepVolume,
    RecordingProfile? recordingProfile,
    int? bufferSeconds,
    bool? recordAudio,
    int? manualMaxMinutes,
    bool? watermark,
    bool? timestamp,
    bool? saveLocation,
    DriveView? defaultView,
    SpeedUnit? speedUnit,
    bool? showCompass,
    HudStyle? hudStyle,
    double? hudScale,
    double? hudOpacity,
    bool? hudShowSpeed,
    bool? hudShowHeading,
    bool? hudShowClock,
    bool? hudShowBattery,
    bool? hudShowDetections,
    bool? hudShowWeather,
    VirtualStyle? virtualStyle,
    DrivingSide? drivingSide,
    bool? autoRecenter,
    double? mapPitch,
    bool? navVoice,
    bool? liveActivity,
    PowerMode? powerMode,
    bool? keepScreenOn,
    bool? emergencyEnabled,
    int? emergencyCountdownS,
    bool? emergencyVoiceCancel,
    String? emergencyMessage,
    String? emergencyNumber,
    bool? emergencyAutoSaveClip,
    double? cameraFov,
    bool? saveDetectionLog,
    bool? tripLogEnabled,
    int? tripRetentionDays,
  }) => AppSettings(
    onboardingDone: onboardingDone ?? this.onboardingDone,
    tourDone: tourDone ?? this.tourDone,
    localeTag: localeTag != null ? localeTag() : this.localeTag,
    themePref: themePref ?? this.themePref,
    reduceMotion: reduceMotion ?? this.reduceMotion,
    cameraDevice: cameraDevice ?? this.cameraDevice,
    stabilization: stabilization ?? this.stabilization,
    overlayOpacity: overlayOpacity ?? this.overlayOpacity,
    showFps: showFps ?? this.showFps,
    modelId: modelId ?? this.modelId,
    confidenceThreshold: confidenceThreshold ?? this.confidenceThreshold,
    trackingEnabled: trackingEnabled ?? this.trackingEnabled,
    showLabels: showLabels ?? this.showLabels,
    showConfidence: showConfidence ?? this.showConfidence,
    segmentationOpacity: segmentationOpacity ?? this.segmentationOpacity,
    segmentationMode: segmentationMode ?? this.segmentationMode,
    voiceAlerts: voiceAlerts ?? this.voiceAlerts,
    voiceLanguage: voiceLanguage != null ? voiceLanguage() : this.voiceLanguage,
    voiceId: voiceId != null ? voiceId() : this.voiceId,
    voiceVolume: voiceVolume ?? this.voiceVolume,
    alertSensitivity: alertSensitivity ?? this.alertSensitivity,
    alertCooldownS: alertCooldownS ?? this.alertCooldownS,
    alertPedestrian: alertPedestrian ?? this.alertPedestrian,
    alertCyclist: alertCyclist ?? this.alertCyclist,
    alertMotorcycle: alertMotorcycle ?? this.alertMotorcycle,
    alertBus: alertBus ?? this.alertBus,
    alertVehicleClose: alertVehicleClose ?? this.alertVehicleClose,
    alertTrafficLight: alertTrafficLight ?? this.alertTrafficLight,
    alertTrafficMoving: alertTrafficMoving ?? this.alertTrafficMoving,
    alertStopSign: alertStopSign ?? this.alertStopSign,
    quietMode: quietMode ?? this.quietMode,
    parkingBeeps: parkingBeeps ?? this.parkingBeeps,
    beepVolume: beepVolume ?? this.beepVolume,
    recordingProfile: recordingProfile ?? this.recordingProfile,
    bufferSeconds: bufferSeconds ?? this.bufferSeconds,
    recordAudio: recordAudio ?? this.recordAudio,
    manualMaxMinutes: manualMaxMinutes ?? this.manualMaxMinutes,
    watermark: watermark ?? this.watermark,
    timestamp: timestamp ?? this.timestamp,
    saveLocation: saveLocation ?? this.saveLocation,
    defaultView: defaultView ?? this.defaultView,
    speedUnit: speedUnit ?? this.speedUnit,
    showCompass: showCompass ?? this.showCompass,
    hudStyle: hudStyle ?? this.hudStyle,
    hudScale: hudScale ?? this.hudScale,
    hudOpacity: hudOpacity ?? this.hudOpacity,
    hudShowSpeed: hudShowSpeed ?? this.hudShowSpeed,
    hudShowHeading: hudShowHeading ?? this.hudShowHeading,
    hudShowClock: hudShowClock ?? this.hudShowClock,
    hudShowBattery: hudShowBattery ?? this.hudShowBattery,
    hudShowDetections: hudShowDetections ?? this.hudShowDetections,
    hudShowWeather: hudShowWeather ?? this.hudShowWeather,
    virtualStyle: virtualStyle ?? this.virtualStyle,
    drivingSide: drivingSide ?? this.drivingSide,
    autoRecenter: autoRecenter ?? this.autoRecenter,
    mapPitch: mapPitch ?? this.mapPitch,
    navVoice: navVoice ?? this.navVoice,
    liveActivity: liveActivity ?? this.liveActivity,
    powerMode: powerMode ?? this.powerMode,
    keepScreenOn: keepScreenOn ?? this.keepScreenOn,
    emergencyEnabled: emergencyEnabled ?? this.emergencyEnabled,
    emergencyCountdownS: emergencyCountdownS ?? this.emergencyCountdownS,
    emergencyVoiceCancel: emergencyVoiceCancel ?? this.emergencyVoiceCancel,
    emergencyMessage: emergencyMessage ?? this.emergencyMessage,
    emergencyNumber: emergencyNumber ?? this.emergencyNumber,
    emergencyAutoSaveClip: emergencyAutoSaveClip ?? this.emergencyAutoSaveClip,
    cameraFov: cameraFov ?? this.cameraFov,
    saveDetectionLog: saveDetectionLog ?? this.saveDetectionLog,
    tripLogEnabled: tripLogEnabled ?? this.tripLogEnabled,
    tripRetentionDays: tripRetentionDays ?? this.tripRetentionDays,
  );

  Map<String, Object?> toJson() => {
    'onboardingDone': onboardingDone,
    'tourDone': tourDone,
    'localeTag': localeTag,
    'themePref': themePref.name,
    'reduceMotion': reduceMotion,
    'cameraDevice': cameraDevice,
    'stabilization': stabilization,
    'overlayOpacity': overlayOpacity,
    'showFps': showFps,
    'modelId': modelId,
    'confidenceThreshold': confidenceThreshold,
    'trackingEnabled': trackingEnabled,
    'showLabels': showLabels,
    'showConfidence': showConfidence,
    'segmentationOpacity': segmentationOpacity,
    'segmentationMode': segmentationMode.name,
    'voiceAlerts': voiceAlerts,
    'voiceLanguage': voiceLanguage,
    'voiceId': voiceId,
    'voiceVolume': voiceVolume,
    'alertSensitivity': alertSensitivity.name,
    'alertCooldownS': alertCooldownS,
    'alertPedestrian': alertPedestrian,
    'alertCyclist': alertCyclist,
    'alertMotorcycle': alertMotorcycle,
    'alertBus': alertBus,
    'alertVehicleClose': alertVehicleClose,
    'alertTrafficLight': alertTrafficLight,
    'alertTrafficMoving': alertTrafficMoving,
    'alertStopSign': alertStopSign,
    'quietMode': quietMode,
    'parkingBeeps': parkingBeeps,
    'beepVolume': beepVolume,
    'recordingProfile': recordingProfile.name,
    'bufferSeconds': bufferSeconds,
    'recordAudio': recordAudio,
    'manualMaxMinutes': manualMaxMinutes,
    'watermark': watermark,
    'timestamp': timestamp,
    'saveLocation': saveLocation,
    'defaultView': defaultView.name,
    'speedUnit': speedUnit.name,
    'showCompass': showCompass,
    'hudStyle': hudStyle.name,
    'hudScale': hudScale,
    'hudOpacity': hudOpacity,
    'hudShowSpeed': hudShowSpeed,
    'hudShowHeading': hudShowHeading,
    'hudShowClock': hudShowClock,
    'hudShowBattery': hudShowBattery,
    'hudShowDetections': hudShowDetections,
    'hudShowWeather': hudShowWeather,
    'virtualStyle': virtualStyle.name,
    'drivingSide': drivingSide.name,
    'autoRecenter': autoRecenter,
    'mapPitch': mapPitch,
    'navVoice': navVoice,
    'liveActivity': liveActivity,
    'powerMode': powerMode.name,
    'keepScreenOn': keepScreenOn,
    'emergencyEnabled': emergencyEnabled,
    'emergencyCountdownS': emergencyCountdownS,
    'emergencyVoiceCancel': emergencyVoiceCancel,
    'emergencyMessage': emergencyMessage,
    'emergencyNumber': emergencyNumber,
    'emergencyAutoSaveClip': emergencyAutoSaveClip,
    'cameraFov': cameraFov,
    'saveDetectionLog': saveDetectionLog,
    'tripLogEnabled': tripLogEnabled,
    'tripRetentionDays': tripRetentionDays,
  };

  static AppSettings fromJson(Map<String, Object?> j) {
    const d = AppSettings();
    T e<T extends Enum>(List<T> vs, String k, T def) =>
        vs.firstWhere((v) => v.name == j[k], orElse: () => def);
    bool b(String k, bool def) => j[k] is bool ? j[k] as bool : def;
    double n(String k, double def) =>
        j[k] is num ? (j[k] as num).toDouble() : def;
    int i(String k, int def) => j[k] is num ? (j[k] as num).toInt() : def;
    String s(String k, String def) => j[k] is String ? j[k] as String : def;
    String? sn(String k) => j[k] is String ? j[k] as String : null;
    return AppSettings(
      onboardingDone: b('onboardingDone', d.onboardingDone),
      tourDone: b('tourDone', d.tourDone),
      localeTag: sn('localeTag'),
      themePref: e(ThemePref.values, 'themePref', d.themePref),
      reduceMotion: b('reduceMotion', d.reduceMotion),
      cameraDevice: s('cameraDevice', d.cameraDevice),
      stabilization: s('stabilization', d.stabilization),
      overlayOpacity: n('overlayOpacity', d.overlayOpacity),
      showFps: b('showFps', d.showFps),
      modelId: s('modelId', d.modelId),
      confidenceThreshold: n('confidenceThreshold', d.confidenceThreshold),
      trackingEnabled: b('trackingEnabled', d.trackingEnabled),
      showLabels: b('showLabels', d.showLabels),
      showConfidence: b('showConfidence', d.showConfidence),
      segmentationOpacity: n('segmentationOpacity', d.segmentationOpacity),
      segmentationMode: e(
        SegmentationMode.values,
        'segmentationMode',
        d.segmentationMode,
      ),
      voiceAlerts: b('voiceAlerts', d.voiceAlerts),
      voiceLanguage: sn('voiceLanguage'),
      voiceId: sn('voiceId'),
      voiceVolume: n('voiceVolume', d.voiceVolume),
      alertSensitivity: e(
        AlertSensitivity.values,
        'alertSensitivity',
        d.alertSensitivity,
      ),
      alertCooldownS: i('alertCooldownS', d.alertCooldownS),
      alertPedestrian: b('alertPedestrian', d.alertPedestrian),
      alertCyclist: b('alertCyclist', d.alertCyclist),
      alertMotorcycle: b('alertMotorcycle', d.alertMotorcycle),
      alertBus: b('alertBus', d.alertBus),
      alertVehicleClose: b('alertVehicleClose', d.alertVehicleClose),
      alertTrafficLight: b('alertTrafficLight', d.alertTrafficLight),
      alertTrafficMoving: b('alertTrafficMoving', d.alertTrafficMoving),
      alertStopSign: b('alertStopSign', d.alertStopSign),
      quietMode: b('quietMode', d.quietMode),
      parkingBeeps: b('parkingBeeps', d.parkingBeeps),
      beepVolume: n('beepVolume', d.beepVolume),
      recordingProfile: e(
        RecordingProfile.values,
        'recordingProfile',
        d.recordingProfile,
      ),
      bufferSeconds: i('bufferSeconds', d.bufferSeconds),
      recordAudio: b('recordAudio', d.recordAudio),
      manualMaxMinutes: switch (i('manualMaxMinutes', d.manualMaxMinutes)) {
        final v when const [0, 15, 30, 60].contains(v) => v,
        _ => d.manualMaxMinutes,
      },
      watermark: b('watermark', d.watermark),
      timestamp: b('timestamp', d.timestamp),
      saveLocation: b('saveLocation', d.saveLocation),
      defaultView: e(DriveView.values, 'defaultView', d.defaultView),
      speedUnit: e(SpeedUnit.values, 'speedUnit', d.speedUnit),
      showCompass: b('showCompass', d.showCompass),
      hudStyle: e(HudStyle.values, 'hudStyle', d.hudStyle),
      hudScale: n('hudScale', d.hudScale),
      hudOpacity: n('hudOpacity', d.hudOpacity),
      hudShowSpeed: b('hudShowSpeed', d.hudShowSpeed),
      hudShowHeading: b('hudShowHeading', d.hudShowHeading),
      hudShowClock: b('hudShowClock', d.hudShowClock),
      hudShowBattery: b('hudShowBattery', d.hudShowBattery),
      hudShowDetections: b('hudShowDetections', d.hudShowDetections),
      hudShowWeather: b('hudShowWeather', d.hudShowWeather),
      virtualStyle: e(VirtualStyle.values, 'virtualStyle', d.virtualStyle),
      drivingSide: e(DrivingSide.values, 'drivingSide', d.drivingSide),
      autoRecenter: b('autoRecenter', d.autoRecenter),
      mapPitch: n('mapPitch', d.mapPitch),
      navVoice: b('navVoice', d.navVoice),
      liveActivity: b('liveActivity', d.liveActivity),
      powerMode: e(PowerMode.values, 'powerMode', d.powerMode),
      keepScreenOn: b('keepScreenOn', d.keepScreenOn),
      emergencyEnabled: b('emergencyEnabled', d.emergencyEnabled),
      emergencyCountdownS: i('emergencyCountdownS', d.emergencyCountdownS),
      emergencyVoiceCancel: b('emergencyVoiceCancel', d.emergencyVoiceCancel),
      emergencyMessage: s('emergencyMessage', d.emergencyMessage),
      emergencyNumber: s('emergencyNumber', d.emergencyNumber),
      emergencyAutoSaveClip: b(
        'emergencyAutoSaveClip',
        d.emergencyAutoSaveClip,
      ),
      cameraFov: n('cameraFov', d.cameraFov),
      saveDetectionLog: b('saveDetectionLog', d.saveDetectionLog),
      tripLogEnabled: b('tripLogEnabled', d.tripLogEnabled),
      tripRetentionDays: i('tripRetentionDays', d.tripRetentionDays),
    );
  }

  String encode() => jsonEncode(toJson());
  static AppSettings decode(String s) =>
      fromJson((jsonDecode(s) as Map).cast<String, Object?>());
}
