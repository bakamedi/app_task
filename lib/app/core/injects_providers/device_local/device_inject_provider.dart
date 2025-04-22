import 'package:flutter_meedu/providers.dart';

import '../../../data/source/providers/device_local/device_local_provider.dart';
import '../../instances/secure_storage/secure_storage_instace.dart';

class DeviceInjectProvider {
  DeviceInjectProvider._();

  static final deviceLocalProvider = Provider(
    (ref) =>
        DeviceLocalProvider(secureStorage: SecureStorageIntance.secureStorage),
  );
}
