import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import 'package:corvista/app/providers.dart';
import 'package:corvista/core/widgets/common.dart';
import 'package:corvista/core/widgets/format.dart';
import 'package:corvista/l10n/l10n.dart';

import 'widgets/clip_tiles.dart';

/// Screen rect of the widget behind [key] (iPad share popover anchor).
Rect? shareOriginOf(GlobalKey key) {
  final box = key.currentContext?.findRenderObject() as RenderBox?;
  return box != null && box.hasSize
      ? box.localToGlobal(Offset.zero) & box.size
      : null;
}

/// System share sheet for one or more clips (also offers "Save to Files").
Future<void> shareClips(
  BuildContext context,
  List<IncidentClip> clips, {
  Rect? origin,
}) async {
  final l10n = context.l10n;
  final files = [
    for (final c in clips)
      if (!c.missingFile) XFile(c.path, mimeType: 'video/mp4'),
  ];
  if (files.isEmpty) return;
  try {
    await SharePlus.instance.share(
      ShareParams(
        files: files,
        title: clips.length == 1 ? clips.first.displayTitle(context) : null,
        sharePositionOrigin: origin,
      ),
    );
  } catch (_) {
    if (context.mounted) showSnack(context, l10n.playerShareFailed);
  }
}

/// Saves [clips] to Photos. Several clips show a progress dialog; a result
/// summary is shown as a snackbar (with an Open Settings action on denial).
Future<PhotosBatchResult> saveClipsToPhotos(
  BuildContext context,
  WidgetRef ref,
  List<IncidentClip> clips,
) async {
  final l10n = context.l10n;
  final actions = ref.read(clipActionsProvider);
  final engine = ref.read(nativeEngineProvider);
  final progress = ValueNotifier<int>(0);
  final navigator = Navigator.of(context, rootNavigator: true);
  var dialogOpen = false;
  if (clips.length > 1) {
    dialogOpen = true;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (ctx) => PopScope(
        canPop: false,
        child: AlertDialog(
          content: ValueListenableBuilder<int>(
            valueListenable: progress,
            builder: (ctx, done, _) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ctx.l10n.clipsSavingToPhotos(
                    (done + 1).clamp(1, clips.length),
                    clips.length,
                  ),
                ),
                const SizedBox(height: 16),
                LinearProgressIndicator(value: done / clips.length),
              ],
            ),
          ),
        ),
      ),
    );
  }
  final r = await actions.saveToPhotos(
    clips,
    onProgress: (done, _) => progress.value = done,
  );
  if (dialogOpen && navigator.mounted) navigator.pop();
  progress.dispose();
  if (!context.mounted) return r;
  if (r.denied) {
    showSnack(
      context,
      l10n.clipsPhotosDenied,
      actionLabel: l10n.commonOpenSettings,
      onAction: () => engine.openSettings(),
    );
  } else if (r.failed == 0) {
    showSnack(context, l10n.clipsPhotosSaved(r.saved));
  } else if (r.saved == 0) {
    showSnack(context, l10n.clipsPhotosFailed);
  } else {
    showSnack(context, l10n.clipsPhotosPartial(r.saved, r.failed));
  }
  return r;
}

/// Confirms (count + total size) and deletes [clips]. Returns true when
/// the clips were deleted.
Future<bool> confirmAndDeleteClips(
  BuildContext context,
  WidgetRef ref,
  List<IncidentClip> clips,
) async {
  final l10n = context.l10n;
  if (clips.isEmpty) return false;
  final size = clips.fold<int>(0, (a, c) => a + c.sizeBytes);
  final ok = await confirmDialog(
    context,
    title: l10n.clipsDeleteConfirmTitleSize(
      clips.length,
      Fmt.bytes(context, size),
    ),
    message: l10n.clipsDeleteConfirmBody(clips.length),
    confirmLabel: l10n.commonDelete,
  );
  if (!ok || !context.mounted) return false;
  try {
    await ref.read(clipsRepositoryProvider).deleteMany(clips.map((c) => c.id));
    ref.invalidate(storageInfoProvider);
    if (context.mounted) showSnack(context, l10n.clipsDeleted(clips.length));
    return true;
  } catch (e) {
    ref.invalidate(storageInfoProvider);
    if (context.mounted) {
      showSnack(context, l10n.commonErrorDetail(e.toString()));
    }
    return false;
  }
}
