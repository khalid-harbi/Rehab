import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/utils/localization_helper.dart';
import 'package:rehab/features/add_ad/presentation/cubit/add_ad_cubit.dart';
import 'package:rehab/features/add_ad/presentation/cubit/add_ad_state.dart';
import 'package:rehab/features/add_ad/presentation/widgets/custom_text_field.dart';
import 'package:rehab/features/add_ad/presentation/widgets/image_picker_widget.dart';

/// نموذج الإعلان — للإضافة وللتعديل معًا.
///
/// شاشة واحدة لا اثنتان: الحقول والتحقق والصور متطابقة، والاختلاف الوحيد
/// أن التحرير يبدأ بحقول ممتلئة ويحفظ بـ update بدل insert. نسخُها شاشةً
/// ثانية كان يعني صيانة تحقّقين وتصميمين يفترقان مع الوقت.
class AddAdFeatureScreen extends HookWidget {
  const AddAdFeatureScreen({super.key, this.home});

  /// العقار المراد تعديله — null يعني إضافة إعلان جديد.
  final HomeEntity? home;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<AddAdCubit>();

    final editing = home != null;

    // ===================================================
    // ===================================================

    // في وضع التحرير تبدأ الحقول ممتلئة ببيانات العقار.
    final titleController = useTextEditingController(
      text: titleForLocale(context, home?.titleEn ?? '', home?.titleAr ?? ''),
    );
    final cityController = useTextEditingController(
      text: titleForLocale(context, home?.cityEn ?? '', home?.cityAr ?? ''),
    );
    final districtController = useTextEditingController(
      text: titleForLocale(
        context,
        home?.districtEn ?? '',
        home?.districtAr ?? '',
      ),
    );
    final propertyTypeController = useTextEditingController(
      text: titleForLocale(
        context,
        home?.propertyTypeEn ?? '',
        home?.propertyTypeAr ?? '',
      ),
    );
    final descriptionController = useTextEditingController(
      text: titleForLocale(
        context,
        home?.descriptionEn ?? '',
        home?.descriptionAr ?? '',
      ),
    );
    final roomsController = useTextEditingController(
      text: editing ? '${home!.rooms}' : '',
    );
    final bathroomsController = useTextEditingController(
      text: editing ? '${home!.bathrooms}' : '',
    );
    final priceController = useTextEditingController(
      text: editing ? home!.price.toStringAsFixed(0) : '',
    );
    final areaController = useTextEditingController(
      text: editing ? home!.area.toStringAsFixed(0) : '',
    );

    // Location controllers
    final latController = useTextEditingController(
      text: editing ? '${home!.lat}' : '',
    );
    final langController = useTextEditingController(
      text: editing ? '${home!.lng}' : '',
    );

    // Pre-declare controllers to obey hook rules
    final existingPolicies = listForLocale(
      context,
      home?.policyEn ?? const [],
      home?.policyAr ?? const [],
    );
    final existingAmenities = listForLocale(
      context,
      home?.amenitiesEn ?? const [],
      home?.amenitiesAr ?? const [],
    );

    String at(List<String> list, int i) => i < list.length ? list[i] : '';

    final policyControllers = [
      useTextEditingController(text: at(existingPolicies, 0)),
      useTextEditingController(text: at(existingPolicies, 1)),
      useTextEditingController(text: at(existingPolicies, 2)),
    ];
    final policyCount = useState(
      existingPolicies.isEmpty ? 1 : existingPolicies.length.clamp(1, 3),
    );

    final amenityControllers = [
      useTextEditingController(text: at(existingAmenities, 0)),
      useTextEditingController(text: at(existingAmenities, 1)),
    ];
    final amenityCount = useState(
      existingAmenities.isEmpty ? 1 : existingAmenities.length.clamp(1, 2),
    );

    // Keep track of selected image files
    final selectedImages = useState<List<File>>([]);

