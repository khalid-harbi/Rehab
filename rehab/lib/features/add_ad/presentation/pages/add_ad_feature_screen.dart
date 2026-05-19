import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/features/add_ad/presentation/widgets/custom_text_field.dart';
import 'package:rehab/features/add_ad/presentation/widgets/image_picker_widget.dart';

class AddAdFeatureScreen extends HookWidget {
  const AddAdFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

    // Location controllers
    final latController = useTextEditingController();
    final langController = useTextEditingController();

    // Pre-declare controllers to obey hook rules (no hooks inside loops)
    final policyControllers = [
      useTextEditingController(),
      useTextEditingController(),
      useTextEditingController(),
    ];
    final policyCount = useState(1);

    final amenityControllers = [
      useTextEditingController(),
      useTextEditingController(),
    ];
    final amenityCount = useState(1);

    Future<void> addHome() async {
      final userId = Supabase.instance.client.auth.currentUser?.id;

      if (userId == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('يجب تسجيل دخول أولًا')));
        return;
      }

      // Extract text from visible controllers and filter out empty strings
      final policies = policyControllers
          .take(policyCount.value)
          .map((c) => c.text.trim())
          .where((text) => text.isNotEmpty)
          .toList();

      final amenities = amenityControllers
          .take(amenityCount.value)
          .map((c) => c.text.trim())
          .where((text) => text.isNotEmpty)
          .toList();

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
        'lat': double.tryParse(latController.text.trim()) ?? 0.0,
        'lang': double.tryParse(langController.text.trim()) ?? 0.0,
        'owner_id': userId,
        'rating': 0,
        'is_available': true,
        'policy': policies,
        'amenities': amenities,
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('تمت إضافة الإعلان بنجاح')));

      if (context.mounted) {
        context.pop();
      }
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
                Text('أضف تفاصيل عقارك', style: theme.textTheme.bodyMedium),
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
                  label: 'الحي',
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
                  hint: 'وصف العقار',
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
                        label: 'السعر بالشهر',
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

                // Location Fields (Lat / Lang)
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: 'خط العرض (Lat)',
                        hint: 'مثال: 24.7136',
                        controller: latController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomTextField(
                        label: 'خط الطول (Lang)',
                        hint: 'مثال: 46.6753',
                        controller: langController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Policies Section
                Text(
                  'قواعد وسياسات السكن',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                for (int i = 0; i < policyCount.value; i++) ...[
                  CustomTextField(
                    label: i == 1
                        ? 'السياسة الثانية'
                        : i == 2
                        ? 'السياسة الثالثة'
                        : 'السياسة الأولى',
                    hint: 'مثال: يمنع التدخين',
                    controller: policyControllers[i],
                  ),
                  const SizedBox(height: 8),
                ],
                if (policyCount.value < 3)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {
                        policyCount.value++;
                      },
                      icon: const Icon(Icons.add, size: 20),
                      label: const Text('إضافة سياسة'),
                    ),
                  ),
                const SizedBox(height: 16),

                // Amenities Section
                Text(
                  'المرافق',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                for (int i = 0; i < amenityCount.value; i++) ...[
                  CustomTextField(
                    label: i == 1 ? 'المرفق الثاني' : 'المرفق الأول',
                    hint: 'مثال: موقف سيارة خاص',
                    controller: amenityControllers[i],
                  ),
                  const SizedBox(height: 8),
                ],
                if (amenityCount.value < 2)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {
                        amenityCount.value++;
                      },
                      icon: const Icon(Icons.add, size: 20),
                      label: const Text('إضافة مرفق'),
                    ),
                  ),

                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'الصور',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: ImagePickerWidget(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: ImagePickerWidget(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: ImagePickerWidget(),
                          ),
                        ],
                      ),
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
