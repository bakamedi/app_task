import 'package:freezed_annotation/freezed_annotation.dart';

part 'init_app_state.freezed.dart';

@freezed
abstract class InitAppState with _$InitAppState {
  const InitAppState._();

  const factory InitAppState() = _InitAppState;

  static InitAppState get initialState => const InitAppState();
}
