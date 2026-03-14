import 'package:flutter_meedu/providers.dart';

import '../../../data/source/providers/timeago/timeago_provider.dart';

class TimeagoInjectProvider {
  TimeagoInjectProvider._();

  static final taskInjectProvider = Provider((ref) => TimeagoProvider());
}
