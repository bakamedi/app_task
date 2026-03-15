import 'dart:typed_data';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

abstract class GoogleTextRecognitionRepository {
  Future<String?> processImageToText({
    Uint8List? bytes,
    required TextRecognitionScript textScript,
  });
}
