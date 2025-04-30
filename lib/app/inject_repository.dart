import 'package:flutter_meedu/providers.dart';

import 'core/injects_providers/db/db_inject_provider.dart';
import 'core/injects_providers/storage/storage_inject_provider.dart';
import 'core/injects_providers/task/task_inject_provider.dart';
import 'data/repositories_impl/db_repository_impl.dart';
import 'data/repositories_impl/router_repository_impl.dart';
import 'data/repositories_impl/snackbar_repository_impl.dart';
import 'data/repositories_impl/task_repository_impl.dart';
import 'data/repositories_impl/user_preferences_repository_impl.dart';
import 'domain/repositories/db_repository.dart';
import 'domain/repositories/router_repository.dart';
import 'domain/repositories/snackbar_repository.dart';
import 'domain/repositories/task_repository.dart';
import 'domain/repositories/user_preferences_repository.dart';

class Repositories {
  Repositories._();

  static final routerRep = Provider<RouterRepository>(
    (ref) => RouterRepositoryImpl(),
  );

  static final snackbarRep = Provider<SnackbarRepository>(
    (ref) => SnackbarRepositoryImpl(),
  );

  static final dbRep = Provider<DbRepository>(
    (ref) =>
        DbRepositoryImpl(dbProvider: DbInjectProvider.dbInjectProvider.read()),
  );

  static final taskRep = Provider<TaskRepository>(
    (ref) => TaskRepositoryImpl(
      taskProvider: TaskInjectProvider.taskInjectProvider.read(),
    ),
  );

  static final userPreferenceRep = Provider<UserPreferencesRepository>(
    (ref) => UserPreferencesRepositoryImpl(
      storageProvider: StorageInjectProvider.storageInjectProvider.read(),
    ),
  );
}
