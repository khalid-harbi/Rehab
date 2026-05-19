import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
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
// <<<<<<< HEAD
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
// =======
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         BlocBuilder<ProfileCubit, ProfileState>(
//                           builder: (context, state) {
//                             if (state is ProfileLoadingState) {
//                               return const Center(child: LoadingWidget());
//                             }

//                             if (state is ProfileSuccessState) {
//                               return Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '${"hi".tr()} ${state.profile.name}',
//                                     style: const TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 24,
//                                     ),
//                                   ),
//                                   Text(
//                                     'howAreYou'.tr(),
//                                     style: const TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               );
//                             }

//                             if (state is ProfileErrorState) {
//                               return Center(
//                                 child: Text(
//                                   'Error: ${state.message}',
//                                   style: const TextStyle(color: Colors.red),
//                                 ),
//                               );
//                             }

//                             return const SizedBox.shrink();
//                           },
//                         ),

//                         const SizedBox(height: 20),

//                         BlocBuilder<OwnerCubit, OwnerState>(
//                           builder: (context, state) {
//                             if (state is OwnerInitialState) {
//                               return const Center(
//                                 child: CircularProgressIndicator(),
//                               );
//                             }

//                             if (state is OwnerSuccessState) {
//                               return Container(
//                                 width: double.infinity,
//                                 padding: const EdgeInsets.all(16),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white.withAlpha(100),
//                                   borderRadius: BorderRadius.circular(18),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'الأرباح الشهرية',
//                                           style: theme.textTheme.bodySmall
//                                               ?.copyWith(
//                                                 fontSize: 20,
//                                                 color: Colors.white.withAlpha(
//                                                   200,
//                                                 ),
//                                               ),
//                                         ),
//                                         const SizedBox(height: 6),
//                                         Text(
//                                           '${state.owner.totalRevenue.toStringAsFixed(0)} ريال',
//                                           style: theme.textTheme.titleLarge
//                                               ?.copyWith(color: Colors.white),
//                                         ),
//                                       ],
//                                     ),
//                                     const Icon(
//                                       Icons.trending_up,
//                                       color: Colors.white,
//                                       size: 28,
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }

//                             if (state is OwnerErrorState) {
//                               return Text(
//                                 state.message,
//                                 style: const TextStyle(color: Colors.red),
//                               );
//                             }

//                             return const SizedBox.shrink();
//                           },
// >>>>>>> origin/khaled4
                        ),
                      ],
                    ),
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
