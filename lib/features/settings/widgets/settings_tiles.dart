import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class _TileIcon extends StatelessWidget {
  const _TileIcon(this.icon);
  final IconData icon;

  @override
  Widget build(BuildContext context) => Icon(icon, size: 22);
}

/// Switch row.
class SettingSwitchTile extends StatelessWidget {
  const SettingSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.icon,
  });

  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: icon == null ? null : _TileIcon(icon!),
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle!),
      value: value,
      onChanged: onChanged,
    );
  }
}

/// Slider row with a tabular value readout. The value is committed on drag end
/// (so persistence is not hammered while dragging).
class SettingSliderTile extends StatefulWidget {
  const SettingSliderTile({
    super.key,
    required this.title,
    required this.value,
    required this.min,
    required this.max,
    required this.format,
    required this.onChanged,
    this.divisions,
    this.icon,
    this.enabled = true,
  });

  final String title;
  final double value;
  final double min;
  final double max;
  final int? divisions;
  final String Function(double v) format;
  final ValueChanged<double> onChanged;
  final IconData? icon;
  final bool enabled;

  @override
  State<SettingSliderTile> createState() => _SettingSliderTileState();
}

class _SettingSliderTileState extends State<SettingSliderTile> {
  double? _drag;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final v = (_drag ?? widget.value).clamp(widget.min, widget.max);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  size: 22,
                  color: theme.listTileTheme.iconColor,
                ),
                const SizedBox(width: 16),
              ],
              Expanded(
                child: Text(widget.title, style: theme.textTheme.bodyLarge),
              ),
              Text(
                widget.format(v),
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontFeatures: tabular,
                  color: AppColors.cyan,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Slider(
            value: v,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            semanticFormatterCallback: widget.format,
            onChanged: widget.enabled ? (x) => setState(() => _drag = x) : null,
            onChangeEnd: widget.enabled
                ? (x) {
                    setState(() => _drag = null);
                    widget.onChanged(x);
                  }
                : null,
          ),
        ],
      ),
    );
  }
}

/// One option of a [SettingChoiceTile].
class ChoiceOption<T> {
  const ChoiceOption(
    this.value,
    this.label, {
    this.subtitle,
    this.enabled = true,
  });
  final T value;
  final String label;
  final String? subtitle;

  /// Unavailable (e.g. lens missing); shown greyed with [subtitle] as reason.
  final bool enabled;
}

/// Row showing the current choice; tap opens a picker sheet.
class SettingChoiceTile<T> extends StatelessWidget {
  const SettingChoiceTile({
    super.key,
    required this.title,
    required this.value,
    required this.options,
    required this.onSelected,
    this.icon,
    this.enabled = true,
    this.footer,
  });

  final String title;
  final T value;
  final List<ChoiceOption<T>> options;
  final ValueChanged<T> onSelected;
  final IconData? icon;
  final bool enabled;
  final String? footer;

  @override
  Widget build(BuildContext context) {
    final current = options.where((o) => o.value == value).firstOrNull;
    return ListTile(
      enabled: enabled,
      leading: icon == null ? null : _TileIcon(icon!),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 170),
            child: Text(
              current?.label ?? '',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.chevron_right_rounded,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ],
      ),
      onTap: () => _pick(context),
    );
  }

  Future<void> _pick(BuildContext context) async {
    final picked = await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) => _ChoiceSheet<T>(
        title: title,
        value: value,
        options: options,
        footer: footer,
      ),
    );
    if (picked != null && context.mounted) onSelected(picked);
  }
}

class _ChoiceSheet<T> extends StatelessWidget {
  const _ChoiceSheet({
    required this.title,
    required this.value,
    required this.options,
    this.footer,
  });

  final String title;
  final T value;
  final List<ChoiceOption<T>> options;
  final String? footer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * .8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
            child: Text(title, style: theme.textTheme.titleLarge),
          ),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsetsDirectional.only(bottom: 16),
              children: [
                for (final o in options)
                  ListTile(
                    minTileHeight: 56,
                    enabled: o.enabled,
                    title: Text(o.label),
                    subtitle: o.subtitle == null ? null : Text(o.subtitle!),
                    trailing: o.value == value
                        ? const Icon(Icons.check_rounded, color: AppColors.cyan)
                        : null,
                    onTap: () => Navigator.of(context).pop(o.value),
                  ),
                if (footer != null)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                    child: Text(footer!, style: theme.textTheme.bodySmall),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Inline segmented control row for 2–4 options.
class SettingSegmentedTile<T> extends StatelessWidget {
  const SettingSegmentedTile({
    super.key,
    required this.title,
    required this.value,
    required this.options,
    required this.onSelected,
    this.icon,
    this.enabled = true,
  });

  final String title;
  final T value;
  final List<ChoiceOption<T>> options;
  final ValueChanged<T> onSelected;
  final IconData? icon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 22, color: theme.listTileTheme.iconColor),
                const SizedBox(width: 16),
              ],
              Expanded(child: Text(title, style: theme.textTheme.bodyLarge)),
            ],
          ),
          const SizedBox(height: 10),
          SegmentedButton<T>(
            showSelectedIcon: false,
            segments: [
              for (final o in options)
                ButtonSegment<T>(
                  value: o.value,
                  enabled: o.enabled,
                  label: Text(o.label, overflow: TextOverflow.ellipsis),
                ),
            ],
            selected: {value},
            onSelectionChanged: enabled ? (s) => onSelected(s.first) : null,
          ),
        ],
      ),
    );
  }
}

