import 'package:flutter/material.dart';
import 'package:flutter_text_recognizer/services/image_picker.dart';
import 'package:flutter_text_recognizer/services/text_extractor.dart';
import 'package:flutter_text_recognizer/widgets/extracted_text.dart';
import 'package:flutter_text_recognizer/widgets/image_picker_section.dart';

class TextRecognizerScreen extends StatefulWidget {
  const TextRecognizerScreen({
    super.key,
  });

  @override
  State<TextRecognizerScreen> createState() => _TextRecognizerScreenState();
}

class _TextRecognizerScreenState extends State<TextRecognizerScreen> {
  final TextExtractor textExtractor = TextExtractor();
  final ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImagePickerSection(
                    imageFile: imagePicker.imageFile,
                    onTap: () async {
                      await imagePicker.pickImage(context);
                      setState(() {});
                    }),
                const SizedBox(
                  height: 20,
                ),
                ExtractedText(
                  textExtractor: textExtractor,
                  imageFile: imagePicker.imageFile,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
