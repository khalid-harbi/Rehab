import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/core/widgets/app_top_bar.dart';
import 'package:rehab/features/home/presentation/cubit/home_cubit.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_cubit.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_state.dart';
import 'package:rehab/features/owner/presentation/widgets/owner_message_view.dart';
import 'package:rehab/features/owner/presentation/widgets/owner_property_card.dart';

/// كل عقارات المالكة — امتداد لقسم «عقاراتي» في اللوحة، بنفس الكارد تمامًا.
///
/// كانت تستخدم `AppBar` عاديًا وكاردًا خاصًا بها، فتبدو صفحة من تطبيق آخر.
/// الآن: `AppTopBar` الموحّد ونفس `OwnerPropertyCard`.
class PropertiesFeatureScreen extends StatelessWidget {
  const PropertiesFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetIt.I<OwnerCubit>()..getOwnerPropertiesMethod(),
        ),

        // زر الخريطة داخل كارد العقار المشترك يقرأ HomeCubit.
        BlocProvider(create: (_) => GetIt.I<HomeCubit>()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppTopBar(
          title: "myProperties".tr(),
          showBack: true,
          actions: [
            IconButton(
              onPressed: () => context.push(Routes.addAd),
              tooltip: "addNewListing".tr(),
              icon: const Icon(Icons.add_rounded, color: Colors.white),
            ),
          ],
        ),
        body: BlocConsumer<OwnerCubit, OwnerState>(
          listenWhen: (_, state) =>
              state is OwnerSuccessState && state.toggleError != null,
          listener: (context, state) => context.showSnackBar(
            (state as OwnerSuccessState).toggleError!,
            isError: true,
          ),
          builder: (context, state) {
            if (state is OwnerErrorState) {
              return _Centered(
                child: OwnerMessageView(
                  icon: Icons.cloud_off_rounded,
                  title: "somethingWentWrong".tr(),
                  body: state.message,
                  actionLabel: "retry".tr(),
                  onAction: () =>
                      context.read<OwnerCubit>().getOwnerPropertiesMethod(),
                ),
              );
            }

            if (state is! OwnerSuccessState) {
              return const Center(child: LoadingWidget());
            }

            if (state.homes.isEmpty) {
              return _Centered(
                child: OwnerMessageView(
                  icon: Icons.add_home_work_outlined,
                  title: "noPropertiesYet".tr(),
                  body: "noPropertiesHint".tr(),
                  actionLabel: "addNewListing".tr(),
                  onAction: () => context.push(Routes.addAd),
                ),
              );
            }

            return RefreshIndicator(
              color: AppColors.primary,
              onRefresh: () =>
                  context.read<OwnerCubit>().getOwnerPropertiesMethod(),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimensions.spaceSm,
                ),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.homes.length,
                itemBuilder: (context, index) =>
                    OwnerPropertyCard(home: state.homes[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Centered extends StatelessWidget {
  const _Centered({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.screenPadding),
        child: child,
      ),
    );
  }
}
