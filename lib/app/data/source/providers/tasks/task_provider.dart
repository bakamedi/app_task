import '../../../../core/either/either.dart';
import '../../../../core/success/success.dart';
import '../../../../domain/defs/type_defs.dart';
import '../../../../domain/models/failures/failure.dart';
import '../../../../domain/models/task/task_model.dart';
import '../../../../presentation/global/extensions/task_ext.dart';
import '../store/store_provider.dart';

class TaskProvider {
  TaskProvider({required StoreProvider storeProvider})
    : _storeProvider = storeProvider;
  final StoreProvider _storeProvider;

  FutureEither<Failure, Success> addTask(Task task) async {
    try {
      await _storeProvider.createRecord(task.toJson());
      return const Either.right(Success());
    } catch (e) {
      return const Either.left(Failure.storage());
    }
  }

  FutureEither<Failure, Success> updateTask(Task task) async {
    try {
      await _storeProvider.updateRecord(
        value: task.toJson(),
        finder: task.finderById,
      );
      return const Either.right(Success());
    } catch (e) {
      return const Either.left(Failure.storage());
    }
  }

  FutureEither<Failure, Success> deleteTask(Task task) async {
    try {
      await _storeProvider.removeRecord(finder: task.finderById);
      return const Either.right(Success());
    } catch (e) {
      return const Either.left(Failure.storage());
    }
  }

  FutureEither<Failure, List<Task>> getTasks() async {
    try {
      final recordsFilter = await _storeProvider.getAllRecords(
        finder: Task.finderFilter(),
      );

      final records = recordsFilter
          .map((record) => Task.fromJson(record.value as Json))
          .toList();
      return Either.right(records);
    } catch (e) {
      Exception('Error getTasks: $e');

      return const Either.left(Failure.storage());
    }
  }
}
