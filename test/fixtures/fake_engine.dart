import 'dart:async';
import 'dart:typed_data';

import 'package:corvista/domain/models/detection.dart';
import 'package:corvista/domain/models/incident.dart';
import 'package:corvista/domain/models/location_fix.dart';
import 'package:corvista/platform/native_bridge/native_engine.dart';
import 'package:flutter/services.dart';

/// In-memory [NativeEngine] for state tests: records every call, exposes
/// stream controllers, and lets tests script results/failures.
class FakeNativeEngine extends NativeEngine {
  FakeNativeEngine();

  final calls = <(String, Map<String, Object?>)>[];

  /// method name → error to throw.
  final failures = <String, PlatformException>{};

  final detectionsCtl = StreamController<DetectionFrame>.broadcast();
  final segmentationCtl = StreamController<SegmentationFrame>.broadcast();
  final statusCtl = StreamController<Map<Object?, Object?>>.broadcast();
  final locationCtl = StreamController<LocationFix>.broadcast();
  final locationAuthCtl = StreamController<String>.broadcast();
  final motionCtl =
      StreamController<({double hz, Float64List samples})>.broadcast();
  final voiceCtl = StreamController<Map<Object?, Object?>>.broadcast();

  List<Map<Object?, Object?>> voiceList = [
    {
      'id': 'en1',
      'name': 'Samantha',
      'language': 'en-US',
      'quality': 'enhanced',
    },
    {'id': 'fr1', 'name': 'Thomas', 'language': 'fr-FR', 'quality': 'default'},
  ];
  List<IncidentResult> recovered = [];
  List<Map<Object?, Object?>> routes = [];
  Map<Object?, Object?>? contact;
  int _clip = 0;

  List<String> get methods => [for (final c in calls) c.$1];
  Iterable<Map<String, Object?>> argsOf(String m) =>
      calls.where((c) => c.$1 == m).map((c) => c.$2);
  int count(String m) => calls.where((c) => c.$1 == m).length;

  Future<T> _rec<T>(
    String m,
    Map<String, Object?> args,
    T Function() result,
  ) async {
    calls.add((m, args));
    final f = failures[m];
    if (f != null) throw f;
    return result();
  }

  // ---- streams ----
  @override
  Stream<DetectionFrame> get detections => detectionsCtl.stream;
  @override
  Stream<SegmentationFrame> get segmentation => segmentationCtl.stream;
  @override
  Stream<Map<Object?, Object?>> get status => statusCtl.stream;
  @override
  Stream<LocationFix> get location => locationCtl.stream;
  @override
  Stream<String> get locationAuth => locationAuthCtl.stream;
  @override
  Stream<({double hz, Float64List samples})> get motion => motionCtl.stream;
  @override
  Stream<Map<Object?, Object?>> get voice => voiceCtl.stream;

  // ---- camera / ai ----
  @override
  Future<Map<Object?, Object?>> cameraStart({
    String deviceType = 'wide',
    String quality = 'hd720',
    String stabilization = 'auto',
    int fps = 30,
  }) => _rec(
    'camera.start',
    {'deviceType': deviceType, 'quality': quality},
    () => {
      'textureId': 1,
      'width': 720,
      'height': 1280,
      'deviceType': deviceType,
      'stabilization': stabilization,
    },
  );
  @override
  Future<void> cameraStop() => _rec('camera.stop', {}, () {});
  @override
  Future<List<Map<Object?, Object?>>> cameraDevices() =>
      _rec('camera.devices', {}, () => []);
  @override
  Future<List<Map<Object?, Object?>>> aiModels() => _rec(
    'ai.models',
    {},
    () => [
      {'id': 'efficient', 'name': 'Efficient', 'installed': true},
      {'id': 'enhanced', 'name': 'Enhanced', 'installed': true},
      {
        'id': 'segmentation',
        'name': 'Segmentation',
        'supportsSegmentation': true,
      },
    ],
  );
  @override
  Future<Map<Object?, Object?>> aiSetModel(String id) =>
      _rec('ai.setModel', {'id': id}, () => {'id': id, 'loadMs': 42});
  @override
  Future<void> aiConfigure({
    double? confidence,
    double? iou,
    double? maxHz,
    double? segmentationHz,
    bool? paused,
    String? computeUnits,
  }) => _rec('ai.configure', {
    'maxHz': maxHz,
    'segmentationHz': segmentationHz,
    'paused': paused,
  }, () {});

