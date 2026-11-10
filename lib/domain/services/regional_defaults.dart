import '../models/app_settings.dart';

/// First-launch defaults that depend on the device region (ISO 3166-1
/// alpha-2). Users can change everything in Settings afterwards.
abstract final class RegionalDefaults {
  /// Countries that sign road speeds in miles per hour.
  static const mphRegions = {'US', 'GB', 'LR', 'MM', 'PR', 'VI', 'GU', 'AS'};

  /// Emergency number to suggest for a road accident (ambulance where it
  /// differs from police). 112 is the GSM-standard fallback that most mobile
  /// networks route to local emergency services.
  static const _emergency = <String, String>{
    // North America & territories
    'US': '911', 'CA': '911', 'MX': '911', 'PR': '911', 'GU': '911',
    'VI': '911', 'AS': '911',
    // UK & Ireland, Commonwealth
    'GB': '999', 'IE': '112', 'HK': '999', 'MY': '999', 'SG': '995',
    'AU': '000', 'NZ': '111', 'ZA': '112', 'IN': '112', 'PK': '1122',
    'BD': '999', 'LK': '1990', 'NG': '112', 'KE': '999',
    // Asia
    'JP': '119', 'KR': '119', 'TW': '119', 'CN': '120', 'TH': '1669',
    'VN': '115', 'PH': '911', 'ID': '112', 'NP': '102',
    // Middle East & North Africa
    'MA': '15', 'DZ': '14', 'TN': '190', 'EG': '123', 'SA': '911',
    'AE': '998', 'QA': '999', 'KW': '112', 'BH': '999', 'OM': '9999',
    'JO': '911', 'LB': '140', 'IL': '101', 'TR': '112', 'IR': '115',
    // Latin America
    'BR': '192', 'AR': '107', 'CL': '131', 'CO': '123', 'PE': '117',
    'VE': '911', 'UY': '911', 'EC': '911', 'BO': '165', 'PY': '911',
    'CR': '911', 'PA': '911', 'GT': '1502', 'DO': '911',
    // Europe (112 everywhere in the EU/EEA; listed for clarity)
    'RU': '112', 'UA': '112', 'CH': '144',
  };

  static String emergencyNumber(String? region) =>
      _emergency[region?.toUpperCase()] ?? '112';

  static SpeedUnit speedUnit(String? region) =>
      mphRegions.contains(region?.toUpperCase())
      ? SpeedUnit.mph
      : SpeedUnit.kmh;

  /// Applies region defaults to a fresh (never-saved) settings object.
  static AppSettings apply(AppSettings s, String? region) => s.copyWith(
    speedUnit: speedUnit(region),
    emergencyNumber: emergencyNumber(region),
  );
}
