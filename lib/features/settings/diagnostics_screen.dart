import 'dart:io';

import 'package:corvista/app/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../ai_models/ai_models_screen.dart' show modelDisplayName;
import '../../core/theme/app_colors.dart';
import '../../core/widgets/common.dart';
import '../../core/widgets/format.dart';
import '../../l10n/l10n.dart';
import 'widgets/settings_labels.dart';
import 'widgets/settings_tiles.dart';

/// Live performance / camera / model / power diagnostics, plus the
/// development-only "test footage" runner (real inference on a local video).
class DiagnosticsScreen extends ConsumerWidget {
  const DiagnosticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final perf = ref.watch(perfProvider);
    final cam = ref.watch(cameraProvider);
    final ai = ref.watch(aiModelsProvider);
    final power = ref.watch(powerProvider);
    String ms(double v) => l10n.diagMs(Fmt.number(context, v, decimals: 1));
    String hz(double v) =>
        l10n.settingsHzValue(Fmt.number(context, v, decimals: 1));
    final model = ai.models.where((m) => m.id == ai.selectedId).firstOrNull;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.diagTitle)),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsetsDirectional.only(bottom: 32),
          children: [
            CvSection(
              title: l10n.diagPerformance,
              children: [
                SettingValueTile(
                  title: l10n.diagInference,
                  value: ms(perf.inferenceMs),
                ),
                SettingValueTile(
                  title: l10n.diagDetectHz,
                  value: hz(perf.detectHz),
                ),
                SettingValueTile(
                  title: l10n.diagCameraFps,
                  value: l10n.diagFps(
                    Fmt.number(context, perf.cameraFps, decimals: 1),
                  ),
                ),
                if (perf.segmentationMs != null)
                  SettingValueTile(
                    title: l10n.diagSegmentation,
                    value: ms(perf.segmentationMs!),
                  ),
                SettingValueTile(
                  title: l10n.diagMemory,
                  value: l10n.diagMb(Fmt.number(context, perf.memoryMB)),
                ),
                SettingValueTile(
                  title: l10n.diagDropped,
                  value: Fmt.number(context, perf.droppedFrames),
                ),
              ],
            ),
            CvSection(
              title: l10n.diagCamera,
              children: [
                SettingValueTile(
                  title: l10n.diagStatus,
                  value: l10n.cameraStatus(cam.status),
                  valueColor: cam.status == CameraStatus.running
                      ? AppColors.green
                      : AppColors.amber,
                ),
                SettingValueTile(
                  title: l10n.diagSource,
                  value: cam.source == 'file'
                      ? l10n.diagSourceFile
                      : l10n.diagSourceCamera,
                  valueColor: cam.source == 'file' ? AppColors.amber : null,
                ),
                SettingValueTile(
                  title: l10n.diagLens,
                  value: l10n.lens(cam.deviceType),
                ),
                SettingValueTile(
                  title: l10n.diagResolution,
                  value: cam.previewSize.isEmpty
                      ? l10n.commonNotAvailable
                      : '${cam.previewSize.width.round()} × ${cam.previewSize.height.round()}',
                ),
                SettingValueTile(
                  title: l10n.diagCameraFps,
                  value: l10n.diagFps(
                    Fmt.number(context, cam.fps, decimals: 1),
                  ),
                ),
                SettingValueTile(
                  title: l10n.diagDropped,
                  value: Fmt.number(context, cam.droppedFrames),
                ),
                if (cam.error != null)
                  SettingValueTile(
                    title: l10n.diagError,
                    value: cam.error!,
                    valueColor: AppColors.red,
                  ),
              ],
            ),
            CvSection(
              title: l10n.diagModel,
              children: [
                SettingValueTile(
                  title: l10n.settingsAiModel,
                  value: model == null
                      ? ai.selectedId
                      : modelDisplayName(l10n, model),
                ),
                if (ai.lastLoadMs != null)
                  SettingValueTile(
                    title: l10n.diagModelLoad,
                    value: ms(ai.lastLoadMs!),
                  ),
                SettingValueTile(
                  title: l10n.diagInference,
                  value: ms(ai.inferenceMs),
                ),
                SettingValueTile(
                  title: l10n.diagDetectHz,
                  value: hz(ai.detectHz),
                ),
                if (ai.error != null)
                  SettingValueTile(
                    title: l10n.diagError,
                    value: ai.error!,
                    valueColor: AppColors.red,
                  ),
              ],
            ),
            CvSection(
              title: l10n.diagPower,
              children: [
                SettingValueTile(
                  title: l10n.settingsThermal,
                  value: l10n.thermal(power.thermal),
                  valueColor: thermalColor(power.thermal),
                ),
                SettingValueTile(
                  title: l10n.settingsBattery,
                  value: power.battery < 0
                      ? l10n.commonNotAvailable
                      : Fmt.percent(context, power.battery),
                ),
                SettingValueTile(
                  title: l10n.settingsAiRate,
                  value: hz(power.aiHz),
                ),
                SettingValueTile(title: l10n.diagSegHz, value: hz(power.segHz)),
                SettingValueTile(
                  title: l10n.diagReduced,
                  value: power.reducedEffects ? l10n.commonOn : l10n.commonOff,
                ),
              ],
            ),
            const _ErrorLogSection(),
            const _TestFootageSection(),
          ],
        ),
      ),
    );
  }
}

