import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:corvista/app/providers.dart';

import 'package:corvista/app/router.dart';
import 'package:corvista/core/theme/app_colors.dart';
import 'package:corvista/l10n/l10n.dart';

/// Content revision date for the in-app Safety / Privacy / Terms texts.
final _revised = DateTime(2026, 11, 1);

class _Section {
  const _Section(this.icon, this.title, this.bullets);

  final IconData icon;
  final String title;
  final List<String> bullets;
}

/// Readable long-form page: intro + titled sections of bullets.
class _InfoPage extends StatelessWidget {
  const _InfoPage({
    required this.title,
    required this.intro,
    required this.sections,
  });

  final String title;
  final String intro;
  final List<_Section> sections;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Align(
        alignment: AlignmentDirectional.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: ListView(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 8, 20, 40),
            children: [
              Text(
                intro,
                style: theme.textTheme.bodyLarge?.copyWith(height: 1.45),
              ),
              for (final s in sections) ...[
                const SizedBox(height: 28),
                Semantics(
                  header: true,
                  child: Row(
                    children: [
                      Icon(s.icon, color: AppColors.cyan, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          s.title,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                for (final b in s.bullets)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      bottom: 10,
                      start: 4,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            top: 8,
                            end: 12,
                          ),
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.onSurfaceVariant,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            b,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              height: 1.45,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
              const SizedBox(height: 28),
              Text(
                l10n.infoLastUpdated(
                  MaterialLocalizations.of(context).formatMediumDate(_revised),
                ),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return _InfoPage(
      title: l10n.safetyTitle,
      intro: l10n.safetyIntro,
      sections: [
        _Section(Icons.phone_iphone_rounded, l10n.safetyBeforeTitle, [
          l10n.safetyBefore1,
          l10n.safetyBefore2,
          l10n.safetyBefore3,
        ]),
        _Section(Icons.visibility_rounded, l10n.safetyWhileTitle, [
          l10n.safetyWhile1,
          l10n.safetyWhile2,
          l10n.safetyWhile3,
        ]),
        _Section(Icons.center_focus_weak_rounded, l10n.safetyLimitsTitle, [
          l10n.safetyLimits1,
          l10n.safetyLimits2,
          l10n.safetyLimits3,
          l10n.safetyLimits4,
        ]),
        _Section(Icons.thermostat_rounded, l10n.safetyHeatTitle, [
          l10n.safetyHeat1,
        ]),
        _Section(Icons.emergency_outlined, l10n.safetyEmergencyTitle, [
          l10n.safetyEmergency1,
          l10n.safetyEmergency2,
        ]),
      ],
    );
  }
}

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return _InfoPage(
      title: l10n.privacyTitle,
      intro: l10n.privacyIntro,
      sections: [
        _Section(Icons.memory_rounded, l10n.privacyCameraTitle, [
          l10n.privacyCamera1,
          l10n.privacyCamera2,
        ]),
        _Section(Icons.video_library_outlined, l10n.privacyRecordingsTitle, [
          l10n.privacyRecordings1,
          l10n.privacyRecordings2,
          l10n.privacyRecordings3,
        ]),
        _Section(Icons.near_me_outlined, l10n.privacyLocationTitle, [
          l10n.privacyLocation1,
        ]),
        _Section(Icons.cloud_outlined, l10n.privacyNetworkTitle, [
          l10n.privacyNetwork1,
          l10n.privacyNetwork2,
          l10n.privacyNetwork4,
        ]),
        _Section(Icons.contact_phone_outlined, l10n.privacyEmergencyTitle, [
          l10n.privacyEmergency1,
        ]),
        _Section(Icons.tune_rounded, l10n.privacyControlsTitle, [
          l10n.privacyControls1,
          l10n.privacyDiagnostics1,
          l10n.privacyControls2,
        ]),
      ],
    );
  }
}

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return _InfoPage(
      title: l10n.termsTitle,
      intro: l10n.termsIntro,
      sections: [
        _Section(Icons.directions_car_outlined, l10n.termsUseTitle, [
          l10n.termsUse1,
          l10n.termsUse2,
        ]),
        _Section(Icons.report_gmailerrorred_rounded, l10n.termsAccuracyTitle, [
          l10n.termsAccuracy1,
          l10n.termsAccuracy2,
        ]),
        _Section(Icons.gavel_rounded, l10n.termsRecordingTitle, [
          l10n.termsRecording1,
        ]),
        _Section(Icons.shield_outlined, l10n.termsLiabilityTitle, [
          l10n.termsLiability1,
        ]),
        _Section(Icons.update_rounded, l10n.termsChangesTitle, [
          l10n.termsChanges1,
        ]),
      ],
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final faq = [
      (l10n.helpQSave, l10n.helpASaveBuffer),
      (l10n.helpQWhere, l10n.helpAWhere),
      (l10n.helpQZones, l10n.helpAZones),
      (l10n.helpQSlow, l10n.helpASlow),
      (l10n.helpQMap, l10n.helpAMap),
      (l10n.helpQSimulator, l10n.helpASimulator),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(l10n.helpTitle)),
      body: Align(
        alignment: AlignmentDirectional.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: ListView(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 40),
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 12),
                child: Text(l10n.helpIntro, style: theme.textTheme.bodyMedium),
              ),
              const _TakeTourCard(),
              const SizedBox(height: 16),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    for (var i = 0; i < faq.length; i++) ...[
                      if (i > 0) const Divider(indent: 16),
                      Theme(
                        data: theme.copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(
                            faq[i].$1,
                            style: theme.textTheme.titleSmall,
                          ),
                          iconColor: AppColors.cyan,
                          childrenPadding: const EdgeInsetsDirectional.fromSTEB(
                            16,
                            0,
                            16,
                            16,
                          ),
                          expandedAlignment: AlignmentDirectional.centerStart,
                          children: [
                            Text(
                              faq[i].$2,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                height: 1.45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () => context.push(Routes.safety),
                icon: const Icon(Icons.health_and_safety_outlined),
                label: Text(l10n.safetyTitle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Replays the Drive-screen coach-mark tour.
class _TakeTourCard extends ConsumerWidget {
  const _TakeTourCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        key: const ValueKey('help-take-tour'),
        minTileHeight: 64,
        leading: const Icon(Icons.tour_rounded, color: AppColors.cyan),
        title: Text(l10n.helpTakeTour),
        subtitle: Text(l10n.helpTakeTourSub),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () async {
          await ref
              .read(settingsProvider.notifier)
              .update((s) => s.copyWith(tourDone: false));
          if (context.mounted) context.go(Routes.drive);
        },
      ),
    );
  }
}
