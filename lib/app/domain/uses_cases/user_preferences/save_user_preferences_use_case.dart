import '../../models/preferences/preference_model.dart';
import '../../repositories/user_preferences_repository.dart';

class SetUserPreferencesUseCase {
  SetUserPreferencesUseCase({
    required UserPreferencesRepository preferenceRepository,
  }) : _preferenceRepository = preferenceRepository;
  final UserPreferencesRepository _preferenceRepository;
  Future<void> call(Preference preference) async {
    await _preferenceRepository.saveUserPreferences(preference);
  }
}
