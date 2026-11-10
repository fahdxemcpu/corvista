import 'package:corvista/app/providers.dart';
import 'package:corvista/domain/models/app_settings.dart';
import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show ProviderListenable;

import 'fake_engine.dart';

class TestEnv {
  TestEnv(this.container, this.engine, this.db);
  final ProviderContainer container;
  final FakeNativeEngine engine;
  final AppDatabase db;

  T read<T>(ProviderListenable<T> p) => container.read(p);
}

/// Lets queued microtasks / stream events run.
Future<void> settle([int rounds = 5]) async {
  for (var i = 0; i < rounds; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

AppDatabase memoryDb() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  return AppDatabase(NativeDatabase.memory());
}

/// Container with a fake engine, in-memory DB and given settings.
Future<TestEnv> makeEnv({
  AppSettings settings = const AppSettings(),
  List<Override> overrides = const [],
  AppDatabase? db,
}) async {
  final engine = FakeNativeEngine();
  final database = db ?? memoryDb();
  final c = ProviderContainer.test(
    overrides: [
      nativeEngineProvider.overrideWithValue(engine),
      databaseProvider.overrideWithValue(database),
      initialSettingsProvider.overrideWithValue(settings),
      emergencyTickProvider.overrideWithValue(const Duration(milliseconds: 10)),
      ...overrides,
    ],
    retry: (_, _) => null,
  );
  await settle();
  return TestEnv(c, engine, database);
}
