import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/providers.dart';
import '../../../app/router.dart';
import '../../../core/widgets/common.dart';
import '../../../core/widgets/format.dart';
import '../../../l10n/l10n.dart';
import 'hud_palette.dart';

/// Large, always-reachable Save Incident control (≥ 64 pt) with progress and
/// an accurate result message.
class SaveIncidentButton extends ConsumerStatefulWidget {
  const SaveIncidentButton({super.key, required this.palette, this.size = 76});

  final HudPalette palette;
  final double size;

  @override
  ConsumerState<SaveIncidentButton> createState() => _SaveIncidentButtonState();
}

class _SaveIncidentButtonState extends ConsumerState<SaveIncidentButton> {
  bool _busy = false;

  Future<void> _save() async {
    if (_busy) return;
    setState(() => _busy = true);
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    // Test footage (camera.startFile) is recorded like the camera, so Save makes a
    // real clip; reason 'test' marks it (native also tags it TEST in its metadata).
    final isTestFootage = ref.read(cameraProvider).source == 'file';
    try {
      final r = await ref
          .read(recorderProvider.notifier)
          .saveIncident(reason: isTestFootage ? 'test' : 'manual');
      if (!mounted) return;
      if (r != null) {
        final res = (r.width > r.height ? r.height : r.width) >= 1080
            ? '1080p'
            : '720p';
        messenger
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                l10n.driveSaved(
                  Fmt.clock(Duration(milliseconds: r.durationMs)),
                  res,
                ),
              ),
              persist: false,
              duration: const Duration(seconds: 5),
              action: SnackBarAction(
                label: l10n.driveSavedView,
                onPressed: () => router.push(Routes.clip(r.id)),
              ),
            ),
          );
      } else {
        final code = ref.read(recorderProvider).error;
        showSnack(context, switch (code) {
          BridgeErrorCode.notRunning => l10n.driveSaveNotRunning,
          BridgeErrorCode.storageFull => l10n.driveSaveStorageFull,
          BridgeErrorCode.ioError => l10n.driveSaveIoError,
          _ => l10n.driveSaveFailed,
        });
      }
    } catch (_) {
      if (mounted) showSnack(context, l10n.driveSaveFailed);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final rec = ref.watch(recorderProvider);
    final l10n = context.l10n;
    final saving = _busy || rec.status == RecorderStatus.saving;
    final target = rec.targetBufferMs <= 0 ? 1 : rec.targetBufferMs;
    final fill = (rec.bufferedMs / target).clamp(0.0, 1.0);
    final p = widget.palette;
    final danger = p.danger;
    final size = widget.size;

    return Semantics(
      button: true,
      label: saving ? l10n.driveSaving : l10n.driveSaveIncident,
      hint: l10n.driveSaveHint((target / 1000).round()),
      excludeSemantics: true,
      child: SizedBox.square(
        dimension: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Buffer fill ring (how much footage is available to save).
            SizedBox.square(
              dimension: size,
              child: CircularProgressIndicator(
                value: saving ? null : fill,
                strokeWidth: 3.5,
                color: saving ? p.warn : danger,
                backgroundColor: Colors.white.withValues(alpha: .14),
              ),
            ),
            Material(
              color: p.highContrast
                  ? Colors.black
                  : danger.withValues(alpha: .92),
              shape: CircleBorder(
                side: BorderSide(
                  color: p.highContrast ? danger : Colors.white24,
                  width: 2,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: saving ? null : () => unawaited(_save()),
                child: SizedBox.square(
                  dimension: size - 12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        saving
                            ? Icons.hourglass_top_rounded
                            : Icons.save_alt_rounded,
                        color: p.highContrast ? danger : Colors.white,
                        size: size * .32,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        l10n.driveSave,
                        maxLines: 1,
                        style: TextStyle(
                          color: p.highContrast ? danger : Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: size * .15,
                          letterSpacing: .4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
