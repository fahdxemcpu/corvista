import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';

import '../../domain/models/detection.dart';
import '../../domain/models/incident.dart';
import '../../domain/models/location_fix.dart';

/// Typed Dart client for the native engine. Contract: docs/BRIDGE.md.
/// Every method maps 1:1 to `<module>.<method>` on `corvista/engine`.
class NativeEngine {
  NativeEngine({MethodChannel? channel})
    : _ch = channel ?? const MethodChannel('corvista/engine');

  final MethodChannel _ch;

  static const _detections = EventChannel('corvista/detections');
  static const _status = EventChannel('corvista/status');
  static const _location = EventChannel('corvista/location');
  static const _motion = EventChannel('corvista/motion');
  static const _voice = EventChannel('corvista/voice');

  Future<T?> call<T>(String method, [Map<String, Object?> args = const {}]) =>
      _ch.invokeMethod<T>(method, args);

  Future<Map<Object?, Object?>> _map(
    String method, [
    Map<String, Object?> args = const {},
  ]) async =>
      (await _ch.invokeMethod<Map<Object?, Object?>>(method, args)) ?? const {};

  Future<List<Map<Object?, Object?>>> _list(
    String method, [
    Map<String, Object?> args = const {},
  ]) async =>
      ((await _ch.invokeMethod<List<Object?>>(method, args)) ?? const [])
          .cast<Map<Object?, Object?>>();

  // ---- streams (broadcast, shared) ----
  late final Stream<Map<Object?, Object?>> _detRaw = _detections
      .receiveBroadcastStream()
      .cast<Map<Object?, Object?>>()
      .asBroadcastStream();
  Stream<DetectionFrame> get detections => _detRaw
      .where((m) => m['type'] == 'detections')
      .map(DetectionFrame.fromMap);
  Stream<SegmentationFrame> get segmentation => _detRaw
      .where((m) => m['type'] == 'segmentation')
      .map(SegmentationFrame.fromMap);

  late final Stream<Map<Object?, Object?>> status = _status
      .receiveBroadcastStream()
      .cast<Map<Object?, Object?>>()
      .asBroadcastStream();

  late final Stream<Map<Object?, Object?>> _locRaw = _location
      .receiveBroadcastStream()
      .cast<Map<Object?, Object?>>()
      .asBroadcastStream();
  Stream<LocationFix> get location =>
      _locRaw.where((m) => m['type'] == null).map(LocationFix.fromMap);
  Stream<String> get locationAuth => _locRaw
      .where((m) => m['type'] == 'auth')
      .map((m) => m['status'] as String);

  /// Motion batches: (hz, samples) where samples is flat [t,ax,ay,az,rx,ry,rz]*n.
  late final Stream<({double hz, Float64List samples})> motion = _motion
      .receiveBroadcastStream()
      .cast<Map<Object?, Object?>>()
      .map(
        (m) => (
          hz: (m['hz'] as num).toDouble(),
          samples: m['samples'] as Float64List,
        ),
      )
      .asBroadcastStream();

  late final Stream<Map<Object?, Object?>> voice = _voice
      .receiveBroadcastStream()
      .cast<Map<Object?, Object?>>()
      .asBroadcastStream();

  // ---- camera ----
  Future<Map<Object?, Object?>> cameraStart({
    String deviceType = 'wide',
    String quality = 'hd720',
    String stabilization = 'auto',
    int fps = 30,
  }) => _map('camera.start', {
    'deviceType': deviceType,
    'quality': quality,
    'stabilization': stabilization,
    'fps': fps,
  });
  Future<Map<Object?, Object?>> cameraStartFile(String path) =>
      _map('camera.startFile', {'path': path});
  Future<void> cameraStop() => call('camera.stop');
  Future<List<Map<Object?, Object?>>> cameraDevices() =>
      _list('camera.devices');
  Future<void> cameraFocus(double x, double y) =>
      call('camera.focus', {'x': x, 'y': y});
  Future<void> cameraTorch(bool on) => call('camera.setTorch', {'on': on});

