import 'package:app_task/app/domain/models/preferences/preference_model.dart';
import 'package:app_task/app/domain/repositories/user_preferences_repository.dart';
import 'package:app_task/app/domain/uses_cases/user_preferences/save_user_preferences_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserPreferencesRepository extends Mock implements UserPreferencesRepository {}
class FakePreference extends Fake implements Preference {}

void main() {
  late MockUserPreferencesRepository mockRepository;
  late SetUserPreferencesUseCase setUserPreferencesUseCase;

  setUpAll(() {
    registerFallbackValue(FakePreference());
  });

  setUp(() {
    mockRepository = MockUserPreferencesRepository();
    setUserPreferencesUseCase = SetUserPreferencesUseCase(preferenceRepository: mockRepository);
  });

  test('should call saveUserPreferences on repository with the given preferences', () async {
    // Arrange
    const preferences = Preference(isDarkMode: true);
    when(() => mockRepository.saveUserPreferences(any())).thenAnswer((_) async => {});

    // Act
    await setUserPreferencesUseCase(preferences);

    // Assert
    verify(() => mockRepository.saveUserPreferences(preferences)).called(1);
  });
}
