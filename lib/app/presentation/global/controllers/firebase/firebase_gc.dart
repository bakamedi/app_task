import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../domain/uses_cases/firebase/on_init_firebase_use_case.dart';
import '../../../../domain/uses_cases/uses_cases.dart';
import 'firebase_state.dart';

final firebaseGP = Provider.state<FirebaseGC, FirebaseState>(
  (_) => FirebaseGC(
    FirebaseState.initialState,
    onInitFirebaseUseCase: UseCases.onInitFirebaseUseCase.read(),
  ),
  autoDispose: false,
);

class FirebaseGC extends StateNotifier<FirebaseState> {
  FirebaseGC(
    super.initialState, {
    required OnInitFirebaseUseCase onInitFirebaseUseCase,
  }) : _onInitFirebaseUseCase = onInitFirebaseUseCase;
  final OnInitFirebaseUseCase _onInitFirebaseUseCase;
  Future<void> onInit(FirebaseApp app) async {
    await _onInitFirebaseUseCase.onInit(app: app);
  }
}