  // ---- ai ----
  Future<List<Map<Object?, Object?>>> aiModels() => _list('ai.models');
  Future<Map<Object?, Object?>> aiSetModel(String id) =>
      _map('ai.setModel', {'id': id});
  Future<void> aiConfigure({
    double? confidence,
    double? iou,
    double? maxHz,
    double? segmentationHz,
    bool? paused,
    String? computeUnits,
  }) => call('ai.configure', {
    'confidence': ?confidence,
    'iou': ?iou,
    'maxHz': ?maxHz,
    'segmentationHz': ?segmentationHz,
    'paused': ?paused,
    'computeUnits': ?computeUnits,
  });
  Future<Map<Object?, Object?>> aiAnalyzeImage(String path) =>
      _map('ai.analyzeImage', {'path': path});
  Future<Map<Object?, Object?>> aiBenchmark(
    String path, {
    int iterations = 20,
  }) => _map('ai.benchmark', {'path': path, 'iterations': iterations});

  // ---- recorder ----
  Future<Map<Object?, Object?>> recorderConfigure({
    required String profile,
    required int bufferSeconds,
    required bool audio,
    required bool watermark,
    required bool timestamp,
    String timestampFormat = 'local',
    String? watermarkText,
  }) => _map('recorder.configure', {
    'profile': profile,
    'bufferSeconds': bufferSeconds,
    'audio': audio,
    'watermark': watermark,
    'timestamp': timestamp,
    'timestampFormat': timestampFormat,
    'watermarkText': ?watermarkText,
  });
  Future<Map<Object?, Object?>> recorderStatus() => _map('recorder.status');
  Future<IncidentResult> saveIncident({
    String reason = 'manual',
    double? lat,
    double? lon,
    double? speed,
    String? title,
  }) async => IncidentResult.fromMap(
    await _map('recorder.saveIncident', {
      'reason': reason,
      'lat': ?lat,
      'lon': ?lon,
      'speed': ?speed,
      'title': ?title,
    }),
  );
  Future<void> clearBuffer() => call('recorder.clearBuffer');

  /// Manual (continuous) recording. Returns the native `manual` status map.
  Future<Map<Object?, Object?>> startManualRecording({
    double preRollSeconds = 5,
    int maxMinutes = 0,
    double splitMinutes = 5,
    double? lat,
    double? lon,
    double? speed,
  }) => _map('recorder.startManual', {
    'preRollSeconds': preRollSeconds,
    'maxMinutes': maxMinutes,
    'splitMinutes': splitMinutes,
    'lat': ?lat,
    'lon': ?lon,
    'speed': ?speed,
  });

  /// Stops manual recording; resolves once the final part(s) are written.
  /// Returns `{parts: [IncidentResult map], manual, reason}`.
  Future<Map<Object?, Object?>> stopManualRecording({
    double? lat,
    double? lon,
    double? speed,
  }) =>
      _map('recorder.stopManual', {'lat': ?lat, 'lon': ?lon, 'speed': ?speed});
  Future<List<IncidentResult>> recoverIncidents() async =>
      (await _list('recorder.recover')).map(IncidentResult.fromMap).toList();

  // ---- media ----
  Future<String?> thumbnail(String path, {int atMs = 1000}) =>
      call<String>('media.thumbnail', {'path': path, 'atMs': atMs});
  Future<Map<Object?, Object?>> probe(String path) =>
      _map('media.probe', {'path': path});
  Future<Map<Object?, Object?>> storage() => _map('media.storage');
  Future<void> deleteMedia(String path) => call('media.delete', {'path': path});

  /// `media.cleanup` → `{bytesFreed, filesDeleted, recovered: [IncidentResult]}`
  /// (older engines may return a bare number of bytes).
  Future<Object?> mediaCleanup() => call<Object>('media.cleanup');

  /// `media.trim` → a NEW clip holding `[startMs, endMs]` of [path] (the
  /// source is untouched). [meta] overrides event metadata inherited from the
  /// source sidecar (title, reason, kind, createdAt, lat, lon, speed).
  Future<IncidentResult> mediaTrim(
    String path, {
    required int startMs,
    required int endMs,
    Map<String, Object?> meta = const {},
  }) async => IncidentResult.fromMap(
    await _map('media.trim', {
      'path': path,
      'startMs': startMs,
      'endMs': endMs,
      'meta': meta,
    }),
  );

