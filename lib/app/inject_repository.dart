import 'package:flutter_meedu/providers.dart';

import 'core/injects_providers/index_injects_providers.dart';
import 'data/repositories_impl/index_repositories_impl.dart';
import 'domain/repositories/index_repositories.dart';

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

  static final supabaseRep = Provider<SupabaseRepository>(
    (ref) => SupabaseRepositoryImpl(
      supabaseProvider: SupabaseInjectProvider.supabaseInjectProvider.read(),
    ),
  );
}