/// Private on-device error log: share (user picks the destination) / clear.
class _ErrorLogSection extends ConsumerWidget {
  const _ErrorLogSection();

  Future<void> _share(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final log = ref.read(errorLogProvider);
    if (log == null) return;
    final box = context.findRenderObject() as RenderBox?;
    final origin = box == null
        ? null
        : box.localToGlobal(Offset.zero) & box.size;
    try {
      final files = await log.files();
      if (files.isEmpty) return;
      await SharePlus.instance.share(
        ShareParams(
          files: [for (final f in files) XFile(f.path, mimeType: 'text/plain')],
          title: l10n.diagLogSection,
          sharePositionOrigin: origin,
        ),
      );
    } catch (_) {
      if (context.mounted) showSnack(context, l10n.diagLogShareFailed);
    }
  }

  Future<void> _clear(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final ok = await confirmDialog(
      context,
      title: l10n.diagLogClearTitle,
      message: l10n.diagLogClearBody,
      confirmLabel: l10n.diagLogClear,
    );
    if (!ok) return;
    await ref.read(errorLogProvider)?.clear();
    ref.invalidate(errorLogSizeProvider);
    if (context.mounted) showSnack(context, l10n.diagLogCleared);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final size = ref.watch(errorLogSizeProvider).value ?? 0;
    final empty = size <= 0;
    return CvSection(
      title: l10n.diagLogSection,
      footer: l10n.diagLogFooter,
      children: [
        SettingNavTile(
          icon: Icons.ios_share_rounded,
          title: l10n.diagLogShare,
          value: empty ? l10n.diagLogEmpty : Fmt.bytes(context, size),
          external: true,
          enabled: !empty,
          onTap: empty ? null : () => _share(context, ref),
        ),
        SettingNavTile(
          icon: Icons.delete_outline_rounded,
          title: l10n.diagLogClear,
          enabled: !empty,
          onTap: empty ? null : () => _clear(context, ref),
        ),
      ],
    );
  }
}

class _TestFootageSection extends ConsumerStatefulWidget {
  const _TestFootageSection();

  @override
  ConsumerState<_TestFootageSection> createState() =>
      _TestFootageSectionState();
}

class _TestFootageSectionState extends ConsumerState<_TestFootageSection> {
  final _path = TextEditingController();
  String? _error;
  bool _busy = false;

  @override
  void dispose() {
    _path.dispose();
    super.dispose();
  }

  Future<void> _useDocuments() async {
    final dir = await getApplicationDocumentsDirectory();
    _path.text = p.join(dir.path, 'test_drive.mp4');
    setState(() => _error = null);
  }

  Future<void> _run() async {
    final l10n = context.l10n;
    final path = _path.text.trim();
    if (path.isEmpty || !File(path).existsSync()) {
      setState(() => _error = l10n.diagFileMissing);
      return;
    }
    setState(() {
      _error = null;
      _busy = true;
    });
    try {
      await ref.read(cameraProvider.notifier).startTestFile(path);
      if (mounted) showSnack(context, l10n.diagRunStarted);
    } catch (e) {
      if (mounted) {
        setState(() => _error = l10n.commonErrorDetail(e.toString()));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _backToCamera() async {
    try {
      await ref.read(cameraProvider.notifier).start(force: true);
    } catch (e) {
      if (mounted) {
        showSnack(context, context.l10n.commonErrorDetail(e.toString()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final isFile = ref.watch(cameraProvider.select((c) => c.source == 'file'));
    return CvSection(
      title: l10n.diagTestFootage,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.amber.withValues(alpha: .15),
                      border: Border.all(color: AppColors.amber),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      l10n.commonTestFootage,
                      style: const TextStyle(
                        color: AppColors.amber,
                        fontWeight: FontWeight.w800,
                        fontSize: 11,
                        letterSpacing: .8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(l10n.diagTestFootageBody, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 14),
              if (!kDebugMode)
                InfoBanner(message: l10n.diagDebugOnly)
              else ...[
                TextField(
                  controller: _path,
                  autocorrect: false,
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    labelText: l10n.diagPathLabel,
                    hintText: l10n.diagPathHint,
                    errorText: _error,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: TextButton(
                    onPressed: _useDocuments,
                    child: Text(l10n.diagUseDocuments),
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton.icon(
                  onPressed: _busy ? null : _run,
                  icon: _busy
                      ? const SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.play_arrow_rounded),
                  label: Text(l10n.diagRun),
                ),
              ],
              if (isFile) ...[
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: _backToCamera,
                  icon: const Icon(Icons.videocam_outlined),
                  label: Text(l10n.diagBackToCamera),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
