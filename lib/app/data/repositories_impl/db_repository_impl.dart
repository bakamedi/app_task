import '../../domain/repositories/db_repository.dart';
import '../source/providers/db/db_provider.dart';

class DbRepositoryImpl extends DbRepository {
  DbRepositoryImpl({required DbProvider dbProvider}) : _dbProvider = dbProvider;
  final DbProvider _dbProvider;

  @override
  Future<void> close() async {
    await _dbProvider.close();
  }

  @override
  Future<void> connect() async {
    await _dbProvider.connect();
  }
}
