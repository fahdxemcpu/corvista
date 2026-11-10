import 'package:intl/intl.dart';

import '../../domain/models/app_settings.dart';
import '../../l10n/app_localizations.dart';
import 'announcement_scheduler.dart';
import 'maneuver.dart';
import 'navigation_models.dart';

/// Builds spoken turn-by-turn prompts. The maneuver phrase is MapKit's own
/// (already localized) instruction; the distance prefix and chaining come
/// from the app's ARB strings.
class GuidanceVoice {
  GuidanceVoice(
    this.l10n, {
    required this.unit,
    required this.locale,
    this.yards = false,
  });

  final AppLocalizations l10n;
  final SpeedUnit unit;
  final String locale;

  /// UK convention: short imperial distances in yards instead of feet.
  final bool yards;

  UnitSystem get units => unit == SpeedUnit.kmh
      ? UnitSystem.metric
      : yards
      ? UnitSystem.imperialYards
      : UnitSystem.imperialFeet;

  /// Within this distance after a maneuver, the following one is chained
  /// ("…, then …").
  static const chainM = 150.0;

  String _num(double v, String pattern) {
    try {
      return NumberFormat(pattern, locale).format(v);
    } catch (_) {
      return NumberFormat(pattern, 'en').format(v);
    }
  }

  /// Rounded, spoken distance ("500 meters", "1.5 kilometers", "0.25 miles").
  String distance(double m) {
    if (unit == SpeedUnit.mph) {
      final miles = m / 1609.344;
      if (miles < 0.2) {
        if (yards) {
          final yd = ((m / .9144) / 50).round() * 50;
          return l10n.navSpokenYards(yd < 50 ? 50 : yd);
        }
        final ft = ((m * 3.28084) / 100).round() * 100;
        return l10n.navSpokenFeet(ft < 100 ? 100 : ft);
      }
      final r = miles < 1
          ? (miles * 4).round() / 4
          : miles < 10
          ? (miles * 2).round() / 2
          : miles.roundToDouble();
      return l10n.navSpokenMiles(r == 1 ? 1 : 2, _num(r, '0.##'));
    }
    if (m < 1000) {
      final r = m < 100 ? (m / 10).round() * 10 : (m / 50).round() * 50;
      if (r >= 1000) return l10n.navSpokenKilometers(1, '1');
      return l10n.navSpokenMeters(r < 10 ? 10 : r);
    }
    final km = m / 1000;
    final r = km < 10 ? (km * 2).round() / 2 : km.roundToDouble();
    return l10n.navSpokenKilometers(r == 1 ? 1 : 2, _num(r, '0.#'));
  }

  static String _clean(String s) => s.trim().replaceAll(RegExp(r'[.。]+$'), '');

  /// Lower-cases the first letter when the phrase follows a prefix (not for
  /// German, where nouns are capitalized).
  String _inner(String s) {
    if (s.isEmpty || locale.startsWith('de')) return s;
    return s[0].toLowerCase() + s.substring(1);
  }

  /// Prompt for [a] or null when there is nothing worth saying.
  String? prompt(Announcement a, Guidance g) {
    final step = g.nextStep;
    if (step == null) return null;
    final text = _clean(step.instructions);
    if (text.isEmpty) return null;
    final arrive = g.maneuver?.type == ManeuverType.arrive;
    // "Continue onto …" needs no action: stay quiet (like Google Maps).
    if (_quiet(g.maneuver)) return null;
    // The arrival itself is announced separately ("You have arrived").
    if (arrive && a.tier == AnnouncementTier.now) return null;

    var phrase = a.tier == AnnouncementTier.now
        ? text
        : l10n.navSpeakIn(distance(a.nominalM), _inner(text));

    final then = g.thenStep;
    final thenD = g.thenDistanceM;
    if (!arrive &&
        then != null &&
        !_quiet(g.thenManeuver) &&
        thenD != null &&
        thenD <= chainM &&
        (a.tier == AnnouncementTier.near ||
            a.tier == AnnouncementTier.now ||
            a.distanceM < 250)) {
      final t2 = _clean(then.instructions);
      if (t2.isNotEmpty) phrase = l10n.navSpeakThen(phrase, _inner(t2));
    }
    return phrase;
  }

  /// "Continue for 5 kilometers" after a maneuver with a long stretch ahead.
  String continueFor(double m) => l10n.navSpeakContinue(distance(m));

  static bool _quiet(Maneuver? m) =>
      m != null &&
      (m.type == ManeuverType.straight || m.type == ManeuverType.depart);
}
