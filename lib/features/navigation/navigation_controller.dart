import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' show Locale, PlatformDispatcher;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/errors/app_errors.dart';
import '../../domain/models/app_settings.dart';
import '../../domain/models/location_fix.dart';
import '../../domain/services/clock.dart';
import '../../l10n/app_localizations.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../maps/location_controller.dart';
import '../settings/settings_controller.dart';
import '../voice_alerts/voice_alert_controller.dart';
import 'guidance_engine.dart';
import 'guidance_voice.dart';
import 'navigation_models.dart';
import 'recent_destinations.dart';
import 'route_guidance.dart';

export 'announcement_scheduler.dart';
export 'guidance_engine.dart';
export 'guidance_voice.dart';
export 'traffic_side.dart';
export 'maneuver.dart';
export 'navigation_models.dart';
export 'recent_destinations.dart';
export 'route_guidance.dart';

enum NavPhase { idle, searching, choosingRoute, navigating, error }

class NavState {
  const NavState({
    this.phase = NavPhase.idle,
    this.query = '',
    this.suggestions = const [],
    this.completedQuery,
    this.places = const [],
    this.submitted = false,
    this.destination,
    this.routes = const [],
    this.selectedRoute = 0,
    this.routeVersion = 0,
    this.guidance,
    this.rerouting = false,
    this.error,
    this.loading = false,
  });

  final NavPhase phase;
  final String query;
  final List<PlaceSuggestion> suggestions;

  /// Query whose completions are in [suggestions] (null = none received yet).
  final String? completedQuery;

  /// Full search results (`nav.search`) — after Search is pressed, or as a
  /// fallback when autocomplete has nothing.
  final List<Place> places;

  /// The user pressed Search for [query].
  final bool submitted;
  final Place? destination;
  final List<RouteInfo> routes;
  final int selectedRoute;

  /// Bumped whenever [routes] is replaced (new search / reroute).
  final int routeVersion;
  final Guidance? guidance;
  final bool rerouting;

  /// Error code: `no_location`, `no_results`, `unavailable`, ...
  final String? error;
  final bool loading;

  RouteInfo? get route =>
      selectedRoute < routes.length ? routes[selectedRoute] : null;

  /// True when a finished search for the current query found nothing.
  bool get noResults =>
      !loading &&
      query.trim().isNotEmpty &&
      completedQuery == query.trim() &&
      suggestions.isEmpty &&
      places.isEmpty;

  /// Index of the quickest route (for the "Fastest" tag).
  int get fastestRoute {
    var best = 0;
    for (var i = 1; i < routes.length; i++) {
      if (routes[i].expectedTravelTimeS < routes[best].expectedTravelTimeS) {
        best = i;
      }
    }
    return best;
  }

  NavState copyWith({
    NavPhase? phase,
    String? query,
    List<PlaceSuggestion>? suggestions,
    String? Function()? completedQuery,
    List<Place>? places,
    bool? submitted,
    Place? Function()? destination,
    List<RouteInfo>? routes,
    int? selectedRoute,
    int? routeVersion,
    Guidance? Function()? guidance,
    bool? rerouting,
    String? Function()? error,
    bool? loading,
  }) => NavState(
    phase: phase ?? this.phase,
    query: query ?? this.query,
    suggestions: suggestions ?? this.suggestions,
    completedQuery: completedQuery != null
        ? completedQuery()
        : this.completedQuery,
    places: places ?? this.places,
    submitted: submitted ?? this.submitted,
    destination: destination != null ? destination() : this.destination,
    routes: routes ?? this.routes,
    selectedRoute: selectedRoute ?? this.selectedRoute,
    routeVersion: routeVersion ?? this.routeVersion,
    guidance: guidance != null ? guidance() : this.guidance,
    rerouting: rerouting ?? this.rerouting,
    error: error != null ? error() : this.error,
    loading: loading ?? this.loading,
  );
}

class NavigationController extends Notifier<NavState> {
  static const debounce = Duration(milliseconds: 300);
  static const rerouteMinInterval = Duration(seconds: 10);

  Timer? _debounce;
  Timer? _ticker;
  GuidanceEngine? _engine;
  DateTime? _lastReroute;
  bool _rerouting = false;
  int _rerouteCount = 0;
  int _queryGen = 0;

  /// Spoken prompts (newest last) — for diagnostics and tests.
  final List<String> spoken = [];

  @override
  NavState build() {
    ref.listen(locationProvider.select((s) => s.fix), (_, fix) {
      if (fix != null) _onFix(fix);
    });
    ref.onDispose(() {
      _debounce?.cancel();
      _ticker?.cancel();
    });
    return const NavState();
  }

  DateTime _now() => ref.read(clockProvider)();

