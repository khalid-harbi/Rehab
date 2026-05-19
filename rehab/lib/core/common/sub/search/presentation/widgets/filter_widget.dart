// import 'package:go_router/go_router.dart';
// import 'package:rehab/core/common/sub/search/presentation/cubit/search_cubit.dart';
// import 'package:rehab/core/exports/app_exports.dart';
// import 'package:rehab/core/utils/localization_helper.dart';

// class FilterWidget extends StatefulWidget {
//   final List<HomeEntity> homes;
//   const FilterWidget({super.key, required this.homes});

//   @override
//   State<FilterWidget> createState() => _FilterWidgetState();
// }

// class _FilterWidgetState extends State<FilterWidget> {
//   double minPrice = 0;
//   double maxPrice = 10000;
//   double highestPriceInDb = 10000;
//   int selectedRooms = 0;
//   int selectedBathrooms = 0;
//   String? selectedCity;

//   @override
//   void initState() {
//     super.initState();

//     if (widget.homes.isNotEmpty) {
//       final maxDbPrice = widget.homes
//           .map((home) => home.price.toDouble())
//           .reduce((value, element) => value > element ? value : element);
//       setState(() {
//         highestPriceInDb = maxDbPrice > 0 ? maxDbPrice : 10000;
//         maxPrice = highestPriceInDb;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ==========================================================
//     final List<String> dynamicCities = widget.homes
//         .map((home) => titleForLocale(context, home.cityEn, home.cityAr))
//         .toSet() // automatically removes any duplicates
//         .toList();
//     // ==========================================================

//     return Container(
//       padding: const EdgeInsets.all(24),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: Container(
//               width: 50,
//               height: 5,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           const Text(
//             "الفلترة",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 25),
//           IconButton(
//             icon: const Icon(Icons.near_me),
//             onPressed: () {
//               context.read<SearchCubit>().getNearbyHomesMethod();
//               context.pop();
//             },
//           ),
//           const SizedBox(height: 25),
//           Text("نطاق السعر: ${minPrice.toInt()} - ${maxPrice.toInt()} ريال"),

//           RangeSlider(
//             values: RangeValues(minPrice, maxPrice),
//             min: 0,
//             max: highestPriceInDb,
//             divisions: (highestPriceInDb / 500).toInt() > 0
//                 ? (highestPriceInDb / 500).toInt()
//                 : 1,
//             activeColor: AppColors.primary,
//             onChanged: (values) {
//               setState(() {
//                 minPrice = values.start;
//                 maxPrice = values.end;
//               });
//             },
//           ),

//           const SizedBox(height: 20),

//           const Text(
//             "المدينة",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),

//           Row(
//             spacing: 10,
//             children: dynamicCities.map((city) {
//               final isSelected = selectedCity == city;
//               return ChoiceChip(
//                 label: Text(city),
//                 selected: isSelected,
//                 onSelected: (value) =>
//                     setState(() => selectedCity = value ? city : null),
//               );
//             }).toList(),
//           ),

//           const SizedBox(height: 20),

