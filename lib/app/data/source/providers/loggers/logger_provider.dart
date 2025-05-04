import 'package:logger/logger.dart';

class LoggerProvider {
  LoggerProvider({required Logger logger}) : _logger = logger;

  final Logger _logger;

  void info(String message) {
    _logger.i(message);
  }

  void debug(String message) {
    _logger.d(message);
  }

  void waring(String message) {
    _logger.w(message);
  }
}
