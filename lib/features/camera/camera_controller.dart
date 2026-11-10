import 'dart:async';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/errors/app_errors.dart';
import '../../domain/models/app_settings.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../settings/settings_controller.dart';

enum CameraStatus {
  idle,
  starting,
  running,
  interrupted,
  stopped,
  unavailable,
  permissionDenied,
  error,
}

class CameraState {
  const CameraState({
    this.status = CameraStatus.idle,
    this.textureId,
    this.previewSize = Size.zero,
    this.fps = 0,
    this.droppedFrames = 0,
    this.error,
    this.source = 'camera',
    this.deviceType = 'wide',
    this.devices = const [],
    this.hfovDeg = 0,
  });

  final CameraStatus status;
  final int? textureId;

  /// Upright buffer size in pixels.
  final Size previewSize;
  final double fps;
  final int droppedFrames;
  final String? error;

  /// 'camera' | 'file'
  final String source;
  final String deviceType;
  final List<Map> devices;

  /// Measured horizontal FOV of the upright frame in degrees (0 = unknown,
  /// e.g. test footage). Used for bearing/range estimation.
  final double hfovDeg;

  bool get isRunning => status == CameraStatus.running;

  CameraState copyWith({
    CameraStatus? status,
    int? Function()? textureId,
    Size? previewSize,
    double? fps,
    int? droppedFrames,
    String? Function()? error,
    String? source,
    String? deviceType,
    List<Map>? devices,
    double? hfovDeg,
  }) => CameraState(
    status: status ?? this.status,
    textureId: textureId != null ? textureId() : this.textureId,
    previewSize: previewSize ?? this.previewSize,
    fps: fps ?? this.fps,
    droppedFrames: droppedFrames ?? this.droppedFrames,
    error: error != null ? error() : this.error,
    source: source ?? this.source,
    deviceType: deviceType ?? this.deviceType,
    devices: devices ?? this.devices,
    hfovDeg: hfovDeg ?? this.hfovDeg,
  );
}

class CameraController extends Notifier<CameraState> {
  StreamSubscription<Map<Object?, Object?>>? _sub;

  @override
  CameraState build() {
    _sub = ref
        .read(nativeEngineProvider)
        .status
        .listen(_onStatus, onError: (_) {});
    ref.onDispose(() => _sub?.cancel());
    return const CameraState();
  }

  void _onStatus(Map<Object?, Object?> m) {
    if (m['type'] != 'camera') return;
    final st = switch (m['state']) {
      'running' => CameraStatus.running,
      'stopped' => CameraStatus.stopped,
      'interrupted' => CameraStatus.interrupted,
      'unavailable' => CameraStatus.unavailable,
      'error' => CameraStatus.error,
      _ => state.status,
    };
    final w = (m['w'] as num?)?.toDouble(), h = (m['h'] as num?)?.toDouble();
    state = state.copyWith(
      status: st,
      textureId: m['textureId'] is num
          ? () => (m['textureId'] as num).toInt()
          : null,
      previewSize: w != null && h != null && w > 0 && h > 0 ? Size(w, h) : null,
      fps: (m['fps'] as num?)?.toDouble(),
      droppedFrames: (m['droppedFrames'] as num?)?.toInt(),
      source: m['source'] as String?,
      hfovDeg: (m['hfov'] as num?)?.toDouble(),
      error: st == CameraStatus.error || st == CameraStatus.interrupted
          ? () => m['reason'] as String?
          : () => null,
    );
  }

  static String qualityFor(AppSettings s) =>
      s.recordingProfile == RecordingProfile.premium ? 'fhd1080' : 'hd720';

  /// Path of the active TEST FOOTAGE file, if test mode was started. Kept so
  /// that a lifecycle pause/resume returns to the same source instead of
  /// silently switching to the live camera.
  String? _testPath;

  String? get testFootagePath => _testPath;

  /// Starts the live camera. If test footage is currently running this is a
  /// no-op unless [force] is set (the user explicitly chose the camera).
  Future<void> start({bool force = false}) async {
    if (!force &&
        _testPath != null &&
        state.source == 'file' &&
        (state.status == CameraStatus.running ||
            state.status == CameraStatus.starting)) {
      return;
    }
    if (force) _testPath = null;
    final s = ref.read(settingsProvider);
    await _start(
      () => ref
          .read(nativeEngineProvider)
          .cameraStart(
            deviceType: s.cameraDevice,
            quality: qualityFor(s),
            stabilization: s.stabilization,
          ),
      source: 'camera',
    );
    unawaited(loadDevices());
  }

  Future<void> startTestFile(String path) {
    _testPath = path;
    return _start(
      () => ref.read(nativeEngineProvider).cameraStartFile(path),
      source: 'file',
    );
  }

  /// Restarts whichever source was active before a pause.
  Future<void> resume() {
    final path = _testPath;
    return path != null ? startTestFile(path) : start();
  }

  Future<void> _start(
    Future<Map<Object?, Object?>> Function() call, {
    required String source,
  }) async {
    state = state.copyWith(
      status: CameraStatus.starting,
      error: () => null,
      source: source,
    );
    try {
      final r = await call();
      if (!ref.mounted) return;
      final w = (r['width'] as num?)?.toDouble() ?? 0,
          h = (r['height'] as num?)?.toDouble() ?? 0;
      state = state.copyWith(
        status: CameraStatus.running,
        textureId: () => (r['textureId'] as num?)?.toInt(),
        previewSize: Size(w, h),
        deviceType: r['deviceType'] as String? ?? state.deviceType,
        hfovDeg: (r['hfov'] as num?)?.toDouble() ?? 0,
      );
    } catch (e) {
      if (!ref.mounted) return;
      final code = errorCode(e);
      state = state.copyWith(
        status: switch (code) {
          BridgeErrorCode.permissionDenied => CameraStatus.permissionDenied,
          BridgeErrorCode.unavailable => CameraStatus.unavailable,
          _ => CameraStatus.error,
        },
        error: () => errorMessage(e),
      );
    }
  }

  Future<void> loadDevices() async {
    try {
      final d = await ref.read(nativeEngineProvider).cameraDevices();
      if (ref.mounted) state = state.copyWith(devices: d);
    } catch (_) {}
  }

  Future<void> stop() async {
    try {
      await ref.read(nativeEngineProvider).cameraStop();
    } catch (_) {}
    if (ref.mounted) state = state.copyWith(status: CameraStatus.stopped);
  }

  Future<void> focus(Offset normalized) async {
    try {
      await ref
          .read(nativeEngineProvider)
          .cameraFocus(normalized.dx, normalized.dy);
    } catch (_) {}
  }
}

final cameraProvider = NotifierProvider<CameraController, CameraState>(
  CameraController.new,
);
