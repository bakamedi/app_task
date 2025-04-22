import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/utils/global_names_key_storage_util.dart';

class DeviceLocalProvider {
  DeviceLocalProvider({required FlutterSecureStorage secureStorage})
    : _secureStorage = secureStorage;

  final FlutterSecureStorage _secureStorage;

  Future<String> _readValue(String key) async {
    try {
      final value = await _secureStorage.read(key: key);
      return value ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> _writeValue(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      rethrow;
    }
  }

  // Variables para obtenerlas dentro de la app

  Future<String> get initialRouteName async =>
      await _readValue(GlobalNameStorageKeyUtils.INITIAL_ROUTE_NAME);

  Future<String> get accessToken async =>
      await _readValue(GlobalNameStorageKeyUtils.ACCESS_TOKEN);

  Future<String> get refreshToken async =>
      await _readValue(GlobalNameStorageKeyUtils.REFRESH_TOKEN);

  Future<String> get completeName async =>
      await _readValue(GlobalNameStorageKeyUtils.COMPLETE_NAME);

  Future<void> setCompleteName(String completeName) async {
    await _writeValue(GlobalNameStorageKeyUtils.COMPLETE_NAME, completeName);
  }

  Future<void> setInitialRouteName(String routename) async {
    await _writeValue(GlobalNameStorageKeyUtils.INITIAL_ROUTE_NAME, routename);
  }

  Future<void> setAccessToken(String token) async {
    await _writeValue(GlobalNameStorageKeyUtils.ACCESS_TOKEN, token);
  }

  Future<void> setRefreshToken(String token) async {
    await _writeValue(GlobalNameStorageKeyUtils.REFRESH_TOKEN, token);
  }

  Future<void> clearData() async {
    try {
      await _secureStorage.deleteAll();
    } catch (_) {}
  }
}
