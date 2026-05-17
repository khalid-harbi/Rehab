import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/core/common/sub/search/presentation/cubit/search_cubit.dart';
import 'package:rehab/core/constants/app_colors.dart';

import 'package:rehab/core/utils/localization_helper.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';

class FilterWidget extends StatefulWidget {
  final List<HomeEntity> homes;
  const FilterWidget({super.key, required this.homes});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  double minPrice = 100;
  double maxPrice = 5000;
  int selectedRooms = 0;
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    // ==========================================================
    final List<String> dynamicCities = widget.homes
        .map((home) => titleForLocale(context, home.cityEn, home.cityAr))
        .toSet() // automatically removes any duplicates
        .toList();
    // ==========================================================

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "الفلترة",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),

          Text("نطاق السعر: ${minPrice.toInt()} - ${maxPrice.toInt()} ريال"),
          RangeSlider(
            values: RangeValues(minPrice, maxPrice),
            min: 0,
            max: 10000,
            divisions: 20,
            activeColor: AppColors.primary,
            onChanged: (values) {
              setState(() {
                minPrice = values.start;
                maxPrice = values.end;
              });
            },
          ),

          const SizedBox(height: 20),

          const Text(
            "المدينة",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Wrap(
            spacing: 10,
            children: dynamicCities.map((city) {
              final isSelected = selectedCity == city;
              return ChoiceChip(
                label: Text(city),
                selected: isSelected,
                onSelected: (val) =>
                    setState(() => selectedCity = val ? city : null),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          const Text(
            "عدد الغرف",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [1, 2, 3, 4, 5].map((num) {
              return InkWell(
                onTap: () => setState(() => selectedRooms = num),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: selectedRooms == num
                        ? const Color(0xFF6A1B9A)
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "$num",
                    style: TextStyle(
                      color: selectedRooms == num ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 40),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {
                context.read<SearchCubit>().applyFilter(
                  minPrice: minPrice,
                  maxPrice: maxPrice,
                  city: selectedCity,
                  rooms: selectedRooms > 0 ? selectedRooms : null,
                );
                Navigator.pop(context);
              },
              child: const Text(
                "تطبيق الفلتر",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
