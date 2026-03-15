import 'package:app_task/app/domain/repositories/timeago_repository.dart';
import 'package:app_task/app/domain/uses_cases/timeago/on_configure_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTimeagoRepository extends Mock implements TimeagoRepository {}

void main() {
  late MockTimeagoRepository mockRepository;
  late OnConfigureUseCase onConfigureUseCase;

  setUp(() {
    mockRepository = MockTimeagoRepository();
    onConfigureUseCase = OnConfigureUseCase(timeagoRepository: mockRepository);
  });

  test('should call configureTimeAgo on repository', () {
    // Act
    onConfigureUseCase();

    // Assert
    verify(() => mockRepository.configureTimeAgo()).called(1);
  });
}
