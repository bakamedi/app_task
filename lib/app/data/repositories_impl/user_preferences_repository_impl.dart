import '../../core/utils/global_names_key_storage_util.dart';
import '../../domain/models/preferences/preference_model.dart';
import '../../domain/repositories/user_preferences_repository.dart';
import '../source/providers/storage/storage_provider.dart';

class UserPreferencesRepositoryImpl extends UserPreferencesRepository {
  UserPreferencesRepositoryImpl({required StorageProvider storageProvider})
    : _storageProvider = storageProvider;
  final StorageProvider _storageProvider;
  @override
  Future<Preference> getUserPreferences() async {
    final preferencesString = await _storageProvider.readValue(
      GlobalNameStorageKeyUtils.PREFERENCES,
    );
    return preferenceFromJson(preferencesString);
  }

  @override
  Future<void> saveUserPreferences(Preference preference) async {
    await _storageProvider.writeValue(
      GlobalNameStorageKeyUtils.PREFERENCES,
      preferenceToJson(preference),
    );
  }
}
