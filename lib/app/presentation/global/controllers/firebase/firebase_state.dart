import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_state.freezed.dart';

@freezed
abstract class FirebaseState with _$FirebaseState {
  const FirebaseState._();

  const factory FirebaseState() = _FirebaseState;

  static FirebaseState get initialState => const FirebaseState();
}
