import 'package:app_task/app/domain/models/task/task_model.dart';
import 'package:app_task/app/domain/repositories/task_repository.dart';
import 'package:app_task/app/domain/uses_cases/tasks/new/new_task_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late MockTaskRepository mockRepository;
  late NewTaskUseCase newTaskUseCase;

  setUpAll(() {
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
    newTaskUseCase = NewTaskUseCase(taskRepository: mockRepository);
  });

  test('should call addTask on repository with the given task', () async {
    // Arrange
    final task = Task(
      id: '1',
      title: 'New Task',
      description: 'Description',
      order: 1,
      completed: false,
      createdAt: '2025-01-01',
    );

    when(() => mockRepository.addTask(any())).thenAnswer((_) async => {});

    // Act
    await newTaskUseCase(task);

    // Assert
    verify(() => mockRepository.addTask(task)).called(1);
  });
}
