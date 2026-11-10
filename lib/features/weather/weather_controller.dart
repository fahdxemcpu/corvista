import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/errors/app_errors.dart';
import '../../domain/models/app_settings.dart';
import '../../domain/models/location_fix.dart';
import '../../domain/services/clock.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../dashcam/drive_session_controller.dart';
import '../maps/location_controller.dart';
import '../settings/settings_controller.dart';

class HourlyWeather {
  const HourlyWeather({
    required this.time,
    required this.condition,
    required this.symbol,
    required this.temperatureC,
    required this.precipitationChance,
    required this.windKph,
  });
  final DateTime time;
  final String condition, symbol;
  final double temperatureC, precipitationChance, windKph;
}

class WeatherState {
  const WeatherState({
    this.loading = false,
    this.error,
    this.condition,
    this.symbol,
    this.temperatureC,
    this.apparentC,
    this.windKph,
    this.visibilityKm,
    this.precipitationChance,
    this.humidity,
    this.asOf,
    this.hourly = const [],
    this.locationName,
    this.attributionLegalUrl,
    this.attributionLogoDark,
    this.attributionLogoLight,
    this.serviceName,
  });

  final bool loading;
  final String? error;
  final String? condition, symbol;
  final double? temperatureC,
      apparentC,
      windKph,
      visibilityKm,
      precipitationChance,
      humidity;
  final DateTime? asOf;
  final List<HourlyWeather> hourly;
  final String? locationName;
  final String? attributionLegalUrl;
  final String? attributionLogoDark;
  final String? attributionLogoLight;
  final String? serviceName;

  bool get hasData => asOf != null;

  WeatherState withLoading(bool v) => _copy(loading: v);
  WeatherState withError(String? e) => _copy(error: () => e, loading: false);

  WeatherState _copy({bool? loading, String? Function()? error}) =>
      WeatherState(
        loading: loading ?? this.loading,
        error: error != null ? error() : this.error,
        condition: condition,
        symbol: symbol,
        temperatureC: temperatureC,
        apparentC: apparentC,
        windKph: windKph,
        visibilityKm: visibilityKm,
        precipitationChance: precipitationChance,
        humidity: humidity,
        asOf: asOf,
        hourly: hourly,
        locationName: locationName,
        attributionLegalUrl: attributionLegalUrl,
        attributionLogoDark: attributionLogoDark,
        attributionLogoLight: attributionLogoLight,
        serviceName: serviceName,
      );

  static WeatherState fromMap(Map<Object?, Object?> m) {
    final c = (m['current'] as Map?) ?? const {};
    final a = (m['attribution'] as Map?) ?? const {};
    double? n(Map src, String k) => (src[k] as num?)?.toDouble();
    DateTime? t(Object? v) =>
        v is num ? DateTime.fromMillisecondsSinceEpoch(v.toInt()) : null;
    return WeatherState(
      condition: c['condition'] as String?,
      symbol: c['symbol'] as String?,
      temperatureC: n(c, 'temperatureC'),
      apparentC: n(c, 'apparentC'),
      windKph: n(c, 'windKph'),
      visibilityKm: n(c, 'visibilityKm'),
      precipitationChance: n(c, 'precipitationChance'),
      humidity: n(c, 'humidity'),
      asOf: t(c['asOf']) ?? DateTime.now(),
      hourly: [
        for (final h in (m['hourly'] as List? ?? const []))
          if (h is Map && h['ts'] is num)
            HourlyWeather(
              time: t(h['ts'])!,
              condition: h['condition'] as String? ?? '',
              symbol: h['symbol'] as String? ?? '',
              temperatureC: n(h, 'temperatureC') ?? 0,
              precipitationChance: n(h, 'precipitationChance') ?? 0,
              windKph: n(h, 'windKph') ?? 0,
            ),
      ],
      locationName: m['locationName'] as String?,
      attributionLegalUrl: a['legalURL'] as String?,
      attributionLogoDark: a['logoDarkURL'] as String?,
      attributionLogoLight: a['logoLightURL'] as String?,
      serviceName: a['serviceName'] as String?,
    );
  }
}

/// WeatherKit conditions. Auto-refreshes every 15 min or after moving 3 km,
/// only while the map view is visible or the HUD weather widget is on.
/// Failures set `error` and keep the last real values — never fake data.
class WeatherController extends Notifier<WeatherState> {
  static const refreshInterval = Duration(minutes: 15);
  static const refreshDistanceM = 3000.0;

  DateTime? _lastFetch;
  LocationFix? _lastFetchFix;
  bool _inFlight = false;
  Timer? _timer;

  @override
  WeatherState build() {
    ref.listen(locationProvider.select((s) => s.fix), (_, fix) {
      if (fix != null) _maybeAutoRefresh();
    });
    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => _maybeAutoRefresh(),
    );
    ref.onDispose(() => _timer?.cancel());
    return const WeatherState();
  }

  bool get _wanted {
    final AppSettings s = ref.read(settingsProvider);
    final session = ref.read(driveSessionProvider);
    return session.view == DriveView.maps || s.hudShowWeather;
  }

  static double distanceM(double lat1, double lon1, double lat2, double lon2) {
    const r = 6371008.8;
    final p1 = lat1 * math.pi / 180, p2 = lat2 * math.pi / 180;
    final dp = p2 - p1, dl = (lon2 - lon1) * math.pi / 180;
    final h =
        math.sin(dp / 2) * math.sin(dp / 2) +
        math.cos(p1) * math.cos(p2) * math.sin(dl / 2) * math.sin(dl / 2);
    return 2 * r * math.asin(math.min(1, math.sqrt(h)));
  }

  void _maybeAutoRefresh() {
    if (!_wanted) return;
    unawaited(refresh());
  }

  Future<void> refresh({bool force = false}) async {
    if (_inFlight) return;
    final fix = ref.read(locationProvider).fix;
    if (fix == null) {
      if (force) state = state.withError('no_location');
      return;
    }
    final now = ref.read(clockProvider)();
    if (!force && _lastFetch != null) {
      final due = now.difference(_lastFetch!) >= refreshInterval;
      final moved =
          _lastFetchFix != null &&
          distanceM(_lastFetchFix!.lat, _lastFetchFix!.lon, fix.lat, fix.lon) >=
              refreshDistanceM;
      if (!due && !moved) return;
    }
    _inFlight = true;
    _lastFetch = now;
    _lastFetchFix = fix;
    state = state.withLoading(true);
    try {
      final m = await ref.read(nativeEngineProvider).weather(fix.lat, fix.lon);
      if (ref.mounted) state = WeatherState.fromMap(m);
    } catch (e) {
      if (ref.mounted) state = state.withError(errorMessage(e));
    } finally {
      _inFlight = false;
    }
  }
}

final weatherProvider = NotifierProvider<WeatherController, WeatherState>(
  WeatherController.new,
);
