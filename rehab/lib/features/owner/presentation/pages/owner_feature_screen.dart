import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/core/utils/formatters.dart';
import 'package:rehab/features/home/presentation/cubit/home_cubit.dart';
import 'package:rehab/features/home/presentation/widgets/home_header_app_bar.dart';
import 'package:rehab/features/home/presentation/widgets/section_header.dart';
import 'package:rehab/features/owner/domain/entities/owner_entity.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_cubit.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_state.dart';
import 'package:rehab/features/owner/presentation/widgets/owner_message_view.dart';
import 'package:rehab/features/owner/presentation/widgets/owner_property_card.dart';
import 'package:rehab/features/owner/presentation/widgets/owner_revenue_card.dart';
import 'package:rehab/features/owner/presentation/widgets/owner_state_card.dart';

/// عدد العقارات المعروضة في اللوحة قبل «عرض المزيد» — نفس رقم أقسام الهوم.
const int _kSectionPreviewCount = 3;

/// لوحة المالكة.
///
/// التصميم يتبع صفحة المستخدمة حرفًا بحرف: نفس الهيدر المثبّت القصير، نفس
/// `SectionHeader` بزر «عرض المزيد»، نفس كارد العقار، ونفس الخلفية والتوكنز.
/// الفرق الوحيد أن المحتوى إدارة لا تصفّح.
///
/// ترتيب الشاشة يتبع سؤال المالكة حين تفتح التطبيق:
/// كم دخلي؟ ← أرقام سريعة ← ما حال إعلاناتي؟ ← أضيفي إعلانًا.
class OwnerFeatureScreen extends StatelessWidget {
  const OwnerFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<OwnerCubit>()..loadDashboard()),

        // كارد العقار مشترك مع صفحة المستخدمة، وزر الخريطة داخله يقرأ
        // HomeCubit — فيلزم توفيره هنا أيضًا.
        BlocProvider(create: (_) => GetIt.I<HomeCubit>()),
      ],
      child: const _OwnerDashboardView(),
    );
  }
}

class _OwnerDashboardView extends StatelessWidget {
  const _OwnerDashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: const _AddListingButton(),
      body: BlocConsumer<OwnerCubit, OwnerState>(
        // فشل مفتاح واحد يُقال في SnackBar، ولا يهدم الشاشة كلها.
        listenWhen: (_, state) =>
            state is OwnerSuccessState && state.toggleError != null,
        listener: (context, state) => context.showSnackBar(
          (state as OwnerSuccessState).toggleError!,
          isError: true,
        ),
        builder: (context, state) {
          if (state is OwnerErrorState) {
            return _ErrorView(message: state.message);
          }

          final success = state is OwnerSuccessState ? state : null;
          final owner = success?.owner;
          final homes = success?.homes ?? const <HomeEntity>[];
          final preview = homes.take(_kSectionPreviewCount).toList();

          return RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () => context.read<OwnerCubit>().loadDashboard(),
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                const HomeHeaderAppBar(),

                // ــــــ بطاقة الدخل ــــــ
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                    AppDimensions.screenPadding,
                    AppDimensions.spaceLg,
                    AppDimensions.screenPadding,
                    0,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: OwnerRevenueCard(
                      totalRevenue: owner?.totalRevenue,
                      paidBookings: owner?.paidBookingsCount ?? 0,
                    ),
                  ),
                ),

                // ــــــ أرقام سريعة ــــــ
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                    AppDimensions.screenPadding,
                    AppDimensions.spaceMd,
                    AppDimensions.screenPadding,
                    0,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: _StatsRow(owner: owner, homes: homes),
                  ),
                ),

                // ــــــ عقاراتي ــــــ
                SliverToBoxAdapter(
                  child: SectionHeader(
                    title: "myProperties".tr(),
                    icon: Icons.home_work_outlined,
                    onShowMore: homes.length > _kSectionPreviewCount
                        ? () => context.push(Routes.properties)
                        : null,
                  ),
                ),

                if (success == null)
                  const SliverToBoxAdapter(child: _PropertiesPlaceholder())
                else if (preview.isEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.screenPadding,
                      ),
                      child: OwnerMessageView(
                        icon: Icons.add_home_work_outlined,
                        title: "noPropertiesYet".tr(),
                        body: "noPropertiesHint".tr(),
                        actionLabel: "addNewListing".tr(),
                        onAction: () => context.push(Routes.addAd),
                      ),
                    ),
                  )
                else
                  SliverList.builder(
                    itemCount: preview.length,
                    itemBuilder: (context, index) =>
                        OwnerPropertyCard(home: preview[index]),
                  ),

                // مساحة تحت آخر عنصر حتى لا يغطّيه الزر العائم والشريط السفلي.
                const SliverToBoxAdapter(child: Gap(96)),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ===================================================================
