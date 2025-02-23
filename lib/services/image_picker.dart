import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_text_recognizer/services/text_extractor.dart';
import 'package:gallery_picker/gallery_picker.dart';

class ImagePicker {
  ImagePicker._internal();
  static final ImagePicker _instance = ImagePicker._internal();
  factory ImagePicker() => _instance;

  File? imageFile;
  final textExtractor = TextExtractor();

  Future<void> pickImage(BuildContext context) async {
    try {
      final mediaFile = await GalleryPicker.pickMedia(
        context: context,
        singleMedia: true,
      );

      if (mediaFile != null && mediaFile.isNotEmpty) {
        imageFile = await mediaFile.first.getFile();
        log('file path: ${imageFile!.path}');
      }
    } catch (e) {
      log('Error picking image: $e');
    }
  }
}
