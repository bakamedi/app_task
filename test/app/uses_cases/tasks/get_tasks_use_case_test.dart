import 'package:app_task/app/domain/models/task/task_model.dart';
import 'package:app_task/app/domain/repositories/task_repository.dart';
import 'package:app_task/app/domain/uses_cases/tasks/gets/get_tasks_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late MockTaskRepository mockRepository;
  late GetTasksUseCase getTasksUseCase;

  setUp(() {
    mockRepository = MockTaskRepository();
    getTasksUseCase = GetTasksUseCase(taskRepository: mockRepository);
  });

  test('should return a list of tasks from the repository', () async {
    // Arrange
    final fakeTasks = [
      Task(
        id: '1',
        title: 'Test Task',
        description: 'Description',
        order: 0,
        completed: false,
        createdAt: '2025-01-01',
      ),
    ];

    when(() => mockRepository.getTasks()).thenAnswer((_) async => fakeTasks);

    // Act
    final result = await getTasksUseCase();

    // Assert
    expect(result, equals(fakeTasks));
    verify(() => mockRepository.getTasks()).called(1);
  });
}
