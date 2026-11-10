import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:corvista/app/providers.dart';
import 'package:corvista/core/theme/app_colors.dart';
import 'package:corvista/core/theme/app_theme.dart';
import 'package:corvista/core/widgets/common.dart';
import 'package:corvista/core/widgets/format.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/l10n/l10n.dart';

/// Bundled road scene used for on-device benchmarking (real inference).
const _benchmarkAsset = 'assets/benchmark/road_scene.jpg';

class AiModelsScreen extends ConsumerStatefulWidget {
  const AiModelsScreen({super.key});

  @override
  ConsumerState<AiModelsScreen> createState() => _AiModelsScreenState();
}

class _AiModelsScreenState extends ConsumerState<AiModelsScreen> {
  String? _switchingTo;
  bool _benchmarking = false;

  Future<void> _select(AiModelInfo m) async {
    final l10n = context.l10n;
    setState(() => _switchingTo = m.id);
    try {
      await ref.read(aiModelsProvider.notifier).select(m.id);
      final err = ref.read(aiModelsProvider).error;
      if (!mounted) return;
      showSnack(
        context,
        err != null
            ? _errorText(l10n, err)
            : l10n.modelsSwitched(modelDisplayName(l10n, m)),
      );
    } catch (e) {
      if (mounted) showSnack(context, l10n.commonErrorDetail(e.toString()));
    } finally {
      if (mounted) setState(() => _switchingTo = null);
    }
  }

  Future<void> _benchmark() async {
    final l10n = context.l10n;
    setState(() => _benchmarking = true);
    try {
      final data = await rootBundle.load(_benchmarkAsset);
      final dir = await getTemporaryDirectory();
      final file = File(p.join(dir.path, 'corvista_benchmark.jpg'));
      await file.writeAsBytes(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        flush: true,
      );
      await ref.read(aiModelsProvider.notifier).benchmark(file.path);
      if (mounted) showSnack(context, l10n.modelsBenchmarkDone);
    } catch (e) {
      if (mounted) showSnack(context, l10n.modelsBenchmarkFailed(e.toString()));
    } finally {
      if (mounted) setState(() => _benchmarking = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final state = ref.watch(aiModelsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.modelsTitle)),
      body: ListView(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 32),
        children: [
          Text(l10n.modelsIntro, style: theme.textTheme.bodyMedium),
          if (state.inferenceMs > 0 || state.lastLoadMs != null) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (state.inferenceMs > 0)
                  _StatPill(
                    icon: Icons.speed_rounded,
                    text: l10n.modelsActiveStats(
                      Fmt.number(context, state.inferenceMs, decimals: 1),
                      Fmt.number(context, state.detectHz, decimals: 1),
                    ),
                  ),
                if (state.lastLoadMs != null)
                  _StatPill(
                    icon: Icons.download_done_rounded,
                    text: l10n.modelsLastLoad(
                      Fmt.number(context, state.lastLoadMs!),
                    ),
                  ),
              ],
            ),
          ],
          if (state.error != null) ...[
            const SizedBox(height: 12),
            InfoBanner(
              tone: BannerTone.error,
              message: _errorText(l10n, state.error!),
            ),
          ],
          const SizedBox(height: 16),
          if (state.models.isEmpty && state.loading)
            const Padding(
              padding: EdgeInsets.all(40),
              child: Center(child: CircularProgressIndicator.adaptive()),
            ),
          for (final m in state.models) ...[
            _ModelCard(
              model: m,
              selected: m.id == state.selectedId,
              switching:
                  _switchingTo == m.id ||
                  (state.loading && _switchingTo == m.id),
              busy: _switchingTo != null || state.loading,
              benchmarking: _benchmarking && m.id == state.selectedId,
              onSelect: () => _select(m),
              onBenchmark: _benchmarking ? null : _benchmark,
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

/// State errors are bridge error codes; localize the ones users can act on.
String _errorText(AppLocalizations l10n, String code) => switch (code) {
  BridgeErrorCode.unavailable => l10n.commonNotAvailable,
  _ => l10n.commonErrorDetail(code),
};

String modelDisplayName(AppLocalizations l10n, AiModelInfo m) => switch (m.id) {
  'efficient' => l10n.modelsEfficientName,
  'enhanced' => l10n.modelsEnhancedName,
  'segmentation' => l10n.modelsSegmentationName,
  'none' => l10n.modelsNoneName,
  _ => m.name,
};

String _description(AppLocalizations l10n, AiModelInfo m) => switch (m.id) {
  'efficient' => l10n.modelsEfficientDesc,
  'enhanced' => l10n.modelsEnhancedDesc,
  'segmentation' => l10n.modelsSegmentationDesc,
  'none' => l10n.modelsNoneDesc,
  _ => l10n.modelsGenericDesc,
};

class _StatPill extends StatelessWidget {
  const _StatPill({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: AppColors.cyan.withValues(alpha: .10),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: AppColors.cyan),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
            fontFeatures: tabular,
          ),
        ),
      ],
    ),
  );
}

