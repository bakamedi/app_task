import 'package:flutter_meedu/notifiers.dart' show StateNotifier;

extension CopyWithUpdater<T> on StateNotifier<T> {
  void onlyUpdateWith(T Function(T state) copyWithFn) {
    onlyUpdate(state = copyWithFn(state));
  }
}
