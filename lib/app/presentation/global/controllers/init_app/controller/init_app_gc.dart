import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../../domain/uses_cases/supabase/on_init_supabase_use_case.dart';
import '../../../../../domain/uses_cases/uses_cases.dart';
import 'init_app_state.dart';

final iniAppGP = Provider.state<InitAppGC, InitAppState>(
  (_) => InitAppGC(
    InitAppState.initialState,
    onInitSupabaseUseCase: UseCases.onInitSupabaseUseCase.read(),
  ),
  autoDispose: false,
);

class InitAppGC extends StateNotifier<InitAppState> {
  InitAppGC(
    super.initialState, {
    required OnInitSupabaseUseCase onInitSupabaseUseCase,
  }) : _onInitSupabaseUseCase = onInitSupabaseUseCase;
  final OnInitSupabaseUseCase _onInitSupabaseUseCase;

  Future<void> onInit() async {
    await _onInitSupabaseUseCase.call();
  }
}
