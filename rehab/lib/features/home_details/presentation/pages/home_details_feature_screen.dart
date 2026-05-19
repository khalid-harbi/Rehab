import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/core/utils/localization_helper.dart';
import 'package:rehab/core/utils/share_home_details.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:rehab/features/home_details/presentation/widgets/booking_bar.dart';
import 'package:rehab/features/home_details/presentation/widgets/facility_card.dart';
import 'package:rehab/features/home_details/presentation/widgets/header_image.dart';
import 'package:rehab/features/home_details/presentation/widgets/owner_card.dart';
import 'package:rehab/features/home_details/presentation/widgets/policy_item.dart';
import 'package:rehab/features/home_details/presentation/widgets/section_title.dart';
import 'package:rehab/features/home_details/presentation/widgets/status_badge.dart';
import 'package:rehab/features/users/presentation/cubit/users_cubit.dart';
import 'package:rehab/features/users/presentation/cubit/users_state.dart';

class HomeDetailsFeatureScreen extends StatelessWidget {
  final HomeEntity home;

  const HomeDetailsFeatureScreen({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersCubit>();
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colors.surface,
      bottomNavigationBar: BookingBar(home: home),
      body: BlocListener<UsersCubit, UsersState>(
        listenWhen: (previous, current) =>
            current is UsersRoomCreatedState || current is UsersErrorState,
        listener: (context, state) async {
          if (state is UsersRoomCreatedState) {
            await context.push(Routes.conversation, extra: state.room);
            if (!context.mounted) return;
            context.read<ChatCubit>().fetchRooms();
          } else if (state is UsersErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("حدث خطأ: ${state.message}")),
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderImage(
                home: home,
                onSharePressed: () => shareHomeDetails(context, home),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatusBadge(isAvailable: home.isAvailable),
                    const SizedBox(height: 24),
                    Text(
                      titleForLocale(context, home.titleEn, home.titleAr),
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 24),
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
                            '${titleForLocale(context, home.cityEn, home.cityAr)} - ${titleForLocale(context, home.districtEn, home.districtAr)}',
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
                          '${home.area} m²',
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
                      titleForLocale(
                        context,
                        home.descriptionEn,
                        home.descriptionAr,
                      ),
                      style: textTheme.bodyMedium?.copyWith(
                        height: 1.7,
                        color: colors.onSurface,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ==========================================
                    // ==========================================
                    const SizedBox(height: 24),
                    SectionTitle(title: "facilities".tr()),
                    GridView.count(
                      padding: const EdgeInsets.only(top: 24, bottom: 24),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 3.2,
                      children: [
                        FacilityCard(
                          icon: Icons.bed_outlined,
                          title: 'bedrooms_count'.plural(home.rooms),
                        ),
                        FacilityCard(
                          icon: Icons.bathtub_outlined,
                          title: 'bathrooms_count'.plural(home.bathrooms),
                        ),
                        for (int i = 0; i < home.amenitiesEn.length; i++)
                          FacilityCard(
                            icon: Icons.star_border,
                            title: titleForLocale(
                              context,
                              home.amenitiesEn[i],
                              home.amenitiesAr.length > i
                                  ? home.amenitiesAr[i]
                                  : '',
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    SectionTitle(title: 'housingRulesAndPolicies'.tr()),
                    const SizedBox(height: 24),

                    for (int i = 0; i < home.policyEn.length; i++)
                      PolicyItem(
                        icon: Icons.info_outline,
                        title: titleForLocale(
                          context,
                          home.policyEn[i],
                          home.policyAr.length > i ? home.policyAr[i] : '',
                        ),
                      ),

                    const SizedBox(height: 24),
                    buildOwnerContactCard(context, cubit, colors, home),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
