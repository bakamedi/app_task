import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/preferences/preference_model.dart';
import '../../../../../domain/models/user/user_model.dart';
import '../utils/session_status.dart';

part 'session_state.freezed.dart';

@freezed
abstract class SessionState with _$SessionState {
  const SessionState._();

  const factory SessionState({
    @Default(
      UserModel(
        id: '',
        email: '',
        name: '',
        photoUrl: '',
        createdAt: null,
        updatedAt: null,
      ),
    )
    UserModel user,
    @Default(SessionStatus.loading) SessionStatus status,
    @Default(Preference(isDarkMode: false)) Preference userPreferences,
    String? error,
  }) = _SessionState;

  static SessionState get initialState => const SessionState();
}