  /// `media.saveToPhotos` → `'saved' | 'denied' | 'failed'` (add-only access).
  Future<String> saveToPhotos(
    String path, {
    DateTime? createdAt,
    double? lat,
    double? lon,
  }) async =>
      (await call<String>('media.saveToPhotos', {
        'path': path,
        'createdAt': ?createdAt?.millisecondsSinceEpoch,
        'lat': ?lat,
        'lon': ?lon,
      })) ??
      'failed';

  // ---- location / motion ----
  Future<void> locationStart({String accuracy = 'navigation'}) =>
      call('location.start', {'accuracy': accuracy});
  Future<void> locationStop() => call('location.stop');
  Future<LocationFix?> locationCurrent() async {
    final m = await call<Map<Object?, Object?>>('location.current');
    return m == null ? null : LocationFix.fromMap(m);
  }

  /// Background location while turn-by-turn navigation is active only.
  Future<Map<Object?, Object?>> locationSetBackground(bool on) =>
      _map('location.setBackground', {'on': on});

  // ---- live activity (Lock Screen / Dynamic Island) ----
  Future<Map<Object?, Object?>> liveActivityStatus() =>
      _map('liveActivity.status');
  Future<String?> liveActivityStart(Map<String, Object?> args) async =>
      (await _map('liveActivity.start', args))['id'] as String?;
  Future<void> liveActivityUpdate(Map<String, Object?> state) =>
      call('liveActivity.update', state);
  Future<void> liveActivityEnd({
    Map<String, Object?>? finalState,
    bool immediate = false,
  }) =>
      call('liveActivity.end', {'final': ?finalState, 'immediate': immediate});

  Future<void> motionStart({int hz = 50}) => call('motion.start', {'hz': hz});
  Future<void> motionStop() => call('motion.stop');

  // ---- nav ----
  Future<List<Map<Object?, Object?>>> navComplete(
    String query, {
    double? lat,
    double? lon,
  }) => _list('nav.complete', {'query': query, 'lat': ?lat, 'lon': ?lon});
  Future<List<Map<Object?, Object?>>> navResolve(String id) =>
      _list('nav.resolve', {'id': id});
  Future<List<Map<Object?, Object?>>> navSearch(
    String query, {
    double? lat,
    double? lon,
  }) => _list('nav.search', {'query': query, 'lat': ?lat, 'lon': ?lon});
  Future<List<Map<Object?, Object?>>> navRoute({
    required double fromLat,
    required double fromLon,
    required double toLat,
    required double toLon,
  }) => _list('nav.route', {
    'fromLat': fromLat,
    'fromLon': fromLon,
    'toLat': toLat,
    'toLon': toLon,
  });

  // ---- weather ----
  Future<Map<Object?, Object?>> weather(double lat, double lon) =>
      _map('weather.get', {'lat': lat, 'lon': lon});

  // ---- speech / audio / voice ----
  Future<List<Map<Object?, Object?>>> voices() => _list('speech.voices');
  Future<void> speak(
    String text, {
    required String language,
    String? voiceId,
    double volume = 1,
    double rate = .5,
    bool interrupt = false,
  }) => call('speech.speak', {
    'text': text,
    'language': language,
    'voiceId': ?voiceId,
    'volume': volume,
    'rate': rate,
    'interrupt': interrupt,
  });
  Future<void> stopSpeech() => call('speech.stop');
  Future<void> proximityTone(int level, double volume) =>
      call('audio.proximity', {'level': level, 'volume': volume});
  Future<void> alertTone(String kind, double volume) =>
      call('audio.alertTone', {'kind': kind, 'volume': volume});
  Future<void> stopAllAudio() => call('audio.stopAll');
  Future<void> voiceStart(
    List<String> phrases,
    String locale, {
    int timeoutS = 30,
  }) => call('voice.start', {
    'phrases': phrases,
    'locale': locale,
    'timeoutS': timeoutS,
  });
  Future<void> voiceStop() => call('voice.stop');

  // ---- contacts / emergency ----
  Future<Map<Object?, Object?>?> pickContact() =>
      call<Map<Object?, Object?>>('contacts.pick');
  Future<bool> emergencyCall(String number) async =>
      (await call<bool>('emergency.call', {'number': number})) ?? false;
  Future<String> composeMessage(List<String> recipients, String body) async =>
      (await call<String>('emergency.compose', {
        'recipients': recipients,
        'body': body,
      })) ??
      'failed';

