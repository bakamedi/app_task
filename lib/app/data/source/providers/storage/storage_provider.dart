import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageProvider {
  StorageProvider({required FlutterSecureStorage secureStorage})
    : _secureStorage = secureStorage;

  final FlutterSecureStorage _secureStorage;

  Future<String> readValue(String key) async {
    try {
      final value = await _secureStorage.read(key: key);
      return value ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> writeValue(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      rethrow;
    }
  }
}
