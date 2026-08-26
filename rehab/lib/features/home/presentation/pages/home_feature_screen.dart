import 'package:rehab/core/common/sub/search/presentation/cubit/search_cubit.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/extensions/user_list_extension.dart';
import 'package:rehab/features/ads/presentation/cubit/ads_cubit.dart';
import 'package:rehab/features/ads/presentation/widgets/ads_carousel.dart';
import 'package:rehab/features/home/presentation/widgets/home_card.dart';
import 'package:rehab/features/home/presentation/widgets/home_header_app_bar.dart';
import 'package:rehab/features/home/presentation/widgets/home_search_bar.dart';
import 'package:rehab/features/home/presentation/widgets/match_user_card.dart';
import 'package:rehab/features/home/presentation/widgets/section_header.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';
import 'package:rehab/features/users/presentation/cubit/users_cubit.dart';
import 'package:rehab/features/users/presentation/cubit/users_state.dart';
import 'package:url_launcher/url_launcher.dart';

/// عدد الكاردات المعروضة في كل قسم قبل «عرض المزيد».
const int _kSectionPreviewCount = 3;

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key, this.onNavigateToTab});

  /// ينقل المستخدم إلى تبويب آخر في الشريط السفلي (١ = البحث، ٣ = التوافق).
  final ValueChanged<int>? onNavigateToTab;

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();
    final adsCubit = context.read<AdsCubit>();

    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: const _EmergencyButton(),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, searchState) {
          final homes = searchState is SearchSuccessState
              ? searchState.homes
              : <HomeEntity>[];

          return RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () async {
              await Future.wait([
                searchCubit.getSearchMethod(title: ''),
                adsCubit.getAdsMethod(),
              ]);
            },
            child: CustomScrollView(
              slivers: [
                const HomeHeaderAppBar(),

                // ــــــ قسم الإعلانات المتحرك ــــــ
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppDimensions.spaceLg),
                    child: AdsCarousel(homes: homes),
                  ),
                ),

                // ــــــ البحث ينقل إلى تبويب البحث ــــــ
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppDimensions.spaceLg),
                    child: HomeSearchBar(onTap: () => onNavigateToTab?.call(1)),
                  ),
                ),

                // ــــــ قسم التوافق ــــــ
                SliverToBoxAdapter(
                  child: _MatchingSection(
                    onShowMore: () => onNavigateToTab?.call(3),
                  ),
                ),

                // ــــــ قسم العقارات ــــــ
                SliverToBoxAdapter(
                  child: SectionHeader(
                    title: "properties".tr(),
                    icon: Icons.home_work_outlined,
                    // «عرض المزيد» ينقل إلى تبويب البحث لعرض كل العقارات.
                    onShowMore: homes.length > _kSectionPreviewCount
                        ? () => onNavigateToTab?.call(1)
                        : null,
                  ),
                ),

                _PropertiesSliver(searchState: searchState),

                const SliverToBoxAdapter(child: Gap(90)),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ===================================================================
// قسم التوافق
// ===================================================================

class _MatchingSection extends StatelessWidget {
  const _MatchingSection({required this.onShowMore});

  final VoidCallback onShowMore;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        final isLoading =
            state is UsersInitialState || state is UsersLoadingState;

        final matches = state is UsersSuccessState
            ? state.users.filteredAndSortedMatches
            : <UsersEntity>[];

        final preview = matches.take(_kSectionPreviewCount).toList();

        return Column(
          children: [
            SectionHeader(
              title: "matching".tr(),
              icon: Icons.favorite_outline,
              // الزر ينقل إلى تبويب التوافق، ويظهر فقط إن كان هناك مزيد.
              onShowMore: matches.length > preview.length ? onShowMore : null,
            ),

            if (isLoading)
              const _SectionPlaceholder(height: 148)
            else if (preview.isEmpty)
              _EmptySection(message: "noMatchesYet".tr())
            else
              _HorizontalSection(
                height: 148,
                itemCount: preview.length,
                itemBuilder: (context, index) =>
                    MatchUserCard(user: preview[index]),
              ),
          ],
        );
      },
    );
  }
}

// ===================================================================
// قسم العقارات
// ===================================================================

class _PropertiesSliver extends StatelessWidget {
  const _PropertiesSliver({required this.searchState});

  final SearchState searchState;

  @override
  Widget build(BuildContext context) {
    final state = searchState;

    if (state is SearchLoadingState) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: LoadingWidget(),
        ),
      );
    }

    if (state is SearchErrorState) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Center(child: Text(state.message)),
        ),
      );
    }

    if (state is! SearchSuccessState) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    if (state.homes.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              Icon(
                Icons.search_off_rounded,
                size: 44,
                color: AppColors.textSecondary.withAlpha(120),
              ),
              const Gap(AppDimensions.spaceMd),
              Text(
                "noResults".tr(),
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final count = _kSectionPreviewCount.clamp(0, state.homes.length);

    return SliverList.builder(
      itemCount: count,
      itemBuilder: (context, index) => HomeCard(home: state.homes[index]),
    );
  }
}

// ===================================================================
// عناصر مشتركة
// ===================================================================

class _HorizontalSection extends StatelessWidget {
  const _HorizontalSection({
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
  });

  final double height;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.screenPadding,
        ),
        itemCount: itemCount,
        separatorBuilder: (context, index) => const Gap(AppDimensions.spaceMd),
        itemBuilder: itemBuilder,
      ),
    );
  }
}

class _EmptySection extends StatelessWidget {
  const _EmptySection({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.screenPadding,
        vertical: AppDimensions.spaceLg,
      ),
      child: Text(
        message,
        style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
      ),
    );
  }
}

class _SectionPlaceholder extends StatelessWidget {
  const _SectionPlaceholder({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.screenPadding,
      ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColors.primary.withAlpha(14),
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        ),
      ),
    );
  }
}

class _EmergencyButton extends StatelessWidget {
  const _EmergencyButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.redAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(30),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        iconSize: 30,
        icon: const Icon(Icons.sos, color: Colors.white70),
        onPressed: () => makeEmergencyCall('0554080481'),
      ),
    );
  }
}

Future<void> makeEmergencyCall(String phoneNumber) async {
  final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);

  if (await canLaunchUrl(launchUri)) {
    await launchUrl(launchUri);
  } else {
    debugPrint('Could not launch emergency call for $phoneNumber');
  }
}
