import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart' show InsertMode, Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/errors/app_errors.dart';
import '../../data/database/database.dart';
import '../../platform/native_bridge/engine_provider.dart';
import '../settings/settings_controller.dart';

class AiModelInfo {
  const AiModelInfo({
    required this.id,
    required this.name,
    required this.version,
    required this.license,
    required this.source,
    required this.installed,
    required this.supportsSegmentation,
    required this.sizeBytes,
    required this.inputSize,
    this.measuredMeanMs,
  });

  final String id, name, version, license, source;
  final bool installed, supportsSegmentation;
  final int sizeBytes;
  final int inputSize;
  final double? measuredMeanMs;

  static AiModelInfo fromMap(Map<Object?, Object?> m) => AiModelInfo(
    id: m['id'] as String? ?? '',
    name: m['name'] as String? ?? '',
    version: m['version'] as String? ?? '',
    license: m['license'] as String? ?? '',
    source: m['source'] as String? ?? '',
    installed: m['installed'] != false,
    supportsSegmentation: m['supportsSegmentation'] == true,
    sizeBytes: (m['sizeBytes'] as num?)?.toInt() ?? 0,
    inputSize: (m['inputSize'] as num?)?.toInt() ?? 0,
  );

  AiModelInfo withMeasured(double? ms) => AiModelInfo(
    id: id,
    name: name,
    version: version,
    license: license,
    source: source,
    installed: installed,
    supportsSegmentation: supportsSegmentation,
    sizeBytes: sizeBytes,
    inputSize: inputSize,
    measuredMeanMs: ms,
  );
}

class AiModelState {
  const AiModelState({
    this.models = const [],
    this.selectedId = 'efficient',
    this.loading = false,
    this.error,
    this.lastLoadMs,
    this.inferenceMs = 0,
    this.detectHz = 0,
  });

  final List<AiModelInfo> models;
  final String selectedId;
  final bool loading;
  final String? error;
  final double? lastLoadMs;
  final double inferenceMs;
  final double detectHz;

  AiModelInfo? get selected =>
      models.where((m) => m.id == selectedId).firstOrNull;

  AiModelState copyWith({
    List<AiModelInfo>? models,
    String? selectedId,
    bool? loading,
    String? Function()? error,
    double? Function()? lastLoadMs,
    double? inferenceMs,
    double? detectHz,
  }) => AiModelState(
    models: models ?? this.models,
    selectedId: selectedId ?? this.selectedId,
    loading: loading ?? this.loading,
    error: error != null ? error() : this.error,
    lastLoadMs: lastLoadMs != null ? lastLoadMs() : this.lastLoadMs,
    inferenceMs: inferenceMs ?? this.inferenceMs,
    detectHz: detectHz ?? this.detectHz,
  );
}

class AiModelController extends Notifier<AiModelState> {
  StreamSubscription<Map<Object?, Object?>>? _sub;
  String? _loadedId;

  @override
  AiModelState build() {
    _sub = ref.read(nativeEngineProvider).status.listen((m) {
      if (m['type'] != 'perf') return;
      state = state.copyWith(
        inferenceMs: (m['inferenceMs'] as num?)?.toDouble(),
        detectHz: (m['detectHz'] as num?)?.toDouble(),
      );
    }, onError: (_) {});
    ref.onDispose(() => _sub?.cancel());
    Future.microtask(loadModels);
    return AiModelState(selectedId: ref.read(settingsProvider).modelId);
  }

  Future<void> loadModels() async {
    try {
      final raw = await ref.read(nativeEngineProvider).aiModels();
      if (!ref.mounted) return;
      final models = raw.map(AiModelInfo.fromMap).toList();
      final measured = {for (final m in state.models) m.id: m.measuredMeanMs};
      state = state.copyWith(
        models: [for (final m in models) m.withMeasured(measured[m.id])],
      );
      unawaited(_seed(raw));
    } catch (e) {
      if (ref.mounted) state = state.copyWith(error: () => errorMessage(e));
    }
  }

  Future<void> _seed(List<Map<Object?, Object?>> raw) async {
    try {
      final db = ref.read(databaseProvider);
      await db.batch((b) {
        for (final m in raw) {
          b.insert(
            db.aiModels,
            AiModelsCompanion.insert(
              id: m['id'] as String? ?? '',
              name: m['name'] as String? ?? '',
              version: Value(m['version'] as String? ?? ''),
              fileName: Value(m['fileName'] as String? ?? ''),
              labelsJson: Value(jsonEncode(m['labels'] ?? const [])),
              license: Value(m['license'] as String? ?? ''),
            ),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
    } catch (_) {}
  }

  /// User selection: loads the model and persists the choice.
  Future<void> select(String id) async {
    final ok = await activate(id);
    if (ok) {
      await ref
          .read(settingsProvider.notifier)
          .update((s) => s.copyWith(modelId: id));
    }
  }

  /// Loads [id] natively (no persistence). Returns success.
  Future<bool> activate(String id, {bool force = false}) async {
    if (!force && _loadedId == id && state.error == null) {
      state = state.copyWith(selectedId: id);
      return true;
    }
    state = state.copyWith(loading: true, error: () => null);
    try {
      final r = await ref.read(nativeEngineProvider).aiSetModel(id);
      if (!ref.mounted) return false;
      _loadedId = id;
      state = state.copyWith(
        selectedId: id,
        loading: false,
        lastLoadMs: () => (r['loadMs'] as num?)?.toDouble(),
      );
      return true;
    } catch (e) {
      if (!ref.mounted) return false;
      state = state.copyWith(loading: false, error: () => errorCode(e));
      return false;
    }
  }

  /// Loads the user's stored model choice. Called by the drive session.
  Future<bool> applySelected() => activate(ref.read(settingsProvider).modelId);

  Future<void> benchmark(String imagePath) async {
    state = state.copyWith(loading: true, error: () => null);
    try {
      final r = await ref.read(nativeEngineProvider).aiBenchmark(imagePath);
      if (!ref.mounted) return;
      final id = r['model'] as String? ?? state.selectedId;
      final mean = (r['meanMs'] as num?)?.toDouble();
      state = state.copyWith(
        loading: false,
        models: [
          for (final m in state.models) m.id == id ? m.withMeasured(mean) : m,
        ],
      );
      try {
        final db = ref.read(databaseProvider);
        await (db.update(db.aiModels)..where((t) => t.id.equals(id))).write(
          AiModelsCompanion(
            perfJson: Value(jsonEncode(r.map((k, v) => MapEntry('$k', v)))),
          ),
        );
      } catch (_) {}
    } catch (e) {
      if (ref.mounted) {
        state = state.copyWith(loading: false, error: () => errorMessage(e));
      }
    }
  }
}

final aiModelsProvider = NotifierProvider<AiModelController, AiModelState>(
  AiModelController.new,
);
