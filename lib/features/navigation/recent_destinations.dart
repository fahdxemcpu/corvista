import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/database.dart';
import 'navigation_models.dart';

/// Recently navigated destinations, newest first, persisted locally (max 10).
class RecentDestinationsController extends Notifier<List<Place>> {
  static const max = 10;
  static const storageKey = 'nav.recents';

  bool _loaded = false;

  @override
  List<Place> build() {
    unawaited(_load());
    return const [];
  }

  Future<void> _load() async {
    try {
      final raw = await ref.read(databaseProvider).readSetting(storageKey);
      if (!ref.mounted) return;
      if (raw != null && raw.isNotEmpty) {
        final list = [
          for (final m in (jsonDecode(raw) as List))
            if (m is Map && m['lat'] is num && m['lon'] is num)
              Place.fromMap(m.cast<Object?, Object?>()),
        ];
        // Keep anything added before loading finished on top.
        state = _merge(state, list);
      }
    } catch (_) {
      // Unreadable history is not worth an error.
    } finally {
      _loaded = true;
    }
  }

  static List<Place> _merge(List<Place> first, List<Place> rest) {
    final out = <Place>[];
    for (final p in [...first, ...rest]) {
      if (out.any(p.sameAs)) continue;
      out.add(p);
      if (out.length == max) break;
    }
    return out;
  }

  /// Ensures persisted entries are loaded (tests).
  Future<void> ready() async {
    while (!_loaded) {
      await Future<void>.delayed(const Duration(milliseconds: 5));
    }
  }

  Future<void> add(Place p) async {
    state = _merge([p], state);
    await _save();
  }

  Future<void> remove(Place p) async {
    state = [
      for (final x in state)
        if (!x.sameAs(p)) x,
    ];
    await _save();
  }

  Future<void> clear() async {
    state = const [];
    await _save();
  }

  Future<void> _save() async {
    try {
      await ref
          .read(databaseProvider)
          .writeSetting(
            storageKey,
            jsonEncode([for (final p in state) p.toJson()]),
          );
    } catch (_) {}
  }
}

final recentDestinationsProvider =
    NotifierProvider<RecentDestinationsController, List<Place>>(
      RecentDestinationsController.new,
    );
