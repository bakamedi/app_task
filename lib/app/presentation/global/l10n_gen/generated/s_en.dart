// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 's.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Task App';

  @override
  String get title => 'My Tasks';

  @override
  String get all => 'All';

  @override
  String get completed => 'Completed';

  @override
  String get pending => 'To Do';

  @override
  String get addTask => 'Add Task';

  @override
  String get taskTitle => 'Task Title';

  @override
  String get taskDescription => 'Task Description';

  @override
  String get newTask => 'New Task';

  @override
  String get editTask => 'Edit Task';

  @override
  String get delete => 'Delete';

  @override
  String get doneTask => 'Added task successfully';

  @override
  String get updateTask => 'Updated task successfully';

  @override
  String get deleteTask => 'Deleted task successfully';
}