  // ---------------------------------------------------------------- search

  /// Debounced (300 ms) search completions. `loading` is set immediately so
  /// the UI never shows "no results" for a query that has not been asked yet.
  void setQuery(String q) {
    _debounce?.cancel();
    final t = q.trim();
    final gen = ++_queryGen;
    state = state.copyWith(
      query: q,
      phase: NavPhase.searching,
      error: () => null,
      submitted: false,
      places: const [],
      loading: t.isNotEmpty,
    );
    if (t.isEmpty) {
      state = state.copyWith(
        suggestions: const [],
        completedQuery: () => null,
        loading: false,
      );
      return;
    }
    _debounce = Timer(debounce, () => _complete(t, gen));
  }

  Future<void> _complete(String q, int gen) async {
    final fix = ref.read(locationProvider).fix;
    final engine = ref.read(nativeEngineProvider);
    try {
      final raw = await engine.navComplete(q, lat: fix?.lat, lon: fix?.lon);
      if (!ref.mounted || gen != _queryGen) return;
      final sugg = [for (final m in raw) PlaceSuggestion.fromMap(m)]
          .where((s) => s.id.isNotEmpty && s.title.isNotEmpty)
          .toList();
      var places = const <Place>[];
      if (sugg.isEmpty) {
        // Autocomplete can come back empty (slow first completer, odd
        // spelling): fall back to a full search before saying "nothing".
        places = await _searchPlaces(q, fix);
        if (!ref.mounted || gen != _queryGen) return;
      }
      state = state.copyWith(
        suggestions: sugg,
        places: places,
        completedQuery: () => q,
        loading: false,
      );
    } catch (e) {
      if (!ref.mounted || gen != _queryGen) return;
      state = state.copyWith(
        loading: false,
        suggestions: const [],
        completedQuery: () => q,
        error: () => errorCode(e),
      );
    }
  }

  Future<List<Place>> _searchPlaces(String q, LocationFix? fix) async {
    try {
      final raw = await ref
          .read(nativeEngineProvider)
          .navSearch(q, lat: fix?.lat, lon: fix?.lon);
      return [
        for (final m in raw)
          if (m['lat'] is num && m['lon'] is num) Place.fromMap(m),
      ];
    } catch (_) {
      return const [];
    }
  }

  /// Search button: full MapKit search for the current query.
  Future<void> submit([String? query]) async {
    final q = (query ?? state.query).trim();
    if (q.isEmpty) return;
    _debounce?.cancel();
    final gen = ++_queryGen;
    final fix = ref.read(locationProvider).fix;
    state = state.copyWith(
      query: query ?? state.query,
      phase: NavPhase.searching,
      loading: true,
      submitted: true,
      error: () => null,
    );
    try {
      final raw = await ref
          .read(nativeEngineProvider)
          .navSearch(q, lat: fix?.lat, lon: fix?.lon);
      if (!ref.mounted || gen != _queryGen) return;
      state = state.copyWith(
        places: [
          for (final m in raw)
            if (m['lat'] is num && m['lon'] is num) Place.fromMap(m),
        ],
        completedQuery: () => q,
        loading: false,
      );
    } catch (e) {
      if (!ref.mounted || gen != _queryGen) return;
      state = state.copyWith(
        loading: false,
        places: const [],
        completedQuery: () => q,
        error: () => errorCode(e),
      );
    }
  }

  // ---------------------------------------------------------------- routes

  Future<List<RouteInfo>> _requestRoutes(LocationFix from, Place to) async {
    final raw = await ref
        .read(nativeEngineProvider)
        .navRoute(
          fromLat: from.lat,
          fromLon: from.lon,
          toLat: to.lat,
          toLon: to.lon,
        );
    return raw
        .map((m) => RouteInfo.fromMap(m).drivingOnly())
        .where((r) => r.polyline.length >= 4)
        .toList();
  }

  /// Resolves an autocomplete suggestion and previews routes to it.
  Future<void> choose(PlaceSuggestion s) async {
    _debounce?.cancel();
    _queryGen++;
    state = state.copyWith(loading: true, error: () => null);
    try {
      final places = await ref.read(nativeEngineProvider).navResolve(s.id);
      if (!ref.mounted) return;
      if (places.isEmpty) {
        state = state.copyWith(
          loading: false,
          phase: NavPhase.error,
          error: () => 'no_results',
        );
        return;
      }
      await chooseDestination(Place.fromMap(places.first));
    } catch (e) {
      if (ref.mounted) {
        state = state.copyWith(
          loading: false,
          phase: NavPhase.error,
          error: () => errorCode(e),
        );
      }
    }
  }

