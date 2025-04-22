import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageIntance {
  SecureStorageIntance._();

  static final secureStorage = FlutterSecureStorage(
    aOptions: const AndroidOptions(
      encryptedSharedPreferences: true,
      resetOnError: true,
    ),
  );
}