    // صور الإعلان الحالية — تُعرض قابلة للإزالة، وما يبقى منها يُحفظ كما هو
    // فلا يفقد الإعلان صوره لمجرد تعديل سعره.
    final keptImages = useState<List<String>>(
      home == null
          ? const []
          : (home!.imageUrls.isNotEmpty
                ? List<String>.from(home!.imageUrls)
                : (home!.imageUrl.isNotEmpty ? [home!.imageUrl] : const [])),
    );

    // كان النموذج يقبل الإرسال بعنوان فارغ وسعر صفر، فيصل إلى الباحثات
    // إعلان بلا بيانات. صار التحقق شرطًا قبل الإرسال.
    final formKey = useMemoized(GlobalKey<FormState>.new);

    String? required(String? v) =>
        (v == null || v.trim().isEmpty) ? 'requiredField'.tr() : null;

    String? requiredNumber(String? v) {
      if (v == null || v.trim().isEmpty) return 'requiredField'.tr();
      final n = num.tryParse(v.trim().replaceAll(',', '.'));
      if (n == null || n <= 0) return 'invalidNumber'.tr();
      return null;
    }

    String? optionalNumber(String? v) {
      if (v == null || v.trim().isEmpty) return null;
      return num.tryParse(v.trim().replaceAll(',', '.')) == null
          ? 'invalidNumber'.tr()
          : null;
    }