  /// Previews routes from the current fix to [dest] (search result / recent).
  Future<void> chooseDestination(Place dest) async {
    _debounce?.cancel();
    _queryGen++;
    state = state.copyWith(
      destination: () => dest,
      loading: true,
      error: () => null,
    );
    final fix = ref.read(locationProvider).fix;
    if (fix == null) {
      final loc = ref.read(locationProvider);
      state = state.copyWith(
        loading: false,
        phase: NavPhase.error,
        error: () =>
            loc.error == BridgeErrorCode.permissionDenied ||
                (!loc.permissionGranted && loc.error != null)
            ? BridgeErrorCode.permissionDenied
            : 'no_location',
      );
      return;
    }
    try {
      final routes = await _requestRoutes(fix, dest);
      if (!ref.mounted) return;
      state = state.copyWith(
        loading: false,
        routes: routes,
        selectedRoute: 0,
        routeVersion: state.routeVersion + 1,
        phase: routes.isEmpty ? NavPhase.error : NavPhase.choosingRoute,
        error: () => routes.isEmpty ? 'no_route' : null,
      );
    } catch (e) {
      if (ref.mounted) {
        state = state.copyWith(
          loading: false,
          phase: NavPhase.error,
          error: () => errorCode(e),
        );
      }
    }
  }

  void selectRoute(int i) {
    if (i < 0 || i >= state.routes.length) return;
    state = state.copyWith(selectedRoute: i);
  }

  Future<void> start() async {
    final r = state.route;
    if (r == null) return;
    _engine = GuidanceEngine(r, voice: _voice(ref.read(settingsProvider)));
    _lastReroute = null;
    _rerouteCount = 0;
    state = state.copyWith(
      phase: NavPhase.navigating,
      guidance: () => null,
      rerouting: false,
      error: () => null,
    );
    final dest = state.destination;
    if (dest != null) {
      unawaited(ref.read(recentDestinationsProvider.notifier).add(dest));
    }
    _startTicker();
    final fix = ref.read(locationProvider).fix;
    if (fix != null) _onFix(fix);
  }

  void cancel() {
    _debounce?.cancel();
    final wasNavigating = state.phase == NavPhase.navigating;
    _engine = null;
    _ticker?.cancel();
    _ticker = null;
    _queryGen++;
    ref.read(navFrameProvider.notifier).set(null);
    state = const NavState().copyWith(routeVersion: state.routeVersion + 1);
    if (wasNavigating) unawaited(ref.read(speechArbiterProvider).stop());
  }

  /// Mutes / unmutes spoken guidance (persisted in settings).
  Future<void> setVoice(bool on) async {
    if (!on) unawaited(ref.read(speechArbiterProvider).stop());
    await ref
        .read(settingsProvider.notifier)
        .update((s) => s.copyWith(navVoice: on));
  }

  // -------------------------------------------------------------- guidance

  /// Smooth (dead-reckoned) guidance frames for the puck, camera and
  /// distance readout between 1 Hz fixes.
  static const frameInterval = Duration(milliseconds: 66);

  void _startTicker() {
    _ticker?.cancel();
    _ticker = Timer.periodic(frameInterval, (_) {
      final e = _engine;
      if (e == null || !ref.mounted || state.phase != NavPhase.navigating) {
        return;
      }
      final g = state.guidance;
      if (g == null || g.arrived || g.offRoute || state.rerouting) return;
      ref.read(navFrameProvider.notifier).set(e.predict(_now()));
    });
  }

  void _onFix(LocationFix fix) {
    final e = _engine;
    if (e == null || state.phase != NavPhase.navigating) return;
    final u = e.onFix(
      NavFix(
        lat: fix.lat,
        lon: fix.lon,
        speed: fix.speed,
        course: fix.course,
        hAcc: fix.hAcc,
      ),
      _now(),
    );
    state = state.copyWith(guidance: () => u.guidance);
    ref.read(navFrameProvider.notifier).set(u.guidance);
    for (final p in u.prompts) {
      _say((_) => p);
    }
    if (u.offRoute) unawaited(_maybeReroute(fix));
  }

  GuidanceVoice _voice(AppSettings s) {
    final tag =
        s.localeTag ?? PlatformDispatcher.instance.locale.toLanguageTag();
    final lang = tag.split(RegExp('[-_]')).first;
    final supported = AppLocalizations.supportedLocales.any(
      (l) => l.languageCode == lang,
    );
    final l10n = lookupAppLocalizations(Locale(supported ? lang : 'en'));
    final region = PlatformDispatcher.instance.locale.countryCode;
    return GuidanceVoice(
      l10n,
      unit: s.speedUnit,
      locale: supported ? lang : 'en',
      yards: region == 'GB',
    );
  }

