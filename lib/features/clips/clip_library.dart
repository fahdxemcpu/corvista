import '../../domain/repositories/clips_repository.dart';
import '../../domain/repositories/trip_repository.dart';

/// What produced a clip. Stored in `IncidentClip.kind` by newer databases;
/// older rows (or engines) fall back to `reason`.
enum ClipKind {
  /// Rolling-buffer "Save Incident" clip.
  incident,

  /// Continuous recording started with the Record button.
  manual,

  /// Saved automatically by the possible-impact / emergency flow.
  emergency,

  /// Recorded from TEST footage / diagnostics.
  test;

  static ClipKind? tryParse(String? v) {
    for (final k in values) {
      if (k.name == v) return k;
    }
    return null;
  }

  /// Kind of [clip]. `kind` defaults to `incident` (the only kind before the
  /// column existed), so an `incident` value still defers to `reason`.
  static ClipKind of(IncidentClip clip) {
    final k = tryParse(clip.kind);
    if (k != null && k != incident) return k;
    return switch (clip.reason) {
      'emergency' => emergency,
      'test' => test,
      'recording' => manual,
      _ => incident,
    };
  }
}

enum ClipFilter { all, recordings, incidents, emergency, favorites }

enum ClipSort { newest, oldest, longest, largest }

extension ClipFilterMatch on ClipFilter {
  bool matches(IncidentClip c) => switch (this) {
    ClipFilter.all => true,
    ClipFilter.recordings => ClipKind.of(c) == ClipKind.manual,
    ClipFilter.incidents => ClipKind.of(c) == ClipKind.incident,
    ClipFilter.emergency => ClipKind.of(c) == ClipKind.emergency,
    ClipFilter.favorites => c.favorite,
  };
}

/// Filters and sorts [clips] (a new list; ties keep newest first).
List<IncidentClip> filterAndSort(
  Iterable<IncidentClip> clips,
  ClipFilter filter,
  ClipSort sort,
) {
  final out = clips.where(filter.matches).toList();
  int newest(IncidentClip a, IncidentClip b) =>
      b.createdAt.compareTo(a.createdAt);
  out.sort(switch (sort) {
    ClipSort.newest => newest,
    ClipSort.oldest => (a, b) => a.createdAt.compareTo(b.createdAt),
    ClipSort.longest => (a, b) {
      final c = b.durationMs.compareTo(a.durationMs);
      return c != 0 ? c : newest(a, b);
    },
    ClipSort.largest => (a, b) {
      final c = b.sizeBytes.compareTo(a.sizeBytes);
      return c != 0 ? c : newest(a, b);
    },
  });
  return out;
}

/// A run of clips recorded on the same local calendar day.
class ClipDayGroup {
  ClipDayGroup(this.day, this.clips);

  /// Local midnight, or null for an ungrouped (size/length sorted) list.
  final DateTime? day;
  final List<IncidentClip> clips;

  int get totalBytes => clips.fold(0, (a, c) => a + c.sizeBytes);
}

/// Groups an already-sorted list by local day for date sorts; other sorts
/// return one ungrouped section so the order stays meaningful.
List<ClipDayGroup> groupByDay(List<IncidentClip> sorted, ClipSort sort) {
  if (sorted.isEmpty) return const [];
  if (sort != ClipSort.newest && sort != ClipSort.oldest) {
    return [ClipDayGroup(null, sorted)];
  }
  final groups = <ClipDayGroup>[];
  for (final c in sorted) {
    final l = c.createdAt.toLocal();
    final day = DateTime(l.year, l.month, l.day);
    if (groups.isEmpty || groups.last.day != day) {
      groups.add(ClipDayGroup(day, []));
    }
    groups.last.clips.add(c);
  }
  return groups;
}

/// Clip counts per kind (for the storage header).
Map<ClipKind, int> countByKind(Iterable<IncidentClip> clips) {
  final m = {for (final k in ClipKind.values) k: 0};
  for (final c in clips) {
    m[ClipKind.of(c)] = m[ClipKind.of(c)]! + 1;
  }
  return m;
}

/// The trip a clip was recorded in: the clip's footage interval
/// `[createdAt - duration, createdAt]` overlaps the trip (open trips run until
/// [now]). The trip with the largest overlap wins.
Trip? tripForClip(IncidentClip clip, Iterable<Trip> trips, {DateTime? now}) {
  final end = clip.createdAt;
  final start = end.subtract(Duration(milliseconds: clip.durationMs));
  final t = now ?? DateTime.now();
  Trip? best;
  var bestMs = -1;
  for (final trip in trips) {
    final tEnd = trip.endedAt ?? t;
    final s = start.isAfter(trip.startedAt) ? start : trip.startedAt;
    final e = end.isBefore(tEnd) ? end : tEnd;
    // Zero-length clips still match when their instant lies inside the trip.
    final overlap = e.difference(s).inMilliseconds;
    if (overlap < 0) continue;
    if (overlap > bestMs) {
      best = trip;
      bestMs = overlap;
    }
  }
  return best;
}
