import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../theme/app_colors.dart';

/// Coloured status dot with an optional soft glow.
class StatusDot extends StatelessWidget {
  const StatusDot({super.key, required this.color, this.size = 8});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(color: color.withValues(alpha: .55), blurRadius: size),
      ],
    ),
  );
}

/// Grouped card section with optional header/footer, for settings-like lists.
class CvSection extends StatelessWidget {
  const CvSection({super.key, this.title, this.footer, required this.children});

  final String? title;
  final String? footer;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4, 8, 4, 8),
              child: Text(
                title!.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                for (var i = 0; i < children.length; i++) ...[
                  if (i > 0) const Divider(indent: 16),
                  children[i],
                ],
              ],
            ),
          ),
          if (footer != null)
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4, 8, 4, 0),
              child: Text(
                footer!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

enum BannerTone { info, warning, error }

/// Inline contextual banner (permission denied, offline, limitations…).
class InfoBanner extends StatelessWidget {
  const InfoBanner({
    super.key,
    required this.message,
    this.icon,
    this.tone = BannerTone.info,
    this.actionLabel,
    this.onAction,
    this.onDismiss,
    this.glass = false,
  });

  final String message;
  final IconData? icon;
  final BannerTone tone;
  final String? actionLabel;
  final VoidCallback? onAction;
  final VoidCallback? onDismiss;

  /// Use the translucent glass look (over camera/map).
  final bool glass;

  Color get _accent => switch (tone) {
    BannerTone.info => AppColors.cyan,
    BannerTone.warning => AppColors.amber,
    BannerTone.error => AppColors.red,
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      liveRegion: tone != BannerTone.info,
      child: Container(
        padding: const EdgeInsetsDirectional.fromSTEB(14, 10, 8, 10),
        decoration: BoxDecoration(
          color: glass ? AppColors.glass : _accent.withValues(alpha: .10),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _accent.withValues(alpha: .45), width: .8),
        ),
        child: Row(
          children: [
            Icon(
              icon ??
                  switch (tone) {
                    BannerTone.info => Icons.info_outline_rounded,
                    BannerTone.warning => Icons.warning_amber_rounded,
                    BannerTone.error => Icons.error_outline_rounded,
                  },
              color: _accent,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: glass
                      ? AppColors.textPrimary
                      : theme.colorScheme.onSurface,
                  height: 1.3,
                ),
              ),
            ),
            if (actionLabel != null && onAction != null)
              TextButton(
                onPressed: onAction,
                style: TextButton.styleFrom(
                  foregroundColor: _accent,
                  minimumSize: const Size(48, 44),
                ),
                child: Text(
                  actionLabel!,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            if (onDismiss != null)
              IconButton(
                onPressed: onDismiss,
                tooltip: context.l10n.commonClose,
                icon: const Icon(Icons.close_rounded, size: 18),
              ),
          ],
        ),
      ),
    );
  }
}

/// Centered empty / unavailable state with icon, title, message and action.
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.message,
    this.actionLabel,
    this.onAction,
    this.secondary,
  });

  final IconData icon;
  final String title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Widget? secondary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cyan.withValues(alpha: .10),
                  border: Border.all(
                    color: AppColors.cyan.withValues(alpha: .35),
                  ),
                ),
                child: Icon(icon, size: 32, color: AppColors.cyan),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge,
              ),
              if (message != null) ...[
                const SizedBox(height: 8),
                Text(
                  message!,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
              if (actionLabel != null && onAction != null) ...[
                const SizedBox(height: 24),
                FilledButton(onPressed: onAction, child: Text(actionLabel!)),
              ],
              if (secondary != null) ...[const SizedBox(height: 8), secondary!],
            ],
          ),
        ),
      ),
    );
  }
}

/// Shows a destructive/neutral confirmation dialog. Returns true on confirm.
Future<bool> confirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmLabel,
  bool destructive = true,
}) async {
  final l10n = context.l10n;
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: Text(l10n.commonCancel),
        ),
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          style: TextButton.styleFrom(
            foregroundColor: destructive ? AppColors.red : AppColors.cyan,
          ),
          child: Text(
            confirmLabel,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    ),
  );
  return ok ?? false;
}

/// Shows a floating snackbar, replacing any current one.
void showSnack(
  BuildContext context,
  String message, {
  String? actionLabel,
  VoidCallback? onAction,
}) {
  final m = ScaffoldMessenger.maybeOf(context);
  if (m == null) return;
  m
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
        // Snackbars with an action persist by default; on a driving UI they
        // must always auto-dismiss.
        persist: false,
        duration: const Duration(seconds: 4),
        action: actionLabel != null && onAction != null
            ? SnackBarAction(label: actionLabel, onPressed: onAction)
            : null,
      ),
    );
}
