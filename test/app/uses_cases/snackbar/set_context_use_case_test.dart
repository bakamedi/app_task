import 'package:app_task/app/domain/repositories/snackbar_repository.dart';
import 'package:app_task/app/domain/uses_cases/snackbar/set_context_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSnackbarRepository extends Mock implements SnackbarRepository {}
class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late MockSnackbarRepository mockRepository;
  late SetContextUseCase setContextUseCase;

  setUp(() {
    mockRepository = MockSnackbarRepository();
    setContextUseCase = SetContextUseCase(snackbarRepository: mockRepository);
  });

  test('should call setBuildContext on repository with the given context', () {
    // Arrange
    final context = MockBuildContext();

    // Act
    setContextUseCase(context);

    // Assert
    verify(() => mockRepository.setBuildContext(context)).called(1);
  });
}