  // ---- recorder / media ----
  @override
  Future<Map<Object?, Object?>> recorderConfigure({
    required String profile,
    required int bufferSeconds,
    required bool audio,
    required bool watermark,
    required bool timestamp,
    String timestampFormat = 'local',
    String? watermarkText,
  }) => _rec(
    'recorder.configure',
    {
      'profile': profile,
      'bufferSeconds': bufferSeconds,
      'audio': audio,
      'watermark': watermark,
    },
    () => {
      'profile': profile,
      'width': profile == 'premium' ? 1920 : 1280,
      'height': profile == 'premium' ? 1080 : 720,
      'bufferSeconds': bufferSeconds,
      'audio': audio,
      'watermark': watermark,
      'timestamp': timestamp,
    },
  );

  IncidentResult makeResult({String reason = 'manual', DateTime? at}) {
    _clip++;
    return IncidentResult(
      id: 'clip$_clip',
      path: '/clips/clip$_clip.mp4',
      thumbnailPath: '/clips/clip$_clip.jpg',
      durationMs: 20000,
      width: 1280,
      height: 720,
      sizeBytes: 1000 + _clip,
      hasAudio: false,
      createdAt: at ?? DateTime(2026, 1, 1).add(Duration(minutes: _clip)),
      reason: reason,
    );
  }

  @override
  Future<IncidentResult> saveIncident({
    String reason = 'manual',
    double? lat,
    double? lon,
    double? speed,
    String? title,
  }) => _rec('recorder.saveIncident', {
    'reason': reason,
    'lat': lat,
    'speed': speed,
  }, () => makeResult(reason: reason));
  @override
  Future<List<IncidentResult>> recoverIncidents() =>
      _rec('recorder.recover', {}, () => recovered);
  @override
  Future<void> deleteMedia(String path) =>
      _rec('media.delete', {'path': path}, () {});
  @override
  Future<void> clearBuffer() => _rec('recorder.clearBuffer', {}, () {});

  // ---- manual (continuous) recording ----
  bool manualActive = false;

  /// Parts returned by the next `recorder.stopManual`.
  List<IncidentResult> manualStopParts = [];

  Map<Object?, Object?> manualMap({int files = 0, int elapsedMs = 0}) => {
    'active': manualActive,
    'startedAt': DateTime(2026, 1, 1).millisecondsSinceEpoch,
    'elapsedMs': elapsedMs,
    'files': files,
  };

  static Map<Object?, Object?> resultMap(IncidentResult r) => {
    'id': r.id,
    'path': r.path,
    'thumbnailPath': r.thumbnailPath,
    'durationMs': r.durationMs,
    'width': r.width,
    'height': r.height,
    'sizeBytes': r.sizeBytes,
    'hasAudio': r.hasAudio,
    'createdAt': r.createdAt.millisecondsSinceEpoch,
    'reason': r.reason,
    'kind': r.kind,
    'part': ?r.part,
  };

  /// A finished manual part (reason `recording`, kind `manual`).
  IncidentResult makePart(int part) {
    final r = makeResult(reason: 'recording');
    return IncidentResult(
      id: r.id,
      path: r.path,
      thumbnailPath: r.thumbnailPath,
      durationMs: 300000,
      width: r.width,
      height: r.height,
      sizeBytes: r.sizeBytes,
      hasAudio: r.hasAudio,
      createdAt: r.createdAt,
      reason: 'recording',
      kindOverride: 'manual',
      part: part,
    );
  }

  /// Native `{type:'recorder', event:'manual_part'}` event.
  void emitManualPart(IncidentResult part) => statusCtl.add({
    'type': 'recorder',
    'event': 'manual_part',
    'part': resultMap(part),
  });

  /// Native auto-stop note (`storage`, `max_duration`, `background`, ...).
  void emitManualStopped(String reason, {int files = 0}) {
    manualActive = false;
    statusCtl.add({
      'type': 'recorder',
      'state': 'buffering',
      'note': 'manual_stopped_$reason',
      'manual': manualMap(files: files),
    });
  }

