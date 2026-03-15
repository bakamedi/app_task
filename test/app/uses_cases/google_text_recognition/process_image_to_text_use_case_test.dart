import 'dart:typed_data';
import 'package:app_task/app/domain/repositories/google_text_recognition_repository.dart';
import 'package:app_task/app/domain/uses_cases/google_text_recognition/process_image_to_text_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:mocktail/mocktail.dart';

class MockGoogleTextRecognitionRepository extends Mock implements GoogleTextRecognitionRepository {}

void main() {
  late MockGoogleTextRecognitionRepository mockRepository;
  late ProcessImageToTextUseCase processImageToTextUseCase;

  setUpAll(() {
    registerFallbackValue(TextRecognitionScript.latin);
  });

  setUp(() {
    mockRepository = MockGoogleTextRecognitionRepository();
    processImageToTextUseCase = ProcessImageToTextUseCase(googleTextRecognitionRepository: mockRepository);
  });

  test('should call processImageToText on repository with the given bytes and script', () async {
    // Arrange
    final bytes = Uint8List(0);
    const script = TextRecognitionScript.latin;
    const expectedText = 'Extracted text';
    
    when(() => mockRepository.processImageToText(
      bytes: any(named: 'bytes'),
      textScript: any(named: 'textScript'),
    )).thenAnswer((_) async => expectedText);

    // Act
    final result = await processImageToTextUseCase(bytes: bytes, textScript: script);

    // Assert
    expect(result, expectedText);
    verify(() => mockRepository.processImageToText(
      bytes: bytes,
      textScript: script,
    )).called(1);
  });
}
