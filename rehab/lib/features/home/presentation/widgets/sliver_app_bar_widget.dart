import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/widgets/loading_widget.dart';
import 'package:rehab/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:rehab/features/profile/presentation/cubit/profile_state.dart';
import 'package:rehab/core/common/sub/search/presentation/cubit/search_cubit.dart';
import 'package:sizer/sizer.dart';

class SliverAppBarWidget extends HookWidget {
  const SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<SearchCubit>();
    // Timer? timer;
    // final controllerSearch = useTextEditingController();

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
      actions: [
        Align(
          alignment: .topEnd,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(60),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
      pinned: true,
      floating: true,
      expandedHeight: 24.sh,
      toolbarHeight: 10.sh,
      shape: RoundedRectangleBorder(
        borderRadius: .only(
          bottomRight: .circular(40),
          bottomLeft: .circular(40),
        ),
      ),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final isCollapsed = constraints.biggest.height <= 120;

          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40),
                  ),
                ),
              ),

              if (!isCollapsed)
                Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withAlpha(60),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                height: 9.sh,
                                width: 9.sh,

                                child: const Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                              ),

                              Gap(5.sw),

                              Expanded(
                                child: BlocProvider(
                                  create: (context) =>
                                      ProfileCubit(GetIt.I.get()),
                                  child: BlocBuilder<ProfileCubit, ProfileState>(
                                    builder: (context, state) {
                                      if (state is ProfileLoadingState) {
                                        return const Center(
                                          child: LoadingWidget(),
                                        );
                                      }

                                      if (state is ProfileSuccessState) {
                                        return Column(
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
                                        );
                                      }

                                      if (state is ProfileErrorState) {
                                        return Center(
                                          child: Text(
                                            'Error: ${state.message}',
                                            style: const TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                        );
                                      }

                                      return const SizedBox.shrink();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(2.sh),
                          SearchBar(controller: controllerSearch),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
