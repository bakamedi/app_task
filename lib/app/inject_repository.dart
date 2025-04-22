import 'package:flutter_meedu/providers.dart';

import 'core/injects_providers/db/db_inject_provider.dart';
import 'data/repositories_impl/db_repository_impl.dart';
import 'data/repositories_impl/router_repository_impl.dart';
import 'domain/repositories/db_repository.dart';
import 'domain/repositories/router_repository.dart';

class Repositories {
  Repositories._();

  static final routerRep = Provider<RouterRepository>(
    (ref) => RouterRepositoryImpl(),
  );

  static final dbRep = Provider<DbRepository>(
    (ref) =>
        DbRepositoryImpl(dbProvider: DbInjectProvider.dbInjectProvider.read()),
  );
}