// الأرقام السريعة
// ===================================================================

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.owner, required this.homes});

  /// null أثناء التحميل.
  final OwnerEntity? owner;
  final List<HomeEntity> homes;

  @override
  Widget build(BuildContext context) {
    final stats = owner;

    if (stats == null) {
      return const _StatsPlaceholder();
    }

    final avgIncome = stats.paidBookingsCount > 0
        ? stats.totalRevenue / stats.paidBookingsCount
        : 0.0;

    // لو تعذّر جلب قائمة العقارات نعرض شرطة بدل صفر كاذب.
    final availableLabel = homes.isEmpty && stats.propertyCount > 0
        ? '—'
        : '${homes.where((home) => home.isAvailable).length}';

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: OwnerStatCard(
              icon: Icons.apartment_outlined,
              value: '${stats.propertyCount}',
              label: "myProperties".tr(),
              onTap: stats.propertyCount > 0
                  ? () => context.push(Routes.properties)
                  : null,
            ),
          ),

          const Gap(AppDimensions.spaceMd),

          Expanded(
            child: OwnerStatCard(
              icon: Icons.visibility_outlined,
              value: availableLabel,
              label: "availableNow".tr(),
            ),
          ),

          const Gap(AppDimensions.spaceMd),

          Expanded(
            child: OwnerStatCard(
              icon: Icons.payments_outlined,
              value: '${Formatters.formatAmount(avgIncome)} ${"riyal".tr()}',
              label: "avgBooking".tr(),
            ),
          ),
        ],
      ),
    );
  }
}

// ===================================================================
// هياكل التحميل — بنفس أبعاد عناصرها النهائية فلا تقفز الشاشة
// ===================================================================

class _Skeleton extends StatelessWidget {
  const _Skeleton({required this.height, this.radius = AppDimensions.radiusLg});

  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(14),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class _StatsPlaceholder extends StatelessWidget {
  const _StatsPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: _Skeleton(height: 96)),
        Gap(AppDimensions.spaceMd),
        Expanded(child: _Skeleton(height: 96)),
        Gap(AppDimensions.spaceMd),
        Expanded(child: _Skeleton(height: 96)),
      ],
    );
  }
}

class _PropertiesPlaceholder extends StatelessWidget {
  const _PropertiesPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.screenPadding),
      child: Column(
        children: [
          _Skeleton(height: 148),
          Gap(AppDimensions.spaceSm),
          _Skeleton(height: 44, radius: AppDimensions.radiusMd),
        ],
      ),
    );
  }
}

// ===================================================================
// الزر العائم وحالة الخطأ
// ===================================================================

class _AddListingButton extends StatelessWidget {
  const _AddListingButton();

  @override
  Widget build(BuildContext context) {
    // الإجراء الأهم للمالكة يبقى ظاهرًا مهما نزلت في الصفحة، بنفس موضع
    // الزر العائم في صفحة المستخدمة.
    return FloatingActionButton.extended(
      onPressed: () => context.push(Routes.addAd),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 4,
      icon: const Icon(Icons.add_rounded),
      label: Text(
        "addNewListing".tr(),
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HomeHeaderAppBar(),

        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.screenPadding),
            child: Center(
              child: OwnerMessageView(
                icon: Icons.cloud_off_rounded,
                title: "somethingWentWrong".tr(),
                body: message,
                actionLabel: "retry".tr(),
                onAction: () => context.read<OwnerCubit>().loadDashboard(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
