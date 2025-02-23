import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_text_recognizer/services/text_extractor.dart';

class ExtractedText extends StatelessWidget {
  const ExtractedText({
    super.key,
    required this.textExtractor,
    required this.imageFile,
  });

  final TextExtractor textExtractor;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    if (imageFile == null) return const SizedBox();

    return FutureBuilder<String?>(
      future: textExtractor.extractText(imageFile!),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final text = snapshot.data ?? 'No text found';
        return Text(
          text,
          style: const TextStyle(fontSize: 20),
        );
      },
    );
  }
}
