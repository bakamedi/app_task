import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/preferences/preference_model.dart';

part 'session_state.freezed.dart';

@freezed
abstract class SessionState with _$SessionState {
  const SessionState._();

  const factory SessionState({
    @Default(Preference(isDarkMode: false)) Preference userPreferences,
  }) = _SessionState;

  static SessionState get initialState => const SessionState();
}
