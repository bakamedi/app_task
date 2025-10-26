import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/app_view_state.dart';

part 'supabase_state.freezed.dart';

@freezed
abstract class SupabaseState with _$SupabaseState {
  const SupabaseState._();

  const factory SupabaseState({
    @Default(AppViewState.idle) AppViewState appViewState,
  }) = _SupabaseState;

  static SupabaseState get initialState => const SupabaseState();
}
