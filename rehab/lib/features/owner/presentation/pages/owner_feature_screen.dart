import 'package:flutter/material.dart';
import 'package:rehab/features/owner/presentation/widgets/owner_state_card.dart';

class OwnerFeatureScreen extends StatelessWidget {
  const OwnerFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Directionality(
            textDirection: TextDirection.rtl,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'لوحة التحكم',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  'نظرة عامة على عقاراتك',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.15,
                  children: const [
                    OwnerStatCard(
                      title: 'عقاراتي',
                      value: '3',
                      icon: Icons.apartment_outlined,
                    ),
                    OwnerStatCard(
                      title: 'طلبات معلقة',
                      value: '2',
                      icon: Icons.access_time_outlined,
                    ),
                    OwnerStatCard(
                      title: 'حجوزات نشطة',
                      value: '5',
                      icon: Icons.check_circle_outline,
                    ),
                    OwnerStatCard(
                      title: 'تنبيهات',
                      value: '1',
                                        icon: Icons.notifications_none_outlined,
                      ),
                    ],
                  ),
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}