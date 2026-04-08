import 'package:firebase_core/firebase_core.dart';

import 'presentation/global/controllers/firebase/firebase_gc.dart';
import 'presentation/global/controllers/timeago/timeago_gc.dart';

class AppInitializer {
  static void onInit({required FirebaseApp app}) {
    timeagoGP.read().onInit();
    firebaseGP.read().onInit(app);
  }
}
