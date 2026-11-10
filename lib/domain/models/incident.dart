/// Result of `recorder.saveIncident` / `recorder.recover`.
class IncidentResult {
  const IncidentResult({
    required this.id,
    required this.path,
    required this.thumbnailPath,
    required this.durationMs,
    required this.width,
    required this.height,
    required this.sizeBytes,
    required this.hasAudio,
    required this.createdAt,
    required this.reason,
    this.lat,
    this.lon,
    this.speed,
    this.kindOverride,
    this.part,
  });

  final String id;
  final String path;
  final String? thumbnailPath;
  final int durationMs;
  final int width;
  final int height;
  final int sizeBytes;
  final bool hasAudio;
  final DateTime createdAt;
  final String reason;
  final double? lat, lon, speed;

  /// Native `kind`, when sent.
  final String? kindOverride;

  /// `incident` | `manual` | `emergency` | `test` (native `kind`, else derived
  /// from [reason]).
  String get kind => kindFor(reason, kind: kindOverride);

  /// Manual recordings: 1-based part index within the recording.
  final int? part;

  /// Derives the kind when native did not send one (older results / recover).
  static String kindFor(String reason, {String? kind}) {
    if (kind != null && kind.isNotEmpty) return kind;
    if (reason == 'emergency') return 'emergency';
    if (reason == 'recording') return 'manual';
    if (reason == 'test') return 'test';
    return 'incident';
  }

  static IncidentResult fromMap(Map<Object?, Object?> m) => IncidentResult(
    id: m['id'] as String,
    path: m['path'] as String,
    thumbnailPath: m['thumbnailPath'] as String?,
    durationMs: (m['durationMs'] as num).toInt(),
    width: (m['width'] as num).toInt(),
    height: (m['height'] as num).toInt(),
    sizeBytes: (m['sizeBytes'] as num).toInt(),
    hasAudio: m['hasAudio'] == true,
    createdAt: DateTime.fromMillisecondsSinceEpoch(
      (m['createdAt'] as num).toInt(),
    ),
    reason: m['reason'] as String? ?? 'manual',
    lat: (m['lat'] as num?)?.toDouble(),
    lon: (m['lon'] as num?)?.toDouble(),
    speed: (m['speed'] as num?)?.toDouble(),
    kindOverride:
        m['kind'] as String? ?? (m['testFootage'] == true ? 'test' : null),
    part: (m['part'] as num?)?.toInt(),
  );
}
