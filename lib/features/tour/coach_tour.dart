import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../../core/animations/motion.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/l10n.dart';

/// One coach mark. [target] is the widget to spotlight; when it is null, not
/// mounted or off-screen the step is shown as a centred card with no hole.
class TourStep {
  const TourStep({
    required this.id,
    required this.icon,
    required this.title,
    this.target,
    this.body,
    this.bullets = const [],
  });

  final String id;
  final GlobalKey? target;
  final IconData icon;
  final String title;
  final String? body;

  /// (icon, label?, text) lines; label is shown bold before the text.
  final List<(IconData, String?, String)> bullets;
}

/// Full-screen spotlight overlay that walks through [steps].
/// Big type, ≥ 56 pt buttons, progress dots, RTL-aware, reduce-motion aware,
/// and the underlying screen is hidden from VoiceOver while it is shown.
class CoachTour extends StatefulWidget {
  const CoachTour({
    super.key,
    required this.steps,
    required this.onFinish,
    this.reduceMotion = false,
  });

  final List<TourStep> steps;

  /// Called with `true` when the last step is confirmed, `false` on skip.
  final ValueChanged<bool> onFinish;
  final bool reduceMotion;

  @override
  State<CoachTour> createState() => _CoachTourState();
}

class _CoachTourState extends State<CoachTour> {
  int _index = 0;
  Rect? _hole;
  Timer? _poll;

  TourStep get _step => widget.steps[_index];

  @override
  void initState() {
    super.initState();
    _scheduleMeasure();
    // Targets can move without rebuilding the overlay (HUD resizes, banners).
    _poll = Timer.periodic(
      const Duration(milliseconds: 400),
      (_) => _scheduleMeasure(),
    );
  }

  @override
  void dispose() {
    _poll?.cancel();
    super.dispose();
  }

