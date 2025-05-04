import 'package:flutter_meedu/providers.dart';
import 'package:logger/logger.dart';

import '../../../data/source/providers/store/store_provider.dart';
import '../db/db_inject_provider.dart';

final _globalLogger = Logger(
  level: bool.fromEnvironment('dart.vm.product') ? Level.warning : Level.debug,
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 3,
    lineLength: 80,
    colors: true,
    printEmojis: true,
  ),
);

class StoreInjectProvider {
  StoreInjectProvider._();

  static final storeInjectProvider = Provider(
    (ref) => StoreProvider(
      dbProvider: DbInjectProvider.dbInjectProvider.read(),
      storeName: 'my_store',
      logger: _globalLogger,
    ),
  );
}
