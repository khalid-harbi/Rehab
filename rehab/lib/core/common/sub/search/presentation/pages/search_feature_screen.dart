import 'package:rehab/core/common/sub/search/presentation/cubit/search_cubit.dart';
import 'package:rehab/core/common/sub/search/presentation/widgets/filter_widget.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/widgets/app_top_bar.dart';
import 'package:rehab/features/home/presentation/cubit/home_cubit.dart';
import 'package:rehab/features/home/presentation/widgets/home_card.dart';

/// تبويب البحث في الشريط السفلي — حقل بحث حي، فلاتر، ونتائج.
class SearchFeatureScreen extends HookWidget {
  const SearchFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    final controller = useTextEditingController();

    useEffect(() {
      Timer? timer;

      void listener() {
        timer?.cancel();
        timer = Timer(const Duration(milliseconds: 400), () {
          cubit.getSearchMethod(title: controller.text);
        });
      }

      controller.addListener(listener);

      return () {
        timer?.cancel();
        controller.removeListener(listener);
      };
    }, const []);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppTopBar(title: "search".tr()),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _SearchField(controller: controller),
            const _QuickActions(),
            const Expanded(child: _Results()),
          ],
        ),
      ),
    );
  }
}

// ===================================================================
// حقل البحث
// ===================================================================

class _SearchField extends StatelessWidget {
  const _SearchField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.screenPadding,
        AppDimensions.spaceLg,
        AppDimensions.screenPadding,
        AppDimensions.spaceMd,
      ),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller,
        builder: (context, value, child) => TextField(
          controller: controller,
          textInputAction: TextInputAction.search,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: "searchHint".tr(),
            hintStyle: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
            prefixIcon: const Icon(
              Icons.search_rounded,
              size: AppDimensions.iconLg,
              color: AppColors.primary,
            ),
            suffixIcon: value.text.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(
                      Icons.close_rounded,
                      size: AppDimensions.iconMd,
                    ),
                    onPressed: controller.clear,
                  ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spaceLg,
              vertical: AppDimensions.spaceMd,
            ),
          ),
        ),
      ),
    );
  }
}

// ===================================================================
// إجراءات سريعة: الفلاتر، القريب مني، إعادة الضبط
// ===================================================================

class _QuickActions extends StatelessWidget {
  const _QuickActions();

  void _openFilters(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();

    final homes = searchCubit.state is SearchSuccessState
        ? (searchCubit.state as SearchSuccessState).homes
        : <HomeEntity>[];

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => BlocProvider.value(
        value: searchCubit,
        child: FilterWidget(homes: homes),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.screenPadding,
        ),
        children: [
          _ActionChip(
            icon: Icons.tune_rounded,
            label: "filters".tr(),
            filled: true,
            onTap: () => _openFilters(context),
          ),
          const Gap(AppDimensions.spaceSm),
          _ActionChip(
            icon: Icons.my_location_rounded,
            label: "nearby".tr(),
            onTap: () => context.read<SearchCubit>().getNearbyHomesMethod(),
          ),
          const Gap(AppDimensions.spaceSm),
          _ActionChip(
            icon: Icons.refresh_rounded,
            label: "reset".tr(),
            onTap: () {
              context.read<SearchCubit>().getSearchMethod(title: '');
              context.read<HomeCubit>().resetFilters();
            },
          ),
        ],
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  const _ActionChip({
    required this.icon,
    required this.label,
    required this.onTap,
    this.filled = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final foreground = filled ? Colors.white : AppColors.primary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spaceMd),
        decoration: BoxDecoration(
          color: filled ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
          border: Border.all(
            color: filled ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: AppDimensions.iconSm, color: foreground),
            const Gap(AppDimensions.spaceXs),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: foreground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===================================================================
// النتائج
// ===================================================================

class _Results extends StatelessWidget {
  const _Results();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return const Center(child: LoadingWidget());
        }

        if (state is SearchErrorState) {
          return _EmptyState(
            icon: Icons.error_outline_rounded,
            message: state.message,
          );
        }

        if (state is! SearchSuccessState) {
          return const SizedBox.shrink();
        }

        if (state.homes.isEmpty) {
          return _EmptyState(
            icon: Icons.search_off_rounded,
            message: "noResults".tr(),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimensions.screenPadding,
                AppDimensions.spaceLg,
                AppDimensions.screenPadding,
                0,
              ),
              child: Text(
                "resultsCount".plural(state.homes.length),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(
                  top: AppDimensions.spaceSm,
                  bottom: 90,
                ),
                itemCount: state.homes.length,
                itemBuilder: (context, index) =>
                    HomeCard(home: state.homes[index]),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 44, color: AppColors.textSecondary.withAlpha(120)),
          const Gap(AppDimensions.spaceMd),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spaceXl,
            ),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