  // ---- permissions / system ----
  Future<String> permissionStatus(String kind) async =>
      (await call<String>('permissions.status', {'kind': kind})) ?? 'denied';
  Future<String> permissionRequest(String kind) async =>
      (await call<String>('permissions.request', {'kind': kind})) ?? 'denied';
  Future<Map<Object?, Object?>> systemInfo() => _map('system.info');
  Future<void> keepAwake(bool on) => call('system.keepAwake', {'on': on});
  Future<void> openSettings() => call('system.openSettings');
  Future<void> openUrl(String url) => call('system.openURL', {'url': url});
}

/// Per-instance channel for a `corvista/map` platform view.
class MapViewController {
  MapViewController(int viewId) : _ch = MethodChannel('corvista/map_$viewId') {
    _ch.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'onUserGesture':
          _gestures.add(null);
        case 'onCameraMode':
          _modes.add((call.arguments as Map)['mode'] as String);
      }
      return null;
    });
  }

  final MethodChannel _ch;
  final _gestures = StreamController<void>.broadcast();
  final _modes = StreamController<String>.broadcast();

  Stream<void> get userGestures => _gestures.stream;
  Stream<String> get cameraModes => _modes.stream;

  Future<void> setCameraMode(String mode) =>
      _ch.invokeMethod('setCameraMode', {'mode': mode});
  Future<void> recenter() =>
      _ch.invokeMethod('recenter', const <String, Object?>{});
  Future<void> zoom(int delta) => _ch.invokeMethod('zoom', {'delta': delta});
  Future<void> setPitch(double deg) =>
      _ch.invokeMethod('setPitch', {'deg': deg});
  Future<void> setStyle({
    required String style,
    required bool dark,
    bool showsTraffic = false,
  }) => _ch.invokeMethod('setStyle', {
    'style': style,
    'dark': dark,
    'showsTraffic': showsTraffic,
  });
  Future<void> setRoute(
    Float64List polyline, {
    required double lat,
    required double lon,
    required String name,
  }) => _ch.invokeMethod('setRoute', {
    'polyline': polyline,
    'destination': {'lat': lat, 'lon': lon, 'name': name},
  });
  Future<void> clearRoute() =>
      _ch.invokeMethod('clearRoute', const <String, Object?>{});

  /// Dims the travelled part of the route: [segment] is the polyline segment
  /// index containing the user's projected position ([lat], [lon]).
  Future<void> setRouteProgress({
    required int segment,
    required double lat,
    required double lon,
  }) => _ch.invokeMethod('setRouteProgress', {
    'segment': segment,
    'lat': lat,
    'lon': lon,
  });

  /// One guidance frame (~15 Hz): route-snapped, dead-reckoned position and
  /// course for the navigation puck + follow camera, distance to the next
  /// maneuver, and the polyline segment for dimming the travelled route.
  Future<void> navFrame({
    required double lat,
    required double lon,
    required double course,
    required double speed,
    double? distanceToManeuverM,
    int? segment,
  }) => _ch.invokeMethod('navFrame', {
    'lat': lat,
    'lon': lon,
    'course': course,
    'speed': speed,
    'distanceToManeuverM': ?distanceToManeuverM,
    'segment': ?segment,
  });

  /// Screen area (points) covered by Flutter chrome; the navigation camera
  /// keeps the puck in the remaining free area.
  Future<void> setCameraInsets({
    required double top,
    required double left,
    required double bottom,
    required double right,
  }) => _ch.invokeMethod('setCameraInsets', {
    'top': top,
    'left': left,
    'bottom': bottom,
    'right': right,
  });

  /// Turn-by-turn context for the follow camera: zooms in while approaching
  /// a maneuver ([distanceToManeuverM] null = no maneuver ahead).
  Future<void> setNavContext({
    required bool navigating,
    double? distanceToManeuverM,
  }) => _ch.invokeMethod('setNavContext', {
    'navigating': navigating,
    'distanceToManeuverM': ?distanceToManeuverM,
  });
  Future<void> setObjects(List<Map<String, Object?>> objects) =>
      _ch.invokeMethod('setObjects', {'objects': objects});

  void dispose() {
    _ch.setMethodCallHandler(null);
    _gestures.close();
    _modes.close();
  }
}
