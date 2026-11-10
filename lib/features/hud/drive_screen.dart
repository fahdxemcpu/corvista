import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../core/animations/motion.dart';
import '../../core/widgets/glass.dart';
import '../../domain/models/app_settings.dart';
import '../../l10n/l10n.dart';
import '../detection/widgets/camera_layer.dart';
import '../detection/widgets/detection_view.dart';
import '../maps/widgets/drive_map_view.dart';
import '../parking/widgets/parking_view.dart';
import '../segmentation/widgets/perception_view.dart';
import '../tour/coach_tour.dart';
import '../tour/drive_tour.dart';
import '../virtual_view/widgets/virtual_view.dart';
import 'widgets/record_button.dart';
import 'widgets/drive_controls.dart';
import 'widgets/hud_palette.dart';
import 'widgets/hud_strip.dart';
import 'widgets/save_incident_button.dart';

/// Main drive shell: full-bleed view, HUD strip, Save Incident, view switcher.
class DriveScreen extends ConsumerStatefulWidget {
  const DriveScreen({super.key});

  @override
  ConsumerState<DriveScreen> createState() => _DriveScreenState();
}

class _DriveScreenState extends ConsumerState<DriveScreen> {
  late final DriveSessionController _session = ref.read(
    driveSessionProvider.notifier,
  );
  double _topH = 96;
  double _bottomH = 150;
  final _tourKeys = DriveTourKeys();
  bool _tour = false;
  Timer? _tourTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      unawaited(ref.read(permissionsProvider.notifier).refresh());
      unawaited(_session.start());
      _maybeStartTour();
    });
  }

  /// First visit after onboarding (or a replay from Help): show the tour once
  /// the HUD and controls have laid out.
  void _maybeStartTour() {
    final s = ref.read(settingsProvider);
    if (!s.onboardingDone || s.tourDone || _tour) return;
    _tourTimer?.cancel();
    _tourTimer = Timer(const Duration(milliseconds: 700), () {
      if (mounted) setState(() => _tour = true);
    });
  }

  void _finishTour(bool _) {
    setState(() => _tour = false);
    unawaited(
      ref
          .read(settingsProvider.notifier)
          .update((s) => s.copyWith(tourDone: true)),
    );
  }

  @override
  void dispose() {
    _tourTimer?.cancel();
    final s = _session;
    // Defer: providers must not be modified while the tree is finalizing.
    Future.microtask(() async {
      try {
        await s.stop();
      } catch (_) {
        // The whole ProviderScope is being torn down; nothing left to stop.
      }
    });
    super.dispose();
  }

  void _select(DriveView v) => _session.setView(v);

  @override
  Widget build(BuildContext context) {
    final view = ref.watch(driveSessionProvider.select((s) => s.view));
    final style = ref.watch(settingsProvider.select((s) => s.hudStyle));
    final reduceMotion = ref.watch(
      settingsProvider.select((s) => s.reduceMotion),
    );
    final palette = HudPalette.of(style);
    final mq = MediaQuery.of(context);
    final landscape = mq.orientation == Orientation.landscape;
    final l10n = context.l10n;
    ref.listen(settingsProvider.select((s) => s.tourDone), (_, done) {
      if (!done) _maybeStartTour();
    });

    final contentPadding = EdgeInsets.only(
      top: _topH,
      bottom: _bottomH,
      left: mq.padding.left,
      right: mq.padding.right,
    );

    final Widget scene = switch (view) {
      DriveView.detection => DetectionView(
        look: palette.look,
        contentPadding: contentPadding,
      ),
      DriveView.virtual => VirtualView(
        contentPadding: contentPadding,
        night: style == HudStyle.night,
      ),
      DriveView.maps => DriveMapView(contentPadding: contentPadding),
      DriveView.parking => ParkingView(
        contentPadding: contentPadding,
        look: palette.look,
      ),
      DriveView.segmentation => PerceptionView(
        contentPadding: contentPadding,
        look: palette.look,
      ),
    };

    final cameraScene =
        view == DriveView.detection || view == DriveView.segmentation;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedSwitcher(
            duration: Motion.duration(
              context,
              Motion.medium,
              appReduceMotion: reduceMotion,
            ),
            child: KeyedSubtree(key: ValueKey(view), child: scene),
          ),
          if (palette.sceneDim > 0 && view != DriveView.maps)
            IgnorePointer(
              child: ColoredBox(
                color: Colors.black.withValues(alpha: palette.sceneDim),
              ),
            ),
          if (style == HudStyle.grid && cameraScene)
            IgnorePointer(
              child: CustomPaint(
                painter: PerspectiveGridPainter(color: palette.accent),
              ),
            ),

          // Top HUD.
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: _MeasureSize(
              onSize: (s) {
                if (mounted && (s.height - _topH).abs() > 1) {
                  setState(() => _topH = s.height);
                }
              },
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 6, 12, 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      KeyedSubtree(
                        key: _tourKeys.hud,
                        child: HudStrip(
                          palette: palette,
                          landscape: landscape,
                          showNavigationCard: view != DriveView.maps,
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: TestFootageBadge(),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 560),
                        child: DriveBanners(view: view),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Bottom controls.
          PositionedDirectional(
            start: 0,
            end: 0,
            bottom: 0,
            child: _MeasureSize(
              onSize: (s) {
                if (mounted && (s.height - _bottomH).abs() > 1) {
                  setState(() => _bottomH = s.height);
                }
              },
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 8),
                  child: landscape
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _SideButtons(palette: palette, keys: _tourKeys),
                            Expanded(
                              child: Center(
                                child: KeyedSubtree(
                                  key: _tourKeys.switcher,
                                  child: ViewSwitcher(
                                    current: view,
                                    onSelect: _select,
                                    palette: palette,
                                    segmentKeys: {
                                      DriveView.maps: _tourKeys.mapTab,
                                    },
                                  ),
                                ),
                              ),
                            ),
                            KeyedSubtree(
                              key: _tourKeys.record,
                              child: RecordButton(palette: palette),
                            ),
                            const SizedBox(width: 10),
                            KeyedSubtree(
                              key: _tourKeys.save,
                              child: SaveIncidentButton(palette: palette),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _SideButtons(palette: palette, keys: _tourKeys),
                                const Spacer(),
                                KeyedSubtree(
                                  key: _tourKeys.record,
                                  child: RecordButton(palette: palette),
                                ),
                                const SizedBox(width: 10),
                                KeyedSubtree(
                                  key: _tourKeys.save,
                                  child: SaveIncidentButton(palette: palette),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: KeyedSubtree(
                                key: _tourKeys.switcher,
                                child: ViewSwitcher(
                                  current: view,
                                  onSelect: _select,
                                  palette: palette,
                                  segmentKeys: {
                                    DriveView.maps: _tourKeys.mapTab,
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
          if (_tour)
            Positioned.fill(
              child: CoachTour(
                steps: driveTourSteps(
                  l10n,
                  _tourKeys,
                  bufferSeconds: ref.watch(
                    settingsProvider.select((s) => s.bufferSeconds),
                  ),
                ),
                reduceMotion: reduceMotion,
                onFinish: _finishTour,
              ),
            ),
          // Keeps screen readers oriented.
          Semantics(
            label: l10n.driveView(view),
            container: true,
            child: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _SideButtons extends StatelessWidget {
  const _SideButtons({required this.palette, required this.keys});

  final HudPalette palette;
  final DriveTourKeys keys;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GlassIconButton(
          key: keys.clips,
          icon: Icons.video_library_rounded,
          label: l10n.driveClips,
          iconColor: palette.text,
          onPressed: () => context.push(Routes.clips),
        ),
        const SizedBox(width: 10),
        GlassIconButton(
          key: keys.settings,
          icon: Icons.tune_rounded,
          label: l10n.driveSettings,
          iconColor: palette.text,
          onPressed: () => context.push(Routes.settings),
        ),
      ],
    );
  }
}

/// Reports its child's laid-out size after each layout pass.
class _MeasureSize extends SingleChildRenderObjectWidget {
  const _MeasureSize({required this.onSize, required super.child});

  final ValueChanged<Size> onSize;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderMeasure(onSize);

  @override
  void updateRenderObject(BuildContext context, _RenderMeasure renderObject) =>
      renderObject.onSize = onSize;
}

class _RenderMeasure extends RenderProxyBox {
  _RenderMeasure(this.onSize);

  ValueChanged<Size> onSize;
  Size? _last;

  @override
  void performLayout() {
    super.performLayout();
    final s = size;
    if (s != _last) {
      _last = s;
      WidgetsBinding.instance.addPostFrameCallback((_) => onSize(s));
    }
  }
}