//           const Text(
//             "عدد الغرف",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [1, 2, 3, 4, 5, 6].map((roomCount) {
//               return InkWell(
//                 onTap: () => setState(() => selectedRooms = roomCount),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 12,
//                   ),
//                   decoration: BoxDecoration(
//                     color: selectedRooms == roomCount
//                         ? AppColors.secondary
//                         : Colors.grey.shade100,
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Text(
//                     "$roomCount",
//                     style: TextStyle(
//                       color: selectedRooms == roomCount
//                           ? Colors.white
//                           : Colors.black,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),

//           const SizedBox(height: 20), // إضافة مسافة تجميلية كانت ناقصة هنا

//           const Text(
//             "عدد الحمامات",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [1, 2, 3, 4, 5].map((bathroomCount) {
//               return InkWell(
//                 onTap: () => setState(() => selectedBathrooms = bathroomCount),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 12,
//                   ),
//                   decoration: BoxDecoration(
//                     color: selectedBathrooms == bathroomCount
//                         ? AppColors.secondary
//                         : Colors.grey.shade100,
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Text(
//                     "$bathroomCount",
//                     style: TextStyle(
//                       color: selectedBathrooms == bathroomCount
//                           ? Colors.white
//                           : Colors.black,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),

//           const SizedBox(height: 40),

//           SizedBox(
//             width: double.infinity,
//             height: 55,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.primary,
//               ),
//               onPressed: () {
//                 context.read<SearchCubit>().applyFilter(
//                   minPrice: minPrice,
//                   maxPrice: maxPrice,
//                   city: selectedCity,
//                   rooms: selectedRooms > 0 ? selectedRooms : null,
//                   bathrooms: selectedBathrooms > 0 ? selectedBathrooms : null,
//                 );
//                 Navigator.pop(context);
//               },
//               child: const Text(
//                 "تطبيق الفلتر",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/common/sub/search/presentation/cubit/search_cubit.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/utils/localization_helper.dart';

class FilterWidget extends StatefulWidget {
  final List<HomeEntity> homes;
  const FilterWidget({super.key, required this.homes});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  double minPrice = 0;
  double maxPrice = 10000;
  double highestPriceInDb = 10000;
  int selectedRooms = 0;
  int selectedBathrooms = 0;
  String? selectedCity;
  String? selectedSort = 'price_asc';

  // @override
  // void initState() {
  //   super.initState();

  //   if (widget.homes.isNotEmpty) {
  //     final maxDbPrice = widget.homes
  //         .map((home) => home.price.toDouble())
  //         .reduce((value, element) => value > element ? value : element);
  //     setState(() {
  //       highestPriceInDb = maxDbPrice > 0 ? maxDbPrice : 10000;
  //       maxPrice = highestPriceInDb;
  //     });
  //   }
  // }
  @override
  void initState() {
    super.initState();

    if (widget.homes.isNotEmpty) {
      final maxDbPrice = widget.homes
          .map((home) => home.price.toDouble())
          .reduce((value, element) => value > element ? value : element);

      setState(() {
        // إذا كان أعلى سعر في الداتا بيس هو 0 (حالة حماية)، نضع قيمة افتراضية 10000
        highestPriceInDb = maxDbPrice > 0 ? maxDbPrice : 10000;
        maxPrice = highestPriceInDb; // السهم الأيمن يبدأ من الحد الأقصى الحقيقي
        minPrice = 0;
      });
    } else {
      // في حال كانت القائمة فارغة مؤقتاً
      highestPriceInDb = 10000;
      maxPrice = 10000;
      minPrice = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double safeMinPrice = minPrice.clamp(0.0, highestPriceInDb);
    double safeMaxPrice = maxPrice.clamp(safeMinPrice, highestPriceInDb);

    if (highestPriceInDb == 0 || safeMinPrice == safeMaxPrice) {
      highestPriceInDb = 10000;
      safeMaxPrice = 10000;
    }
    final List<String> dynamicCities = widget.homes
        .map((home) => titleForLocale(context, home.cityEn, home.cityAr))
        .toSet()
        .toList();

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "تصفية النتائج",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          " بالقرب مني",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.my_location,
                            color: AppColors.primary,
                          ),
                          onPressed: () {
                            context.read<SearchCubit>().getNearbyHomesMethod();
                            context.pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 32, thickness: 1, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.only(bottom: 12, top: 8),
              child: Row(
                children: [
                  Icon(Icons.sort_rounded, size: 20, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Text(
                    "الترتيب حسب",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            DropdownButtonFormField<String>(
              initialValue: selectedSort,
              dropdownColor: Colors.white,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.primary,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade50,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'price_asc',
                  child: Text('من الأقل للأعلى'),
                ),
                DropdownMenuItem(
                  value: 'price_desc',
                  child: Text('من الأعلى للأقل'),
                ),
                DropdownMenuItem(
                  value: 'rating_desc',
                  child: Text('الأعلى تقييما'),
                ),
                DropdownMenuItem(
                  value: 'rating_asc',
                  child: Text('الأقل تقييما'),
                ),
              ],
              onChanged: (value) => setState(() => selectedSort = value),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12, top: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.payments_outlined,
                        size: 20,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),

                      Text(
                        "نطاق السعر: ${safeMinPrice.toInt()} - ${safeMaxPrice.toInt()} ريال",
                      ),
                    ],
                  ),
                ),
                Text(
                  "${minPrice.toInt()} - ${maxPrice.toInt()} ريال",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: AppColors.primary,
                inactiveTrackColor: AppColors.primary.withAlpha(40),
                trackHeight: 4.0,
                thumbColor: AppColors.primary,
                showValueIndicator: ShowValueIndicator.alwaysVisible,
                valueIndicatorColor: AppColors.primary,
                valueIndicatorTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                rangeThumbShape: const RoundRangeSliderThumbShape(
                  enabledThumbRadius: 10,
                ),
              ),
              child: RangeSlider(
                // 🔥 التحديث هنا: مرري المتغيرات الآمنة
                values: RangeValues(safeMinPrice, safeMaxPrice),
                min: 0,
                max: highestPriceInDb,
                divisions: (highestPriceInDb / 500).toInt() > 0
                    ? (highestPriceInDb / 500).toInt()
                    : 1,
                labels: RangeLabels(
                  '${safeMinPrice.toInt()}',
                  '${safeMaxPrice.toInt()}',
                ),
                onChanged: (values) {
                  setState(() {
                    minPrice = values.start;
                    maxPrice = values.end;
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(bottom: 12, top: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 20,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "المدينة",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              spacing: 10,
              children: dynamicCities.map((city) {
                final isSelected = selectedCity == city;
                return ChoiceChip(
                  label: Text(city),
                  selected: isSelected,
                  selectedColor: AppColors.primary,
                  backgroundColor: Colors.grey.shade50,
                  checkmarkColor: Colors.white,
                  shadowColor: Colors.black.withAlpha(20),
                  elevation: isSelected ? 4 : 0,
                  side: BorderSide(
                    color: isSelected
                        ? AppColors.primary
                        : Colors.grey.shade200,
                  ),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onSelected: (value) =>
                      setState(() => selectedCity = value ? city : null),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.only(bottom: 12, top: 8),
              child: Row(
                children: [
                  Icon(Icons.bed_outlined, size: 20, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Text(
                    "عدد الغرف",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [1, 2, 3, 4, 5, 6].map((roomCount) {
                  final isSelected = selectedRooms == roomCount;
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () => setState(
                        () => selectedRooms = isSelected ? 0 : roomCount,
                      ),
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        width: 55,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.secondary
                              : Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(14),

                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.secondary.withAlpha(60),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ]
                              : [],
                        ),
                        child: Text(
                          "$roomCount",
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.only(bottom: 12, top: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.bathtub_outlined,
                    size: 20,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "عدد الحمامات",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [1, 2, 3, 4, 5].map((bathroomCount) {
                  final isSelected = selectedBathrooms == bathroomCount;
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () => setState(
                        () =>
                            selectedBathrooms = isSelected ? 0 : bathroomCount,
                      ),
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        width: 55,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.secondary
                              : Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(14),

                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.secondary.withAlpha(60),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ]
                              : [],
                        ),
                        child: Text(
                          "$bathroomCount",
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 36),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 2,
                  shadowColor: AppColors.primary.withAlpha(100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  context.read<SearchCubit>().applyFilter(
                    minPrice: minPrice,
                    maxPrice: maxPrice,
                    city: selectedCity,
                    rooms: selectedRooms > 0 ? selectedRooms : null,
                    bathrooms: selectedBathrooms > 0 ? selectedBathrooms : null,
                    sortBy: selectedSort,
                  );
                  Navigator.pop(context);
                },
                child: Text(
                  "تطبيق الفلترة ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