/// Navigation row with optional trailing value text.
class SettingNavTile extends StatelessWidget {
  const SettingNavTile({
    super.key,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.value,
    this.icon,
    this.trailing,
    this.external = false,
    this.enabled = true,
  });

  final String title;
  final String? subtitle;
  final String? value;
  final IconData? icon;
  final Widget? trailing;
  final VoidCallback? onTap;

  /// Shows an "opens elsewhere" glyph instead of a chevron.
  final bool external;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).colorScheme.onSurfaceVariant;
    return ListTile(
      enabled: enabled,
      leading: icon == null ? null : _TileIcon(icon!),
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle!),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ?trailing,
          if (value != null)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 170),
              child: Text(
                value!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: muted, fontFeatures: tabular),
              ),
            ),
          const SizedBox(width: 4),
          Icon(
            external ? Icons.open_in_new_rounded : Icons.chevron_right_rounded,
            color: muted,
            size: external ? 18 : 24,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}

/// Read-only label/value row (live status values).
class SettingValueTile extends StatelessWidget {
  const SettingValueTile({
    super.key,
    required this.title,
    required this.value,
    this.icon,
    this.valueColor,
  });

  final String title;
  final String value;
  final IconData? icon;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontFeatures: tabular,
      fontWeight: FontWeight.w600,
      color: valueColor ?? Theme.of(context).colorScheme.onSurfaceVariant,
    );
    // Long values (e.g. error messages) go under the title instead of
    // squeezing it; short values stay right-aligned and width-capped.
    final long = value.length > 22;
    return ListTile(
      leading: icon == null ? null : _TileIcon(icon!),
      title: Text(title),
      subtitle: long ? Text(value, style: style) : null,
      trailing: long
          ? null
          : ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * .45,
              ),
              child: Text(
                value,
                style: style,
                textAlign: TextAlign.end,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
    );
  }
}

/// Row whose value is edited in a text dialog.
class SettingTextTile extends StatelessWidget {
  const SettingTextTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.saveLabel,
    required this.cancelLabel,
    this.placeholder,
    this.hint,
    this.icon,
    this.keyboardType,
    this.multiline = false,
    this.enabled = true,
  });

  final String title;
  final String value;
  final String? placeholder;
  final String? hint;
  final IconData? icon;
  final TextInputType? keyboardType;
  final bool multiline;
  final bool enabled;
  final String saveLabel;
  final String cancelLabel;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).colorScheme.onSurfaceVariant;
    final shown = value.isEmpty ? (placeholder ?? '') : value;
    if (multiline) {
      return ListTile(
        enabled: enabled,
        leading: icon == null ? null : _TileIcon(icon!),
        title: Text(title),
        subtitle: Text(shown, maxLines: 3, overflow: TextOverflow.ellipsis),
        trailing: Icon(Icons.edit_outlined, color: muted, size: 20),
        onTap: () => _edit(context),
      );
    }
    return SettingNavTile(
      enabled: enabled,
      title: title,
      icon: icon,
      value: shown,
      onTap: () => _edit(context),
    );
  }

  Future<void> _edit(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => _TextEditDialog(
        title: title,
        initial: value,
        hint: hint,
        keyboardType: keyboardType,
        multiline: multiline,
        saveLabel: saveLabel,
        cancelLabel: cancelLabel,
      ),
    );
    if (result != null) onChanged(result.trim());
  }
}

class _TextEditDialog extends StatefulWidget {
  const _TextEditDialog({
    required this.title,
    required this.initial,
    required this.saveLabel,
    required this.cancelLabel,
    this.hint,
    this.keyboardType,
    this.multiline = false,
  });

  final String title;
  final String initial;
  final String? hint;
  final TextInputType? keyboardType;
  final bool multiline;
  final String saveLabel;
  final String cancelLabel;

  @override
  State<_TextEditDialog> createState() => _TextEditDialogState();
}

class _TextEditDialogState extends State<_TextEditDialog> {
  late final _c = TextEditingController(text: widget.initial);

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.title),
    content: TextField(
      controller: _c,
      autofocus: true,
      keyboardType: widget.multiline
          ? TextInputType.multiline
          : widget.keyboardType,
      minLines: widget.multiline ? 3 : 1,
      maxLines: widget.multiline ? 6 : 1,
      decoration: InputDecoration(hintText: widget.hint),
      onSubmitted: widget.multiline
          ? null
          : (v) => Navigator.of(context).pop(v),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text(widget.cancelLabel),
      ),
      TextButton(
        onPressed: () => Navigator.of(context).pop(_c.text),
        child: Text(widget.saveLabel),
      ),
    ],
  );
}
