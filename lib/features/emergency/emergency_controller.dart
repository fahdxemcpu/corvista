import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/database/database.dart';
import '../../domain/services/clock.dart';
import '../../domain/services/emergency_message.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../../platform/native_bridge/native_engine.dart';
import '../dashcam/recorder_controller.dart';
import '../maps/location_controller.dart';
import '../settings/settings_controller.dart';
import '../voice_alerts/alert_phrases.dart';
import 'emergency_contacts.dart';
import 'impact_detector.dart';

export 'emergency_contacts.dart';
export 'impact_detector.dart';

enum EmergencyPhase { disabled, armed, countdown, cancelled, escalated }

class EmergencyEvent {
  const EmergencyEvent({
    required this.id,
    required this.at,
    required this.evidence,
    this.lat,
    this.lon,
    this.clipId,
    this.cancelled = false,
    this.cancelledBy,
    this.actions = const [],
  });

  final String id;
  final DateTime at;
  final ImpactEvidence evidence;
  final double? lat, lon;
  final String? clipId;
  final bool cancelled;

  /// 'button' | 'voice'
  final String? cancelledBy;
  final List<String> actions;

  EmergencyEvent copyWith({
    String? clipId,
    bool? cancelled,
    String? cancelledBy,
    List<String>? actions,
  }) => EmergencyEvent(
    id: id,
    at: at,
    evidence: evidence,
    lat: lat,
    lon: lon,
    clipId: clipId ?? this.clipId,
    cancelled: cancelled ?? this.cancelled,
    cancelledBy: cancelledBy ?? this.cancelledBy,
    actions: actions ?? this.actions,
  );
}

class EmergencyState {
  const EmergencyState({
    this.phase = EmergencyPhase.disabled,
    this.secondsLeft = 0,
    this.event,
    this.voiceListening = false,
    this.lastVoiceText,
    this.isTest = false,
  });

  final EmergencyPhase phase;
  final int secondsLeft;
  final EmergencyEvent? event;
  final bool voiceListening;
  final String? lastVoiceText;

  /// Simulated event (`simulateForTest`): UI must label it TEST; call and
  /// message actions are disabled.
  final bool isTest;

  bool get actionsEnabled =>
      !isTest &&
      (phase == EmergencyPhase.countdown || phase == EmergencyPhase.escalated);

  EmergencyState copyWith({
    EmergencyPhase? phase,
    int? secondsLeft,
    EmergencyEvent? Function()? event,
    bool? voiceListening,
    String? Function()? lastVoiceText,
    bool? isTest,
  }) => EmergencyState(
    phase: phase ?? this.phase,
    secondsLeft: secondsLeft ?? this.secondsLeft,
    event: event != null ? event() : this.event,
    voiceListening: voiceListening ?? this.voiceListening,
    lastVoiceText: lastVoiceText != null ? lastVoiceText() : this.lastVoiceText,
    isTest: isTest ?? this.isTest,
  );
}

/// Countdown tick (tests override with a short interval).
final emergencyTickProvider = Provider<Duration>(
  (ref) => const Duration(seconds: 1),
);

/// Crash-detection flow. Never places a call or sends a message by itself:
/// after the countdown it only *offers* "Call emergency services" and
/// "Message contacts" (iOS requires user confirmation for both anyway).
class EmergencyController extends Notifier<EmergencyState> {
  ImpactDetector detector = ImpactDetector();
  late NativeEngine _engine;
  StreamSubscription<({double hz, Float64List samples})>? _motionSub;
  StreamSubscription<Map<Object?, Object?>>? _voiceSub;
  Timer? _timer;

  bool get _armed => _motionSub != null;

  @override
  EmergencyState build() {
    _engine = ref.read(nativeEngineProvider);
    ref.listen(settingsProvider.select((s) => s.emergencyEnabled), (
      _,
      enabled,
    ) {
      unawaited(enabled ? arm() : disarm());
    });
    ref.listen(locationProvider.select((s) => s.fix), (_, fix) {
      if (fix != null && _armed && fix.hasSpeed) {
        _onEvidence(detector.addSpeed(fix.ts, fix.speed));
      }
    });
    ref.onDispose(() {
      _motionSub?.cancel();
      _voiceSub?.cancel();
      _timer?.cancel();
    });
    if (ref.read(settingsProvider).emergencyEnabled) Future.microtask(arm);
    return const EmergencyState();
  }

