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
              Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.primary.withAlpha(200),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'لوحة التحكم',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    'مرحبا ',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 18,
                      color: Colors.white.withAlpha(200),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(100),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'الأرباح الشهرية',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 20,
                                color: Colors.white.withAlpha(200),
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              '5,000 ريال',
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const Icon(
                          Icons.trending_up,
                          color: Colors.white,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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