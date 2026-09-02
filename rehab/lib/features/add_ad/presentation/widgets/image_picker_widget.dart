import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rehab/core/constants/app_dimensions.dart';

/// مربّع اختيار صورة واحدة.
///
/// يأخذ ألوانه من الثيم فيعمل في الوضعين، ويتيح إزالة الصورة بعد اختيارها —
/// كان المالك سابقًا لا يستطيع التراجع عن صورة اختارها بالخطأ.
class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key, this.onFileChanged});

  /// يُمرَّر null عند إزالة الصورة.
  final void Function(File?)? onFileChanged;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _file;

  Future<void> _pick() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (image == null) return;

    final file = File(image.path);
    if (!mounted) return;
    setState(() => _file = file);
    widget.onFileChanged?.call(file);
  }

  void _remove() {
    setState(() => _file = null);
    widget.onFileChanged?.call(null);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = BorderRadius.circular(AppDimensions.radiusMd);

    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          Positioned.fill(
            child: Material(
              color: theme.colorScheme.surface,
              borderRadius: radius,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: _pick,
                child: _file == null
                    ? DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: radius,
                          border: Border.all(
                            color: theme.dividerColor,
                            width: 1.2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo_outlined,
                              size: AppDimensions.iconLg,
                              color: theme.colorScheme.primary,
                            ),
                            const SizedBox(height: AppDimensions.spaceXs),
                            Text(
                              'addPhoto'.tr(),
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Image.file(_file!, fit: BoxFit.cover),
              ),
            ),
          ),

          if (_file != null)
            Positioned(
              top: 2,
              right: 2,
              child: Material(
                color: Colors.black.withAlpha(140),
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: _remove,
                  customBorder: const CircleBorder(),
                  child: Tooltip(
                    message: 'removePhoto'.tr(),
                    child: const SizedBox(
                      width: 26,
                      height: 26,
                      child: Icon(
                        Icons.close_rounded,
                        size: AppDimensions.iconMd,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
