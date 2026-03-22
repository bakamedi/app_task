import 'package:app_task/app/core/either/either.dart';
import 'package:app_task/app/core/success/success.dart';
import 'package:app_task/app/domain/uses_cases/tasks/gets/get_order_by_tasks_params.dart';
import 'package:app_task/app/domain/uses_cases/tasks/gets/get_order_by_tasks_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app_task/app/domain/models/task/task_model.dart';
import 'package:app_task/app/domain/repositories/task_repository.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late MockTaskRepository mockRepository;
  late GetOrderByTasksUseCase getOrderByTasksUseCase;

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
    getOrderByTasksUseCase = GetOrderByTasksUseCase(
      taskRepository: mockRepository,
    );
  });

  test(
    'should increment order of existing tasks and return new task with order 0',
    () async {
      // Arrange
      final taskToAdd = Task(
        id: '3',
        title: 'New Task',
        description: 'New Description',
        order: 0,
        completed: false,
        createdAt: '2025-01-01',
      );

      final currentTasks = [
        Task(
          id: '1',
          title: 'Task 1',
          description: '',
          order: 0,
          completed: false,
          createdAt: '',
        ),
        Task(
          id: '2',
          title: 'Task 2',
          description: '',
          order: 1,
          completed: false,
          createdAt: '',
        ),
      ];

      when(() => mockRepository.updateTask(any()))
          .thenAnswer((_) async => const Either.right(Success()));

      // Act
      final result = await getOrderByTasksUseCase(
        GetOrderByTasksParams(
          taskToAdd: taskToAdd,
          currentTasks: currentTasks,
        ),
      );

      // Assert
      verify(
        () => mockRepository.updateTask(currentTasks[0].copyWith(order: 1)),
      ).called(1);

      verify(
        () => mockRepository.updateTask(currentTasks[1].copyWith(order: 2)),
      ).called(1);

      expect(result.getRightOrNull()?.order, 0);
      expect(result.getRightOrNull()?.id, taskToAdd.id);
    },
  );
}
