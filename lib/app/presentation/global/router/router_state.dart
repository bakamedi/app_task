import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

part 'router_state.freezed.dart';

@freezed
abstract class RouterState with _$RouterState {
  const RouterState._();

  const factory RouterState({GoRouter? router}) = _RouterState;

  static RouterState get initialState => const RouterState();
}
