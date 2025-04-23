// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:sembast/sembast.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

@freezed
abstract class Task with _$Task {
  const factory Task({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "completed") required bool completed,
    @JsonKey(name: "created_at") required String createdAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  /// Static empty factory
  static Task empty() => const Task(
    id: '',
    title: '',
    description: '',
    completed: false,
    createdAt: '',
  );

  static Finder finderFilter() =>
      Finder(sortOrders: [SortOrder('created_at', false)]);
}