  Future<void> arm() async {
    if (!ref.read(settingsProvider).emergencyEnabled) {
      state = state.copyWith(
        phase: _busy ? state.phase : EmergencyPhase.disabled,
      );
      return;
    }
    if (!_armed) {
      detector.reset();
      _motionSub = _engine.motion.listen(
        (b) => _onEvidence(detector.addMotion(b.samples)),
        onError: (_) {},
      );
    }
    if (!_busy) state = state.copyWith(phase: EmergencyPhase.armed);
  }

  Future<void> disarm() async {
    await _motionSub?.cancel();
    _motionSub = null;
    if (state.phase == EmergencyPhase.countdown && !state.isTest) {
      _stopCountdown();
    }
    if (!(state.isTest && _busy)) {
      state = state.copyWith(
        phase: EmergencyPhase.disabled,
        event: () => null,
        isTest: false,
      );
    }
  }

  bool get _busy =>
      state.phase == EmergencyPhase.countdown ||
      state.phase == EmergencyPhase.escalated;

  /// Feeds a motion batch directly (tests / replay).
  void addMotion(Float64List samples) =>
      _onEvidence(detector.addMotion(samples));

  void _onEvidence(ImpactEvidence? e) {
    if (e == null || state.phase != EmergencyPhase.armed) return;
    unawaited(_trigger(e, isTest: false));
  }

  Future<void> _trigger(ImpactEvidence evidence, {required bool isTest}) async {
    final s = ref.read(settingsProvider);
    final fix = ref.read(locationProvider).fix;
    final event = EmergencyEvent(
      id: const Uuid().v4(),
      at: ref.read(clockProvider)(),
      evidence: evidence,
      lat: fix?.lat,
      lon: fix?.lon,
    );
    state = state.copyWith(
      phase: EmergencyPhase.countdown,
      secondsLeft: s.emergencyCountdownS,
      event: () => event,
      isTest: isTest,
      lastVoiceText: () => null,
    );
    _timer?.cancel();
    _timer = Timer.periodic(ref.read(emergencyTickProvider), (_) => _tick());

    unawaited(_safe(() => _engine.alertTone('emergency', 1.0)));
    if (s.emergencyVoiceCancel) {
      unawaited(_startVoice(s.localeTag, s.emergencyCountdownS));
    }
    if (isTest) return; // simulated: no clip, no DB record
    await _persist();
    if (s.emergencyAutoSaveClip) {
      try {
        final clip = await ref
            .read(recorderProvider.notifier)
            .saveIncident(reason: 'emergency');
        if (clip != null && ref.mounted && state.event?.id == event.id) {
          state = state.copyWith(
            event: () => state.event!.copyWith(clipId: clip.id),
          );
          await _persist();
        }
      } catch (_) {
        // Best effort.
      }
    }
  }

  Future<void> _startVoice(String? localeTag, int timeoutS) async {
    final lang = AlertPhrases.supportedLanguage(localeTag);
    final locale = AlertPhrases.defaultVoiceLanguage[lang] ?? 'en-US';
    await _voiceSub?.cancel();
    _voiceSub = _engine.voice.listen((m) {
      if (!_busy) return;
      switch (m['type']) {
        case 'listening':
          state = state.copyWith(voiceListening: true);
        case 'partial':
          state = state.copyWith(lastVoiceText: () => m['text'] as String?);
        case 'matched':
          state = state.copyWith(
            lastVoiceText: () => (m['phrase'] ?? m['text']) as String?,
          );
          cancel(by: 'voice');
        case 'ended' || 'error':
          state = state.copyWith(voiceListening: false);
      }
    }, onError: (_) {});
    try {
      await _engine.voiceStart(
        AlertPhrases.emergencyCancelPhrases(lang),
        locale,
        timeoutS: timeoutS,
      );
      if (ref.mounted && _busy) state = state.copyWith(voiceListening: true);
    } catch (_) {
      if (ref.mounted) state = state.copyWith(voiceListening: false);
    }
  }

  void _tick() {
    if (state.phase != EmergencyPhase.countdown) {
      _timer?.cancel();
      return;
    }
    final left = state.secondsLeft - 1;
    if (left > 0) {
      state = state.copyWith(secondsLeft: left);
      return;
    }
    _timer?.cancel();
    _stopVoiceAndTone();
    state = state.copyWith(
      phase: EmergencyPhase.escalated,
      secondsLeft: 0,
      voiceListening: false,
      event: () => state.event?.copyWith(
        actions: [...?state.event?.actions, 'escalated'],
      ),
    );
    unawaited(_persist());
  }

