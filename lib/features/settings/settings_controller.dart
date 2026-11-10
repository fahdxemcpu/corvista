import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/database.dart';
import '../../domain/models/app_settings.dart';
import '../../domain/repositories/settings_repository.dart';

/// Settings loaded before `runApp` (see `bootstrap()`); defaults otherwise.
final initialSettingsProvider = Provider<AppSettings>(
  (ref) => const AppSettings(),
);

/// Stored user preferences (what the user chose).
class SettingsController extends Notifier<AppSettings> {
  @override
  AppSettings build() => ref.read(initialSettingsProvider);

  /// Applies [f] and persists the result to Drift.
  Future<void> update(AppSettings Function(AppSettings s) f) async {
    final next = f(state);
    state = next;
    await saveSettings(ref.read(databaseProvider), next);
  }

  /// Re-reads persisted settings (e.g. after a restore).
  Future<void> reload() async {
    final s = await loadSettings(ref.read(databaseProvider));
    if (ref.mounted) state = s;
  }
}

final settingsProvider = NotifierProvider<SettingsController, AppSettings>(
  SettingsController.new,
);
