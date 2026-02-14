import '../../domain/repositories/index_repositories.dart';
import '../source/providers/timeago/timeago_provider.dart';

class TimeagoRepositoryImpl extends TimeagoRepository {
  TimeagoRepositoryImpl({required TimeagoProvider timeagoProvider})
    : _timeagoProvider = timeagoProvider;
  final TimeagoProvider _timeagoProvider;
  @override
  void configureTimeAgo() {
    _timeagoProvider.configureTimeAgo();
  }
}
