// Build-only entrypoint for native work: `flutter build ios --simulator --debug -t lib/native_smoke_main.dart`.
// Imports nothing from the app so native builds are independent of in-progress Dart code.
import 'package:flutter/widgets.dart';

void main() => runApp(const SizedBox());
