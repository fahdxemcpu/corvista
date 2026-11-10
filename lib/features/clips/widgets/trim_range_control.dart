import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:corvista/core/theme/app_colors.dart';

/// Scrubber with frame thumbnails and draggable start/end handles.
///
/// Values are milliseconds. The timeline follows the text direction (in RTL
/// the start is on the right, like the player's slider). Each handle is an
/// accessible slider (increase/decrease by [stepMs]).
class TrimRangeControl extends StatefulWidget {
  const TrimRangeControl({
    super.key,
    required this.durationMs,
    required this.startMs,
    required this.endMs,
    required this.onChanged,
    required this.startLabel,
    required this.endLabel,
    this.onChangeEnd,
    this.onSeek,
    this.positionMs,
    this.thumbnails = const [],
    this.minRangeMs = 1000,
    this.stepMs = 500,
    this.height = 64,
  });

  final int durationMs;
  final int startMs;
  final int endMs;

  /// Called continuously while a handle moves, with clamped values.
  final void Function(int startMs, int endMs) onChanged;

  /// Called when a drag ends (e.g. to seek the preview).
  final void Function(int startMs, int endMs)? onChangeEnd;

  /// Tap on the strip: seek the preview to that time.
  final ValueChanged<int>? onSeek;

  /// Playhead (null hides it).
  final int? positionMs;

  /// Evenly spaced frame thumbnails (file paths; null = still loading).
  final List<String?> thumbnails;
  final int minRangeMs;
  final int stepMs;
  final double height;
  final String startLabel;
  final String endLabel;

  /// Clamps a requested range to `[0, duration]` with at least [minRange]
  /// between the handles; [movingStart] tells which handle yields.
  static (int, int) clampRange(
    int start,
    int end,
    int duration,
    int minRange, {
    required bool movingStart,
  }) {
    final gap = math.min(minRange, duration);
    if (movingStart) {
      final s = math.min(math.max(start, 0), math.max(0, end - gap));
      return (s, end);
    }
    final e = math.max(
      math.min(end, duration),
      math.min(duration, start + gap),
    );
    return (start, e);
  }

  static String formatMs(int ms) {
    final d = Duration(milliseconds: ms);
    final m = d.inMinutes;
    final s = d.inSeconds.remainder(60);
    final tenth = (d.inMilliseconds.remainder(1000) / 100).floor();
    return '$m:${s.toString().padLeft(2, '0')}.$tenth';
  }

  @override
  State<TrimRangeControl> createState() => _TrimRangeControlState();
}

class _TrimRangeControlState extends State<TrimRangeControl> {
  static const handleWidth = 18.0;
  static const hitWidth = 44.0;

  /// Running value of the handle being dragged (sub-pixel accurate).
  double? _dragMs;

  int get _dur => math.max(1, widget.durationMs);

  void _set(int value, {required bool start, bool end = false}) {
    final (s, e) = TrimRangeControl.clampRange(
      start ? value : widget.startMs,
      start ? widget.endMs : value,
      widget.durationMs,
      widget.minRangeMs,
      movingStart: start,
    );
    if (s != widget.startMs || e != widget.endMs) widget.onChanged(s, e);
    if (end) widget.onChangeEnd?.call(s, e);
  }

