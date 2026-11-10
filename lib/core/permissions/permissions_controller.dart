import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../platform/native_bridge/engine_provider.dart';

enum AppPermission {
  camera,
  microphone,
  locationWhenInUse,
  speech,
  notifications,
}

enum PermissionStatus {
  granted,
  denied,
  restricted,
  notDetermined,
  limited;

  static PermissionStatus parse(String? s) => values.firstWhere(
    (v) => v.name == s,
    orElse: () => PermissionStatus.denied,
  );

  bool get isGranted => this == granted || this == limited;
}

class PermissionsController
    extends Notifier<Map<AppPermission, PermissionStatus>> {
  @override
  Map<AppPermission, PermissionStatus> build() {
    Future.microtask(refresh);
    return {
      for (final p in AppPermission.values) p: PermissionStatus.notDetermined,
    };
  }

  Future<void> refresh() async {
    final engine = ref.read(nativeEngineProvider);
    final next = <AppPermission, PermissionStatus>{};
    for (final p in AppPermission.values) {
      try {
        next[p] = PermissionStatus.parse(await engine.permissionStatus(p.name));
      } catch (_) {
        next[p] = state[p] ?? PermissionStatus.notDetermined;
      }
    }
    if (ref.mounted) state = next;
  }

  Future<PermissionStatus> request(AppPermission p) async {
    PermissionStatus s;
    try {
      s = PermissionStatus.parse(
        await ref.read(nativeEngineProvider).permissionRequest(p.name),
      );
    } catch (_) {
      s = PermissionStatus.denied;
    }
    if (ref.mounted) state = {...state, p: s};
    return s;
  }

  Future<void> openSettings() => ref.read(nativeEngineProvider).openSettings();
}

final permissionsProvider =
    NotifierProvider<
      PermissionsController,
      Map<AppPermission, PermissionStatus>
    >(PermissionsController.new);
