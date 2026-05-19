import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rehab/core/constants/app_colors.dart';

class ImagePickerWidget extends StatefulWidget {
  final void Function(File?)? onFileChanged;

  const ImagePickerWidget({super.key, this.onFileChanged});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? pickedImageFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () async {
          final picker = ImagePicker();
          final image = await picker.pickImage(
            source: ImageSource.gallery,
            imageQuality: 70,
          );

          if (image != null) {
            final file = File(image.path);
            setState(() {
              pickedImageFile = file;
            });
            // Send the file back to the parent screen
            widget.onFileChanged?.call(file);
          }
        },
        child: pickedImageFile != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  pickedImageFile!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              )
            : const Icon(Icons.camera_alt, size: 18, color: Colors.black),
      ),
    );
  }
}
