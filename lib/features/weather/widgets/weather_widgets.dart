import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common.dart';
import '../../../core/widgets/format.dart';
import '../../../l10n/l10n.dart';

/// Maps an SF Symbol weather name (WeatherKit `symbolName`) to a Material icon.
IconData weatherIcon(String? symbol) {
  final s = symbol ?? '';
  if (s.contains('bolt')) return Icons.thunderstorm_rounded;
  if (s.contains('snow') || s.contains('sleet')) return Icons.ac_unit_rounded;
  if (s.contains('rain') || s.contains('drizzle')) {
    return Icons.water_drop_rounded;
  }
  if (s.contains('fog') || s.contains('haze') || s.contains('smoke')) {
    return Icons.foggy;
  }
  if (s.contains('wind')) return Icons.air_rounded;
  if (s.contains('moon')) {
    return s.contains('cloud')
        ? Icons.nights_stay_rounded
        : Icons.dark_mode_rounded;
  }
  if (s.contains('sun') && s.contains('cloud')) return Icons.wb_cloudy_rounded;
  if (s.contains('cloud')) return Icons.cloud_rounded;
  if (s.contains('sun')) return Icons.wb_sunny_rounded;
  return Icons.thermostat_rounded;
}

Future<void> showWeatherSheet(BuildContext context) =>
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => const WeatherSheet(),
    );

/// Weather detail sheet: current conditions, hourly forecast and the
/// attribution WeatherKit requires (provider mark + legal link).
class WeatherSheet extends ConsumerStatefulWidget {
  const WeatherSheet({super.key});

  @override
  ConsumerState<WeatherSheet> createState() => _WeatherSheetState();
}

class _WeatherSheetState extends ConsumerState<WeatherSheet> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) unawaited(ref.read(weatherProvider.notifier).refresh());
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = ref.watch(weatherProvider);
    final unit = ref.watch(settingsProvider.select((s) => s.speedUnit));
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;

    Widget content;
    if (!w.hasData) {
      content = Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: w.loading
            ? const Center(child: CircularProgressIndicator())
            : EmptyState(
                icon: Icons.cloud_off_rounded,
                title: w.error == 'no_location'
                    ? l10n.weatherNoLocation
                    : l10n.weatherUnavailable,
                // The native message (e.g. WeatherKit not entitled on
                // unsigned builds) is not useful to drivers: stay calm.
                message: null,
                actionLabel: l10n.commonRetry,
                onAction: () => unawaited(
                  ref.read(weatherProvider.notifier).refresh(force: true),
                ),
              ),
      );
    } else {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(weatherIcon(w.symbol), size: 54, color: AppColors.cyan),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      w.temperatureC == null
                          ? '--'
                          : Fmt.temperature(w.temperatureC!, unit),
                      style: theme.textTheme.displayMedium,
                    ),
                    Text(w.condition ?? '', style: theme.textTheme.titleMedium),
                    if (w.apparentC != null)
                      Text(
                        l10n.weatherFeelsLike(
                          Fmt.temperature(w.apparentC!, unit),
                        ),
                        style: theme.textTheme.bodyMedium,
                      ),
                  ],
                ),
              ),
              IconButton(
                tooltip: l10n.weatherRefresh,
                onPressed: w.loading
                    ? null
                    : () => unawaited(
                        ref.read(weatherProvider.notifier).refresh(force: true),
                      ),
                icon: w.loading
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.refresh_rounded),
              ),
            ],
          ),
          if (w.locationName != null) ...[
            const SizedBox(height: 4),
            Text(w.locationName!, style: theme.textTheme.bodyMedium),
          ],
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              if (w.precipitationChance != null)
                _Metric(
                  Icons.umbrella_rounded,
                  l10n.weatherPrecipitation,
                  Fmt.percent(context, w.precipitationChance!),
                ),
              if (w.windKph != null)
                _Metric(
                  Icons.air_rounded,
                  l10n.weatherWind,
                  Fmt.wind(context, w.windKph!, unit),
                ),
              if (w.visibilityKm != null)
                _Metric(
                  Icons.visibility_rounded,
                  l10n.weatherVisibility,
                  Fmt.visibility(context, w.visibilityKm!, unit),
                ),
              if (w.humidity != null)
                _Metric(
                  Icons.opacity_rounded,
                  l10n.weatherHumidity,
                  Fmt.percent(context, w.humidity!),
                ),
            ],
          ),
          if (w.hourly.isNotEmpty) ...[
            const SizedBox(height: 24),
            Text(l10n.weatherHourly, style: theme.textTheme.titleMedium),
            const SizedBox(height: 10),
            SizedBox(
              height: 116,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: w.hourly.length.clamp(0, 24),
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final h = w.hourly[i];
                  return Container(
                    width: 64,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          i == 0 ? l10n.weatherNow : Fmt.time(context, h.time),
                          style: theme.textTheme.labelSmall,
                          maxLines: 1,
                        ),
                        Icon(
                          weatherIcon(h.symbol),
                          size: 22,
                          color: AppColors.cyan,
                        ),
                        Text(
                          Fmt.temperature(h.temperatureC, unit),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFeatures: [FontFeature.tabularFigures()],
                          ),
                        ),
                        Text(
                          Fmt.percent(context, h.precipitationChance),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: AppColors.blue,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
          if (w.asOf != null) ...[
            const SizedBox(height: 16),
            Text(
              l10n.weatherAsOf(Fmt.time(context, w.asOf!)),
              style: theme.textTheme.bodySmall,
            ),
          ],
        ],
      );
    }

    final logo = dark ? w.attributionLogoDark : w.attributionLogoLight;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.weatherTitle, style: theme.textTheme.titleLarge),
            const SizedBox(height: 16),
            content,
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),
            // Required WeatherKit attribution.
            Row(
              children: [
                if (logo != null)
                  Image.network(
                    logo,
                    height: 16,
                    errorBuilder: (_, _, _) => Text(
                      l10n.weatherProvidedBy(w.serviceName ?? 'Apple Weather'),
                    ),
                  )
                else
                  Text(
                    l10n.weatherProvidedBy(w.serviceName ?? 'Apple Weather'),
                    style: theme.textTheme.bodySmall,
                  ),
                const Spacer(),
                TextButton(
                  onPressed: () => unawaited(
                    launchUrl(
                      Uri.parse(
                        w.attributionLegalUrl ?? 'https://weatherkit.apple.com/legal-attribution.html',
                      ),
                      mode: LaunchMode.externalApplication,
                    ),
                  ),
                  child: Text(l10n.weatherLegal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric(this.icon, this.label, this.value);

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(minWidth: 140),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: theme.textTheme.labelSmall),
              Text(
                value,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
