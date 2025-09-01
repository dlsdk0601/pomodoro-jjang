import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage({required String name}) : _name = name;

  final String _name;

  late final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      resetOnError: true,
      sharedPreferencesName: _name,
      preferencesKeyPrefix: _name,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
      accountName: _name,
    ),
  );

  Future<void> deleteAll() async {
    await _flutterSecureStorage.deleteAll();
  }

  Future<void> delete(StorageKey key) async {
    await _flutterSecureStorage.delete(key: key.name);
  }

  Future<void> set(StorageKey key, dynamic value) async {
    await _flutterSecureStorage.write(key: key.name, value: value.toString());
  }

  Future<String?> read(StorageKey key) async {
    return await _flutterSecureStorage.read(key: key.name);
  }
}

enum StorageKey {
  IS_DARK("isDark");

  const StorageKey(this.name);

  final String name;
}

final storage = SecureStorage(name: 'pomoJjang');
