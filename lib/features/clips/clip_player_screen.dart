import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import 'package:corvista/app/providers.dart';
import 'package:corvista/app/router.dart';
import 'package:corvista/core/theme/app_colors.dart';
import 'package:corvista/core/theme/app_theme.dart';
import 'package:corvista/core/widgets/common.dart';
import 'package:corvista/core/widgets/format.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:corvista/l10n/l10n.dart';

import 'clip_trim_screen.dart';
import 'clip_ui_actions.dart';
import 'widgets/clip_tiles.dart';

/// Plays one saved clip; trim, Save to Photos, share, rename, favorite,
/// delete, details.
class ClipPlayerScreen extends ConsumerStatefulWidget {
  const ClipPlayerScreen({super.key, required this.clipId});

  final String clipId;

  @override
  ConsumerState<ClipPlayerScreen> createState() => _ClipPlayerScreenState();
}

class _ClipPlayerScreenState extends ConsumerState<ClipPlayerScreen> {
  VideoPlayerController? _controller;
  String? _loadedPath;
  Object? _loadError;
  bool _deleting = false;
  bool _immersive = false;
  bool _savingPhotos = false;
  final _shareKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // The player supports both orientations; landscape shows full-bleed video.
    SystemChrome.setPreferredOrientations(const [
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    _controller?.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  void _ensureController(IncidentClip clip) {
    if (_loadedPath == clip.path) return;
    _loadedPath = clip.path;
    _controller?.dispose();
    final c = VideoPlayerController.file(File(clip.path));
    _controller = c;
    _loadError = null;
    c
        .initialize()
        .then((_) {
          if (!mounted || _controller != c) return;
          setState(() {});
          c.play();
        })
        .catchError((Object e) {
          if (mounted && _controller == c) setState(() => _loadError = e);
        });
  }

  Future<void> _rename(IncidentClip clip) async {
    final l10n = context.l10n;
    final controller = TextEditingController(text: clip.title);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.playerRenameTitle),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLength: 80,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(hintText: l10n.playerRenameHint),
          onSubmitted: (v) => Navigator.of(ctx).pop(v),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(l10n.commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(controller.text),
            child: Text(l10n.commonSave),
          ),
        ],
      ),
    );
    controller.dispose();
    if (result == null || !mounted) return;
    try {
      await ref.read(clipsRepositoryProvider).rename(clip.id, result.trim());
      if (mounted) showSnack(context, l10n.playerRenamed);
    } catch (e) {
      if (mounted) showSnack(context, l10n.commonErrorDetail(e.toString()));
    }
  }

  Future<void> _toggleFavorite(IncidentClip clip) async {
    final l10n = context.l10n;
    try {
      await ref
          .read(clipsRepositoryProvider)
          .setFavorite(clip.id, !clip.favorite);
      if (mounted) {
        showSnack(
          context,
          clip.favorite ? l10n.playerUnfavorited : l10n.playerFavorited,
        );
      }
    } catch (e) {
      if (mounted) showSnack(context, l10n.commonErrorDetail(e.toString()));
    }
  }

  Future<void> _share(IncidentClip clip) =>
      shareClips(context, [clip], origin: shareOriginOf(_shareKey));

  Future<void> _saveToPhotos(IncidentClip clip) async {
    if (_savingPhotos) return;
    setState(() => _savingPhotos = true);
    await saveClipsToPhotos(context, ref, [clip]);
    if (mounted) setState(() => _savingPhotos = false);
  }

  Future<void> _trim(IncidentClip clip) async {
    final l10n = context.l10n;
    await _controller?.pause();
    if (!mounted) return;
    final id = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => ClipTrimScreen(clip: clip),
      ),
    );
    if (id == null || !mounted) return;
    final router = GoRouter.of(context);
    showSnack(
      context,
      l10n.trimSaved,
      actionLabel: l10n.trimOpenNew,
      onAction: () => router.push(Routes.clip(id)),
    );
  }

  void _showInfo(IncidentClip clip) => showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (_) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: .6,
      maxChildSize: .95,
      builder: (_, scroll) => ListView(
        controller: scroll,
        padding: const EdgeInsetsDirectional.only(bottom: 24),
        children: [_MetadataPanel(clip: clip)],
      ),
    ),
  );

  Future<void> _delete(IncidentClip clip) async {
    final l10n = context.l10n;
    final ok = await confirmDialog(
      context,
      title: l10n.clipsDeleteConfirmTitle(1),
      message: l10n.clipsDeleteConfirmBody(1),
      confirmLabel: l10n.commonDelete,
    );
    if (!ok || !mounted) return;
    setState(() => _deleting = true);
    await _controller?.pause();
    try {
      await ref.read(clipsRepositoryProvider).delete(clip.id);
      ref.invalidate(storageInfoProvider);
      if (!mounted) return;
      showSnack(context, l10n.clipsDeleted(1));
      context.pop();
    } catch (e) {
      if (!mounted) return;
      setState(() => _deleting = false);
      showSnack(context, l10n.commonErrorDetail(e.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final clipsAsync = ref.watch(clipsProvider);
    IncidentClip? clip;
    for (final c in clipsAsync.value ?? const <IncidentClip>[]) {
      if (c.id == widget.clipId) clip = c;
    }

    if (clip == null) {
      return Scaffold(
        appBar: AppBar(),
        body: clipsAsync.isLoading || _deleting
            ? const Center(child: CircularProgressIndicator.adaptive())
            : EmptyState(
                icon: Icons.movie_filter_outlined,
                title: l10n.playerNotFoundTitle,
                message: l10n.playerNotFoundBody,
                actionLabel: l10n.commonBack,
                onAction: () => context.pop(),
              ),
      );
    }

    final missing = clip.missingFile || !File(clip.path).existsSync();
    if (missing) {
      return Scaffold(
        appBar: AppBar(title: Text(clip.displayTitle(context))),
        body: EmptyState(
          icon: Icons.videocam_off_outlined,
          title: l10n.playerMissingTitle,
          message: l10n.playerMissingBody,
          actionLabel: l10n.playerRemoveEntry,
          onAction: () => _delete(clip!),
        ),
      );
    }

    _ensureController(clip);
    final landscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    if (_immersive != landscape) {
      _immersive = landscape;
      SystemChrome.setEnabledSystemUIMode(
        landscape ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
      );
    }

    final video = _VideoSurface(
      controller: _controller!,
      error: _loadError,
      fullBleed: landscape,
    );
    final c = clip;

    if (landscape) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned.fill(child: video),
            SafeArea(
              child: Padding(
                padding: const EdgeInsetsDirectional.all(8),
                child: Row(
                  children: [
                    _RoundButton(
                      icon: Icons.arrow_back_ios_new_rounded,
                      label: l10n.playerBack,
                      onTap: () => context.pop(),
                    ),
                    const Spacer(),
                    _RoundButton(
                      icon: c.favorite
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      label: c.favorite
                          ? l10n.clipsUnfavorite
                          : l10n.clipsFavorite,
                      color: c.favorite ? AppColors.amber : null,
                      onTap: () => _toggleFavorite(c),
                    ),
                    const SizedBox(width: 8),
                    _RoundButton(
                      icon: Icons.content_cut_rounded,
                      label: l10n.playerTrim,
                      onTap: () => _trim(c),
                    ),
                    const SizedBox(width: 8),
                    _RoundButton(
                      icon: Icons.photo_library_outlined,
                      label: l10n.clipsSaveToPhotos,
                      onTap: () => _saveToPhotos(c),
                    ),
                    const SizedBox(width: 8),
                    _RoundButton(
                      key: _shareKey,
                      icon: Icons.ios_share_rounded,
                      label: l10n.commonShare,
                      onTap: () => _share(c),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(c.displayTitle(context), overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(
            tooltip: c.favorite ? l10n.clipsUnfavorite : l10n.clipsFavorite,
            icon: Icon(
              c.favorite ? Icons.star_rounded : Icons.star_outline_rounded,
              color: c.favorite ? AppColors.amber : null,
            ),
            onPressed: () => _toggleFavorite(c),
          ),
          PopupMenuButton<String>(
            tooltip: l10n.playerMore,
            onSelected: (v) => switch (v) {
              'rename' => _rename(c),
              'info' => _showInfo(c),
              _ => _delete(c),
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                value: 'info',
                child: ListTile(
                  leading: const Icon(Icons.info_outline_rounded),
                  title: Text(l10n.playerInfo),
                ),
              ),
              PopupMenuItem(
                value: 'rename',
                child: ListTile(
                  leading: const Icon(Icons.edit_outlined),
                  title: Text(l10n.commonRename),
                ),
              ),
              PopupMenuItem(
                value: 'delete',
                child: ListTile(
                  leading: const Icon(
                    Icons.delete_outline_rounded,
                    color: AppColors.red,
                  ),
                  title: Text(
                    l10n.commonDelete,
                    style: const TextStyle(color: AppColors.red),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(bottom: 32),
        children: [
          ColoredBox(
            color: Colors.black,
            child: AspectRatio(aspectRatio: 16 / 9, child: video),
          ),
          _ActionRow(
            children: [
              _ActionButton(
                icon: Icons.content_cut_rounded,
                label: l10n.playerTrim,
                onTap: () => _trim(c),
              ),
              _ActionButton(
                icon: Icons.photo_library_outlined,
                label: l10n.clipsSaveToPhotos,
                busy: _savingPhotos,
                onTap: () => _saveToPhotos(c),
              ),
              _ActionButton(
                key: _shareKey,
                icon: Icons.ios_share_rounded,
                label: l10n.commonShare,
                onTap: () => _share(c),
              ),
              _ActionButton(
                icon: Icons.info_outline_rounded,
                label: l10n.playerInfo,
                onTap: () => _showInfo(c),
              ),
            ],
          ),
          _MetadataPanel(clip: c),
        ],
      ),
    );
  }
}

/// Primary clip actions under the video (portrait).
class _ActionRow extends StatelessWidget {
  const _ActionRow({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 4),
    child: Row(children: [for (final c in children) Expanded(child: c)]),
  );
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.busy = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: busy ? null : onTap,
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 4,
            vertical: 8,
          ),
          child: Column(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHigh,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.colorScheme.outline,
                    width: .8,
                  ),
                ),
                child: Center(
                  child: busy
                      ? const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Icon(
                          icon,
                          size: 22,
                          color: theme.colorScheme.onSurface,
                        ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  const _RoundButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.black.withValues(alpha: .45),
    shape: const CircleBorder(),
    child: IconButton(
      tooltip: label,
      iconSize: 22,
      constraints: const BoxConstraints.tightFor(width: 48, height: 48),
      icon: Icon(icon, color: color ?? Colors.white),
      onPressed: onTap,
    ),
  );
}

/// Video with tap-to-toggle transport controls and a scrubber.
class _VideoSurface extends StatefulWidget {
  const _VideoSurface({
    required this.controller,
    required this.error,
    required this.fullBleed,
  });

  final VideoPlayerController controller;
  final Object? error;
  final bool fullBleed;

  @override
  State<_VideoSurface> createState() => _VideoSurfaceState();
}

class _VideoSurfaceState extends State<_VideoSurface> {
  bool _controlsVisible = true;
  bool _wasPlayingBeforeScrub = false;
  double? _scrubMs;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (widget.error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: AppColors.red,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.playerLoadError,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
    }
    return ValueListenableBuilder<VideoPlayerValue>(
      valueListenable: widget.controller,
      builder: (context, v, _) {
        if (!v.isInitialized) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        final durMs = v.duration.inMilliseconds.toDouble().clamp(
          1.0,
          double.infinity,
        );
        final posMs = (_scrubMs ?? v.position.inMilliseconds.toDouble()).clamp(
          0.0,
          durMs,
        );
        final ended =
            !v.isPlaying &&
            v.position >= v.duration - const Duration(milliseconds: 200);
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => setState(() => _controlsVisible = !_controlsVisible),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: v.aspectRatio,
                  child: VideoPlayer(widget.controller),
                ),
              ),
              AnimatedOpacity(
                opacity: _controlsVisible ? 1 : 0,
                duration: MediaQuery.disableAnimationsOf(context)
                    ? Duration.zero
                    : const Duration(milliseconds: 200),
                child: IgnorePointer(
                  ignoring: !_controlsVisible,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0x00000000),
                              Color(0x00000000),
                              Color(0x99000000),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Material(
                          color: Colors.black.withValues(alpha: .45),
                          shape: const CircleBorder(),
                          child: IconButton(
                            iconSize: 38,
                            constraints: const BoxConstraints.tightFor(
                              width: 72,
                              height: 72,
                            ),
                            tooltip: ended
                                ? l10n.playerReplay
                                : v.isPlaying
                                ? l10n.playerPause
                                : l10n.playerPlay,
                            icon: Icon(
                              ended
                                  ? Icons.replay_rounded
                                  : v.isPlaying
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              if (ended) {
                                await widget.controller.seekTo(Duration.zero);
                                await widget.controller.play();
                              } else if (v.isPlaying) {
                                await widget.controller.pause();
                              } else {
                                await widget.controller.play();
                              }
                            },
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        start: 0,
                        end: 0,
                        bottom: 0,
                        child: SafeArea(
                          top: false,
                          minimum: EdgeInsets.fromLTRB(
                            widget.fullBleed ? 16 : 8,
                            0,
                            widget.fullBleed ? 16 : 8,
                            widget.fullBleed ? 8 : 0,
                          ),
                          child: Row(
                            children: [
                              _time(Duration(milliseconds: posMs.round())),
                              Expanded(
                                child: Slider(
                                  value: posMs,
                                  max: durMs,
                                  semanticFormatterCallback: (ms) => Fmt.clock(
                                    Duration(milliseconds: ms.round()),
                                  ),
                                  onChangeStart: (_) {
                                    _wasPlayingBeforeScrub = v.isPlaying;
                                    widget.controller.pause();
                                  },
                                  onChanged: (ms) {
                                    setState(() => _scrubMs = ms);
                                    widget.controller.seekTo(
                                      Duration(milliseconds: ms.round()),
                                    );
                                  },
                                  onChangeEnd: (ms) async {
                                    await widget.controller.seekTo(
                                      Duration(milliseconds: ms.round()),
                                    );
                                    if (mounted) {
                                      setState(() => _scrubMs = null);
                                    }
                                    if (_wasPlayingBeforeScrub) {
                                      await widget.controller.play();
                                    }
                                  },
                                ),
                              ),
                              _time(v.duration),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _time(Duration d) => Text(
    Fmt.clock(d),
    style: const TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w600,
      fontFeatures: tabular,
    ),
  );
}

class _MetadataPanel extends ConsumerWidget {
  const _MetadataPanel({required this.clip});

  final IncidentClip clip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final unit = ref.watch(settingsProvider.select((s) => s.speedUnit));
    final speed = Fmt.speed(clip.speed, unit);
    return CvSection(
      title: l10n.playerDetails,
      children: [
        _row(context, l10n.playerDate, Fmt.dateTime(context, clip.createdAt)),
        _row(
          context,
          l10n.playerDuration,
          Fmt.clock(Duration(milliseconds: clip.durationMs)),
        ),
        _row(
          context,
          l10n.playerResolution,
          '${clip.resolutionLabel} · ${clip.width} × ${clip.height}',
        ),
        _row(context, l10n.playerSize, Fmt.bytes(context, clip.sizeBytes)),
        _row(
          context,
          l10n.playerAudio,
          clip.hasAudio ? l10n.playerAudioYes : l10n.playerAudioNo,
        ),
        _row(context, l10n.playerKind, clip.clipKind.label(context)),
        _row(context, l10n.playerReason, switch (clip.reason) {
          'emergency' => l10n.playerReasonEmergency,
          'recovered' => l10n.playerReasonRecovered,
          'recording' => l10n.playerReasonRecording,
          _ => l10n.playerReasonManual,
        }),
        if (speed != null)
          _row(
            context,
            l10n.playerSpeed,
            '$speed ${unit == SpeedUnit.kmh ? l10n.unitKmh : l10n.unitMph}',
          ),
        if (clip.hasLocation)
          ListTile(
            title: Text(l10n.playerLocation),
            subtitle: Text(
              clip.locationLabel(),
              style: const TextStyle(fontFeatures: tabular),
            ),
            trailing: TextButton.icon(
              icon: const Icon(Icons.map_outlined, size: 18),
              label: Text(l10n.playerOpenInMaps),
              onPressed: () => launchUrl(
                Uri.parse(
                  'https://maps.apple.com/?ll=${clip.lat},${clip.lon}&q=${Uri.encodeComponent(clip.displayTitle(context))}',
                ),
                mode: LaunchMode.externalApplication,
              ),
            ),
          ),
      ],
    );
  }

  Widget _row(BuildContext context, String label, String value) => ListTile(
    title: Text(label),
    trailing: Text(
      value,
      style: Theme.of(context).textTheme.bodyMedium
          ?.copyWith(fontFeatures: tabular),
    ),
  );
}
