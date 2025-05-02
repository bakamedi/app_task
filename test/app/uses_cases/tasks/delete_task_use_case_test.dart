import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app_task/app/domain/models/task/task_model.dart';
import 'package:app_task/app/domain/repositories/task_repository.dart';
import 'package:app_task/app/domain/uses_cases/tasks/delete/delete_task_use_case.dart';

// Fake para el tipo Task
class FakeTask extends Fake implements Task {}

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late MockTaskRepository mockRepository;
  late DeleteTaskUseCase deleteTaskUseCase;

  // Registrar el fallback antes de cualquier test
  setUpAll(() {
    registerFallbackValue(FakeTask());
  });

  setUp(() {
    mockRepository = MockTaskRepository();
    deleteTaskUseCase = DeleteTaskUseCase(taskRepository: mockRepository);
  });

  test('should call deleteTask on repository with the given task', () async {
    // Arrange
    final task = Task(
      id: '1',
      title: 'Task to delete',
      description: '',
      order: 0,
      completed: false,
      createdAt: '2025-01-01',
    );

    when(() => mockRepository.deleteTask(any())).thenAnswer((_) async => {});

    // Act
    await deleteTaskUseCase(task);

    // Assert
    verify(() => mockRepository.deleteTask(task)).called(1);
  });
}
