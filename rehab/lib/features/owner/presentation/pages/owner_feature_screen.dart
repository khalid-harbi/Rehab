import 'package:go_router/go_router.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_cubit.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_state.dart';
import 'package:rehab/features/owner/presentation/widgets/owner_sliver_app_bar_widget.dart';

class OwnerFeatureScreen extends StatelessWidget {
  const OwnerFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const Color softPinkColor = Color(0xFFF9BCC6);
    const Color warmBeigeColor = Color(0xFFD4BE9F);

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'لوحة التحكم',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<OwnerCubit, OwnerState>(
                      builder: (context, state) {
                        if (state is OwnerSuccessState) {
                          final ownerData = state.owner;

                          return Column(
                            children: [
                              Container(
                                height: 100,
                                width: double.infinity,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withAlpha(30),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.apartment_outlined,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    ),
                                    const SizedBox(width: 16),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '${ownerData.propertyCount}',
                                            style: theme
                                                .textTheme
                                                .headlineMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'عقاراتي ',
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white70,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 150,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: softPinkColor,
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: AppColors.primary
                                                  .withAlpha(30),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.check_circle_outline,
                                              color: AppColors.primary,
                                              size: 26,
                                            ),
                                          ),

                                          const Spacer(),
                                          Text(
                                            '${ownerData.paidBookingsCount}',
                                            style: theme.textTheme.headlineSmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.primary,
                                                ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'الحجوزات المدفوعة',
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                  fontSize: 13,
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Container(
                                      height: 150,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: warmBeigeColor,
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: AppColors.primary
                                                  .withAlpha(30),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.monetization_on_outlined,
                                              color: AppColors.primary,
                                              size: 26,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            ownerData.paidBookingsCount > 0
                                                ? '${(ownerData.totalRevenue / ownerData.paidBookingsCount).toStringAsFixed(0)} ريال'
                                                : '0 ريال',
                                            style: theme.textTheme.headlineSmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: AppColors.primary,
                                                ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'متوسط الدخل لكل حجز',
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                  fontSize: 13,
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }

                        return const SizedBox(
                          height: 200,
                          child: Center(child: LoadingWidget()),
                        );
                      },
                    ),

                    Gap(5.sh),
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
