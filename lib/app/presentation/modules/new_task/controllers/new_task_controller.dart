import 'package:flutter/material.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../domain/models/task/task_model.dart';
import '../../../../domain/uses_cases/tasks/delete_task_use_case.dart';
import '../../../../domain/uses_cases/tasks/get_order_by_tasks_use_case.dart';
import '../../../../domain/uses_cases/tasks/new_task_use_case.dart';
import '../../../../domain/uses_cases/tasks/update_task_use_case.dart';
import '../../../../domain/uses_cases/uses_cases.dart';
import '../../../global/extensions/copy_with_updater_ext.dart';
import '../../../global/extensions/task_ext.dart';
import 'new_task_state.dart';

final newTaskProvider = Provider.state<NewTaskController, NewTaskState>(
  (_) => NewTaskController(
    NewTaskState.initialState,
    newTaskUseCase: UseCases.newTaskUseCase.read(),
    updateTaskUseCase: UseCases.updateTaskUseCase.read(),
    deleteTaskUseCase: UseCases.deleteTaskUseCase.read(),
    getOrderByTasksUseCase: UseCases.getOrderByTasksUseCase.read(),
  ),
);

class NewTaskController extends StateNotifier<NewTaskState> {
  NewTaskController(
    super.initialState, {
    required NewTaskUseCase newTaskUseCase,
    required UpdateTaskUseCase updateTaskUseCase,
    required DeleteTaskUseCase deleteTaskUseCase,
    required GetOrderByTasksUseCase getOrderByTasksUseCase,
  }) : _newTaskUseCase = newTaskUseCase,
       _updateTaskUseCase = updateTaskUseCase,
       _deleteTaskUseCase = deleteTaskUseCase,
       _getOrderByTasksUseCase = getOrderByTasksUseCase;

  final NewTaskUseCase _newTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  final GetOrderByTasksUseCase _getOrderByTasksUseCase;

  GlobalKey<FormState>? get formTaskKey => state.formTaskKey;
  bool get hasTak => state.taskToAdd.id.isNotEmpty;

  Future<void> addTask(List<Task> tasks) async {
    final taskByOrder = await _getOrderByTasksUseCase.call(
      state.taskToAdd,
      tasks,
    );
    await _newTaskUseCase.call(taskByOrder.withGeneratedId());
  }

  void onChangeTitle(String? title) {
    onlyUpdateWith(
      (state) => state.copyWith(
        taskToAdd: state.taskToAdd.copyWith(title: title ?? ''),
      ),
    );
  }

  void onChangeDescription(String? description) {
    onlyUpdateWith(
      (state) => state.copyWith(
        taskToAdd: state.taskToAdd.copyWith(description: description ?? ''),
      ),
    );
  }

  void setTaskToAdd(Task task) {
    onlyUpdateWith((state) => state.copyWith(taskToAdd: task));
  }

  Future<void> updateTask(Task task) async {
    await _updateTaskUseCase.call(task);
  }

  Future<void> deleteTask(Task task) async {
    await _deleteTaskUseCase.call(task);
  }
}
