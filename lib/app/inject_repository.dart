import 'package:flutter_meedu/providers.dart';

import 'data/repositories_impl/router_repository_impl.dart';
import 'domain/repositories/router_repository.dart';

class Repositories {
  Repositories._();

  static final authRep = Provider<RouterRepository>(
    (ref) => RouterRepositoryImpl(),
  );
}
