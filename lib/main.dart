import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/bootstrap.dart';
import 'core/errors/error_log.dart';
import 'platform/native_bridge/native_engine.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Private on-device error log (never sent automatically). Installed before
  // bootstrap so start-up failures are captured too.
  final log = await ErrorLog.install();
  _registerLicenses();
  final engine = NativeEngine();
  final overrides = await bootstrap(engine: engine);
  runApp(ProviderScope(overrides: overrides, child: const CorvistaApp()));
  if (log != null) {
    engine
        .systemInfo()
        .then((m) {
          log.setVersion(
            m['appVersion'] as String? ?? '?',
            m['build']?.toString() ?? '?',
          );
        })
        .catchError((Object _) {});
  }
}

/// Open-source notices for bundled on-device model components, shown in
/// Settings › Information › Open-source licences (Flutter's licence page).
void _registerLicenses() {
  LicenseRegistry.addLicense(() async* {
    final apache = await rootBundle.loadString(
      'assets/licenses/scene_model_LICENSE.txt',
    );
    yield LicenseEntryWithLineBreaks(const ['On-device scene model'], apache);
    final detection = await rootBundle.loadString(
      'assets/licenses/detection_model_LICENSE.txt',
    );
    yield LicenseEntryWithLineBreaks(const [
      'On-device detection model',
    ], detection);
  });
}
