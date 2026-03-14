import 'dart:typed_data';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../repositories/google_text_recognition_repository.dart';

class ProcessImageToTextUseCase {
  ProcessImageToTextUseCase({
    required GoogleTextRecognitionRepository googleTextRecognitionRepository,
  }) : _googleTextRecognitionRepository = googleTextRecognitionRepository;
  final GoogleTextRecognitionRepository _googleTextRecognitionRepository;

  Future<String?> call({
    required Uint8List? bytes,
    TextRecognitionScript textScript = TextRecognitionScript.latin,
  }) async {
    return await _googleTextRecognitionRepository.processImageToText(
      bytes: bytes,
      textScript: textScript,
    );
  }
}