  void _say(String? Function(GuidanceVoice v) build) {
    final s = ref.read(settingsProvider);
    final text = build(_voice(s));
    if (text == null || text.isEmpty) return;
    spoken.add(text);
    if (!s.navVoice) return;
    // Voice language: app language (falls back to an installed voice / en).
    final appTag =
        s.localeTag ?? PlatformDispatcher.instance.locale.toLanguageTag();
    final (voiceLang, _) = ref
        .read(voiceAlertsProvider.notifier)
        .resolveLanguage(s.copyWith(voiceLanguage: () => appTag));
    unawaited(
      ref
          .read(speechArbiterProvider)
          .speak(
            text,
            channel: SpeechChannel.guidance,
            language: voiceLang,
            volume: s.voiceVolume,
          ),
    );
  }

  /// Reroute origin: a little ahead along the current course, so MapKit
  /// starts the new route in the direction of travel (heading hint).
  static (double, double) rerouteOrigin(LocationFix fix) {
    if (!fix.hasSpeed || !fix.hasCourse || fix.speed < 3) {
      return (fix.lat, fix.lon);
    }
    final d = math.min(40.0, fix.speed * 2);
    const r = 6371008.8;
    final b = fix.course * math.pi / 180;
    final lat1 = fix.lat * math.pi / 180, lon1 = fix.lon * math.pi / 180;
    final lat2 = math.asin(
      math.sin(lat1) * math.cos(d / r) +
          math.cos(lat1) * math.sin(d / r) * math.cos(b),
    );
    final lon2 =
        lon1 +
        math.atan2(
          math.sin(b) * math.sin(d / r) * math.cos(lat1),
          math.cos(d / r) - math.sin(lat1) * math.sin(lat2),
        );
    return (lat2 * 180 / math.pi, lon2 * 180 / math.pi);
  }

  Future<void> _maybeReroute(LocationFix fix) async {
    final dest = state.destination;
    final e = _engine;
    if (dest == null || e == null || _rerouting) return;
    final now = _now();
    // First reroute immediately; then at most one per interval.
    if (_lastReroute != null &&
        now.difference(_lastReroute!) < rerouteMinInterval) {
      return;
    }
    _lastReroute = now;
    _rerouting = true;
    _rerouteCount++;
    state = state.copyWith(rerouting: true);
    _say((v) => v.l10n.navSpeakRerouting);
    try {
      final (oLat, oLon) = rerouteOrigin(fix);
      final raw = await ref
          .read(nativeEngineProvider)
          .navRoute(
            fromLat: oLat,
            fromLon: oLon,
            toLat: dest.lat,
            toLon: dest.lon,
          );
      final routes = raw
          .map((m) => RouteInfo.fromMap(m).drivingOnly())
          .where((r) => r.polyline.length >= 4)
          .toList();
      if (!ref.mounted ||
          routes.isEmpty ||
          state.phase != NavPhase.navigating ||
          !identical(_engine, e)) {
        return;
      }
      // The old route stays on the map until this one replaces it.
      e.replaceRoute(routes.first);
      state = state.copyWith(
        routes: routes,
        selectedRoute: 0,
        routeVersion: state.routeVersion + 1,
        rerouting: false,
        error: () => null,
      );
      _onFix(fix);
    } catch (err) {
      // Keep guiding on the old route; surface the error.
      if (ref.mounted) state = state.copyWith(error: () => errorCode(err));
    } finally {
      _rerouting = false;
      if (ref.mounted && state.rerouting) {
        state = state.copyWith(rerouting: false);
      }
    }
  }

  /// Number of reroutes in this navigation session.
  int get rerouteCount => _rerouteCount;

  /// Distance in metres between two coordinates (haversine).
  static double distanceM(double lat1, double lon1, double lat2, double lon2) {
    const r = 6371008.8;
    final p1 = lat1 * math.pi / 180, p2 = lat2 * math.pi / 180;
    final dp = p2 - p1, dl = (lon2 - lon1) * math.pi / 180;
    final h =
        math.sin(dp / 2) * math.sin(dp / 2) +
        math.cos(p1) * math.cos(p2) * math.sin(dl / 2) * math.sin(dl / 2);
    return 2 * r * math.asin(math.min(1, math.sqrt(h)));
  }
}

final navigationProvider = NotifierProvider<NavigationController, NavState>(
  NavigationController.new,
);

/// Latest dead-reckoned guidance frame (~15 Hz while navigating); null when
/// not navigating. Drives the puck, camera and live distance readout.
class NavFrameController extends Notifier<Guidance?> {
  @override
  Guidance? build() => null;

  void set(Guidance? g) => state = g;
}

final navFrameProvider = NotifierProvider<NavFrameController, Guidance?>(
  NavFrameController.new,
);
