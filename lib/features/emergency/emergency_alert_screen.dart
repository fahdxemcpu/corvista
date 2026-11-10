import 'dart:math' as math;

import 'package:corvista/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/animations/motion.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/common.dart';
import '../../l10n/l10n.dart';

/// Full-screen possible-impact alert: countdown, giant cancel, then
/// user-confirmed call / message actions after escalation.
class EmergencyAlertScreen extends ConsumerStatefulWidget {
  const EmergencyAlertScreen({super.key});

  @override
  ConsumerState<EmergencyAlertScreen> createState() =>
      _EmergencyAlertScreenState();
}

class _EmergencyAlertScreenState extends ConsumerState<EmergencyAlertScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  );
  int? _total;
  bool _closing = false;
  bool _calling = false;
  bool _messaging = false;

  @override
  void initState() {
    super.initState();
    HapticFeedback.heavyImpact();
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  void _close() {
    if (_closing || !mounted) return;
    _closing = true;
    final c = ref.read(emergencyProvider.notifier);
    if (ref.read(emergencyProvider).phase == EmergencyPhase.cancelled) {
      c.dismiss();
    }
    // This runs from the phase listener, before the rebuild that flips
    // PopScope.canPop to true, so maybePop() would be refused. Pop explicitly
    // after the frame instead (Navigator.pop is not blocked by PopScope).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final nav = Navigator.of(context);
      if (nav.canPop()) nav.pop();
    });
  }

  void _cancel() {
    HapticFeedback.mediumImpact();
    ref.read(emergencyProvider.notifier).cancel();
  }

  Future<void> _call(String number) async {
    final l10n = context.l10n;
    setState(() => _calling = true);
    try {
      await ref.read(emergencyProvider.notifier).callEmergency();
    } catch (_) {
      if (mounted) showSnack(context, l10n.emergencyCallFailed(number));
    } finally {
      if (mounted) setState(() => _calling = false);
    }
  }

  Future<void> _message() async {
    final l10n = context.l10n;
    setState(() => _messaging = true);
    try {
      final r = await ref.read(emergencyProvider.notifier).messageContacts();
      if (!mounted) return;
      showSnack(context, switch (r) {
        'sent' => l10n.emergencyMsgSent,
        'cancelled' => l10n.emergencyMsgCancelled,
        'unavailable' => l10n.emergencyMsgUnavailable,
        'no_contacts' => l10n.emergencyMsgNoContacts,
        _ => l10n.emergencyMsgFailed,
      });
    } catch (_) {
      if (mounted) showSnack(context, l10n.emergencyMsgFailed);
    } finally {
      if (mounted) setState(() => _messaging = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final st = ref.watch(emergencyProvider);
    final settings = ref.watch(settingsProvider);
    final animate = Motion.enabled(
      context,
      appReduceMotion: settings.reduceMotion,
    );
    final test = st.isTest;
    final countdown = st.phase == EmergencyPhase.countdown;
    final escalated = st.phase == EmergencyPhase.escalated;

    ref.listen(emergencyProvider.select((s) => s.phase), (_, p) {
      if (p != EmergencyPhase.countdown && p != EmergencyPhase.escalated) {
        _close();
      }
    });
    if (!countdown && !escalated) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _close());
    }

    if (countdown) {
      _total = math.max(
        _total ?? 0,
        math.max(settings.emergencyCountdownS, st.secondsLeft),
      );
      if (animate && !_pulse.isAnimating) _pulse.repeat();
      if (!animate && _pulse.isAnimating) _pulse.stop();
    } else if (_pulse.isAnimating) {
      _pulse.stop();
    }
    final total = (_total ?? settings.emergencyCountdownS).clamp(1, 600);
    final fraction = countdown ? st.secondsLeft / total : 0.0;

    return PopScope(
      canPop: !countdown,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop &&
            !_closing &&
            ref.read(emergencyProvider).phase == EmergencyPhase.escalated) {
          _closing = true;
          ref.read(emergencyProvider.notifier)
            ..cancel()
            ..dismiss();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF12060A),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, c) {
              final landscape = c.maxWidth > c.maxHeight;
              final ringSize = math.min(
                landscape ? c.maxHeight * .62 : c.maxWidth * .72,
                320.0,
              );

              final header = Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (test)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 12),
                      child: Container(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.amber.withValues(alpha: .18),
                          border: Border.all(color: AppColors.amber),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          l10n.emergencyAlertTestBadge,
                          style: const TextStyle(
                            color: AppColors.amber,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  Semantics(
                    header: true,
                    liveRegion: true,
                    child: Text(
                      l10n.emergencyAlertHeadline,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.emergencyAlertSubtitle,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: const Color(0xFFFFB3B6),
                    ),
                  ),
                ],
              );

              final ring = countdown
                  ? Semantics(
                      label: l10n.emergencyAlertSecondsLeft(st.secondsLeft),
                      child: SizedBox.square(
                        dimension: ringSize,
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(end: fraction),
                          duration: animate
                              ? const Duration(milliseconds: 950)
                              : Duration.zero,
                          builder: (context, f, _) => AnimatedBuilder(
                            animation: _pulse,
                            builder: (context, _) => CustomPaint(
                              painter: _CountdownRingPainter(
                                fraction: f,
                                pulse: animate ? _pulse.value : 0,
                              ),
                              child: Center(
                                child: ExcludeSemantics(
                                  child: Text(
                                    '${st.secondsLeft}',
                                    style: TextStyle(
                                      fontSize: ringSize * .34,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      height: 1,
                                      fontFeatures: tabular,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink();

              final voice = st.voiceListening || st.lastVoiceText != null
                  ? Padding(
                      padding: const EdgeInsetsDirectional.only(top: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (st.voiceListening)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _MicPulse(animate: animate),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    l10n.emergencyAlertListening,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          if (st.lastVoiceText != null &&
                              st.lastVoiceText!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 4),
                              child: Text(
                                l10n.emergencyAlertHeard(st.lastVoiceText!),
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink();

              final actions = Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (countdown)
                    SizedBox(
                      height: 104,
                      child: FilledButton(
                        onPressed: _cancel,
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF12060A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        child: Text(
                          l10n.emergencyAlertCancel,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  if (escalated) ...[
                    Text(
                      l10n.emergencyAlertEscalated,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    const SizedBox(height: 14),
                    if (test)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 10),
                        child: InfoBanner(
                          glass: true,
                          tone: BannerTone.warning,
                          icon: Icons.science_outlined,
                          message: l10n.emergencyAlertTestMode,
                        ),
                      ),
                    _BigAction(
                      icon: Icons.call_rounded,
                      color: AppColors.red,
                      title: l10n.emergencyAlertCall,
                      subtitle: test
                          ? l10n.emergencyAlertTestMode
                          : l10n.emergencyAlertCallNumber(
                              settings.emergencyNumber,
                            ),
                      busy: _calling,
                      onPressed:
                          !st.actionsEnabled || settings.emergencyNumber.isEmpty
                          ? null
                          : () => _call(settings.emergencyNumber),
                    ),
                    const SizedBox(height: 10),
                    _BigAction(
                      icon: Icons.sms_rounded,
                      color: AppColors.blue,
                      title: l10n.emergencyAlertMessage,
                      subtitle: test
                          ? l10n.emergencyAlertTestMode
                          : l10n.emergencyAlertMessageSubtitle,
                      busy: _messaging,
                      onPressed: st.actionsEnabled ? _message : null,
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      height: 64,
                      child: OutlinedButton(
                        onPressed: () {
                          _cancel();
                          _close();
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white54),
                          textStyle: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        child: Text(l10n.emergencyAlertClose),
                      ),
                    ),
                  ],
                ],
              );

              if (landscape) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(child: Center(child: ring)),
                      const SizedBox(width: 24),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              header,
                              voice,
                              const SizedBox(height: 20),
                              actions,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return SingleChildScrollView(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: c.maxHeight - 44),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      header,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Center(child: ring),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [voice, const SizedBox(height: 16)],
                      ),
                      actions,
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _BigAction extends StatelessWidget {
  const _BigAction({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    this.busy = false,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !busy;
    return Semantics(
      button: true,
      enabled: enabled,
      label: '$title. $subtitle',
      child: Material(
        color: enabled ? color : Colors.white10,
        borderRadius: BorderRadius.circular(22),
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: enabled ? onPressed : null,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 80),
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
              child: Row(
                children: [
                  busy
                      ? const SizedBox.square(
                          dimension: 28,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Colors.white,
                          ),
                        )
                      : Icon(
                          icon,
                          size: 30,
                          color: enabled ? Colors.white : Colors.white38,
                        ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ExcludeSemantics(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              color: enabled ? Colors.white : Colors.white54,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            subtitle,
                            style: TextStyle(
                              color: enabled ? Colors.white70 : Colors.white38,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MicPulse extends StatefulWidget {
  const _MicPulse({required this.animate});
  final bool animate;

  @override
  State<_MicPulse> createState() => _MicPulseState();
}

class _MicPulseState extends State<_MicPulse>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  );

  @override
  void initState() {
    super.initState();
    if (widget.animate) _c.repeat(reverse: true);
  }

  @override
  void didUpdateWidget(_MicPulse old) {
    super.didUpdateWidget(old);
    if (widget.animate && !_c.isAnimating) _c.repeat(reverse: true);
    if (!widget.animate) _c.stop();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _c,
    builder: (_, _) => Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.green.withValues(alpha: .15 + .2 * _c.value),
      ),
      child: const Icon(Icons.mic_rounded, size: 18, color: AppColors.green),
    ),
  );
}

class _CountdownRingPainter extends CustomPainter {
  _CountdownRingPainter({required this.fraction, required this.pulse});

  final double fraction;
  final double pulse;

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final r = size.shortestSide / 2 - 14;
    if (pulse > 0) {
      canvas.drawCircle(
        c,
        r + 6 + 10 * pulse,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = AppColors.red.withValues(alpha: .45 * (1 - pulse)),
      );
    }
    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..color = Colors.white.withValues(alpha: .08);
    canvas.drawCircle(c, r, track);
    final arc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
        startAngle: -math.pi / 2,
        endAngle: math.pi * 1.5,
        colors: const [AppColors.amber, AppColors.red],
        transform: const GradientRotation(-math.pi / 2),
      ).createShader(Rect.fromCircle(center: c, radius: r));
    canvas.drawArc(
      Rect.fromCircle(center: c, radius: r),
      -math.pi / 2,
      math.pi * 2 * fraction.clamp(0.0, 1.0),
      false,
      arc,
    );
  }

  @override
  bool shouldRepaint(_CountdownRingPainter old) =>
      old.fraction != fraction || old.pulse != pulse;
}
