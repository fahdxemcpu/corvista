import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../app/router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/common.dart';
import '../../l10n/l10n.dart';

/// First-run permissions: one honest line per permission, then "Allow all"
/// shows the iOS prompts one after another (camera → location → microphone →
/// speech). Notifications are not used and never requested. Each row shows
/// its status and offers Open Settings once denied.
class PermissionsScreen extends ConsumerStatefulWidget {
  const PermissionsScreen({super.key});

  /// Request order on "Allow all".
  static const sequence = [
    AppPermission.camera,
    AppPermission.locationWhenInUse,
    AppPermission.microphone,
    AppPermission.speech,
  ];

  @override
  ConsumerState<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends ConsumerState<PermissionsScreen>
    with WidgetsBindingObserver {
  AppPermission? _asking;
  bool _running = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) unawaited(ref.read(permissionsProvider.notifier).refresh());
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Returning from the Settings app (or a system prompt): re-read statuses.
    if (state == AppLifecycleState.resumed && !_running) {
      unawaited(ref.read(permissionsProvider.notifier).refresh());
    }
  }

  PermissionStatus _status(AppPermission p) =>
      ref.read(permissionsProvider)[p] ?? PermissionStatus.notDetermined;

  Future<void> _request(AppPermission p) async {
    setState(() => _asking = p);
    try {
      await ref.read(permissionsProvider.notifier).request(p);
    } finally {
      if (mounted) setState(() => _asking = null);
    }
  }

  Future<void> _allowAll() async {
    if (_running) return;
    setState(() => _running = true);
    try {
      for (final p in PermissionsScreen.sequence) {
        if (!mounted) return;
        if (_status(p) != PermissionStatus.notDetermined) continue;
        await _request(p);
      }
    } finally {
      if (mounted) setState(() => _running = false);
    }
    if (!mounted) return;
    final allGranted = PermissionsScreen.sequence.every(
      (p) => _status(p).isGranted,
    );
    if (allGranted) await _finish();
  }

  Future<void> _finish() async {
    await ref
        .read(settingsProvider.notifier)
        .update((s) => s.copyWith(onboardingDone: true));
    if (mounted) context.go(Routes.drive);
  }

  String _title(AppLocalizations l10n, AppPermission p) => switch (p) {
    AppPermission.camera => l10n.permCameraTitle,
    AppPermission.locationWhenInUse => l10n.permLocationTitle,
    AppPermission.microphone => l10n.permMicTitle,
    AppPermission.speech => l10n.permSpeechTitle,
    AppPermission.notifications => '',
  };

  @override
  Widget build(BuildContext context) {
    final perms = ref.watch(permissionsProvider);
    final l10n = context.l10n;
    final theme = Theme.of(context);
    PermissionStatus st(AppPermission p) =>
        perms[p] ?? PermissionStatus.notDetermined;
    final pending = PermissionsScreen.sequence.any(
      (p) => st(p) == PermissionStatus.notDetermined,
    );
    final anyDenied = PermissionsScreen.sequence.any(
      (p) =>
          st(p) == PermissionStatus.denied ||
          st(p) == PermissionStatus.restricted,
    );
    final cameraDenied = st(AppPermission.camera) == PermissionStatus.denied;

    final rows = [
      (AppPermission.camera, Icons.videocam_rounded, l10n.permCameraLine, true),
      (
        AppPermission.locationWhenInUse,
        Icons.location_on_rounded,
        l10n.permLocationLine,
        false,
      ),
      (AppPermission.microphone, Icons.mic_rounded, l10n.permMicLine, false),
      (
        AppPermission.speech,
        Icons.record_voice_over_rounded,
        l10n.permSpeechLine,
        false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.permTitle)),
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: ListView(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 24),
              children: [
                Text(
                  l10n.permSetupIntro,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      for (var i = 0; i < rows.length; i++) ...[
                        if (i > 0) const Divider(indent: 72),
                        _PermissionRow(
                          key: ValueKey('perm-${rows[i].$1.name}'),
                          icon: rows[i].$2,
                          title: _title(l10n, rows[i].$1),
                          line: rows[i].$3,
                          required: rows[i].$4,
                          status: st(rows[i].$1),
                          asking: _asking == rows[i].$1,
                          busy: _running || _asking != null,
                          onAllow: () => unawaited(_request(rows[i].$1)),
                        ),
                      ],
                    ],
                  ),
                ),
                if (anyDenied) ...[
                  const SizedBox(height: 16),
                  InfoBanner(
                    tone: BannerTone.warning,
                    message: cameraDenied
                        ? l10n.permCameraNeeded
                        : l10n.permSomeDenied,
                    actionLabel: l10n.commonOpenSettings,
                    onAction: () => unawaited(
                      ref.read(permissionsProvider.notifier).openSettings(),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 8, 20, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (pending || _running)
                FilledButton(
                  key: const ValueKey('permissions-allow-all'),
                  onPressed: _running ? null : () => unawaited(_allowAll()),
                  child: _running && _asking != null
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox.square(
                              dimension: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            const SizedBox(width: 12),
                            Flexible(
                              child: Text(
                                l10n.permAsking(_title(l10n, _asking!)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      : Text(l10n.permAllowAll),
                ),
              if (pending || _running)
                TextButton(
                  key: const ValueKey('permissions-not-now'),
                  onPressed: _running ? null : () => unawaited(_finish()),
                  style: TextButton.styleFrom(
                    minimumSize: const Size(64, 48),
                    foregroundColor: theme.colorScheme.onSurfaceVariant,
                  ),
                  child: Text(l10n.permNotNow),
                )
              else
                FilledButton(
                  key: const ValueKey('permissions-start'),
                  onPressed: () => unawaited(_finish()),
                  child: Text(l10n.permStart),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PermissionRow extends ConsumerWidget {
  const _PermissionRow({
    super.key,
    required this.icon,
    required this.title,
    required this.line,
    required this.required,
    required this.status,
    required this.asking,
    required this.busy,
    required this.onAllow,
  });

  final IconData icon;
  final String title, line;
  final bool required, asking, busy;
  final PermissionStatus status;
  final VoidCallback onAllow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final Widget trailing = switch (status) {
      _ when asking => const SizedBox.square(
        dimension: 22,
        child: CircularProgressIndicator(strokeWidth: 2.2),
      ),
      PermissionStatus.granted => _StatusPill(
        Icons.check_circle_rounded,
        l10n.permGranted,
        AppColors.green,
      ),
      PermissionStatus.limited => _StatusPill(
        Icons.check_circle_outline_rounded,
        l10n.permLimited,
        AppColors.green,
      ),
      PermissionStatus.denied => TextButton(
        onPressed: () =>
            unawaited(ref.read(permissionsProvider.notifier).openSettings()),
        style: TextButton.styleFrom(minimumSize: const Size(48, 44)),
        child: Text(l10n.commonOpenSettings),
      ),
      PermissionStatus.restricted => _StatusPill(
        Icons.block_rounded,
        l10n.permRestricted,
        AppColors.amber,
      ),
      PermissionStatus.notDetermined => OutlinedButton(
        onPressed: busy ? null : onAllow,
        style: OutlinedButton.styleFrom(minimumSize: const Size(72, 44)),
        child: Text(l10n.permAllow),
      ),
    };
    final statusText = switch (status) {
      PermissionStatus.granted => l10n.permGranted,
      PermissionStatus.limited => l10n.permLimited,
      PermissionStatus.denied => l10n.permDenied,
      PermissionStatus.restricted => l10n.permRestricted,
      PermissionStatus.notDetermined => '',
    };
    return Semantics(
      container: true,
      label: '$title. $line. $statusText',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 14, 12, 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.cyan.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.cyan, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ExcludeSemantics(
                          child: Wrap(
                            spacing: 8,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(title, style: theme.textTheme.titleMedium),
                              Text(
                                required
                                    ? l10n.permRequired
                                    : l10n.permOptional,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: required
                                      ? AppColors.amber
                                      : theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      trailing,
                    ],
                  ),
                  const SizedBox(height: 2),
                  ExcludeSemantics(
                    child: Text(line, style: theme.textTheme.bodyMedium),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill(this.icon, this.label, this.color);

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, color: color, size: 20),
      const SizedBox(width: 6),
      Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    ],
  );
}
