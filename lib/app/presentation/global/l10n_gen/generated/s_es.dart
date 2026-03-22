// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 's.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Tareas App';

  @override
  String get title => 'Mis Tareas';

  @override
  String get all => 'Todas';

  @override
  String get completed => 'Completadas';

  @override
  String get pending => 'Pendientes';

  @override
  String get addTask => 'Agregar Tarea';

  @override
  String get taskTitle => 'Título de la Tarea';

  @override
  String get taskDescription => 'Descripción de la Tarea';

  @override
  String get newTask => 'Nueva Tarea';

  @override
  String get editTask => 'Editar Tarea';

  @override
  String get delete => 'Eliminar';

  @override
  String get doneTask => 'Agregada tarea exitosamente';

  @override
  String get updateTask => 'Actualizada tarea exitosamente';

  @override
  String get deleteTask => 'Eliminada tarea exitosamente';

  @override
  String get writeTitleHere => 'Escribe aquí el titulo';

  @override
  String get errorProcessingImage => 'Hubo un error al procesar la imagen';

  @override
  String get errorDeletingTask => 'Error al borrar la tarea';

  @override
  String get errorCreatingTask => 'Error al crear la tarea';

  @override
  String get errorUpdatingTask => 'Error al actualizar la tarea';

  @override
  String get errorCompletingTask => 'Error al completar la tarea';
}
