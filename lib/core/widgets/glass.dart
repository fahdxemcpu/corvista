import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Translucent, blurred instrument panel used over camera / map content.
class GlassPanel extends StatelessWidget {
  const GlassPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsetsDirectional.symmetric(
      horizontal: 14,
      vertical: 10,
    ),
    this.radius = 18,
    this.blur = 18,
    this.color,
    this.borderColor,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final double blur;
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final br = BorderRadius.circular(radius);
    return ClipRRect(
      borderRadius: br,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color ?? AppColors.glass,
            borderRadius: br,
            border: Border.all(
              color: borderColor ?? AppColors.glassBorder,
              width: .5,
            ),
          ),
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}

/// Round glass button with a guaranteed touch target (default 56 pt).
class GlassIconButton extends StatelessWidget {
  const GlassIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.label,
    this.size = 56,
    this.iconColor,
    this.active = false,
    this.badge,
  });

  final IconData icon;
  final VoidCallback? onPressed;

  /// Accessibility label + tooltip.
  final String label;
  final double size;
  final Color? iconColor;
  final bool active;
  final Widget? badge;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      child: Tooltip(
        message: label,
        child: SizedBox.square(
          dimension: size,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: GlassPanel(
                  radius: size / 2,
                  padding: EdgeInsets.zero,
                  color: active ? AppColors.cyan.withValues(alpha: .22) : null,
                  borderColor: active
                      ? AppColors.cyan.withValues(alpha: .6)
                      : null,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: onPressed,
                      child: Center(
                        child: Icon(
                          icon,
                          size: size * .42,
                          color:
                              (iconColor ??
                                      (active
                                          ? AppColors.cyan
                                          : AppColors.textPrimary))
                                  .withValues(alpha: enabled ? 1 : .4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (badge != null)
                PositionedDirectional(top: -2, end: -2, child: badge!),
            ],
          ),
        ),
      ),
    );
  }
}

/// Small rounded chip used in HUD strips (icon + text).
class GlassChip extends StatelessWidget {
  const GlassChip({
    super.key,
    required this.child,
    this.icon,
    this.iconColor,
    this.onTap,
    this.semanticLabel,
  });

  final Widget child;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onTap;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final content = GlassPanel(
      radius: 14,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 15, color: iconColor ?? AppColors.textSecondary),
            const SizedBox(width: 6),
          ],
          DefaultTextStyle.merge(
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              fontFeatures: [FontFeature.tabularFigures()],
            ),
            child: child,
          ),
        ],
      ),
    );
    if (onTap == null) {
      return Semantics(label: semanticLabel, child: content);
    }
    return Semantics(
      button: true,
      label: semanticLabel,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: content,
      ),
    );
  }
}
