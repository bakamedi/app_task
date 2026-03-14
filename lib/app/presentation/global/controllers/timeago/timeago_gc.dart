import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../domain/uses_cases/timeago/on_configure_use_case.dart';
import '../../../../domain/uses_cases/uses_cases.dart';
import 'timeago_state.dart';

final timeagoGP = Provider.state<TimeagoGC, TimeagoState>(
  (_) => TimeagoGC(
    TimeagoState.initialState,
    onConfigureUseCase: UseCases.onConfigureUseCase.read(),
  ),
  autoDispose: false,
);

class TimeagoGC extends StateNotifier<TimeagoState> {
  TimeagoGC(
    super.initialState, {
    required OnConfigureUseCase onConfigureUseCase,
  }) : _onConfigureUseCase = onConfigureUseCase;

  final OnConfigureUseCase _onConfigureUseCase;

  void onInit() {
    _onConfigureUseCase.call();
  }
}