class _ModelCard extends StatelessWidget {
  const _ModelCard({
    required this.model,
    required this.selected,
    required this.switching,
    required this.busy,
    required this.benchmarking,
    required this.onSelect,
    required this.onBenchmark,
  });

  final AiModelInfo model;
  final bool selected;
  final bool switching;
  final bool busy;
  final bool benchmarking;
  final VoidCallback onSelect;
  final VoidCallback? onBenchmark;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final isNone = model.id == 'none';
    final views = isNone
        ? const <DriveView>[]
        : [
            DriveView.detection,
            DriveView.virtual,
            DriveView.maps,
            DriveView.parking,
            if (model.supportsSegmentation) DriveView.segmentation,
          ];
    final muted = theme.colorScheme.onSurfaceVariant;

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(
          color: selected ? AppColors.cyan : theme.colorScheme.outline,
          width: selected ? 1.6 : .8,
        ),
      ),
      child: InkWell(
        onTap: selected || busy || !model.installed ? null : onSelect,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 14, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    isNone
                        ? Icons.pause_circle_outline_rounded
                        : model.supportsSegmentation
                        ? Icons.layers_outlined
                        : Icons.center_focus_strong_outlined,
                    color: selected ? AppColors.cyan : muted,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      modelDisplayName(l10n, model),
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  if (switching)
                    const SizedBox.square(
                      dimension: 22,
                      child: CircularProgressIndicator(strokeWidth: 2.2),
                    )
                  else if (selected)
                    Semantics(
                      label: l10n.modelsSelected,
                      child: const Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.cyan,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                _description(l10n, model),
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 6),
              _bullet(
                context,
                isNone ? l10n.modelsFunctionNone : l10n.modelsFunctionDetection,
              ),
              if (model.supportsSegmentation)
                _bullet(context, l10n.modelsFunctionSegmentation),
              const SizedBox(height: 10),
              Wrap(
                spacing: 18,
                runSpacing: 6,
                children: [
                  if (!isNone)
                    _kv(
                      context,
                      l10n.modelsSize,
                      Fmt.bytes(context, model.sizeBytes),
                    ),
                  if (views.isNotEmpty)
                    _kv(
                      context,
                      l10n.modelsViews,
                      views.map(l10n.driveView).join(' · '),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    model.installed
                        ? Icons.inventory_2_outlined
                        : Icons.cloud_off_outlined,
                    size: 15,
                    color: model.installed ? AppColors.green : AppColors.amber,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    model.installed
                        ? l10n.modelsStatusInstalled
                        : l10n.modelsStatusNotInstalled,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: model.installed
                          ? AppColors.green
                          : AppColors.amber,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              if (!isNone) ...[
                const Divider(height: 24),
                _benchmarkRow(context),
              ],
              if (!selected && model.installed) ...[
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: busy ? null : onSelect,
                    icon: const Icon(Icons.swap_horiz_rounded, size: 18),
                    label: Text(
                      switching ? l10n.modelsSwitching : l10n.modelsUse,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _benchmarkRow(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final ms = model.measuredMeanMs;
    if (ms != null) {
      return Row(
        children: [
          const Icon(Icons.timer_outlined, size: 16, color: AppColors.cyan),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              l10n.modelsBenchmarkMeasured(
                Fmt.number(context, ms, decimals: 1),
              ),
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFeatures: tabular,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
          if (selected)
            TextButton(
              onPressed: onBenchmark,
              child: Text(
                benchmarking
                    ? l10n.modelsBenchmarkRunning
                    : l10n.modelsBenchmarkRun,
              ),
            ),
        ],
      );
    }
    return Row(
      children: [
        Icon(
          Icons.timer_off_outlined,
          size: 16,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.modelsBenchmarkNotMeasured,
                style: theme.textTheme.bodyMedium,
              ),
              if (!selected)
                Text(
                  l10n.modelsBenchmarkSelectHint,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
        if (selected)
          benchmarking
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox.square(
                        dimension: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      const SizedBox(width: 8),
                      Text(l10n.modelsBenchmarkRunning),
                    ],
                  ),
                )
              : FilledButton.tonal(
                  onPressed: onBenchmark,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(48, 44),
                  ),
                  child: Text(l10n.modelsBenchmarkRun),
                ),
      ],
    );
  }

  Widget _bullet(BuildContext context, String text) => Padding(
    padding: const EdgeInsetsDirectional.only(top: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsetsDirectional.only(top: 7, end: 8),
          child: SizedBox.square(
            dimension: 5,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.cyan,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(text, style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    ),
  );

  Widget _kv(BuildContext context, String k, String v) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          k.toUpperCase(),
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          v,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface,
            fontFeatures: tabular,
          ),
        ),
      ],
    );
  }
}
