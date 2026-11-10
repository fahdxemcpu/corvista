import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/providers.dart';
import '../../../app/router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common.dart';
import '../../../core/widgets/glass.dart';
import '../../../core/widgets/format.dart';
import '../../../domain/models/app_settings.dart';
import '../../../l10n/l10n.dart';
import '../../navigation/widgets/nav_widgets.dart';
import '../../weather/widgets/weather_widgets.dart';

/// Native MapKit view (`corvista/map`) with search, route preview, guidance,
/// recenter / zoom and approximate detection markers.
class DriveMapView extends ConsumerStatefulWidget {
  const DriveMapView({super.key, required this.contentPadding});

  final EdgeInsets contentPadding;

  @override
  ConsumerState<DriveMapView> createState() => _DriveMapViewState();
}

class _DriveMapViewState extends ConsumerState<DriveMapView> {
  MapViewController? _map;
  StreamSubscription<void>? _gestureSub;
  StreamSubscription<String>? _modeSub;
  Timer? _objectsTimer;
  Timer? _autoRecenter;
  bool _showRecenter = false;
  String? _routeKey;

  @override
  void dispose() {
    _gestureSub?.cancel();
    _modeSub?.cancel();
    _objectsTimer?.cancel();
    _autoRecenter?.cancel();
    _map?.dispose();
    super.dispose();
  }

