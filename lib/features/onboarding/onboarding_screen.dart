import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../core/animations/motion.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/l10n.dart';
import 'widgets/onboarding_illustrations.dart';

/// Five-page introduction ending with the safety & privacy acknowledgement.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  static const pageCount = 5;

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final _pages = PageController();
  late final AnimationController _loop = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  );
  int _index = 0;
  bool _ack = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncMotion();
  }

  void _syncMotion() {
    final reduce = ref.read(settingsProvider).reduceMotion;
    if (Motion.enabled(context, appReduceMotion: reduce)) {
      if (!_loop.isAnimating) _loop.repeat();
    } else {
      _loop
        ..stop()
        ..value = .35;
    }
  }

  @override
  void dispose() {
    _pages.dispose();
    _loop.dispose();
    super.dispose();
  }

  void _go(int i) {
    final reduce = ref.read(settingsProvider).reduceMotion;
    if (Motion.enabled(context, appReduceMotion: reduce)) {
      _pages.animateToPage(i, duration: Motion.medium, curve: Motion.curve);
    } else {
      _pages.jumpToPage(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      settingsProvider.select((s) => s.reduceMotion),
      (_, _) => _syncMotion(),
    );
    final l10n = context.l10n;
    final last = _index == OnboardingScreen.pageCount - 1;
    final painters = <CustomPainter Function()>[
      () => RoadPainter(_loop),
      () => ScanPainter(_loop),
      () => LayersPainter(_loop),
      () => TimelinePainter(_loop),
      () => ShieldPainter(_loop),
    ];
    final titles = [
      l10n.onboardingTitle1,
      l10n.onboardingTitle2,
      l10n.onboardingTitle3,
      l10n.onboardingTitle4,
      l10n.onboardingTitle5,
    ];
    final bodies = [
      l10n.onboardingBody1,
      l10n.onboardingBody2,
      l10n.onboardingBody3,
      l10n.onboardingBody4,
      null,
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 52,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    l10n.appName,
                    style: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(letterSpacing: 1.2, color: AppColors.cyan),
                  ),
                  const Spacer(),
                  if (!last)
                    TextButton(
                      onPressed: () => _go(OnboardingScreen.pageCount - 1),
                      style: TextButton.styleFrom(
                        minimumSize: const Size(64, 48),
                      ),
                      child: Text(l10n.onboardingSkip),
                    ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pages,
                itemCount: OnboardingScreen.pageCount,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (context, i) => _Page(
                  painter: painters[i](),
                  title: titles[i],
                  body: bodies[i],
                  extra: i == OnboardingScreen.pageCount - 1
                      ? _SafetyContent(
                          ack: _ack,
                          onAck: (v) => setState(() => _ack = v),
                        )
                      : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 16),
              child: Row(
                children: [
                  Semantics(
                    label: l10n.onboardingPageLabel(
                      _index + 1,
                      OnboardingScreen.pageCount,
                    ),
                    excludeSemantics: true,
                    child: Row(
                      children: [
                        for (var i = 0; i < OnboardingScreen.pageCount; i++)
                          AnimatedContainer(
                            duration: Motion.fast,
                            margin: const EdgeInsetsDirectional.only(end: 6),
                            width: i == _index ? 22 : 7,
                            height: 7,
                            decoration: BoxDecoration(
                              color: i == _index
                                  ? AppColors.cyan
                                  : AppColors.border,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  FilledButton(
                    key: const ValueKey('onboarding-next'),
                    onPressed: last
                        ? (_ack ? () => context.go(Routes.permissions) : null)
                        : () => _go(_index + 1),
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(140, 56),
                    ),
                    child: Text(
                      last ? l10n.onboardingAgree : l10n.onboardingNext,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({
    required this.painter,
    required this.title,
    this.body,
    this.extra,
  });

  final CustomPainter painter;
  final String title;
  final String? body;
  final Widget? extra;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final art = ExcludeSemantics(
      child: AspectRatio(
        aspectRatio: 1.1,
        child: CustomPaint(painter: painter),
      ),
    );
    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          header: true,
          child: Text(title, style: theme.textTheme.headlineMedium),
        ),
        if (body != null) ...[
          const SizedBox(height: 12),
          Text(
            body!,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.4,
            ),
          ),
        ],
        if (extra != null) ...[const SizedBox(height: 16), extra!],
      ],
    );
    return LayoutBuilder(
      builder: (context, c) {
        if (c.maxWidth > c.maxHeight) {
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(child: Center(child: art)),
                const SizedBox(width: 24),
                Expanded(child: SingleChildScrollView(child: text)),
              ],
            ),
          );
        }
        final compact = extra != null;
        return SingleChildScrollView(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: c.maxHeight * (compact ? .17 : .55),
                ),
                child: Center(child: art),
              ),
              const SizedBox(height: 16),
              text,
            ],
          ),
        );
      },
    );
  }
}

class _SafetyContent extends StatelessWidget {
  const _SafetyContent({required this.ack, required this.onAck});

  final bool ack;
  final ValueChanged<bool> onAck;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final bullets = [
      (Icons.visibility_rounded, l10n.onboardingSafety1),
      (Icons.do_not_touch_rounded, l10n.onboardingSafety2),
      (Icons.report_gmailerrorred_rounded, l10n.onboardingSafety3),
      (Icons.phone_iphone_rounded, l10n.onboardingSafety4),
      (Icons.wifi_rounded, l10n.onboardingSafety5),
      (Icons.push_pin_rounded, l10n.onboardingSafety6),
      (Icons.checklist_rounded, l10n.onboardingSafety7),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (icon, text) in bullets)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 20, color: AppColors.green),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    text,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: TextButton(
            onPressed: () => context.push(Routes.safety),
            child: Text(l10n.onboardingReadSafety),
          ),
        ),
        const SizedBox(height: 4),
        Material(
          color: theme.colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(14),
          child: CheckboxListTile(
            key: const ValueKey('onboarding-ack'),
            value: ack,
            onChanged: (v) => onAck(v ?? false),
            controlAffinity: ListTileControlAffinity.leading,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            title: Text(
              l10n.onboardingAcknowledge,
              style: const TextStyle(fontSize: 14.5),
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
