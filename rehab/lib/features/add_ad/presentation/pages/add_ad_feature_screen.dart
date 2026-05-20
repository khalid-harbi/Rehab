import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/features/add_ad/presentation/cubit/add_ad_cubit.dart';
import 'package:rehab/features/add_ad/presentation/cubit/add_ad_state.dart';
import 'package:rehab/features/add_ad/presentation/widgets/custom_text_field.dart';
import 'package:rehab/features/add_ad/presentation/widgets/image_picker_widget.dart';

class AddAdFeatureScreen extends HookWidget {
  const AddAdFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<AddAdCubit>();

    // ===================================================
    // ===================================================

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

    // Pre-declare controllers to obey hook rules
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

    // Keep track of selected image files
    final selectedImages = useState<List<File>>([]);

    void addHome() {
      if (selectedImages.value.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('الرجاء إضافة صورة واحدة على الأقل')),
        );
        return;
      }

      // ===================================================
      // ===================================================

      // Extract text from visible controllers and filter out empty strings
      // Force conversion to strict List<String> types using .toList() and List<String>.from

      final List<String> policies = List<String>.from(
        policyControllers
            .take(policyCount.value)
            .map((c) => c.text.trim())
            .where((text) => text.isNotEmpty),
      );

      // ===================================================
      // ===================================================

      final List<String> amenities = List<String>.from(
        amenityControllers
            .take(amenityCount.value)
            .map((c) => c.text.trim())
            .where((text) => text.isNotEmpty),
      );

      // ===================================================
      // ===================================================

      final cleanLat = latController.text.trim().replaceAll(',', '.');
      final cleanLng = langController.text.trim().replaceAll(',', '.');

      // ===================================================
      // ===================================================

      cubit.submitAd(
        title: titleController.text.trim(),
        city: cityController.text.trim(),
        district: districtController.text.trim(),
        propertyType: propertyTypeController.text.trim(),
        description: descriptionController.text.trim(),
        rooms: int.tryParse(roomsController.text.trim()) ?? 0,
        bathrooms: int.tryParse(bathroomsController.text.trim()) ?? 0,
        price: double.tryParse(priceController.text.trim()) ?? 0.0,
        area: double.tryParse(areaController.text.trim()) ?? 0.0,
        lat: double.tryParse(cleanLat) ?? 0.0,
        lng: double.tryParse(cleanLng) ?? 0.0,
        policies: policies,
        amenities: amenities,
        images: selectedImages.value,
      );
    }

    // ===================================================
    // ===================================================

    return BlocConsumer<AddAdCubit, AddAdState>(
      listener: (context, state) {
        if (state is AddAdSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('تمت إضافة الإعلان بنجاح'),
            ),
          );
          context.pop();
        } else if (state is AddAdErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Align(
                      alignment: .centerStart,
                      child: IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Gap(16),
                    Text(
                      'addNewListing'.tr(),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(4),
                    Text(
                      'addYourPropertyDetails'.tr(),
                      style: theme.textTheme.bodyMedium,
                    ),
                    Gap(24),
                    CustomTextField(
                      label: 'listingTitle'.tr(),
                      hint: 'listingTitleHint'.tr(),
                      controller: titleController,
                    ),
                    Gap(16),
                    CustomTextField(
                      label: 'city'.tr(),
                      hint: 'cityHint'.tr(),
                      controller: cityController,
                    ),
                    Gap(16),
                    CustomTextField(
                      label: 'district'.tr(),
                      hint: 'districtHint'.tr(),
                      controller: districtController,
                    ),
                    Gap(16),
                    CustomTextField(
                      label: 'propertyType'.tr(),
                      hint: 'propertyTypeHint'.tr(),
                      controller: propertyTypeController,
                    ),
                    Gap(16),
                    CustomTextField(
                      label: 'description'.tr(),
                      hint: 'descriptionHint'.tr(),
                      maxLines: 5,
                      controller: descriptionController,
                    ),
                    Gap(16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'numberOfRooms'.tr(),
                            hint: 'numberOfRoomsHint'.tr(),
                            controller: roomsController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Gap(12),
                        Expanded(
                          child: CustomTextField(
                            label: 'numberOfBathrooms'.tr(),
                            hint: 'numberOfBathroomsHint'.tr(),
                            controller: bathroomsController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    Gap(16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'monthlyPrice'.tr(),
                            hint: 'monthlyPriceHint'.tr(),
                            controller: priceController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Gap(12),
                        Expanded(
                          child: CustomTextField(
                            label: 'area'.tr(),
                            hint: 'areaHint'.tr(),
                            controller: areaController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    Gap(16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'latitude'.tr(),
                            hint: 'latitudeHint'.tr(),
                            controller: latController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Gap(12),
                        Expanded(
                          child: CustomTextField(
                            label: 'longitude'.tr(),
                            hint: 'longitudeHint'.tr(),
                            controller: langController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    Gap(24),
                    Text(
                      'housingRulesAndPolicies'.tr(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(8),
                    for (int i = 0; i < policyCount.value; i++) ...[
                      CustomTextField(
                        label: i == 1
                            ? 'secondPolicy'.tr()
                            : i == 2
                            ? 'thirdPolicy'.tr()
                            : 'firstPolicy'.tr(),
                        hint: 'noSmokingHint'.tr(),
                        controller: policyControllers[i],
                      ),
                      Gap(8),
                    ],
                    if (policyCount.value < 3)
                      Align(
                        alignment: .centerEnd,
                        child: TextButton.icon(
                          onPressed: () {
                            policyCount.value++;
                          },
                          icon: const Icon(Icons.add, size: 20),
                          label: Text('addPolicy'.tr()),
                        ),
                      ),
                    Gap(16),
                    Text(
                      'facilities'.tr(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(8),
                    for (int i = 0; i < amenityCount.value; i++) ...[
                      CustomTextField(
                        label: i == 1
                            ? 'secondFacility'.tr()
                            : 'firstFacility'.tr(),
                        hint: 'privateParkingHint'.tr(),
                        controller: amenityControllers[i],
                      ),
                      Gap(8),
                    ],
                    if (amenityCount.value < 2)
                      Align(
                        alignment: .centerEnd,
                        child: TextButton.icon(
                          onPressed: () {
                            amenityCount.value++;
                          },
                          icon: const Icon(Icons.add, size: 20),
                          label: Text('addFacility'.tr()),
                        ),
                      ),
                    Gap(24),
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          'images'.tr(),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Gap(8),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(3, (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ImagePickerWidget(
                                    onFileChanged: (File? file) {
                                      final currentImages = List<File>.from(
                                        selectedImages.value,
                                      );
                                      if (file != null) {
                                        if (index < currentImages.length) {
                                          currentImages[index] = file;
                                        } else {
                                          currentImages.add(file);
                                        }
                                      }
                                      selectedImages.value = currentImages;
                                    },
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: state is AddAdLoadingState ? null : addHome,
                        child: state is AddAdLoadingState
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.5,
                                ),
                              )
                            : Text(
                                'submitListing'.tr(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
