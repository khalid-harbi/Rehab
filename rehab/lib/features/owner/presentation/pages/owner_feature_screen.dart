import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_cubit.dart';
import 'package:rehab/features/owner/presentation/widgets/owner_sliver_app_bar_widget.dart';
import 'package:rehab/features/owner/presentation/widgets/owner_state_card.dart';

class OwnerFeatureScreen extends StatelessWidget {
  const OwnerFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => OwnerCubit(GetIt.I.get())..getOwnerMethod(),
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: CustomScrollView(
          slivers: [
            OwnerSliverAppBarWidget(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'لوحة التحكم',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                    Gap(2.sh),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context.push(Routes.addAd);
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('إضافة إعلان جديد'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
