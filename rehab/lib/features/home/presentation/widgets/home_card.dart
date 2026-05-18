import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/core/services/map_service.dart';
import 'package:rehab/core/utils/localization_helper.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';
import 'package:rehab/features/home/presentation/cubit/home_cubit.dart';
import 'package:rehab/features/home/presentation/widgets/home_image_carousel.dart';

class HomeCard extends StatelessWidget {
  final HomeEntity home;
  const HomeCard({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        context.push(Routes.homeDetails, extra: home);
      },
      //todo : add shadow "leen"
      // todo: and change to container instead of card
      // todo: fix ريال/شهريا
      //todo: why the image separated from the card ???
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child:HomeImageCarousel(
  images: home.imageUrls.isNotEmpty
      ? home.imageUrls
      : [home.imageUrl],
  height: 200,
  borderRadius: BorderRadius.zero,
),
                ),
                //todo: change it posion based on language
                if (home.distance != null && home.distance! > 0.1)
                  Positioned(
                    top: 15,
                    left: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondary.withAlpha(99),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'يبعد ${home.distance!.toStringAsFixed(1)} كم',
                        style: const TextStyle(
                          color: AppColors.background,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleForLocale(context, home.titleEn, home.titleAr),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        titleForLocale(context, home.cityEn, home.cityAr),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.apartment_outlined,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),

                      const SizedBox(width: 4),
                      Text(
                        titleForLocale(
                          context,
                          home.propertyTypeEn,
                          home.propertyTypeAr,
                        ),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 18, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        home.rating.toString(),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${home.price}  ريال/شهريًا',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<HomeCubit>().openMapLocation(
                          home.lat,
                          home.lng,
                        );
                      },
                      icon: const Icon(Icons.map_outlined, size: 18),
                      label: const Text(
                        'فتح في الخريطة',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
