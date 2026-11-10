import '../services/regional_defaults.dart';
import '../../data/database/database.dart';
import '../models/app_settings.dart';

const settingsKey = 'app';

/// Loads persisted settings (defaults when missing or unreadable).
/// Loads persisted settings. On first launch (nothing saved yet) returns
/// defaults adapted to [region] (device country code): speed unit and
/// emergency number.
Future<AppSettings> loadSettings(AppDatabase db, {String? region}) async {
  try {
    final raw = await db.readSetting(settingsKey);
    if (raw == null || raw.isEmpty) {
      return RegionalDefaults.apply(const AppSettings(), region);
    }
    return AppSettings.decode(raw);
  } catch (_) {
    return const AppSettings();
  }
}

Future<void> saveSettings(AppDatabase db, AppSettings s) =>
    db.writeSetting(settingsKey, s.encode());
