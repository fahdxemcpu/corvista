import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/incident.dart';
import '../../domain/repositories/clips_repository.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../../platform/native_bridge/native_engine.dart';
import 'clip_library.dart';

/// Outcome of saving one or more clips to Photos.
class PhotosBatchResult {
  const PhotosBatchResult({
    required this.saved,
    required this.failed,
    required this.denied,
  });

  final int saved, failed;

  /// Add-only Photos access was refused; the batch stopped there.
  final bool denied;
}

/// Library operations that span native + catalogue (trim, Photos export,
/// cleanup). UI-free so they can be unit tested with the fake engine.
class ClipActions {
  ClipActions(this._engine, this._repo);

  final NativeEngine _engine;
  final ClipsRepository _repo;

  /// Exports `[startMs, endMs]` of [clip] as a new clip, catalogues it and
  /// returns it. The original is not modified. Throws [PlatformException]
  /// (`storage_full`, `io_error`, `failed`, `bad_args`).
  Future<IncidentResult> trim(
    IncidentClip clip, {
    required int startMs,
    required int endMs,
    required String title,
  }) async {
    // The new clip's time is when its last frame was recorded, so it keeps
    // its place in the timeline (and its trip).
    final createdAt = clip.createdAt.subtract(
      Duration(milliseconds: (clip.durationMs - endMs).clamp(0, 1 << 31)),
    );
    final r = await _engine.mediaTrim(
      clip.path,
      startMs: startMs,
      endMs: endMs,
      meta: {
        'title': title,
        'reason': clip.reason,
        'kind': ClipKind.of(clip).name,
        'createdAt': createdAt.millisecondsSinceEpoch,
        'lat': ?clip.lat,
        'lon': ?clip.lon,
        'speed': ?clip.speed,
      },
    );
    await _repo.add(r, title: title);
    return r;
  }

  /// Saves [clips] to Photos one by one, reporting `(done, total)` after
  /// each. Stops at the first `denied` (further requests would be refused).
  Future<PhotosBatchResult> saveToPhotos(
    List<IncidentClip> clips, {
    void Function(int done, int total)? onProgress,
  }) async {
    var saved = 0, failed = 0;
    for (var i = 0; i < clips.length; i++) {
      final c = clips[i];
      String r;
      try {
        r = c.missingFile
            ? 'failed'
            : await _engine.saveToPhotos(
                c.path,
                createdAt: c.createdAt,
                lat: c.lat,
                lon: c.lon,
              );
      } catch (_) {
        r = 'failed';
      }
      if (r == 'denied') {
        return PhotosBatchResult(saved: saved, failed: failed, denied: true);
      }
      if (r == 'saved') {
        saved++;
      } else {
        failed++;
      }
      onProgress?.call(i + 1, clips.length);
    }
    return PhotosBatchResult(saved: saved, failed: failed, denied: false);
  }

  /// Settings › Free up space: frees temporary data only (stale buffer
  /// segments, partial exports, temp share/GPX files, orphan thumbnails,
  /// decoded image caches). Saved clips and trips are never touched; valid
  /// recovered exports are added to the library. Returns bytes freed.
  Future<int> freeUpSpace() async {
    PaintingBinding.instance.imageCache
      ..clear()
      ..clearLiveImages();
    var freed = 0;
    try {
      final r = await _engine.mediaCleanup();
      if (r is num) freed = r.toInt();
      if (r is Map) {
        if (r['bytesFreed'] is num) freed = (r['bytesFreed'] as num).toInt();
        final recovered = r['recovered'];
        if (recovered is List && recovered.isNotEmpty) {
          await _repo.reconcile(
            recovered: [
              for (final m in recovered.whereType<Map<Object?, Object?>>())
                IncidentResult.fromMap(m),
            ],
          );
        }
      }
    } catch (_) {
      // Older native engine without media.cleanup: caches were still cleared.
    }
    return freed;
  }
}

final clipActionsProvider = Provider<ClipActions>(
  (ref) => ClipActions(
    ref.watch(nativeEngineProvider),
    ref.watch(clipsRepositoryProvider),
  ),
);
