import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common.dart';
import '../../../domain/models/app_settings.dart';
import '../../../l10n/l10n.dart';
import 'nav_widgets.dart';

/// Destination search (route `/destination`): recent destinations, live
/// Apple Maps suggestions while typing, full results on Search.
class DestinationSheet extends ConsumerStatefulWidget {
  const DestinationSheet({super.key});

  @override
  ConsumerState<DestinationSheet> createState() => _DestinationSheetState();
}

class _DestinationSheetState extends ConsumerState<DestinationSheet> {
  late final TextEditingController _text = TextEditingController(
    text: ref.read(navigationProvider).query,
  );
  bool _choosing = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  Future<void> _run(Future<void> Function(NavigationController c) f) async {
    setState(() => _choosing = true);
    ref.read(driveSessionProvider.notifier).setView(DriveView.maps);
    await f(ref.read(navigationProvider.notifier));
    if (!mounted) return;
    setState(() => _choosing = false);
    final nav = ref.read(navigationProvider);
    if (nav.phase == NavPhase.choosingRoute || nav.phase == NavPhase.error) {
      Navigator.of(context).maybePop();
    }
  }

  void _setQuery(String v) {
    setState(() {});
    ref.read(navigationProvider.notifier).setQuery(v);
  }

  Widget _message(String text, {IconData? icon}) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: AppColors.textSecondary, size: 32),
            const SizedBox(height: 8),
          ],
          Text(
            text,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _tile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Key? key,
    Color color = AppColors.cyan,
  }) => ListTile(
    key: key,
    minTileHeight: 64,
    enabled: !_choosing,
    leading: CircleAvatar(
      backgroundColor: color.withValues(alpha: .14),
      child: Icon(icon, color: color),
    ),
    title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
    subtitle: subtitle.isEmpty
        ? null
        : Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
    onTap: onTap,
  );

  @override
  Widget build(BuildContext context) {
    final nav = ref.watch(navigationProvider);
    final recents = ref.watch(recentDestinationsProvider);
    final loc = ref.watch(locationProvider);
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final q = _text.text.trim();
    final ctl = ref.read(navigationProvider.notifier);

    final children = <Widget>[];
    final locationOff =
        !loc.permissionGranted &&
        loc.fix == null &&
        loc.error == BridgeErrorCode.permissionDenied;
    if (locationOff) {
      children.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: InfoBanner(
            tone: BannerTone.warning,
            message: l10n.navLocationOff,
            actionLabel: l10n.commonOpenSettings,
            onAction: () =>
                unawaited(ref.read(nativeEngineProvider).openSettings()),
          ),
        ),
      );
    }

    if (q.isEmpty) {
      if (recents.isEmpty) {
        children.add(
          _message(l10n.navSearchStartTyping, icon: Icons.search_rounded),
        );
      } else {
        children.add(
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 4, 8, 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.navRecents,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => unawaited(
                    ref.read(recentDestinationsProvider.notifier).clear(),
                  ),
                  child: Text(l10n.navClearRecents),
                ),
              ],
            ),
          ),
        );
        for (final p in recents) {
          children.add(
            _tile(
              icon: Icons.history_rounded,
              color: AppColors.textSecondary,
              title: p.name,
              subtitle: p.address,
              onTap: () => unawaited(_run((c) => c.chooseDestination(p))),
            ),
          );
        }
      }
    } else {
      final err = nav.error;
      if (err != null && nav.suggestions.isEmpty && nav.places.isEmpty) {
        children.add(
          Padding(
            padding: const EdgeInsets.all(16),
            child: InfoBanner(
              tone: BannerTone.warning,
              message: navErrorText(l10n, err),
              actionLabel: l10n.commonRetry,
              onAction: () => nav.submitted ? ctl.submit() : ctl.setQuery(q),
            ),
          ),
        );
      } else if (nav.noResults) {
        children.add(
          _message(l10n.navNoResults, icon: Icons.location_off_rounded),
        );
      } else if (nav.suggestions.isEmpty && nav.places.isEmpty && nav.loading) {
        children.add(_message(l10n.navSearching));
      }
      if (!nav.submitted) {
        for (final s in nav.suggestions) {
          children.add(
            _tile(
              key: ValueKey('nav-suggestion-${s.id}'),
              icon: Icons.place_rounded,
              title: s.title,
              subtitle: s.subtitle,
              onTap: () => unawaited(_run((c) => c.choose(s))),
            ),
          );
        }
      }
      if (nav.places.isNotEmpty) {
        if (nav.submitted || nav.suggestions.isNotEmpty) {
          children.add(
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
              child: Text(
                l10n.navPlaces,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          );
        }
        for (final p in nav.places) {
          children.add(
            _tile(
              icon: Icons.storefront_rounded,
              title: p.name,
              subtitle: p.address,
              onTap: () => unawaited(_run((c) => c.chooseDestination(p))),
            ),
          );
        }
      }
      if (!nav.submitted && nav.suggestions.isNotEmpty) {
        children.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
            child: Text(
              l10n.navSearchSubmitHint,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        );
      }
    }

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * .85,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
              child: TextField(
                key: const ValueKey('nav-search-field'),
                controller: _text,
                autofocus: true,
                autocorrect: false,
                textInputAction: TextInputAction.search,
                onChanged: _setQuery,
                onSubmitted: (v) {
                  if (v.trim().isNotEmpty) unawaited(ctl.submit(v));
                },
                decoration: InputDecoration(
                  hintText: l10n.navSearchFieldHint,
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: nav.loading || _choosing
                      ? const Padding(
                          padding: EdgeInsets.all(14),
                          child: SizedBox.square(
                            dimension: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : (q.isEmpty
                            ? null
                            : IconButton(
                                tooltip: l10n.commonClose,
                                icon: const Icon(Icons.clear_rounded),
                                onPressed: () {
                                  _text.clear();
                                  _setQuery('');
                                },
                              )),
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHigh,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 8),
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
