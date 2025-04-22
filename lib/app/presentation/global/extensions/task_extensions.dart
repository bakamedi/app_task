import 'package:sembast/sembast.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/models/task/task_model.dart';

extension TaskFinderExt on Task {
  Finder get finderById {
    return Finder(filter: Filter.equals('id', id));
  }

  Task withGeneratedId() {
    final uuid = Uuid();
    return copyWith(id: uuid.v4());
  }
}
