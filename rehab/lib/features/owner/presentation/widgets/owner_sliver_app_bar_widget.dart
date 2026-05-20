import 'package:any_image_view/any_image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/widgets/loading_widget.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_cubit.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_state.dart';
import 'package:rehab/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:rehab/features/profile/presentation/cubit/profile/profile_state.dart';
import 'package:sizer/sizer.dart';

class OwnerSliverAppBarWidget extends HookWidget {
  const OwnerSliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      actions: [],
      pinned: true,
      floating: true,
      expandedHeight: 30.sh,
      toolbarHeight: 30.sh,
      shape: RoundedRectangleBorder(
        borderRadius: .only(
          bottomRight: .circular(30),
          bottomLeft: .circular(30),
        ),
      ),
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
          ),

          Positioned(
            top: 70,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: BlocBuilder<ProfileCubit, ProfileState>(
                          builder: (context, state) {
                            if (state is ProfileLoadingState) {
                              return const Center(child: LoadingWidget());
                            }

                            if (state is ProfileSuccessState) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        50.sp,
                                      ),
                                      child: AnyImageView(
                                        imagePath:
                                            state.profile.imageUrl ??
                                            "https://placeholder.com/user.png",
                                        width: 30.sp,
                                        height: 30.sp,
                                        fit: BoxFit.cover,
                                        errorWidget: Icon(
                                          Icons.person,
                                          size: 30.sp,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Gap(5.sw),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${"hi".tr()} ${state.profile.name}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        "howAreYou".tr(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }

                            if (state is ProfileErrorState) {
                              return Center(
                                child: Text(
                                  'Error: ${state.message}',
                                  style: const TextStyle(color: Colors.red),
                                ),
                              );
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ],
                  ),
                  Gap(2.sh),
                  BlocBuilder<OwnerCubit, OwnerState>(
                    builder: (context, state) {
                      if (state is OwnerInitialState ||
                          state is OwnerLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is OwnerSuccessState) {
                        return Container(
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
                                    'مجموع الأرباح ',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: 20,
                                      color: Colors.white.withAlpha(200),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '${state.owner!.totalRevenue.toStringAsFixed(0)} ريال',
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      color: Colors.white,
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
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
