import 'dart:io';
import 'package:flutter/material.dart';

class ImagePickerSection extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onTap;

  const ImagePickerSection({
    super.key,
    required this.imageFile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (imageFile != null) {
      return Image.file(
        imageFile!,
        height: 300,
        width: 300,
        fit: BoxFit.contain,
      );
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
        ),
        child: const Center(
          child: Text(
            'Select Image',
            maxLines: 1,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
