import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../domain/models/app_settings.dart';

/// Locale-aware number/date formatting helpers. All numeric UI uses tabular
/// figures (see `tabular` in app_theme.dart).
abstract final class Fmt {
  static String _locale(BuildContext context) =>
      Localizations.localeOf(context).toLanguageTag();

  /// m/s → display speed integer in [unit]; null when invalid.
  static int? speed(double? mps, SpeedUnit unit) {
    if (mps == null || mps < 0) return null;
    final v = unit == SpeedUnit.kmh ? mps * 3.6 : mps * 2.2369362921;
    return v.round();
  }

  static double kmhToUnit(double kmh, SpeedUnit unit) =>
      unit == SpeedUnit.kmh ? kmh : kmh * 0.621371;

  /// Route / navigation distance (real geometry, not a visual estimate).
  static String routeDistance(
    BuildContext context,
    double meters,
    SpeedUnit unit,
  ) => routeDistanceIn(_locale(context), meters, unit);

  /// [routeDistance] for a BCP-47 [loc] (no widget context, e.g. Live Activity).
  static String routeDistanceIn(String loc, double meters, SpeedUnit unit) {
    if (unit == SpeedUnit.mph) {
      final miles = meters / 1609.344;
      if (miles < 0.1) {
        final ft = (meters * 3.28084 / 50).round() * 50;
        return '${NumberFormat.decimalPattern(loc).format(ft)} ft';
      }
      return '${NumberFormat(miles < 10 ? '0.0' : '0', loc).format(miles)} mi';
    }
    if (meters < 1000) {
      final m = meters < 100
          ? (meters / 10).round() * 10
          : (meters / 50).round() * 50;
      return '${NumberFormat.decimalPattern(loc).format(m)} m';
    }
    final km = meters / 1000;
    return '${NumberFormat(km < 10 ? '0.0' : '0', loc).format(km)} km';
  }

  static String bytes(BuildContext context, int bytes) {
    final loc = _locale(context);
    const units = ['B', 'KB', 'MB', 'GB', 'TB'];
    var v = bytes.toDouble();
    var i = 0;
    while (v >= 1000 && i < units.length - 1) {
      v /= 1000;
      i++;
    }
    final f = NumberFormat(i == 0 || v >= 100 ? '0' : '0.0', loc);
    return '${f.format(v)} ${units[i]}';
  }

  /// 0:42, 12:05, 1:02:03
  static String clock(Duration d) {
    final h = d.inHours,
        m = d.inMinutes.remainder(60),
        s = d.inSeconds.remainder(60);
    String two(int n) => n.toString().padLeft(2, '0');
    return h > 0 ? '$h:${two(m)}:${two(s)}' : '$m:${two(s)}';
  }

  static String time(BuildContext context, DateTime t) {
    final use24 = MediaQuery.maybeAlwaysUse24HourFormatOf(context) ?? false;
    return (use24
            ? DateFormat.Hm(_locale(context))
            : DateFormat.jm(_locale(context)))
        .format(t);
  }

  static String dateTime(BuildContext context, DateTime t) =>
      '${DateFormat.yMMMd(_locale(context)).format(t)} · ${time(context, t)}';

  static String date(BuildContext context, DateTime t) =>
      DateFormat.yMMMEd(_locale(context)).format(t);

  static String number(BuildContext context, num v, {int decimals = 0}) =>
      NumberFormat(
        decimals == 0 ? '#,##0' : '#,##0.${'0' * decimals}',
        _locale(context),
      ).format(v);

  static String percent(BuildContext context, double fraction) =>
      NumberFormat.percentPattern(_locale(context)).format(fraction);

  /// Celsius → display string using locale preference (°F for US-style mph users).
  static String temperature(double c, SpeedUnit unit) {
    final v = unit == SpeedUnit.mph ? c * 9 / 5 + 32 : c;
    return '${v.round()}°';
  }

  static String wind(BuildContext context, double kph, SpeedUnit unit) =>
      unit == SpeedUnit.mph
      ? '${(kph * 0.621371).round()} mph'
      : '${kph.round()} km/h';

  static String visibility(BuildContext context, double km, SpeedUnit unit) =>
      unit == SpeedUnit.mph
      ? '${NumberFormat('0.#', _locale(context)).format(km * 0.621371)} mi'
      : '${NumberFormat('0.#', _locale(context)).format(km)} km';

  /// 8 compass points for a heading in degrees.
  static String compassPoint(double deg) {
    const pts = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    return pts[((deg % 360) / 45).round() % 8];
  }
}
