import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/incident.dart';

import 'fake_engine.dart';
import 'test_container.dart';

/// Test-only clip for library widget/logic tests.
IncidentClip clipFixture(
  String id, {
  String kind = 'incident',
  String reason = 'manual',
  bool favorite = false,
  DateTime? at,
  int durationMs = 20000,
  int sizeBytes = 50000000,
  bool hasAudio = false,
  double? lat,
  double? lon,
  String title = '',
}) => IncidentClip(
  id: id,
  title: title.isEmpty ? 'Clip $id' : title,
  path: '/clips/$id.mp4',
  thumbnailPath: null,
  durationMs: durationMs,
  width: 1920,
  height: 1080,
  sizeBytes: sizeBytes,
  hasAudio: hasAudio,
  favorite: favorite,
  createdAt: at ?? DateTime(2026, 3, 4, 10),
  reason: reason,
  lat: lat,
  lon: lon,
  speed: null,
  missingFile: false,
  kind: kind,
);

Trip tripFixture(String id, DateTime start, Duration length) => Trip(
  id: id,
  startedAt: start,
  endedAt: start.add(length),
  distanceM: 5000,
  movingTimeS: length.inSeconds.toDouble(),
  avgSpeedMs: 10,
  maxSpeedMs: 20,
  startLat: null,
  startLon: null,
  endLat: null,
  endLon: null,
  startPlace: null,
  endPlace: null,
  detectionCounts: const {},
  alertsCount: 0,
  incidentCount: 0,
  emergencyCount: 0,
  title: '',
  favorite: false,
);

/// Records library mutations instead of touching Drift / native files.
class FakeClipsRepository extends ClipsRepository {
  FakeClipsRepository() : super(memoryDb(), FakeNativeEngine());

  final deleted = <String>[];
  final added = <(IncidentResult, String?)>[];

  @override
  Future<void> add(IncidentResult r, {String? title}) async =>
      added.add((r, title));
  final favorites = <String, bool>{};

  @override
  Future<void> deleteMany(Iterable<String> ids) async => deleted.addAll(ids);

  @override
  Future<void> setFavorite(String id, bool v) async => favorites[id] = v;

  @override
  Future<int> reconcile({List<IncidentResult> recovered = const []}) async => 0;
}
