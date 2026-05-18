import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/features/add_ad/presentation/widgets/custom_text_field.dart';
import 'package:rehab/features/profile/presentation/pages/profile_feature_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddAdFeatureScreen extends HookWidget {
  const AddAdFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    File? pickedImageFile;
    final theme = Theme.of(context);

    final titleController = useTextEditingController();
    final cityController = useTextEditingController();
    final districtController = useTextEditingController();
    final propertyTypeController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final roomsController = useTextEditingController();
    final bathroomsController = useTextEditingController();
    final priceController = useTextEditingController();
    final areaController = useTextEditingController();
    final imageUrlController = useTextEditingController();

    Future<void> addHome() async {
      final userId = Supabase.instance.client.auth.currentUser?.id;

      if (userId == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('يجب تسجيل دخول أولًا')));
        return;
      }

      await Supabase.instance.client.from('home').insert({
        'title': titleController.text.trim(),
        'city': cityController.text.trim(),
        'district': districtController.text.trim(),
        'property_type': propertyTypeController.text.trim(),
        'description': descriptionController.text.trim(),
        'rooms': int.tryParse(roomsController.text.trim()) ?? 0,
        'bathrooms': int.tryParse(bathroomsController.text.trim()) ?? 0,
        'price': double.tryParse(priceController.text.trim()) ?? 0,
        'area': double.tryParse(areaController.text.trim()) ?? 0,
        'image_url': imageUrlController.text.trim(),
        'owner_id': userId,
        'rating': 0,
        'is_available': true,
        'policy': '',
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('تمت إضافة الإعلان بنجاح')));

      context.pop();
    }

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
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text('أضيفي تفاصيل عقارك', style: theme.textTheme.bodyMedium),

                const SizedBox(height: 24),

                CustomTextField(
                  label: 'عنوان الإعلان',
                  hint: 'مثال: شقة فسيحة في حي النرجس',
                  controller: titleController,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  label: 'المدينة',
                  hint: 'مثال: الرياض',
                  controller: cityController,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  label: 'الموقع',
                  hint: 'الرياض، حي الياسمين',
                  controller: districtController,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  label: 'نوع السكن',
                  hint: 'شقة خاصة، شقة مشتركة',
                  controller: propertyTypeController,
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  label: 'الوصف',
                  hint: 'اكتبي وصف العقار',
                  maxLines: 5,
                  controller: descriptionController,
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: 'عدد الغرف',
                        hint: 'مثال: 3',
                        controller: roomsController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomTextField(
                        label: 'عدد الحمامات',
                        hint: 'مثال: 2',
                        controller: bathroomsController,
                        keyboardType: TextInputType.number,
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
                        controller: priceController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomTextField(
                        label: 'المساحة',
                        hint: 'مثال: 120',
                        controller: areaController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                CustomTextField(
                  label: 'رابط الصورة',
                  hint: 'ضعي رابط صورة الإعلان',
                  controller: imageUrlController,
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
                    onPressed: addHome,
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
