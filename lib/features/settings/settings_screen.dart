import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import 'widgets/settings_sections_capture.dart';
import 'widgets/settings_sections_general.dart';
import '../trips/widgets/trip_settings_section.dart';

/// All app preferences, grouped by section. Every control persists through
/// `settingsProvider.update`. Not meant to be used while driving.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settingsTitle)),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: ListView(
              padding: const EdgeInsetsDirectional.only(bottom: 32),
              children: const [
                CameraSettingsSection(),
                AiSettingsSection(),
                AlertSettingsSection(),
                RecordingSettingsSection(),
                TripSettingsSection(),
                DrivingSettingsSection(),
                PowerSettingsSection(),
                EmergencySettingsSection(),
                AppearanceSettingsSection(),
                PrivacyDataSettingsSection(),
                InformationSettingsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
