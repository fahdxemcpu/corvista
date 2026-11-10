import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/providers.dart';
import '../../../app/router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/models/tracked_object.dart';
import '../../../l10n/l10n.dart';
import 'cover_transform.dart';
import 'detection_overlay_painter.dart';
import 'smoothed_tracks.dart';

/// Visual options for how boxes are drawn (derived from the HUD style).
class OverlayLook {
  const OverlayLook({this.tint, this.highContrast = false});
  final Color? tint;
  final bool highContrast;
}

/// Live camera texture (BoxFit.cover) + optional mask layer + tracked boxes,
/// tap-to-focus, and camera status overlays. Shared by Detection, Parking and
/// Perception views.
class CameraLayer extends ConsumerStatefulWidget {
  const CameraLayer({
    super.key,
    this.showBoxes = true,
    this.underlay,
    this.highlightId,
    this.look = const OverlayLook(),
    this.compactStatus = false,
    this.showLabels = true,
    this.fit = FrameFit.cover,
  });

  /// How the frame is fitted (parking keeps the full width and the bottom).
  final FrameFit fit;

  final bool showBoxes;

  /// Draw class/confidence labels (still subject to the user setting). Split
  /// views with a small camera pane turn them off to avoid clutter.
  final bool showLabels;

  /// Painted between the texture and the boxes; receives the transform.
  final Widget Function(BuildContext context, CoverTransform tf)? underlay;
  final int? highlightId;
  final OverlayLook look;

  /// Smaller status overlay for split layouts.
  final bool compactStatus;

  /// Render-harness hook: replaces the platform [Texture] (which cannot draw
  /// in `flutter test`) with e.g. a still frame. Never set in app code.
  @visibleForTesting
  static Widget Function(int textureId)? debugTextureBuilder;

  @override
  ConsumerState<CameraLayer> createState() => _CameraLayerState();
}

class _CameraLayerState extends ConsumerState<CameraLayer> {
  Offset? _focusAt;
  Timer? _focusTimer;

  @override
  void dispose() {
    _focusTimer?.cancel();
    super.dispose();
  }

