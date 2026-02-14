import '../../repositories/timeago_repository.dart';

class OnConfigureUseCase {
  OnConfigureUseCase({required TimeagoRepository timeagoRepository})
    : _timeagoRepository = timeagoRepository;

  final TimeagoRepository _timeagoRepository;

  void call() {
    _timeagoRepository.configureTimeAgo();
  }
}
