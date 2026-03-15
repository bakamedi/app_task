import 'package:signature/signature.dart';

import '../models/task/task_model.dart';

sealed class TaskCreationSource {
  const TaskCreationSource();
}

class TaskFromForm extends TaskCreationSource {
  const TaskFromForm(this.task);
  final Task task;
}

class TaskFromWriting extends TaskCreationSource {
  const TaskFromWriting({required this.task, required this.signature});
  final Task task;
  final SignatureController signature;
}