  void _scheduleMeasure() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final r = _measure(_step.target);
      final changed =
          (r == null) != (_hole == null) ||
          (r != null && _hole != null && !_close(r, _hole!));
      if (changed) setState(() => _hole = r);
    });
  }

  static bool _close(Rect a, Rect b) =>
      (a.left - b.left).abs() < .5 &&
      (a.top - b.top).abs() < .5 &&
      (a.width - b.width).abs() < .5 &&
      (a.height - b.height).abs() < .5;

  /// Target bounds in this overlay's coordinates, or null when unusable.
  Rect? _measure(GlobalKey? key) {
    final me = context.findRenderObject();
    final obj = key?.currentContext?.findRenderObject();
    if (me is! RenderBox || obj is! RenderBox) return null;
    if (!obj.attached || !obj.hasSize || !me.hasSize) return null;
    final topLeft = obj.localToGlobal(Offset.zero, ancestor: me);
    final bottomRight = obj.localToGlobal(
      obj.size.bottomRight(Offset.zero),
      ancestor: me,
    );
    final r = Rect.fromPoints(topLeft, bottomRight);
    final screen = Offset.zero & me.size;
    if (r.isEmpty || !screen.overlaps(r)) return null;
    return r.intersect(screen);
  }

  void _go(int i) {
    setState(() {
      _index = i;
      _hole = _measure(widget.steps[i].target);
    });
    _scheduleMeasure();
    final l10n = context.l10n;
    SemanticsService.sendAnnouncement(
      View.of(context),
      '${l10n.tourProgress(i + 1, widget.steps.length)}. ${widget.steps[i].title}',
      Directionality.of(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Re-measure after every rebuild (rotation, layout changes, HUD resize).
    _scheduleMeasure();
    final l10n = context.l10n;
    final mq = MediaQuery.of(context);
    final animate = Motion.enabled(
      context,
      appReduceMotion: widget.reduceMotion,
    );
    final duration = animate ? Motion.medium : Duration.zero;
    final last = _index == widget.steps.length - 1;
    final hole = _hole?.inflate(8);

    return BlockSemantics(
      child: Semantics(
        scopesRoute: true,
        namesRoute: true,
        explicitChildNodes: true,
        label: l10n.tourLabel,
        child: LayoutBuilder(
          builder: (context, c) {
            final size = Size(c.maxWidth, c.maxHeight);
            final safeTop = mq.padding.top + 12;
            final safeBottom = mq.padding.bottom + 12;

            // Card goes on the side of the hole with more room: above/below,
            // or beside it in landscape when vertical room is tight.
            final padL = mq.padding.left + 12, padR = mq.padding.right + 12;
            double top = safeTop,
                bottom = safeBottom,
                left = padL,
                right = padR;
            var alignment = Alignment.center;
            if (hole != null) {
              final above = hole.top - safeTop;
              final below = size.height - hole.bottom - safeBottom;
              final before = hole.left - padL;
              final after = size.width - hole.right - padR;
              final wide = size.width > size.height;
              if (wide &&
                  math.max(above, below) < 300 &&
                  math.max(before, after) >= 320) {
                if (after >= before) {
                  left = hole.right + 16;
                  alignment = Alignment.centerLeft;
                } else {
                  right = size.width - hole.left + 16;
                  alignment = Alignment.centerRight;
                }
              } else if (below >= above) {
                top = hole.bottom + 12;
                alignment = Alignment.topCenter;
              } else {
                bottom = size.height - hole.top + 12;
                alignment = Alignment.bottomCenter;
              }
            }

            return Stack(
              fit: StackFit.expand,
              children: [
                // Scrim + spotlight. Absorbs taps so nothing underneath is
                // triggered by accident.
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {},
                  child: hole == null
                      ? CustomPaint(size: size, painter: _SpotlightPainter())
                      : TweenAnimationBuilder<Rect?>(
                          tween: RectTween(begin: hole, end: hole),
                          duration: duration,
                          curve: Motion.curve,
                          builder: (context, r, _) => CustomPaint(
                            size: size,
                            painter: _SpotlightPainter(hole: r),
                          ),
                        ),
                ),
                Positioned(
                  left: left,
                  right: right,
                  top: top,
                  bottom: bottom,
                  child: LayoutBuilder(
                    builder: (context, region) {
                      // Short regions (landscape): buttons beside the text,
                      // bullets in two columns, wider card.
                      final compact =
                          region.maxHeight < 400 && region.maxWidth >= 560;
                      return Align(
                        alignment: alignment,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: compact ? 760 : 560,
                          ),
                          child: AnimatedSwitcher(
                            duration: duration,
                            child: _Card(
                              key: ValueKey(_step.id),
                              step: _step,
                              index: _index,
                              total: widget.steps.length,
                              last: last,
                              compact: compact,
                              onNext: last
                                  ? () => widget.onFinish(true)
                                  : () => _go(_index + 1),
                              onBack: _index == 0
                                  ? null
                                  : () => _go(_index - 1),
                              onSkip: () => widget.onFinish(false),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SpotlightPainter extends CustomPainter {
  _SpotlightPainter({this.hole});

  final Rect? hole;

  @override
  void paint(Canvas canvas, Size size) {
    final scrim = Paint()..color = Colors.black.withValues(alpha: .74);
    final full = Path()..addRect(Offset.zero & size);
    final h = hole;
    if (h == null) {
      canvas.drawPath(full, scrim);
      return;
    }
    final radius = Radius.circular((h.shortestSide / 2).clamp(12.0, 28.0));
    final rr = RRect.fromRectAndRadius(h, radius);
    canvas.drawPath(
      Path.combine(PathOperation.difference, full, Path()..addRRect(rr)),
      scrim,
    );
    canvas.drawRRect(
      rr,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..color = AppColors.cyan,
    );
    canvas.drawRRect(
      rr.inflate(4),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..color = AppColors.cyan.withValues(alpha: .25)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );
  }

  @override
  bool shouldRepaint(_SpotlightPainter old) => old.hole != hole;
}

class _Card extends StatelessWidget {
  const _Card({
    super.key,
    required this.step,
    required this.index,
    required this.total,
    required this.last,
    required this.compact,
    required this.onNext,
    required this.onBack,
    required this.onSkip,
  });

  final TourStep step;
  final int index, total;
  final bool last, compact;
  final VoidCallback onNext;
  final VoidCallback? onBack;
  final VoidCallback onSkip;

  static const _text = AppColors.textPrimary;

  Widget _header(AppLocalizations l10n) => Row(
    children: [
      Semantics(
        label: l10n.tourProgress(index + 1, total),
        excludeSemantics: true,
        child: Row(
          children: [
            for (var i = 0; i < total; i++)
              Container(
                margin: const EdgeInsetsDirectional.only(end: 5),
                width: i == index ? 18 : 7,
                height: 7,
                decoration: BoxDecoration(
                  color: i <= index ? AppColors.cyan : AppColors.border,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
          ],
        ),
      ),
      const Spacer(),
      if (!last)
        TextButton(
          key: const ValueKey('tour-skip'),
          onPressed: onSkip,
          style: TextButton.styleFrom(
            minimumSize: const Size(64, 44),
            foregroundColor: AppColors.textSecondary,
          ),
          child: Text(l10n.tourSkip, style: const TextStyle(fontSize: 16)),
        ),
    ],
  );

  Widget _bullet((IconData, String?, String) b) {
    final (icon, label, text) = b;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, color: AppColors.cyan, size: compact ? 20 : 22),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                if (label != null)
                  TextSpan(
                    text: '$label  ',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                TextSpan(text: text),
              ],
            ),
            style: TextStyle(
              color: _text,
              fontSize: compact ? 16 : 17,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _content() => LayoutBuilder(
    builder: (context, c) {
      final twoCols = compact && c.maxWidth >= 440 && step.bullets.length > 2;
      final colW = twoCols ? (c.maxWidth - 16) / 2 : c.maxWidth;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            liveRegion: true,
            header: true,
            child: Row(
              children: [
                Icon(step.icon, color: AppColors.cyan, size: compact ? 26 : 30),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    step.title,
                    style: TextStyle(
                      color: _text,
                      fontSize: compact ? 21 : 24,
                      fontWeight: FontWeight.w700,
                      height: 1.15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (step.body != null) ...[
            SizedBox(height: compact ? 8 : 10),
            Text(
              step.body!,
              style: TextStyle(
                color: _text,
                fontSize: compact ? 16 : 18,
                height: 1.35,
              ),
            ),
          ],
          if (step.bullets.isNotEmpty) ...[
            SizedBox(height: compact ? 6 : 2),
            Wrap(
              spacing: 16,
              runSpacing: compact ? 8 : 10,
              children: [
                for (final b in step.bullets)
                  SizedBox(width: colW, child: _bullet(b)),
              ],
            ),
          ],
        ],
      );
    },
  );

  Widget _next(AppLocalizations l10n, {double minWidth = 0}) => FilledButton(
    key: const ValueKey('tour-next'),
    onPressed: onNext,
    style: FilledButton.styleFrom(minimumSize: Size(minWidth, 56)),
    child: Text(
      last ? l10n.tourFinish : l10n.tourNext,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );

  Widget _back(AppLocalizations l10n, {double minWidth = 88}) => OutlinedButton(
    key: const ValueKey('tour-back'),
    onPressed: onBack,
    style: OutlinedButton.styleFrom(
      foregroundColor: _text,
      minimumSize: Size(minWidth, 56),
      padding: const EdgeInsets.symmetric(horizontal: 16),
    ),
    child: Text(l10n.tourBack),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final Widget body;
    if (compact) {
      body = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(l10n),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: SingleChildScrollView(child: _content())),
                const SizedBox(width: 16),
                SizedBox(
                  width: 168,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _next(l10n),
                      if (onBack != null) ...[
                        const SizedBox(height: 10),
                        _back(l10n, minWidth: 0),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      body = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(l10n),
          const SizedBox(height: 8),
          Flexible(child: SingleChildScrollView(child: _content())),
          const SizedBox(height: 16),
          Row(
            children: [
              if (onBack != null) ...[_back(l10n), const SizedBox(width: 12)],
              Expanded(child: _next(l10n)),
            ],
          ),
        ],
      );
    }
    return MediaQuery.withClampedTextScaling(
      maxScaleFactor: 1.5,
      child: Material(
        color: AppColors.surface,
        elevation: 12,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: AppColors.border),
        ),
        child: Padding(
          padding: compact
              ? const EdgeInsetsDirectional.fromSTEB(18, 10, 14, 14)
              : const EdgeInsetsDirectional.fromSTEB(20, 18, 20, 14),
          child: body,
        ),
      ),
    );
  }
}
