import '../../../../domain/models/task/task_model.dart';
import '../../../../presentation/global/extensions/finder_ext.dart';
import '../../../../presentation/global/extensions/task_ext.dart';
import '../store/store_provider.dart';

class TaskProvider {
  TaskProvider({required StoreProvider storeProvider})
    : _storeProvider = storeProvider;
  final StoreProvider _storeProvider;

  Future<void> addTask(Task task) async {
    await _storeProvider.createRecord(task.toJson());
  }

  Future<void> updateTask(Task task) async {
    await _storeProvider.updateRecord(
      value: task.toJson(),
      finder: task.finderById,
    );
  }

  Future<void> deleteTask(Task task) async {
    await _storeProvider.removeRecord(finder: task.finderById);
  }

  Future<List<Task>> getTasks({bool completed = false}) async {
    try {
      final records = await _storeProvider.getAllRecords(
        finder: FinderExtensions.byCompleted(completed),
      );

      return records
          .map((record) => Task.fromJson(record.value as Map<String, dynamic>))
          .toList();
    } catch (e) {
      Exception('Error getTasks: $e');

      return [];
    }
  }
}
