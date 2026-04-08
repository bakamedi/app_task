import 'package:firebase_core/firebase_core.dart';

import '../../domain/repositories/firebase_repository.dart';
import '../source/providers/firebase/firebase_provider.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {
  FirebaseRepositoryImpl({required FirebaseProvider firebaseProvider})
    : _firebaseProvider = firebaseProvider;
  final FirebaseProvider _firebaseProvider;
  @override
  Future<void> onInit(FirebaseApp app) async {
    await _firebaseProvider.onInit(app);
  }
}
