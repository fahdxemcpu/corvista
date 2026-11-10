import 'dart:async';
import 'dart:ui' show Locale, PlatformDispatcher;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/widgets/format.dart';
import '../../domain/models/app_settings.dart';
import '../../l10n/app_localizations.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../../platform/native_bridge/native_engine.dart';
import '../camera/camera_controller.dart';
import '../dashcam/drive_session_controller.dart';
import '../dashcam/recorder_controller.dart';
import '../settings/settings_controller.dart';
import 'navigation_controller.dart';

/// Mirrors turn-by-turn guidance + dashcam state into an iOS Live Activity
/// (Lock Screen / Dynamic Island) through `liveActivity.*`.
///
/// Read-only consumer of navigation / recorder / camera state. Starts when
/// guidance starts (and Settings › Live Activity is on), updates only when the
/// rendered content changes (native additionally throttles to ≤ 1/s), ends on
/// arrival or cancel. Activated from the app widget.
class LiveActivityBridge {
  LiveActivityBridge(this._ref);

  final Ref _ref;
  bool _active = false;
  bool _starting = false;

  /// No (re)start for this navigation session: arrived, unavailable or
  /// disabled in iOS Settings.
  bool _done = false;
  Map<String, Object?>? _last;
  final List<ProviderSubscription<Object?>> _subs = [];

  void sync() {
    final nav = _ref.read(navigationProvider);
    final s = _ref.read(settingsProvider);
    if (nav.phase != NavPhase.navigating) {
      _done = false;
      if (_active) _end(_finalEnded(s));
      return;
    }
    if (!s.liveActivity) {
      if (_active) _end(null, immediate: true);
      return;
    }
    if (_done) return;
    final content = liveActivityContent(
      nav: nav,
      settings: s,
      l10n: _l10n(s),
      locale: _lang(s),
      dashcam: _dashcam(),
    );
    if (!_active) {
      if (!_starting) unawaited(_start(nav, s, content));
      return;
    }
    if (content['phase'] == 'arrived') {
      _done = true;
      _end(content);
      return;
    }
    if (mapEquals(content, _last)) return;
    _last = content;
    unawaited(_call(() => _engine.liveActivityUpdate(content)));
  }

  NativeEngine get _engine => _ref.read(nativeEngineProvider);

  Future<void> _start(
    NavState nav,
    AppSettings s,
    Map<String, Object?> content,
  ) async {
    _starting = true;
    try {
      final id = await _engine.liveActivityStart({
        'destination': nav.destination?.name ?? '',
        'etaLabel': _l10n(s).liveActivityEta,
        ...content,
      });
      _active = true;
      _last = content;
      _listenDashcam();
      debugPrint('[liveActivity] started $id');
    } catch (e) {
      // Disabled in iOS Settings / unsupported: don't retry every fix.
      _done = true;
      debugPrint('[liveActivity] start failed: $e');
    } finally {
      _starting = false;
    }
    sync();
  }

  void _end(Map<String, Object?>? finalState, {bool immediate = false}) {
    _active = false;
    _last = null;
    for (final sub in _subs) {
      sub.close();
    }
    _subs.clear();
    unawaited(
      _call(
        () => _engine.liveActivityEnd(
          finalState: finalState,
          immediate: immediate,
        ),
      ),
    );
    debugPrint('[liveActivity] end ${finalState?['phase'] ?? 'immediate'}');
  }

  Map<String, Object?> _finalEnded(AppSettings s) {
    final l10n = _l10n(s);
    return {
      ...?_last,
      'distance': '',
      'instruction': l10n.liveActivityEnded,
      'phase': 'ended',
      'dashcam': 'off',
      'dashcamLabel': l10n.liveActivityDashcamOff,
    };
  }

  /// Dashcam state only matters while an activity is shown: subscribe then.
  void _listenDashcam() {
    void on(Object? _, Object? _) => sync();
    _subs
      ..add(_ref.listen(cameraProvider.select((c) => c.status), on))
      ..add(_ref.listen(recorderProvider.select((r) => r.status), on))
      ..add(
        _ref.listen(
          driveSessionProvider.select((d) => (d.active, d.backgroundPaused)),
          on,
        ),
      );
  }