  void _onTap(TapUpDetails d, CoverTransform tf) {
    final cam = ref.read(cameraProvider);
    if (!cam.isRunning) return;
    unawaited(
      ref.read(cameraProvider.notifier).focus(tf.toNormalized(d.localPosition)),
    );
    setState(() => _focusAt = d.localPosition);
    _focusTimer?.cancel();
    _focusTimer = Timer(const Duration(milliseconds: 1100), () {
      if (mounted) setState(() => _focusAt = null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cam = ref.watch(cameraProvider);
    final s = ref.watch(settingsProvider);
    final tracks = widget.showBoxes
        ? ref.watch(tracksProvider)
        : const <TrackedObject>[];
    final l10n = context.l10n;
    final hasTexture = cam.textureId != null && !cam.previewSize.isEmpty;

    return LayoutBuilder(
      builder: (context, c) {
        final view = Size(c.maxWidth, c.maxHeight);
        final tf = CoverTransform(
          frameSize: cam.previewSize,
          viewSize: view,
          fit: widget.fit,
        );
        return Semantics(
          label: l10n.cameraPreviewLabel,
          hint: cam.isRunning ? l10n.cameraFocusHint : null,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapUp: hasTexture ? (d) => _onTap(d, tf) : null,
            child: ClipRect(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const ColoredBox(color: Colors.black),
                  if (hasTexture)
                    Positioned.fromRect(
                      rect: tf.frameRect,
                      child:
                          CameraLayer.debugTextureBuilder?.call(
                            cam.textureId!,
                          ) ??
                          Texture(textureId: cam.textureId!),
                    ),
                  if (hasTexture && widget.underlay != null)
                    widget.underlay!(context, tf),
                  if (hasTexture && widget.showBoxes)
                    TrackSmootherScope(
                      tracks: tracks,
                      reduceMotion: s.reduceMotion,
                      builder: (context, smoother, repaint) => CustomPaint(
                        painter: DetectionOverlayPainter(
                          smoother: smoother,
                          frameSize: cam.previewSize,
                          labelFor: l10n.objectClass,
                          showLabels: widget.showLabels && s.showLabels,
                          showConfidence: s.showConfidence,
                          opacity: s.overlayOpacity,
                          tint: widget.look.tint,
                          highContrast: widget.look.highContrast,
                          highlightId: widget.highlightId,
                          repaint: repaint,
                        ),
                      ),
                    ),
                  // Legibility scrims for the status bar / HUD above and the
                  // drive controls below (full-screen camera views only).
                  if (hasTexture && !widget.compactStatus) ...[
                    const Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      height: 170,
                      child: IgnorePointer(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0x99080C12), Color(0x00080C12)],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      height: 210,
                      child: IgnorePointer(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Color(0xB3080C12), Color(0x00080C12)],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  if (_focusAt != null)
                    Positioned(
                      left: _focusAt!.dx - 34,
                      top: _focusAt!.dy - 34,
                      child: const _FocusRing(),
                    ),
                  if (!cam.isRunning)
                    CameraStatusOverlay(compact: widget.compactStatus),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FocusRing extends StatelessWidget {
  const _FocusRing();

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.amber, width: 1.5),
      ),
    ),
  );
}

/// Explains why there is no live picture and offers the real next step.
class CameraStatusOverlay extends ConsumerWidget {
  const CameraStatusOverlay({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cam = ref.watch(cameraProvider);
    final l10n = context.l10n;
    final camCtl = ref.read(cameraProvider.notifier);

    Widget body(
      IconData icon,
      String title,
      String? msg,
      List<Widget> actions, {
      bool spinner = false,
    }) {
      return ColoredBox(
        color: Colors.black.withValues(alpha: .72),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(compact ? 12 : 28),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (spinner)
                    const SizedBox.square(
                      dimension: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.4,
                        color: AppColors.cyan,
                      ),
                    )
                  else
                    Icon(icon, color: AppColors.cyan, size: compact ? 26 : 36),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (msg != null && !compact) ...[
                    const SizedBox(height: 6),
                    Text(
                      msg,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                        height: 1.35,
                      ),
                    ),
                  ],
                  if (actions.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: actions,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      );
    }

    final retry = FilledButton(
      onPressed: () => unawaited(camCtl.start()),
      child: Text(l10n.cameraStart),
    );
    switch (cam.status) {
      case CameraStatus.starting:
      case CameraStatus.idle:
        return body(
          Icons.videocam_outlined,
          l10n.cameraStarting,
          null,
          const [],
          spinner: true,
        );
      case CameraStatus.running:
        return const SizedBox.shrink();
      case CameraStatus.interrupted:
        return body(
          Icons.pause_circle_outline_rounded,
          l10n.cameraInterrupted,
          l10n.cameraInterruptedBody,
          const [],
        );
      case CameraStatus.unavailable:
        return body(
          Icons.no_photography_outlined,
          l10n.cameraUnavailable,
          l10n.cameraUnavailableBody,
          [
            if (kDebugMode)
              OutlinedButton.icon(
                onPressed: () => context.push(Routes.settingsDiagnostics),
                icon: const Icon(Icons.movie_outlined),
                label: Text(l10n.cameraRunTestFootage),
              ),
          ],
        );
      case CameraStatus.permissionDenied:
        return body(
          Icons.videocam_off_outlined,
          l10n.cameraPermissionDenied,
          l10n.cameraPermissionDeniedBody,
          [
            FilledButton(
              onPressed: () => unawaited(
                ref.read(permissionsProvider.notifier).openSettings(),
              ),
              child: Text(l10n.commonOpenSettings),
            ),
          ],
        );
      case CameraStatus.error:
        return body(
          Icons.error_outline_rounded,
          l10n.cameraError,
          cam.error == null
              ? l10n.commonError
              : l10n.commonErrorDetail(cam.error!),
          [retry],
        );
      case CameraStatus.stopped:
        return body(Icons.videocam_outlined, l10n.cameraStopped, null, [retry]);
    }
  }
}

/// Small on-screen diagnostics line (settings.showFps).
class PerfLine extends ConsumerWidget {
  const PerfLine({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = ref.watch(perfProvider);
    return IgnorePointer(
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          context.l10n.cameraDiagLine(
            p.cameraFps.toStringAsFixed(0),
            p.detectHz.toStringAsFixed(1),
            p.inferenceMs.toStringAsFixed(0),
            p.droppedFrames,
          ),
          style: const TextStyle(
            color: AppColors.green,
            fontSize: 11,
            fontFamily: 'Menlo',
            fontFeatures: [FontFeature.tabularFigures()],
          ),
        ),
      ),
    );
  }
}

/// "TEST FOOTAGE" marker whenever a local file feeds the pipeline.
class TestFootageBadge extends ConsumerWidget {
  const TestFootageBadge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final source = ref.watch(cameraProvider.select((c) => c.source));
    if (source != 'file') return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.amber,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        context.l10n.commonTestFootage,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontSize: 12,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
