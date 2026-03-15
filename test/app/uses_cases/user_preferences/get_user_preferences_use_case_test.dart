import 'package:app_task/app/domain/models/preferences/preference_model.dart';
import 'package:app_task/app/domain/repositories/user_preferences_repository.dart';
import 'package:app_task/app/domain/uses_cases/user_preferences/get_user_preferences_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserPreferencesRepository extends Mock implements UserPreferencesRepository {}

void main() {
  late MockUserPreferencesRepository mockRepository;
  late GetUserPreferencesUseCase getUserPreferencesUseCase;

  setUp(() {
    mockRepository = MockUserPreferencesRepository();
    getUserPreferencesUseCase = GetUserPreferencesUseCase(preferenceRepository: mockRepository);
  });

  test('should return preferences from repository', () async {
    // Arrange
    const preferences = Preference(isDarkMode: true);
    when(() => mockRepository.getUserPreferences()).thenAnswer((_) async => preferences);

    // Act
    final result = await getUserPreferencesUseCase();

    // Assert
    expect(result, preferences);
    verify(() => mockRepository.getUserPreferences()).called(1);
  });
}
