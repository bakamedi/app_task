import 'package:flutter_meedu/providers.dart';

import '../../../data/source/providers/storage/storage_provider.dart';
import '../../instances/secure_storage/secure_storage_instace.dart';

class StorageInjectProvider {
  StorageInjectProvider._();

  static final storageInjectProvider = Provider(
    (ref) => StorageProvider(secureStorage: SecureStorageIntance.secureStorage),
  );
}
