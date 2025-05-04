import 'package:flutter_meedu/providers.dart';
import 'package:logger/logger.dart';

final _globalLogger = Logger(
  level: bool.fromEnvironment('dart.vm.product') ? Level.warning : Level.debug,
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 3,
    lineLength: 80,
    colors: true,
    printEmojis: true,
  ),
);

class LoggerInjectProvider {
  LoggerInjectProvider._();
  static final loggerInjectProvider = Provider<Logger>((ref) => _globalLogger);
}
