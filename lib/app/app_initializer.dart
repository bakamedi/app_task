import 'presentation/global/controllers/timeago/timeago_gc.dart';

class AppInitializer {
  static Future<void> init() async {
    timeagoGP.read().onInit();
  }
}
