import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../core/http/either/either.dart';
import '../../../../domain/uses_cases/supabase/on_init_supabase_use_case.dart';
import '../../../../domain/uses_cases/uses_cases.dart';
import '../../utils/online_state.dart';
import 'supabase_state.dart';

final supabaseGP = Provider.state<SupabaseGC, SupabaseState>(
  (_) => SupabaseGC(
    SupabaseState.initialState,
    onInitSupabaseUseCase: UseCases.onInitSupabaseUseCase.read(),
  ),
  autoDispose: false,
);

class SupabaseGC extends StateNotifier<SupabaseState> {
  SupabaseGC(
    super.initialState, {
    required OnInitSupabaseUseCase onInitSupabaseUseCase,
  }) : _onInitSupabaseUseCase = onInitSupabaseUseCase;
  final OnInitSupabaseUseCase _onInitSupabaseUseCase;

  Future<void> onInit() async {
    _onChangeOnlineState(OnlineState.connecting);
    final result = await _onInitSupabaseUseCase.call();

    result.when(
      left: (failure) => _onChangeOnlineState(OnlineState.error),
      right: (success) => _onChangeOnlineState(OnlineState.ok),
    );
  }

  void _onChangeOnlineState(OnlineState onlineState) {
    onlyUpdate(state = state.copyWith(onlineState: onlineState));
  }
}