  String _dashcam() {
    final d = _ref.read(driveSessionProvider);
    if (!d.active) return 'off';
    if (d.backgroundPaused) return 'paused';
    final cam = _ref.read(cameraProvider).status;
    final rec = _ref.read(recorderProvider).status;
    if (cam == CameraStatus.running &&
        (rec == RecorderStatus.buffering || rec == RecorderStatus.saving)) {
      return 'recording';
    }
    if (cam == CameraStatus.interrupted || cam == CameraStatus.stopped) {
      return 'paused';
    }
    return 'off';
  }

  static String _lang(AppSettings s) {
    final tag =
        s.localeTag ?? PlatformDispatcher.instance.locale.toLanguageTag();
    final lang = tag.split(RegExp('[-_]')).first;
    return AppLocalizations.supportedLocales.any((l) => l.languageCode == lang)
        ? lang
        : 'en';
  }

  static AppLocalizations _l10n(AppSettings s) =>
      lookupAppLocalizations(Locale(_lang(s)));

  Future<void> _call(Future<void> Function() f) async {
    try {
      await f();
    } catch (e) {
      debugPrint('[liveActivity] $e');
    }
  }
}

/// Content state sent to `liveActivity.start/update` (pure, unit-tested).
/// ETA is rounded to the minute and progress to 1 % so the activity only
/// updates when what it shows changes.
Map<String, Object?> liveActivityContent({
  required NavState nav,
  required AppSettings settings,
  required AppLocalizations l10n,
  required String locale,
  required String dashcam,
  DateTime? now,
}) {
  final g = nav.guidance;
  final route = nav.route;
  final arrived = g?.arrived ?? false;
  final rerouting = nav.rerouting || (g?.offRoute ?? false);
  final step =
      g?.nextStep ??
      (route?.steps.isNotEmpty ?? false ? route!.steps[0] : null);
  final remainingM = g?.remainingM ?? route?.distanceM ?? 0;
  final eta =
      g?.eta ??
      (now ?? DateTime.now()).add(
        Duration(seconds: (route?.expectedTravelTimeS ?? 0).round()),
      );
  final etaMin = (eta.millisecondsSinceEpoch / 60000).round() * 60000;
  final total = (g?.totalM ?? 0) > 0 ? g!.totalM : (route?.distanceM ?? 0);
  final progress = arrived
      ? 1.0
      : total > 0
      ? ((g?.progressM ?? 0) / total).clamp(0.0, 1.0)
      : 0.0;
  final unit = settings.speedUnit;
  return {
    'maneuver': arrived
        ? ManeuverType.arrive.name
        : (g?.maneuver?.type ?? ManeuverType.straight).name,
    'distance': arrived
        ? ''
        : Fmt.routeDistanceIn(
            locale,
            g?.distanceToNextM ?? step?.distanceM ?? 0,
            unit,
          ),
    'instruction': arrived
        ? l10n.navArrived
        : rerouting
        ? l10n.navRerouting
        : (step?.instructions ?? ''),
    'etaMs': etaMin.toDouble(),
    'remaining': arrived ? '' : Fmt.routeDistanceIn(locale, remainingM, unit),
    'progress': (progress * 100).round() / 100,
    'dashcam': dashcam,
    'dashcamLabel': switch (dashcam) {
      'recording' => l10n.liveActivityRec,
      'paused' => l10n.liveActivityPaused,
      _ => l10n.liveActivityDashcamOff,
    },
    'phase': arrived
        ? 'arrived'
        : rerouting
        ? 'rerouting'
        : 'navigating',
  };
}

final liveActivityBridgeProvider = Provider<void>((ref) {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) return;
  final b = LiveActivityBridge(ref);
  ref.listen(navigationProvider, (_, _) => b.sync());
  ref.listen(
    settingsProvider.select((s) => (s.liveActivity, s.speedUnit, s.localeTag)),
    (_, _) => b.sync(),
  );
});
