import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:corvista/app/providers.dart';
import 'package:corvista/core/theme/app_colors.dart';
import 'package:corvista/core/theme/app_theme.dart';
import 'package:corvista/core/widgets/common.dart';
import 'package:corvista/core/widgets/format.dart';
import 'package:corvista/l10n/l10n.dart';

import 'clip_tiles.dart';

/// Library header: device storage (clips / buffer / other / free), clip
/// counts per kind, a "Free up space" shortcut and a gentle low-space note.
class StorageBar extends ConsumerStatefulWidget {
  const StorageBar({super.key});

  /// Below this, long recordings may not fit; the header suggests cleanup.
  static const lowStorageBytes = 2 * 1000 * 1000 * 1000; // 2 GB

  @override
  ConsumerState<StorageBar> createState() => _StorageBarState();
}

class _StorageBarState extends ConsumerState<StorageBar> {
  bool _cleaning = false;

  Future<void> _freeUp() async {
    final l10n = context.l10n;
    setState(() => _cleaning = true);
    final freed = await ref.read(clipActionsProvider).freeUpSpace();
    ref.invalidate(storageInfoProvider);
    if (!mounted) return;
    setState(() => _cleaning = false);
    showSnack(
      context,
      freed > 0
          ? l10n.settingsFreedBytes(Fmt.bytes(context, freed))
          : l10n.settingsNothingToFree,
    );
  }

  @override
  Widget build(BuildContext context) {
    final info = ref.watch(storageInfoProvider);
    final counts = countByKind(ref.watch(clipsProvider).value ?? const []);
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final secondary = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
      fontFeatures: tabular,
    );
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 4),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 14, 16, 12),
          child: info.when(
            skipLoadingOnReload: true,
            loading: () => const SizedBox(
              height: 48,
              child: Center(child: CircularProgressIndicator.adaptive()),
            ),
            error: (_, _) => Text(
              l10n.commonNotAvailable,
              style: theme.textTheme.bodyMedium,
            ),
            data: (s) {
              final total = s.totalBytes <= 0 ? 1 : s.totalBytes;
              final clips = s.clipsBytes / total;
              final buffer = s.bufferBytes / total;
              final used = ((total - s.freeBytes) / total).clamp(0.0, 1.0);
              final other = (used - clips - buffer).clamp(0.0, 1.0);
              final low = s.freeBytes < StorageBar.lowStorageBytes;
              final usage = l10n.clipsStorageUsage(
                Fmt.bytes(context, s.clipsBytes),
                Fmt.bytes(context, s.bufferBytes),
                Fmt.bytes(context, s.freeBytes),
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.clipsStorageClips(
                                Fmt.bytes(context, s.clipsBytes),
                              ),
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontFeatures: tabular,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              l10n.clipsStorageUsedFree(
                                Fmt.bytes(context, total - s.freeBytes),
                                Fmt.bytes(context, s.freeBytes),
                              ),
                              style: secondary,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton.icon(
                        onPressed: _cleaning ? null : _freeUp,
                        icon: _cleaning
                            ? const SizedBox.square(
                                dimension: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(
                                Icons.cleaning_services_outlined,
                                size: 18,
                              ),
                        label: Text(l10n.clipsFreeUpSpace),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Semantics(
                    label: usage,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 10,
                        color: theme.colorScheme.surfaceContainerHigh,
                        child: Row(
                          children: [
                            _seg(clips, AppColors.cyan),
                            _seg(buffer, AppColors.blue),
                            _seg(
                              other,
                              theme.colorScheme.onSurfaceVariant.withValues(
                                alpha: .45,
                              ),
                            ),
                            _seg(
                              1 - used.toDouble(),
                              theme.colorScheme.surfaceContainerHigh,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ExcludeSemantics(child: Text(usage, style: secondary)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: [
                      _count(
                        context,
                        ClipKind.manual,
                        l10n.clipsCountRecordings(counts[ClipKind.manual]!),
                      ),
                      _count(
                        context,
                        ClipKind.incident,
                        l10n.clipsCountIncidents(counts[ClipKind.incident]!),
                      ),
                      _count(
                        context,
                        ClipKind.emergency,
                        l10n.clipsCountEmergency(counts[ClipKind.emergency]!),
                      ),
                    ],
                  ),
                  if (low) ...[
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        10,
                        8,
                        10,
                        8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.amber.withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.info_outline_rounded,
                            size: 16,
                            color: AppColors.amber,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              l10n.clipsStorageLowGentle,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _count(BuildContext context, ClipKind kind, String text) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: kind.color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface,
            fontFeatures: tabular,
          ),
        ),
      ],
    );
  }

  static Widget _seg(double fraction, Color color) {
    final flex = (fraction * 1000).round();
    if (flex <= 0) return const SizedBox.shrink();
    return Expanded(
      flex: flex,
      child: ColoredBox(color: color),
    );
  }
}
