import '../../repositories/snackbar_repository.dart';

class ShowSnackbarUseCase {
  ShowSnackbarUseCase({required SnackbarRepository snackbarRepository})
    : _snackbarRepository = snackbarRepository;
  final SnackbarRepository _snackbarRepository;

  void call(String message) {
    _snackbarRepository.showSnackbar(message);
  }
}
