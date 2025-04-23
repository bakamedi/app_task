import 'package:flutter/material.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../domain/uses_cases/snackbar/set_context_use_case.dart';
import '../../../../domain/uses_cases/snackbar/show_snackbar_use_case.dart';
import '../../../../domain/uses_cases/uses_cases.dart';
import 'snackbar_state.dart';

final snackbarGP = Provider.state<SnackbarGC, SnackbarState>(
  (_) => SnackbarGC(
    SnackbarState.initialState,
    showSnackbarUseCase: UseCases.showSnackbarUseCase.read(),
    setContextUseCase: UseCases.setContextUseCase.read(),
  ),
);

class SnackbarGC extends StateNotifier<SnackbarState> {
  SnackbarGC(
    super.initialState, {
    required ShowSnackbarUseCase showSnackbarUseCase,
    required SetContextUseCase setContextUseCase,
  }) : _showSnackbarUseCase = showSnackbarUseCase,
       _setContextUseCase = setContextUseCase;

  final ShowSnackbarUseCase _showSnackbarUseCase;
  final SetContextUseCase _setContextUseCase;

  void show(String message) {
    _showSnackbarUseCase.call(message);
  }

  void setContext(BuildContext context) {
    _setContextUseCase.call(context);
  }
}