  @override
  Future<Map<Object?, Object?>> startManualRecording({
    double preRollSeconds = 5,
    int maxMinutes = 0,
    double splitMinutes = 5,
    double? lat,
    double? lon,
    double? speed,
  }) => _rec(
    'recorder.startManual',
    {
      'preRollSeconds': preRollSeconds,
      'maxMinutes': maxMinutes,
      'splitMinutes': splitMinutes,
      'lat': lat,
    },
    () {
      manualActive = true;
      return manualMap();
    },
  );

  @override
  Future<Map<Object?, Object?>> stopManualRecording({
    double? lat,
    double? lon,
    double? speed,
  }) => _rec('recorder.stopManual', {}, () {
    manualActive = false;
    final parts = manualStopParts;
    manualStopParts = [];
    return {
      'parts': [for (final p in parts) resultMap(p)],
      'manual': manualMap(files: parts.length),
      'reason': 'user',
    };
  });

  /// Scripted `media.cleanup` result.
  Map<Object?, Object?> cleanupResult = const {
    'bytesFreed': 0,
    'filesDeleted': 0,
    'recovered': <Object?>[],
  };
  @override
  Future<Object?> mediaCleanup() =>
      _rec<Object?>('media.cleanup', {}, () => cleanupResult);
  @override
  Future<Map<Object?, Object?>> storage() => _rec(
    'media.storage',
    {},
    () => {
      'freeBytes': 100,
      'totalBytes': 200,
      'clipsBytes': 10,
      'bufferBytes': 5,
    },
  );

  // ---- media: library (thumbnail frames, trim, Photos) ----
  @override
  Future<String?> thumbnail(String path, {int atMs = 1000}) => _rec(
    'media.thumbnail',
    {'path': path, 'atMs': atMs},
    () => '/thumbs/${path.hashCode}_$atMs.jpg',
  );

  /// `media.trim`: a new clip of `endMs - startMs` carrying [meta].
  @override
  Future<IncidentResult> mediaTrim(
    String path, {
    required int startMs,
    required int endMs,
    Map<String, Object?> meta = const {},
  }) => _rec(
    'media.trim',
    {'path': path, 'startMs': startMs, 'endMs': endMs, 'meta': meta},
    () {
      _clip++;
      return IncidentResult(
        id: 'trim$_clip',
        path: '/clips/trim$_clip.mp4',
        thumbnailPath: '/clips/trim$_clip.jpg',
        durationMs: endMs - startMs,
        width: 1280,
        height: 720,
        sizeBytes: 500 + _clip,
        hasAudio: false,
        createdAt: meta['createdAt'] is int
            ? DateTime.fromMillisecondsSinceEpoch(meta['createdAt'] as int)
            : DateTime(2026, 1, 2),
        reason: meta['reason'] as String? ?? 'manual',
        kindOverride: meta['kind'] as String?,
      );
    },
  );

  /// Scripted `media.saveToPhotos` results by path (default `saved`).
  final photosResults = <String, String>{};
  @override
  Future<String> saveToPhotos(
    String path, {
    DateTime? createdAt,
    double? lat,
    double? lon,
  }) => _rec('media.saveToPhotos', {
    'path': path,
  }, () => photosResults[path] ?? 'saved');

  // ---- location / motion ----
  @override
  Future<void> locationStart({String accuracy = 'navigation'}) =>
      _rec('location.start', {}, () {});
  @override
  Future<void> locationStop() => _rec('location.stop', {}, () {});
  @override
  Future<LocationFix?> locationCurrent() =>
      _rec('location.current', {}, () => null);
  @override
  Future<void> motionStart({int hz = 50}) => _rec('motion.start', {}, () {});
  @override
  Future<void> motionStop() => _rec('motion.stop', {}, () {});

  // ---- nav / weather ----
  @override
  Future<List<Map<Object?, Object?>>> navComplete(
    String query, {
    double? lat,
    double? lon,
  }) => _rec(
    'nav.complete',
    {'query': query},
    () =>
        completions ??
        [
          {'id': 's1', 'title': 'Cafe $query', 'subtitle': 'Somewhere'},
        ],
  );

