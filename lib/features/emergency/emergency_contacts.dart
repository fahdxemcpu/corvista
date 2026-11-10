import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/errors/error_log.dart';
import '../../data/local_storage/secure_store.dart';
import '../../platform/native_bridge/engine_provider.dart';

class EmergencyContact {
  const EmergencyContact({
    required this.identifier,
    required this.name,
    required this.phone,
  });
  final String identifier, name, phone;

  Map<String, String> toJson() => {
    'identifier': identifier,
    'name': name,
    'phone': phone,
  };

  static EmergencyContact fromJson(Map<Object?, Object?> j) => EmergencyContact(
    identifier: '${j['identifier'] ?? ''}',
    name: '${j['name'] ?? ''}',
    phone: '${j['phone'] ?? ''}',
  );
}

/// Emergency contacts in the Keychain (flutter_secure_storage, JSON list).
class EmergencyContactsController
    extends AsyncNotifier<List<EmergencyContact>> {
  static const storageKey = 'emergency_contacts';
  static const maxContacts = 5;

  @override
  Future<List<EmergencyContact>> build() async {
    final raw = await ref.read(secureStorageProvider).read(key: storageKey);
    if (raw == null || raw.isEmpty) return const [];
    try {
      final list = [
        for (final e in jsonDecode(raw) as List)
          EmergencyContact.fromJson(e as Map),
      ];
      _protect(list);
      return list;
    } catch (_) {
      return const [];
    }
  }

  /// Keeps contact names and numbers out of the private error log.
  static void _protect(List<EmergencyContact> list) =>
      ErrorLog.instance?.setSensitiveTerms([
        for (final c in list) ...[c.name, c.phone],
      ]);

  Future<void> _save(List<EmergencyContact> list) async {
    await ref
        .read(secureStorageProvider)
        .write(
          key: storageKey,
          value: jsonEncode([for (final c in list) c.toJson()]),
        );
    _protect(list);
    if (ref.mounted) state = AsyncData(list);
  }

  /// Opens the system contact picker (no Contacts permission needed).
  /// Returns false when cancelled, duplicate, or the list is full.
  Future<bool> pickAndAdd() async {
    final m = await ref.read(nativeEngineProvider).pickContact();
    if (m == null) return false;
    final c = EmergencyContact.fromJson(m);
    if (c.phone.trim().isEmpty) return false;
    return add(c);
  }

  Future<bool> add(EmergencyContact c) async {
    final current = await future;
    if (current.length >= maxContacts) return false;
    if (current.any(
      (e) => e.identifier == c.identifier || e.phone == c.phone,
    )) {
      return false;
    }
    await _save([...current, c]);
    return true;
  }

  Future<void> remove(String identifier) async {
    final current = await future;
    await _save(current.where((c) => c.identifier != identifier).toList());
  }
}

final emergencyContactsProvider =
    AsyncNotifierProvider<EmergencyContactsController, List<EmergencyContact>>(
      EmergencyContactsController.new,
    );
