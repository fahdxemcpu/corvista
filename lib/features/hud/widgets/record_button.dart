import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../core/widgets/common.dart';
import '../../../core/widgets/format.dart';
import '../../../l10n/l10n.dart';
import 'hud_palette.dart';

/// Manual (continuous) recording toggle, placed next to Save Incident.
/// Idle: red dot + "Record". Recording: red stop square + "REC mm:ss".
/// No confirmation either way; haptic on toggle; auto-stops are announced.
class RecordButton extends ConsumerWidget {
  const RecordButton({super.key, required this.palette, this.size = 64});

  final HudPalette palette;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    // Announce how a recording ended (the parts are already in Clips).
    ref.listen(recorderProvider.select((s) => s.lastStopReason), (prev, next) {
      if (next == null || next == prev) return;
      final parts = ref.read(recorderProvider).manualParts;
      showSnack(
        context,
        next == 'user'
            ? l10n.driveRecordSaved(parts)
            : l10n.driveRecordStopped(next),
      );
    });

    final rec = ref.watch(recorderProvider);
    final active = rec.manualActive;
    final busy = rec.manualBusy;
    final p = palette;
    final time = Fmt.clock(Duration(milliseconds: rec.manualElapsedMs));
    final fg = p.highContrast ? p.danger : Colors.white;

    Future<void> toggle() async {
      unawaited(HapticFeedback.mediumImpact());
      final notifier = ref.read(recorderProvider.notifier);
      if (active) {
        await notifier.stopManual();
      } else if (!await notifier.startManual() && context.mounted) {
        showSnack(context, l10n.driveRecordFailed);
      }
    }

    return Semantics(
      button: true,
      toggled: active,
      label: active
          ? l10n.driveRecordStopA11y(time)
          : l10n.driveRecordStartA11y,
      hint: active ? null : l10n.driveRecordHint,
      excludeSemantics: true,
      child: SizedBox.square(
        dimension: size,
        child: Material(
          color: p.highContrast
              ? Colors.black
              : Colors.black.withValues(alpha: active ? .72 : .55),
          shape: CircleBorder(
            side: BorderSide(
              color: active ? p.danger : Colors.white38,
              width: active ? 3 : 2,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: busy ? null : () => unawaited(toggle()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: size * (active ? .26 : .3),
                  height: size * (active ? .26 : .3),
                  decoration: BoxDecoration(
                    color: busy ? p.warn : p.danger,
                    borderRadius: BorderRadius.circular(
                      active ? size * .05 : size * .15,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  active ? time : l10n.driveRecord,
                  maxLines: 1,
                  style: TextStyle(
                    color: fg,
                    fontWeight: FontWeight.w800,
                    fontSize: size * .16,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
