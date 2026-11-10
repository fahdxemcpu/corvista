import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import 'package:corvista/app/providers.dart';
import 'package:corvista/core/theme/app_colors.dart';
import 'package:corvista/core/theme/app_theme.dart';
import 'package:corvista/core/widgets/common.dart';
import 'package:corvista/l10n/l10n.dart';

import 'widgets/clip_tiles.dart';
import 'widgets/trim_range_control.dart';

/// Cuts a shorter clip out of [clip]. Pops with the new clip id on success.
class ClipTrimScreen extends ConsumerStatefulWidget {
  const ClipTrimScreen({super.key, required this.clip, this.preview = true});

  final IncidentClip clip;

  /// False in widget tests (no platform video player).
  final bool preview;

  static const frameCount = 8;

  @override
  ConsumerState<ClipTrimScreen> createState() => _ClipTrimScreenState();
}

class _ClipTrimScreenState extends ConsumerState<ClipTrimScreen> {
  VideoPlayerController? _video;
  int _start = 0;
  late int _end = widget.clip.durationMs;
  int? _position;
  bool _saving = false;
  late final List<String?> _frames = List.filled(
    ClipTrimScreen.frameCount,
    null,
  );

  int get _duration => math.max(1, widget.clip.durationMs);

  @override
  void initState() {
    super.initState();
    _loadFrames();
    if (widget.preview) {
      final c = VideoPlayerController.file(File(widget.clip.path));
      _video = c;
      c
          .initialize()
          .then((_) {
            if (!mounted) return;
            c.addListener(_onTick);
            setState(() {});
          })
          .catchError((Object _) {});
    }
  }

  @override
  void dispose() {
    _video?.removeListener(_onTick);
    _video?.dispose();
    super.dispose();
  }

  Future<void> _loadFrames() async {
    final engine = ref.read(nativeEngineProvider);
    final n = ClipTrimScreen.frameCount;
    for (var i = 0; i < n; i++) {
      final at = ((i + .5) / n * _duration).round();
      try {
        final p = await engine.thumbnail(widget.clip.path, atMs: at);
        if (!mounted) return;
        setState(() => _frames[i] = p);
      } catch (_) {
        // Keep the placeholder for this frame.
      }
    }
  }

  /// Loops playback inside the selection and tracks the playhead.
  void _onTick() {
    final c = _video;
    if (c == null || !c.value.isInitialized) return;
    final pos = c.value.position.inMilliseconds;
    if (c.value.isPlaying && pos >= _end) {
      c.pause();
      c.seekTo(Duration(milliseconds: _start));
    }
    if (pos != _position) setState(() => _position = pos);
  }

  Future<void> _seek(int ms) async {
    setState(() => _position = ms);
    await _video?.seekTo(Duration(milliseconds: ms));
  }

  Future<void> _togglePlay() async {
    final c = _video;
    if (c == null || !c.value.isInitialized) return;
    if (c.value.isPlaying) {
      await c.pause();
      return;
    }
    final pos = c.value.position.inMilliseconds;
    if (pos < _start || pos >= _end - 100) {
      await c.seekTo(Duration(milliseconds: _start));
    }
    await c.play();
  }

  Future<void> _save() async {
    final l10n = context.l10n;
    final title = l10n.clipsTrimmedTitle(widget.clip.displayTitle(context));
    setState(() => _saving = true);
    await _video?.pause();
    try {
      final r = await ref
          .read(clipActionsProvider)
          .trim(widget.clip, startMs: _start, endMs: _end, title: title);
      ref.invalidate(storageInfoProvider);
      if (mounted) Navigator.of(context).pop(r.id);
    } on PlatformException catch (e) {
      if (!mounted) return;
      setState(() => _saving = false);
      showSnack(
        context,
        e.code == 'storage_full' ? l10n.trimStorageFull : l10n.trimFailed,
      );
    } catch (_) {
      if (!mounted) return;
      setState(() => _saving = false);
      showSnack(context, l10n.trimFailed);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final landscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    final selected = Duration(milliseconds: _end - _start);

    final preview = ColoredBox(
      color: Colors.black,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: _video != null && _video!.value.isInitialized
            ? Center(
                child: AspectRatio(
                  aspectRatio: _video!.value.aspectRatio,
                  child: VideoPlayer(_video!),
                ),
              )
            : Center(child: ClipThumbnail(clip: widget.clip)),
      ),
    );

    final controls = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.trimSelection(
                  TrimRangeControl.formatMs(selected.inMilliseconds),
                ),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontFeatures: tabular,
                ),
              ),
            ),
            if (_video != null)
              ValueListenableBuilder<VideoPlayerValue>(
                valueListenable: _video!,
                builder: (_, v, _) => IconButton.filledTonal(
                  tooltip: v.isPlaying ? l10n.playerPause : l10n.trimPreview,
                  onPressed: v.isInitialized ? _togglePlay : null,
                  icon: Icon(
                    v.isPlaying
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        TrimRangeControl(
          durationMs: widget.clip.durationMs,
          startMs: _start,
          endMs: _end,
          positionMs: _position,
          thumbnails: _frames,
          startLabel: l10n.trimStartHandle,
          endLabel: l10n.trimEndHandle,
          onChanged: (s, e) {
            final startMoved = s != _start;
            setState(() {
              _start = s;
              _end = e;
            });
            _video?.pause();
            _seek(startMoved ? s : e);
          },
          onChangeEnd: (s, _) => _seek(s),
          onSeek: _seek,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              TrimRangeControl.formatMs(_start),
              style: theme.textTheme.bodySmall?.copyWith(
                fontFeatures: tabular,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const Spacer(),
            Text(
              TrimRangeControl.formatMs(_end),
              style: theme.textTheme.bodySmall?.copyWith(
                fontFeatures: tabular,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          l10n.trimHint,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          key: const ValueKey('trim-save'),
          onPressed: _saving ? null : _save,
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.amber,
            foregroundColor: AppColors.background,
            minimumSize: const Size.fromHeight(52),
          ),
          icon: _saving
              ? const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.content_cut_rounded),
          label: Text(_saving ? l10n.trimSaving : l10n.trimSave),
        ),
      ],
    );

    return PopScope(
      canPop: !_saving,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.trimTitle),
          leading: IconButton(
            tooltip: l10n.commonClose,
            icon: const Icon(Icons.close_rounded),
            onPressed: _saving ? null : () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
          child: landscape
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.all(16),
                        child: Center(child: preview),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: SingleChildScrollView(
                        padding: const EdgeInsetsDirectional.all(16),
                        child: controls,
                      ),
                    ),
                  ],
                )
              : ListView(
                  children: [
                    preview,
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        16,
                        20,
                        16,
                        24,
                      ),
                      child: controls,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