  Widget _handle({
    required bool start,
    required double trackWidth,
    required bool rtl,
  }) {
    final value = start ? widget.startMs : widget.endMs;
    final label = start ? widget.startLabel : widget.endLabel;
    final step = widget.stepMs;
    return Semantics(
      slider: true,
      label: label,
      value: TrimRangeControl.formatMs(value),
      increasedValue: TrimRangeControl.formatMs(
        math.min(widget.durationMs, value + step),
      ),
      decreasedValue: TrimRangeControl.formatMs(math.max(0, value - step)),
      onIncrease: () => _set(value + step, start: start, end: true),
      onDecrease: () => _set(value - step, start: start, end: true),
      child: GestureDetector(
        key: ValueKey(start ? 'trim-start-handle' : 'trim-end-handle'),
        behavior: HitTestBehavior.opaque,
        onHorizontalDragStart: (_) => _dragMs = value.toDouble(),
        onHorizontalDragUpdate: (d) {
          final dir = rtl ? -1.0 : 1.0;
          _dragMs =
              (_dragMs ?? value.toDouble()) +
              d.delta.dx * dir / trackWidth * _dur;
          _set(_dragMs!.round(), start: start);
        },
        onHorizontalDragEnd: (_) {
          _dragMs = null;
          _set(start ? widget.startMs : widget.endMs, start: start, end: true);
        },
        child: SizedBox(
          width: hitWidth,
          height: widget.height + 8,
          child: Center(
            child: Container(
              width: handleWidth,
              height: widget.height + 8,
              decoration: BoxDecoration(
                color: AppColors.amber,
                borderRadius: BorderRadiusDirectional.horizontal(
                  start: Radius.circular(start ? 8 : 2),
                  end: Radius.circular(start ? 2 : 8),
                ),
                boxShadow: const [
                  BoxShadow(color: Color(0x66000000), blurRadius: 6),
                ],
              ),
              child: Center(
                child: Container(
                  width: 3,
                  height: 22,
                  decoration: BoxDecoration(
                    color: AppColors.background.withValues(alpha: .7),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rtl = Directionality.of(context) == TextDirection.rtl;
    return LayoutBuilder(
      builder: (context, constraints) {
        // Handles sit just outside the selected range, so the track is inset
        // by one handle width on each side.
        final full = constraints.maxWidth;
        final track = math.max(1.0, full - handleWidth * 2);
        double x(int ms) => handleWidth + ms / _dur * track;
        final sx = x(widget.startMs), ex = x(widget.endMs);
        final h = widget.height;
        return SizedBox(
          height: h + 8,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Frame strip.
              PositionedDirectional(
                start: handleWidth,
                end: handleWidth,
                top: 4,
                height: h,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapDown: widget.onSeek == null
                      ? null
                      : (d) {
                          final local = rtl
                              ? track - d.localPosition.dx
                              : d.localPosition.dx;
                          widget.onSeek!(
                            (local / track * _dur).round().clamp(
                              widget.startMs,
                              widget.endMs,
                            ),
                          );
                        },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: _FrameStrip(paths: widget.thumbnails),
                  ),
                ),
              ),
              // Dimmed outside the selection.
              PositionedDirectional(
                start: handleWidth,
                top: 4,
                height: h,
                width: math.max(0, sx - handleWidth),
                child: const IgnorePointer(
                  child: ColoredBox(color: Color(0xB3080C12)),
                ),
              ),
              PositionedDirectional(
                start: ex,
                top: 4,
                height: h,
                width: math.max(0, full - handleWidth - ex),
                child: const IgnorePointer(
                  child: ColoredBox(color: Color(0xB3080C12)),
                ),
              ),
              // Selection frame.
              PositionedDirectional(
                start: sx,
                top: 2,
                height: h + 4,
                width: math.max(0, ex - sx),
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: AppColors.amber,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.positionMs != null)
                PositionedDirectional(
                  start: x(widget.positionMs!.clamp(0, widget.durationMs)) - 1,
                  top: 0,
                  height: h + 8,
                  width: 2,
                  child: const IgnorePointer(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Color(0x99000000), blurRadius: 3),
                        ],
                      ),
                    ),
                  ),
                ),
              PositionedDirectional(
                start: sx - handleWidth - (hitWidth - handleWidth) / 2,
                top: 0,
                child: _handle(start: true, trackWidth: track, rtl: rtl),
              ),
              PositionedDirectional(
                start: ex - (hitWidth - handleWidth) / 2,
                top: 0,
                child: _handle(start: false, trackWidth: track, rtl: rtl),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FrameStrip extends StatelessWidget {
  const _FrameStrip({required this.paths});

  final List<String?> paths;

  @override
  Widget build(BuildContext context) {
    const placeholder = ColoredBox(color: AppColors.elevated);
    if (paths.isEmpty) return placeholder;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final p in paths)
          Expanded(
            child: p == null
                ? placeholder
                : Image.file(
                    File(p),
                    fit: BoxFit.cover,
                    cacheWidth: 160,
                    gaplessPlayback: true,
                    errorBuilder: (_, _, _) => placeholder,
                  ),
          ),
      ],
    );
  }
}