  /// Scripted `nav.complete` result (null = one "Cafe `query`" suggestion).
  List<Map<Object?, Object?>>? completions;

  /// Scripted `nav.search` result.
  List<Map<Object?, Object?>> places = [
    {'name': 'Cafe Place', 'address': '2 Road', 'lat': 45.02, 'lon': 7.01},
  ];
  @override
  Future<List<Map<Object?, Object?>>> navSearch(
    String query, {
    double? lat,
    double? lon,
  }) => _rec('nav.search', {'query': query}, () => places);
  @override
  Future<List<Map<Object?, Object?>>> navResolve(String id) => _rec(
    'nav.resolve',
    {'id': id},
    () => [
      {'name': 'Cafe', 'address': '1 Road', 'lat': 45.01, 'lon': 7.0},
    ],
  );
  @override
  Future<List<Map<Object?, Object?>>> navRoute({
    required double fromLat,
    required double fromLon,
    required double toLat,
    required double toLon,
  }) =>
      _rec('nav.route', {'fromLat': fromLat, 'fromLon': fromLon}, () => routes);
  @override
  Future<Map<Object?, Object?>> weather(double lat, double lon) => _rec(
    'weather.get',
    {'lat': lat},
    () => {
      'current': {
        'condition': 'clear',
        'symbol': 'sun.max',
        'temperatureC': 21.5,
        'asOf': 1700000000000,
      },
      'hourly': [],
      'attribution': {'serviceName': 'Weather'},
    },
  );

  // ---- speech / audio / voice ----
  @override
  Future<List<Map<Object?, Object?>>> voices() =>
      _rec('speech.voices', {}, () => voiceList);
  @override
  Future<void> speak(
    String text, {
    required String language,
    String? voiceId,
    double volume = 1,
    double rate = .5,
    bool interrupt = false,
  }) => _rec('speech.speak', {
    'text': text,
    'language': language,
    'voiceId': voiceId,
  }, () {});
  @override
  Future<void> stopSpeech() => _rec('speech.stop', {}, () {});
  @override
  Future<void> proximityTone(int level, double volume) =>
      _rec('audio.proximity', {'level': level, 'volume': volume}, () {});
  @override
  Future<void> alertTone(String kind, double volume) =>
      _rec('audio.alertTone', {'kind': kind}, () {});
  @override
  Future<void> stopAllAudio() => _rec('audio.stopAll', {}, () {});
  @override
  Future<void> voiceStart(
    List<String> phrases,
    String locale, {
    int timeoutS = 30,
  }) => _rec('voice.start', {'phrases': phrases, 'locale': locale}, () {});
  @override
  Future<void> voiceStop() => _rec('voice.stop', {}, () {});

  // ---- contacts / emergency ----
  @override
  Future<Map<Object?, Object?>?> pickContact() =>
      _rec('contacts.pick', {}, () => contact);
  @override
  Future<bool> emergencyCall(String number) =>
      _rec('emergency.call', {'number': number}, () => true);
  @override
  Future<String> composeMessage(List<String> recipients, String body) => _rec(
    'emergency.compose',
    {'recipients': recipients, 'body': body},
    () => 'sent',
  );

  // ---- permissions / system ----
  @override
  Future<String> permissionStatus(String kind) =>
      _rec('permissions.status', {'kind': kind}, () => 'granted');
  @override
  Future<String> permissionRequest(String kind) =>
      _rec('permissions.request', {'kind': kind}, () => 'granted');
  @override
  Future<Map<Object?, Object?>> systemInfo() => _rec(
    'system.info',
    {},
    () => {
      'thermal': 'nominal',
      'battery': 0.8,
      'charging': false,
      'lowPower': false,
      'memoryMB': 300,
    },
  );
  @override
  Future<void> keepAwake(bool on) =>
      _rec('system.keepAwake', {'on': on}, () {});
  @override
  Future<void> openSettings() => _rec('system.openSettings', {}, () {});
  @override
  Future<void> openUrl(String url) =>
      _rec('system.openURL', {'url': url}, () {});
}
