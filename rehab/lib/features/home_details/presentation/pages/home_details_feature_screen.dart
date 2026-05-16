import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';
import 'package:rehab/features/home_details/presentation/widgets/booking_bar.dart';
import 'package:rehab/features/home_details/presentation/widgets/facility_card.dart';
import 'package:rehab/features/home_details/presentation/widgets/header_image.dart';
import 'package:rehab/features/home_details/presentation/widgets/policy_item.dart';
import 'package:rehab/features/home_details/presentation/widgets/review_card.dart';
import 'package:rehab/features/home_details/presentation/widgets/section_title.dart';
import 'package:rehab/features/home_details/presentation/widgets/status_badge.dart';

class HomeDetailsFeatureScreen extends StatelessWidget {
  final HomeEntity home;

  const HomeDetailsFeatureScreen({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colors.surface,
      bottomNavigationBar: BookingBar(home: home),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderImage(home: home),

            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusBadge(isAvailable: home.isAvailable),

                  const SizedBox(height: 10),

                  Text(
                    home.title,
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: colors.primary,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${home.city} - ${home.district}',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colors.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.space_dashboard_outlined,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),

                      const SizedBox(width: 4),
                      Text(
                        home.area.toString() + "M",
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 20,
                        color: colors.secondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${home.rating}',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  SectionTitle(title: 'aboutProperty'.tr()),

                  const SizedBox(height: 8),

                  Text(
                    home.description,
                    style: textTheme.bodyMedium?.copyWith(
                      height: 1.7,
                      color: colors.onSurface,
                    ),
                  ),

                  const SizedBox(height: 10),

                  SectionTitle(title: "facilities".tr()),

                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 3.2,
                    children: [
                      FacilityCard(
                        icon: Icons.bed_outlined,
                        title: '${home.rooms}bedrooms'.tr(),
                      ),
                      FacilityCard(
                        icon: Icons.bathtub_outlined,
                        title: '${home.bathrooms} bathrooms'.tr(),
                      ),
                      FacilityCard(
                        icon: Icons.wifi_outlined,
                        title: "wi-fi".tr(),
                      ),
                      FacilityCard(
                        icon: Icons.local_parking_outlined,
                        title: 'parking'.tr(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  SectionTitle(title: 'housing rules and policies'.tr()),

                  const SizedBox(height: 12),

                  const PolicyItem(
                    icon: Icons.lock_outline,
                    title: 'السكن مخصص للنساء فقط',
                  ),
                  const PolicyItem(
                    icon: Icons.schedule_outlined,
                    title: 'تسجيل الدخول بعد 2 مساءً',
                  ),
                  const PolicyItem(
                    icon: Icons.smoke_free_outlined,
                    title: 'ممنوع التدخين داخل السكن',
                  ),

                  const SizedBox(height: 24),

                  SectionTitle(title: 'تجارب الضيوف'),

                  const SizedBox(height: 12),

                  const ReviewCard(),

                  const SizedBox(height: 90),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
