import 'dart:developer';
import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class TextExtractor {
  TextExtractor._internal();
  static final TextExtractor _instance = TextExtractor._internal();
  factory TextExtractor() => _instance;

  Future<String?> extractText(File file) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    try {
      final inputImage = InputImage.fromFile(file);
      final recognizedText = await textRecognizer.processImage(inputImage);
      return recognizedText.text;
    } catch (e) {
      log('Error extracting text: $e');
      return null;
    } finally {
      textRecognizer.close();
    }
  }
}
