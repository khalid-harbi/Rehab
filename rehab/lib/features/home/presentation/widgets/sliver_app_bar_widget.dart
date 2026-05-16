import 'dart:async';
import 'package:any_image_view/any_image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:rehab/core/common/sub/search/presentation/cubit/search_state.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/widgets/loading_widget.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';
import 'package:rehab/features/home/presentation/widgets/filter_widget.dart';
import 'package:rehab/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:rehab/features/profile/presentation/cubit/profile_state.dart';
import 'package:rehab/core/common/sub/search/presentation/cubit/search_cubit.dart';
import 'package:sizer/sizer.dart';

class SliverAppBarWidget extends HookWidget {
  const SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // controllerSearch.addListener(() async {
    //   if (timer != null) {
    //     timer!.cancel();
    //   }

    //   timer = Timer.periodic(Duration(milliseconds: 500), (timer) async {
    //     if (timer.tick == 1) {
    //       cubit.getSearchMethod(title: controllerSearch.text);
    //       timer.cancel();
    //     }
    //   });
    // });
    final cubit = context.read<SearchCubit>();
    final controllerSearch = useTextEditingController();

    Timer? timer;

    useEffect(() {
      cubit.getSearchMethod(title: "");

      void listener() {
        timer?.cancel();

        timer = Timer(const Duration(milliseconds: 500), () {
          cubit.getSearchMethod(title: controllerSearch.text);
        });
      }

      controllerSearch.addListener(listener);

      return () {
        timer?.cancel();
        controllerSearch.removeListener(listener);
      };
    }, []);
    return SliverAppBar(
      actions: [],
      pinned: true,
      floating: true,
      expandedHeight: 22.sh,
      toolbarHeight: 22.sh,
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
                  Row(
                    children: [
                      Expanded(
                        child: SearchBar(
                          controller: controllerSearch,
                          leading: const Icon(Icons.search),
                          constraints: const BoxConstraints(
                            maxHeight: 45,
                            minHeight: 40,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // ======================================================
                          final searchCubit = context.read<SearchCubit>();
                          List<HomeEntity> currentHomes = [];
                          if (searchCubit.state is SearchSuccessState) {
                            currentHomes =
                                (searchCubit.state as SearchSuccessState).homes;
                          }
                          // ======================================================

                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                            builder: (context) {
                              return BlocProvider.value(
                                value: searchCubit,
                                child: FilterWidget(homes: currentHomes),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.tune_rounded, color: Colors.white),
                      ),
                    ],
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
