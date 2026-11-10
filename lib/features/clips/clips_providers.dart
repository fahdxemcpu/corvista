import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/clips_repository.dart';
import '../../platform/native_bridge/engine_provider.dart';

export '../../domain/repositories/clips_repository.dart';
export 'clip_actions.dart';
export 'clip_library.dart';

class StorageInfo {
  const StorageInfo({
    required this.freeBytes,
    required this.totalBytes,
    required this.clipsBytes,
    required this.bufferBytes,
    required this.clipCount,
  });
  final int freeBytes, totalBytes, clipsBytes, bufferBytes, clipCount;
}

/// Every catalogued clip, newest first (no gallery limit; bounded only by
/// device storage).
final clipsProvider = StreamProvider<List<IncidentClip>>(
  (ref) => ref.watch(clipsRepositoryProvider).watchAll(),
);

final storageInfoProvider = FutureProvider<StorageInfo>((ref) async {
  final m = await ref.read(nativeEngineProvider).storage();
  final count = await ref.read(clipsRepositoryProvider).count();
  int i(String k) => (m[k] as num?)?.toInt() ?? 0;
  return StorageInfo(
    freeBytes: i('freeBytes'),
    totalBytes: i('totalBytes'),
    clipsBytes: i('clipsBytes'),
    bufferBytes: i('bufferBytes'),
    clipCount: count,
  );
});