  void _onCreated(int id) {
    final c = MapViewController(id);
    _map = c;
    _gestureSub = c.userGestures.listen((_) {
      if (!mounted) return;
      setState(() => _showRecenter = true);
      _autoRecenter?.cancel();
      if (ref.read(settingsProvider).autoRecenter) {
        _autoRecenter = Timer(const Duration(seconds: 12), _recenter);
      }
    });
    _modeSub = c.cameraModes.listen((m) {
      if (!mounted) return;
      final navigating =
          ref.read(navigationProvider).phase == NavPhase.navigating;
      setState(() => _showRecenter = navigating ? m != 'follow' : m == 'free');
    });
    _syncRoute(ref.read(navigationProvider), force: true);
    _objectsTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _pushObjects(),
    );
  }

  void _recenter() {
    _autoRecenter?.cancel();
    unawaited(_map?.recenter());
    if (mounted) setState(() => _showRecenter = false);
  }

  void _pushObjects() {
    final c = _map;
    if (c == null || !mounted) return;
    final fix = ref.read(locationProvider).fix;
    final tracks = ref.read(tracksProvider);
    final objs = const MapProjector()
        .projectAll(fix, tracks)
        .map((o) => o.toMap())
        .toList();
    unawaited(c.setObjects(objs).catchError((_) {}));
  }

  void _syncRoute(NavState nav, {bool force = false}) {
    final c = _map;
    if (c == null) return;
    final show =
        nav.phase == NavPhase.choosingRoute || nav.phase == NavPhase.navigating;
    final route = show && nav.routes.isNotEmpty
        ? nav.routes[nav.selectedRoute.clamp(0, nav.routes.length - 1)]
        : null;
    final key = route == null
        ? null
        : '${nav.routeVersion}:${route.id}:${nav.selectedRoute}:${nav.phase.name}';
    if (!force && key == _routeKey) return;
    final phaseChanged =
        _routeKey?.split(':').last != nav.phase.name || route == null;
    _routeKey = key;
    final dest = nav.destination;
    final navigating = nav.phase == NavPhase.navigating;
    unawaited(c.setNavContext(navigating: navigating).catchError((_) {}));
    if (route == null || dest == null) {
      unawaited(c.clearRoute().catchError((_) {}));
      unawaited(c.setCameraMode('follow').catchError((_) {}));
      return;
    }
    unawaited(
      c
          .setRoute(
            route.polyline,
            lat: dest.lat,
            lon: dest.lon,
            name: dest.name,
          )
          .catchError((_) {}),
    );
    if (phaseChanged || !navigating) {
      unawaited(
        c.setCameraMode(navigating ? 'follow' : 'overview').catchError((_) {}),
      );
    }
    if (navigating && mounted) setState(() => _showRecenter = false);
  }

  final _stackKey = GlobalKey();
  final _bannerKey = GlobalKey();
  final _tripKey = GlobalKey();
  EdgeInsets? _sentInsets;

  Rect? _rectOf(GlobalKey k) {
    final box = k.currentContext?.findRenderObject() as RenderBox?;
    final stack = _stackKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || stack == null || !box.hasSize) return null;
    final o = box.localToGlobal(Offset.zero, ancestor: stack);
    return o & box.size;
  }

  /// Tells the native camera which part of the map is not covered by the
  /// guidance chrome, so the puck sits in the free area (portrait: between
  /// banner and trip bar; landscape: beside the panels).
  void _syncInsets() {
    final c = _map;
    final stack = _stackKey.currentContext?.findRenderObject() as RenderBox?;
    if (c == null || stack == null || !mounted) return;
    final size = stack.size;
    final pad = widget.contentPadding;
    final banner = _rectOf(_bannerKey);
    final trip = _rectOf(_tripKey);
    final wide = size.width > size.height && size.width >= 600;
    final rtl = Directionality.of(context) == TextDirection.rtl;
    EdgeInsets insets;
    if (wide) {
      final panelEdge = [banner, trip].whereType<Rect>().fold<double>(
        0,
        (a, r) => math.max(a, rtl ? size.width - r.left : r.right),
      );
      insets = EdgeInsets.only(
        top: pad.top,
        bottom: pad.bottom,
        left: rtl ? 0 : panelEdge + 8,
        right: rtl ? panelEdge + 8 : 0,
      );
    } else {
      insets = EdgeInsets.only(
        top: (banner?.bottom ?? pad.top) + 8,
        bottom: size.height - (trip?.top ?? size.height - pad.bottom) + 8,
      );
    }
    final last = _sentInsets;
    if (last != null &&
        (last.top - insets.top).abs() < 4 &&
        (last.bottom - insets.bottom).abs() < 4 &&
        (last.left - insets.left).abs() < 4 &&
        (last.right - insets.right).abs() < 4) {
      return;
    }
    _sentInsets = insets;
    unawaited(
      c
          .setCameraInsets(
            top: insets.top,
            left: insets.left,
            bottom: insets.bottom,
            right: insets.right,
          )
          .catchError((_) {}),
    );
  }

  /// Per-frame (~15 Hz) puck, camera and travelled-route update.
  void _pushFrame(Guidance? g) {
    final c = _map;
    if (c == null || g == null) return;
    final lat = g.snappedLat, lon = g.snappedLon;
    if (lat == null || lon == null || g.arrived) return;
    unawaited(
      c
          .navFrame(
            lat: lat,
            lon: lon,
            course: g.routeBearing ?? 0,
            speed: g.speedMps,
            distanceToManeuverM: g.distanceToNextM,
            segment: g.segmentIndex,
          )
          .catchError((_) {}),
    );
  }

  void _overview() {
    unawaited(_map?.setCameraMode('overview').catchError((_) {}));
    if (mounted) setState(() => _showRecenter = true);
  }

  @override
  Widget build(BuildContext context) {
    final nav = ref.watch(navigationProvider);
    final s = ref.watch(settingsProvider);
    final weather = ref.watch(weatherProvider);
    final loc = ref.watch(locationProvider);
    final l10n = context.l10n;
    final dark = Theme.of(context).brightness == Brightness.dark;
    ref.listen(navigationProvider, (_, next) => _syncRoute(next));
    ref.listen(navFrameProvider, (_, f) => _pushFrame(f));
    // Off route / rerouting: no snapped frames — follow the raw GPS fix so
    // the puck and camera stay with the car until the new route arrives.
    ref.listen(locationProvider.select((l) => l.fix), (_, fix) {
      final n = ref.read(navigationProvider);
      final c = _map;
      if (c == null || fix == null || n.phase != NavPhase.navigating) return;
      if (!n.rerouting && !(n.guidance?.offRoute ?? false)) return;
      unawaited(
        c
            .navFrame(
              lat: fix.lat,
              lon: fix.lon,
              course: fix.hasCourse
                  ? fix.course
                  : (n.guidance?.routeBearing ?? 0),
              speed: fix.hasSpeed ? fix.speed : 0,
            )
            .catchError((_) {}),
      );
    });
    ref.listen(
      settingsProvider.select((x) => x.mapPitch),
      (_, p) => unawaited(_map?.setPitch(p)),
    );

    final pad = widget.contentPadding;
    final isIos = defaultTargetPlatform == TargetPlatform.iOS && !kIsWeb;
    final navigating = nav.phase == NavPhase.navigating;
    final arrived = navigating && (nav.guidance?.arrived ?? false);
    final size = MediaQuery.sizeOf(context);
    final wide = size.width > size.height && size.width >= 600;
    final panelW = wide ? math.min(440.0, size.width * .46) : double.infinity;

    final fix = loc.fix;
    final nowS = DateTime.now().millisecondsSinceEpoch / 1000;
    final weakGps =
        navigating &&
        fix != null &&
        (fix.hAcc > 50 || (fix.ts > 0 && nowS - fix.ts / 1000 > 10));
    final weatherVisible =
        !s.hudShowWeather &&
        !navigating &&
        (weather.hasData || (weather.error == null && weather.loading));

    Widget constrain(Widget child) => wide
        ? Align(
            alignment: AlignmentDirectional.topStart,
            child: SizedBox(width: panelW, child: child),
          )
        : child;

    if (navigating) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _syncInsets());
    }
    return Stack(
      key: _stackKey,
      fit: StackFit.expand,
      children: [
        if (isIos)
          UiKitView(
            viewType: 'corvista/map',
            creationParams: {
              'pitch': s.mapPitch,
              'showsBuildings': true,
              'elevation': 'realistic',
              'dark': dark,
              'followUser': true,
              'showsTraffic': false,
            },
            creationParamsCodec: const StandardMessageCodec(),
            onPlatformViewCreated: _onCreated,
          )
        else
          ColoredBox(
            color: AppColors.surface,
            child: Center(
              child: Text(
                l10n.mapUnsupported,
                style: const TextStyle(color: AppColors.textSecondary),
              ),
            ),
          ),

        // Top: search pill / maneuver banner / error.
        PositionedDirectional(
          top: pad.top + 14,
          start: 12,
          end: navigating ? 12 : 12 + 64,
          child: constrain(
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (navigating)
                  KeyedSubtree(key: _bannerKey, child: const ManeuverBanner())
                else if (nav.phase != NavPhase.choosingRoute)
                  _SearchPill(query: nav.destination?.name),
                if (weakGps) ...[
                  const SizedBox(height: 8),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: _Pill(
                      icon: Icons.gps_not_fixed_rounded,
                      text: l10n.navWeakGps,
                    ),
                  ),
                ],
                if (nav.error != null &&
                    (nav.phase == NavPhase.error || navigating)) ...[
                  const SizedBox(height: 8),
                  InfoBanner(
                    glass: true,
                    tone: BannerTone.warning,
                    message: navErrorText(l10n, nav.error!),
                    actionLabel: navigating ? null : l10n.navDismiss,
                    onAction: navigating
                        ? null
                        : ref.read(navigationProvider.notifier).cancel,
                  ),
                ],
              ],
            ),
          ),
        ),

        // Side controls (hidden while navigating: the screen belongs to
        // guidance; recenter moves next to the trip bar).
        if (!navigating)
          PositionedDirectional(
            end: 12,
            top: pad.top + 14,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GlassIconButton(
                  icon: Icons.add_rounded,
                  size: 48,
                  label: l10n.mapZoomIn,
                  onPressed: _map == null
                      ? null
                      : () => unawaited(_map!.zoom(1)),
                ),
                const SizedBox(height: 8),
                GlassIconButton(
                  icon: Icons.remove_rounded,
                  size: 48,
                  label: l10n.mapZoomOut,
                  onPressed: _map == null
                      ? null
                      : () => unawaited(_map!.zoom(-1)),
                ),
                if (_showRecenter) ...[
                  const SizedBox(height: 8),
                  GlassIconButton(
                    icon: Icons.my_location_rounded,
                    label: l10n.mapRecenter,
                    active: true,
                    onPressed: _recenter,
                  ),
                ],
                if (weatherVisible) ...[
                  const SizedBox(height: 8),
                  _MapWeatherChip(state: weather, unit: s.speedUnit),
                ],
              ],
            ),
          ),

        // Bottom: route preview / trip bar / arrival.
        PositionedDirectional(
          start: 12,
          end: 12,
          bottom: pad.bottom + 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (navigating && !arrived)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // The HUD strip already shows GPS speed when enabled.
                      if (!s.hudShowSpeed) const SpeedBubble(),
                      const Spacer(),
                      if (_showRecenter)
                        GlassIconButton(
                          icon: Icons.navigation_rounded,
                          label: l10n.mapRecenter,
                          active: true,
                          onPressed: _recenter,
                        ),
                    ],
                  ),
                ),
              if (nav.phase == NavPhase.choosingRoute)
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: const RoutePreviewCard(),
                  ),
                ),
              if (navigating)
                constrain(
                  arrived
                      ? const ArrivalCard()
                      : KeyedSubtree(
                          key: _tripKey,
                          child: TripBar(onOverview: _overview),
                        ),
                ),
              if (!navigating &&
                  ref.watch(
                    tracksProvider.select(
                      (t) =>
                          t.any((x) => x.isConfirmed && x.approxRangeM != null),
                    ),
                  ))
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    l10n.mapObjectsApprox,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                      shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => GlassPanel(
    radius: 20,
    padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 14, 8),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: AppColors.amber),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

class _SearchPill extends StatelessWidget {
  const _SearchPill({this.query});

  final String? query;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Semantics(
      button: true,
      label: l10n.navSearchHint,
      excludeSemantics: true,
      child: GestureDetector(
        onTap: () => context.push(Routes.destination),
        child: GlassPanel(
          radius: 28,
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
          child: Row(
            children: [
              const Icon(Icons.search_rounded, color: AppColors.cyan),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  query ?? l10n.navSearchHint,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MapWeatherChip extends StatelessWidget {
  const _MapWeatherChip({required this.state, required this.unit});

  final WeatherState state;
  final SpeedUnit unit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final has = state.hasData && state.temperatureC != null;
    return GlassIconButton(
      icon: has ? weatherIcon(state.symbol) : Icons.cloud_off_rounded,
      label: has
          ? l10n.hudWeatherLabel(
              Fmt.temperature(state.temperatureC!, unit),
              state.condition ?? '',
            )
          : l10n.mapWeatherUnavailable,
      onPressed: () => unawaited(showWeatherSheet(context)),
    );
  }
}
