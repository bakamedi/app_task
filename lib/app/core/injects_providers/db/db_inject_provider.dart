import 'package:flutter_meedu/providers.dart';
import 'package:sembast/sembast_io.dart';

import '../../../data/source/providers/db/db_provider.dart';

class DbInjectProvider {
  DbInjectProvider._();

  static final dbInjectProvider = Provider(
    (ref) => DbProvider(databaseFactory: databaseFactoryIo),
  );
}
