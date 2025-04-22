import 'package:flutter_meedu/providers.dart';

import '../../../data/source/providers/tasks/task_provider.dart';
import '../store/store_inject_provider.dart';

class TaskInjectProvider {
  TaskInjectProvider._();

  static final taskInjectProvider = Provider(
    (ref) => TaskProvider(
      storeProvider: StoreInjectProvider.storeInjectProvider.read(),
    ),
  );
}
