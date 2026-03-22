import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../../../core/success/success.dart';
import '../../../defs/task_creation_source.dart';
import '../../../defs/type_defs.dart';
import '../../../models/failures/failure.dart';
import '../../../repositories/index_repositories.dart';
import '../../base/base_use_case.dart';

class NewTaskUseCase implements UseCase<Success, TaskCreationSource> {
  NewTaskUseCase({
    required TaskRepository taskRepository,
    required GoogleTextRecognitionRepository googleTextRecognitionRepository,
  }) : _taskRepository = taskRepository,
       _googleTextRecognitionRepository = googleTextRecognitionRepository;
  final TaskRepository _taskRepository;
  final GoogleTextRecognitionRepository _googleTextRecognitionRepository;

  @override
  FutureEither<Failure, Success> call(TaskCreationSource source) async {
    switch (source) {
      case TaskFromForm(task: final task):
        return await _taskRepository.addTask(task);
      case TaskFromWriting(task: final task, signature: final signature):
        // Caso complejo: procesamos la firma antes de guardar
        final bytes = await signature.toPngBytes();
        final text = await _googleTextRecognitionRepository.processImageToText(
          bytes: bytes,
          textScript: TextRecognitionScript.latin,
        );

        final newTask = task.copyWith(
          description: text ?? '',
          createdAt: DateTime.now().toIso8601String(),
        );

        return await _taskRepository.addTask(newTask);
    }
  }
}
