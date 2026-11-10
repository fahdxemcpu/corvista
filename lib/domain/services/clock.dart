import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Injectable wall clock (tests override with a fixed/fake clock).
typedef Clock = DateTime Function();

final clockProvider = Provider<Clock>((ref) => DateTime.now);
