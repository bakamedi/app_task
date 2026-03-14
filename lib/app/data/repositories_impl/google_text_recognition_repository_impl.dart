import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../domain/repositories/google_text_recognition_repository.dart';

class GoogleTextRecognitionRepositoryImpl
    extends GoogleTextRecognitionRepository {
  @override
  Future<String?> processImageToText({
    Uint8List? bytes,
    required TextRecognitionScript textScript,
  }) async {
    try {
      if (bytes == null) return null;
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/drawing.png');
      await file.writeAsBytes(bytes);

      final fileSize = await file.length();
      print('File saved at: ${file.path}, size: $fileSize bytes');

      final inputImage = InputImage.fromFile(file);

      print('Starting Text Recognition with script: $textScript');
      final textRecognizer = TextRecognizer(script: textScript);

      final RecognizedText recognizedText = await textRecognizer.processImage(
        inputImage,
      );

      final resultText = recognizedText.text;
      print('Recognition result: "$resultText"');
      textRecognizer.close();
      return resultText;
    } catch (e) {
      print('Error in repository processImageToText: $e');
      return null;
    }
  }
}
