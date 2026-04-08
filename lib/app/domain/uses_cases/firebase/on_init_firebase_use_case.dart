import 'package:firebase_core/firebase_core.dart';

import '../../repositories/firebase_repository.dart';

class OnInitFirebaseUseCase {
  OnInitFirebaseUseCase({required FirebaseRepository firebaseRepository})
    : _firebaseRepository = firebaseRepository;

  final FirebaseRepository _firebaseRepository;

  Future<void> onInit({required FirebaseApp app}) async {
    await _firebaseRepository.onInit(app);
  }
}
