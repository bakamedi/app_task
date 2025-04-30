import 'package:flutter/material.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../domain/uses_cases/user_preferences/get_user_preferences_use_case.dart';
import '../../../../domain/uses_cases/user_preferences/save_user_preferences_use_case.dart';
import '../../../../domain/uses_cases/uses_cases.dart';
import '../../extensions/copy_with_updater_ext.dart';
import 'session_state.dart';

final sessionGP = Provider.state<SessionGC, SessionState>(
  (_) => SessionGC(
    SessionState.initialState,
    getUserPreferencesUseCase: UseCases.getPreferencesUseCase.read(),
    setUserPreferencesUseCase: UseCases.savePreferencesUseCase.read(),
  ),
  autoDispose: false,
);

class SessionGC extends StateNotifier<SessionState> {
  SessionGC(
    super.initialState, {
    required GetUserPreferencesUseCase getUserPreferencesUseCase,
    required SetUserPreferencesUseCase setUserPreferencesUseCase,
  }) : _getUserPreferencesUseCase = getUserPreferencesUseCase,
       _setUserPreferencesUseCase = setUserPreferencesUseCase;
  final GetUserPreferencesUseCase _getUserPreferencesUseCase;
  final SetUserPreferencesUseCase _setUserPreferencesUseCase;

  Future<void> init(BuildContext context) async {
    final preferences = await _getUserPreferencesUseCase.call();
    onlyUpdateWith((state) => state.copyWith(userPreferences: preferences));
  }

  Future<void> onChangeTheme() async {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    final updatedPreferences = state.userPreferences.copyWith(
      isDarkMode: isDarkMode,
    );
    await _setUserPreferencesUseCase.call(updatedPreferences);
  }
}