  void _stopVoiceAndTone() {
    _voiceSub?.cancel();
    _voiceSub = null;
    unawaited(_safe(_engine.voiceStop));
    unawaited(_safe(_engine.stopAllAudio));
  }

  void _stopCountdown() {
    _timer?.cancel();
    _stopVoiceAndTone();
  }

  /// "I'm okay" — cancels the countdown (or dismisses the escalation).
  void cancel({String by = 'button'}) {
    if (!_busy) return;
    _stopCountdown();
    state = state.copyWith(
      phase: EmergencyPhase.cancelled,
      voiceListening: false,
      event: () => state.event?.copyWith(cancelled: true, cancelledBy: by),
    );
    unawaited(_persist());
  }

  /// Returns to armed/disabled after a cancelled or escalated event.
  void dismiss() {
    if (state.phase == EmergencyPhase.countdown) return;
    _stopCountdown();
    state = EmergencyState(
      phase: _armed ? EmergencyPhase.armed : EmergencyPhase.disabled,
    );
  }

  /// Opens the dialer for the configured emergency number (user confirms in
  /// the iOS sheet). Disabled for test events.
  Future<void> callEmergency() async {
    if (!state.actionsEnabled) return;
    final number = ref.read(settingsProvider).emergencyNumber;
    final opened = await _safe(() => _engine.emergencyCall(number)) ?? false;
    _addAction(opened ? 'call' : 'call_failed');
  }

  /// Opens the message composer prefilled for the emergency contacts.
  /// Returns the composer result, `no_contacts`, or `disabled` (test mode).
  Future<String> messageContacts() async {
    if (!state.actionsEnabled) return 'disabled';
    final contacts = await ref.read(emergencyContactsProvider.future);
    if (contacts.isEmpty) return 'no_contacts';
    final s = ref.read(settingsProvider);
    final ev = state.event;
    final fix = ref.read(locationProvider).fix;
    final body = composeEmergencyMessage(
      userMessage: s.emergencyMessage,
      at: ref.read(clockProvider)(),
      lat: ev?.lat ?? fix?.lat,
      lon: ev?.lon ?? fix?.lon,
    );
    final result =
        await _safe(
          () =>
              _engine.composeMessage([for (final c in contacts) c.phone], body),
        ) ??
        'failed';
    _addAction('message:$result');
    return result;
  }

  /// Runs the synthetic severe-impact fixture through a fresh detector and
  /// enters a countdown flagged `isTest` (no clip, no DB row, no call/message).
  Future<void> simulateForTest() async {
    if (_busy) return;
    final start = ref.read(clockProvider)().millisecondsSinceEpoch.toDouble();
    final evidence = MotionScenario.severeImpact(startMs: start)
        .runThrough(ImpactDetector());
    if (evidence.isEmpty) return;
    await _trigger(evidence.first, isTest: true);
  }

  void _addAction(String a) {
    final ev = state.event;
    if (ev == null || !ref.mounted) return;
    state = state.copyWith(
      event: () => ev.copyWith(actions: [...ev.actions, a]),
    );
    unawaited(_persist());
  }

  Future<void> _persist() async {
    final ev = state.event;
    if (ev == null || state.isTest) return;
    try {
      await ref
          .read(databaseProvider)
          .upsertEmergencyEvent(
            EmergencyEventsCompanion.insert(
              id: ev.id,
              triggeredAt: ev.at,
              evidenceJson: jsonEncode(ev.evidence.toJson()),
              cancelled: Value(ev.cancelled),
              cancelledBy: Value(ev.cancelledBy),
              clipId: Value(ev.clipId),
              lat: Value(ev.lat),
              lon: Value(ev.lon),
              actionsJson: Value(jsonEncode(ev.actions)),
            ),
          );
    } catch (_) {}
  }

  static Future<T?> _safe<T>(Future<T> Function() f) async {
    try {
      return await f();
    } catch (_) {
      return null;
    }
  }
}

final emergencyProvider = NotifierProvider<EmergencyController, EmergencyState>(
  EmergencyController.new,
);
