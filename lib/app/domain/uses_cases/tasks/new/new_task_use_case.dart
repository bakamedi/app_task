import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../../defs/task_creation_source.dart';
import '../../../repositories/index_repositories.dart';

class NewTaskUseCase {
  NewTaskUseCase({
    required TaskRepository taskRepository,
    required GoogleTextRecognitionRepository googleTextRecognitionRepository,
  }) : _taskRepository = taskRepository,
       _googleTextRecognitionRepository = googleTextRecognitionRepository;
  final TaskRepository _taskRepository;
  final GoogleTextRecognitionRepository _googleTextRecognitionRepository;

  Future<void> call(TaskCreationSource source) async {
    switch (source) {
      case TaskFromForm(task: final task):
        await _taskRepository.addTask(task);
        break;
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

        await _taskRepository.addTask(newTask);
        break;
    }
  }
}
