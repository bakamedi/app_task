import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseProvider {
  late final FirebaseApp _app;
  late final FirebaseAuth _auth;

  Future<void> onInit(FirebaseApp app) async {
    _app = app;
    _auth = FirebaseAuth.instanceFor(app: app);
  }
}