    void addHome() {
      // التحقق أولًا حتى تظهر رسائل الحقول الناقصة مباشرة تحتها
      if (!(formKey.currentState?.validate() ?? false)) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('checkRequiredFields'.tr())));
        return;
      }

      if (selectedImages.value.isEmpty && keptImages.value.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('pleaseAddImage'.tr())));
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

      if (editing) {
        cubit.updateAd(
          id: home!.id,
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
          keptImageUrls: keptImages.value,
          newImages: selectedImages.value,
        );
        return;
      }

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
            SnackBar(
              content: Text((editing ? 'listingUpdated' : 'listingAdded').tr()),
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
                padding: const EdgeInsets.all(AppDimensions.spaceXl),
                child: Form(
                  key: formKey,
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
                      Gap(AppDimensions.spaceLg),
                      Text(
                        (editing ? 'editListing' : 'addNewListing').tr(),
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(AppDimensions.spaceXs),
                      Text(
                        (editing
                                ? 'editYourPropertyDetails'
                                : 'addYourPropertyDetails')
                            .tr(),
                        style: theme.textTheme.bodyMedium,
                      ),
                      Gap(AppDimensions.spaceXl),
                      CustomTextField(
                        label: 'listingTitle'.tr(),
                        validator: required,
                        isRequired: true,
                        hint: 'listingTitleHint'.tr(),
                        controller: titleController,
                      ),
                      Gap(AppDimensions.spaceLg),
                      CustomTextField(
                        label: 'city'.tr(),
                        validator: required,
                        isRequired: true,
                        hint: 'cityHint'.tr(),
                        controller: cityController,
                      ),
                      Gap(AppDimensions.spaceLg),
                      CustomTextField(
                        label: 'district'.tr(),
                        validator: required,
                        isRequired: true,
                        hint: 'districtHint'.tr(),
                        controller: districtController,
                      ),
                      Gap(AppDimensions.spaceLg),
                      CustomTextField(
                        label: 'propertyType'.tr(),
                        validator: required,
                        isRequired: true,
                        hint: 'propertyTypeHint'.tr(),
                        controller: propertyTypeController,
                      ),
                      Gap(AppDimensions.spaceLg),
                      CustomTextField(
                        label: 'description'.tr(),
                        validator: required,
                        isRequired: true,
                        hint: 'descriptionHint'.tr(),
                        maxLines: 5,
                        controller: descriptionController,
                      ),
                      Gap(AppDimensions.spaceLg),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              label: 'numberOfRooms'.tr(),
                              validator: requiredNumber,
                              isRequired: true,
                              hint: 'numberOfRoomsHint'.tr(),
                              controller: roomsController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Gap(AppDimensions.spaceMd),
                          Expanded(
                            child: CustomTextField(
                              label: 'numberOfBathrooms'.tr(),
                              validator: requiredNumber,
                              isRequired: true,
                              hint: 'numberOfBathroomsHint'.tr(),
                              controller: bathroomsController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      Gap(AppDimensions.spaceLg),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              label: 'monthlyPrice'.tr(),
                              validator: requiredNumber,
                              isRequired: true,
                              hint: 'monthlyPriceHint'.tr(),
                              controller: priceController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Gap(AppDimensions.spaceMd),
                          Expanded(
                            child: CustomTextField(
                              label: 'area'.tr(),
                              validator: requiredNumber,
                              isRequired: true,
                              hint: 'areaHint'.tr(),
                              controller: areaController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      Gap(AppDimensions.spaceLg),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              label: 'latitude'.tr(),
                              validator: optionalNumber,
                              hint: 'latitudeHint'.tr(),
                              controller: latController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Gap(AppDimensions.spaceMd),
                          Expanded(
                            child: CustomTextField(
                              label: 'longitude'.tr(),
                              validator: optionalNumber,
                              hint: 'longitudeHint'.tr(),
                              controller: langController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      Gap(AppDimensions.spaceXl),
                      Text(
                        'housingRulesAndPolicies'.tr(),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(AppDimensions.spaceSm),
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
                        Gap(AppDimensions.spaceSm),
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
                      Gap(AppDimensions.spaceLg),
                      Text(
                        'facilities'.tr(),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(AppDimensions.spaceSm),
                      for (int i = 0; i < amenityCount.value; i++) ...[
                        CustomTextField(
                          label: i == 1
                              ? 'secondFacility'.tr()
                              : 'firstFacility'.tr(),
                          hint: 'privateParkingHint'.tr(),
                          controller: amenityControllers[i],
                        ),
                        Gap(AppDimensions.spaceSm),
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
                      Gap(AppDimensions.spaceXl),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            'images'.tr(),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Gap(AppDimensions.spaceSm),

                          // صور الإعلان الحالية — بلا هذا الشريط كانت
                          // المالكة تظنّ إعلانها بلا صور وتُعيد رفعها.
                          if (keptImages.value.isNotEmpty) ...[
                            Text(
                              'currentPhotos'.tr(),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            Gap(AppDimensions.spaceSm),
                            SizedBox(
                              height: 86,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: keptImages.value.length,
                                separatorBuilder: (_, _) =>
                                    const Gap(AppDimensions.spaceSm),
                                itemBuilder: (context, index) => _ExistingPhoto(
                                  url: keptImages.value[index],
                                  onRemove: () {
                                    final next = List<String>.from(
                                      keptImages.value,
                                    )..removeAt(index);
                                    keptImages.value = next;
                                  },
                                ),
                              ),
                            ),
                            Gap(AppDimensions.spaceMd),
                          ],
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
                          onPressed: state is AddAdLoadingState
                              ? null
                              : addHome,
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
                                  (editing ? 'saveChanges' : 'submitListing')
                                      .tr(),
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
          ),
        );
      },
    );
  }
}

/// صورة قائمة في الإعلان، مع زر إزالتها.
class _ExistingPhoto extends StatelessWidget {
  const _ExistingPhoto({required this.url, required this.onRemove});

  final String url;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = BorderRadius.circular(AppDimensions.radiusMd);

    return SizedBox(
      width: 86,
      height: 86,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: radius,
              child: Image.network(
                url,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  color: theme.colorScheme.primary.withAlpha(20),
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: theme.colorScheme.primary.withAlpha(120),
                  ),
                ),
              ),
            ),
          ),

          PositionedDirectional(
            top: 2,
            end: 2,
            child: Material(
              color: Colors.black.withAlpha(140),
              shape: const CircleBorder(),
              child: InkWell(
                onTap: onRemove,
                customBorder: const CircleBorder(),
                child: const SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(Icons.close, size: 15, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
