import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/features/add_ad/presentation/widgets/custom_text_field.dart';
import 'package:rehab/features/profile/presentation/pages/profile_feature_screen.dart';

class AddAdFeatureScreen extends StatelessWidget {
  const AddAdFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    File? pickedImageFile;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  'إضافة إعلان جديد',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  'أضيفي تفاصيل عقارك',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: 24),

                const CustomTextField(
                  label: 'عنوان الإعلان',
                  hint: 'مثال: شقة فسيحة في حي النرجس',
                ),

                const SizedBox(height: 16),
                const CustomTextField(label: 'المدينة', hint: 'مثال: الرياض'),

                const SizedBox(height: 16),
                const CustomTextField(
                  label: 'الموقع',
                  hint: 'الرياض، حي الياسمين',
                ),

                const SizedBox(height: 16),
                const CustomTextField(
                  label: 'نوع السكن',
                  hint: 'شقه خاصه , شقه مشتركة ',
                ),

                const SizedBox(height: 16),
                const CustomTextField(
                  label: 'الوصف',
                  hint: 'اكتبي وصف العقار',
                  maxLines: 5,
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: 'عدد الغرف',
                        hint: 'مثال: 3',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: CustomTextField(
                        label: 'عدد الحمامات',
                        hint: 'مثال: 2',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: 'السعر',
                        hint: 'مثال: 2500',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: CustomTextField(
                        label: 'المساحة',
                        hint: 'مثال: 120',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                const CustomTextField(
                  label: 'رابط الصورة',
                  hint: 'ضعي رابط صورة الإعلان',
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'اضيفي صورة',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    StatefulBuilder(
                      builder: (context, setDialogState) {
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
                                setDialogState(() {
                                  pickedImageFile = File(image.path);
                                });
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
                                : const Icon(
                                    Icons.camera_alt,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('إضافة الإعلان'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
