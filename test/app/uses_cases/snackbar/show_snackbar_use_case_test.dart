import 'package:app_task/app/domain/repositories/snackbar_repository.dart';
import 'package:app_task/app/domain/uses_cases/snackbar/show_snackbar_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSnackbarRepository extends Mock implements SnackbarRepository {}

void main() {
  late MockSnackbarRepository mockRepository;
  late ShowSnackbarUseCase showSnackbarUseCase;

  setUp(() {
    mockRepository = MockSnackbarRepository();
    showSnackbarUseCase = ShowSnackbarUseCase(snackbarRepository: mockRepository);
  });

  test('should call showSnackbar on repository with the given message', () {
    // Arrange
    const message = 'Test message';

    // Act
    showSnackbarUseCase(message);

    // Assert
    verify(() => mockRepository.showSnackbar(message)).called(1);
  });
}
