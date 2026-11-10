import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'native_engine.dart';

/// The single native engine client. Overridden by `bootstrap()` (shared
/// instance) and by tests (fake subclass).
final nativeEngineProvider = Provider<NativeEngine>((ref) => NativeEngine());
