import 'package:firebase_core/firebase_core.dart';

abstract class FirebaseRepository {
  Future<void> onInit(FirebaseApp app);
}
