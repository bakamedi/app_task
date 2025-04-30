import '../models/preferences/preference_model.dart';

abstract class UserPreferencesRepository {
  Future<void> saveUserPreferences(Preference preference);
  Future<Preference> getUserPreferences();
}
