import 'package:app_task/app/domain/models/task/task_model.dart';
import 'package:app_task/app/domain/uses_cases/tasks/task_classifier.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaskClassifier', () {
    final task1 = Task(id: '1', title: 'Task 1', description: '', order: 0, completed: false, createdAt: '2025-01-01');
    final task2 = Task(id: '2', title: 'Task 2', description: '', order: 1, completed: true, createdAt: '2025-01-01');
    final tasks = [task1, task2];

    test('should classify tasks correctly from list', () {
      // Act
      final classifier = TaskClassifier.from(tasks);

      // Assert
      expect(classifier.all, tasks);
      expect(classifier.toDo, [task1]);
      expect(classifier.completed, [task2]);
    });

    test('updateTask should return a new classifier with updated task', () {
      // Arrange
      final classifier = TaskClassifier.from(tasks);
      final updatedTask1 = task1.copyWith(title: 'Updated Task 1', completed: true);

      // Act
      final updatedClassifier = classifier.updateTask(updatedTask1);

      // Assert
      expect(updatedClassifier.all.any((t) => t.title == 'Updated Task 1'), isTrue);
      expect(updatedClassifier.toDo.isEmpty, isTrue);
      expect(updatedClassifier.completed.length, 2);
    });

    test('deleteTask should return a new classifier with task removed', () {
      // Arrange
      final classifier = TaskClassifier.from(tasks);

      // Act
      final updatedClassifier = classifier.deleteTask(task1);

      // Assert
      expect(updatedClassifier.all.length, 1);
      expect(updatedClassifier.all.contains(task1), isFalse);
      expect(updatedClassifier.toDo.isEmpty, isTrue);
      expect(updatedClassifier.completed, [task2]);
    });

    test('reorderTasks should return a new classifier with reordered tasks', () {
      // Arrange
      final classifier = TaskClassifier.from(tasks);

      // Act
      // To swap task1 (index 0) and task2 (index 1), newIndex should be 2
      // because of the adjustment logic in reorderTasks (common in ReorderableListView)
      final updatedClassifier = classifier.reorderTasks(0, 2);

      // Assert
      expect(updatedClassifier.all[0].id, '2');
      expect(updatedClassifier.all[1].id, '1');
      expect(updatedClassifier.all[0].order, 0);
      expect(updatedClassifier.all[1].order, 1);
    });
  });
}
