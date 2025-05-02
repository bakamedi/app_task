import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app_task/app/domain/models/task/task_model.dart';
import 'package:app_task/app/domain/repositories/task_repository.dart';
import 'package:app_task/app/domain/uses_cases/tasks/update/update_task_use_case.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late MockTaskRepository mockRepository;
  late UpdateTaskUseCase updateTaskUseCase;

  setUpAll(() {
    // Fallback para evitar error con `any()`
    registerFallbackValue(
      Task(
        id: '',
        title: '',
        description: '',
        order: 0,
        completed: false,
        createdAt: '',
      ),
    );
  });

  setUp(() {
    mockRepository = MockTaskRepository();
    updateTaskUseCase = UpdateTaskUseCase(taskRepository: mockRepository);
  });

  test('should call updateTask on repository with the given task', () async {
    // Arrange
    final task = Task(
      id: '1',
      title: 'Updated Task',
      description: 'Updated Description',
      order: 2,
      completed: true,
      createdAt: '2025-01-01',
    );

    when(() => mockRepository.updateTask(any())).thenAnswer((_) async => {});

    // Act
    await updateTaskUseCase(task);

    // Assert
    verify(() => mockRepository.updateTask(task)).called(1);
  });
}
