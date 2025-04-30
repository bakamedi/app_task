import '../../models/preferences/preference_model.dart';
import '../../repositories/user_preferences_repository.dart';

class GetUserPreferencesUseCase {
  GetUserPreferencesUseCase({
    required UserPreferencesRepository preferenceRepository,
  }) : _preferenceRepository = preferenceRepository;
  final UserPreferencesRepository _preferenceRepository;
  Future<Preference> call() async {
    return await _preferenceRepository.getUserPreferences();
  }
}
