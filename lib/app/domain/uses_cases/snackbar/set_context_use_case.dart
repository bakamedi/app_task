import 'package:flutter/material.dart';

import '../../repositories/snackbar_repository.dart';

class SetContextUseCase {
  SetContextUseCase({required SnackbarRepository snackbarRepository})
    : _snackbarRepository = snackbarRepository;
  final SnackbarRepository _snackbarRepository;

  void call(BuildContext context) {
    _snackbarRepository.setBuildContext(context);
  }
}
