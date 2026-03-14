import 'presentation/global/controllers/timeago/timeago_gc.dart';

class AppInitializer {
  static void init() {
    timeagoGP.read().onInit();
  }
}
