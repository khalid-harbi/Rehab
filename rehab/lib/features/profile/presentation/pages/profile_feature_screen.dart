import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/features/auth/sub/logout/presentation/pages/logout_feature_widget.dart';
import 'package:rehab/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:rehab/features/profile/presentation/cubit/profile_state.dart';
import 'package:rehab/features/profile/presentation/widgets/profile_widget.dart';
import 'package:sizer/sizer.dart';

class ProfileFeatureScreen extends StatelessWidget {
  const ProfileFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile".tr(), style: TextStyle(fontSize: 36)),
        centerTitle: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is ProfileLoadingState) {
                    context.showLoading();
                  } else {
                    context.hideLoading();
                  }

                  if (state is ProfileErrorState) {
                    context.showSnackBar(state.message, isError: true);
                  }
                },
                builder: (context, state) {
                  if (state is ProfileSuccessState) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child: CircleAvatar(
                              radius: 30.sp,
                              child: IconButton(
                                onPressed: () {
                                  context.go(Routes.profile);
                                },
                                icon: Icon(Icons.person, size: 30.sp),
                              ),
                            ),
                          ),

                          Text(
                            state.profile.name,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // Text(
                          //   "عضو منذ: ${Formatters.formatFullDate(state.profile.createdAt)}",
                          //   style: const TextStyle(
                          //     color: AppColors.textSecondary,
                          //     fontSize: 14,
                          //   ),
                          // ),
                          ProfileWidget(
                            icon: Icon(Icons.favorite),
                            title: "favorites",
                          ),
                          ProfileWidget(
                            icon: Icon(Icons.attach_money),
                            title: "bookings",
                          ),
                          ProfileWidget(
                            icon: Icon(Icons.interests_outlined),
                            title: "lifestyle",
                            onTap: () => context.push(Routes.lifestyle),
                          ),

                          ProfileWidget(
                            icon: Icon(Icons.dark_mode_outlined),
                            title: "darkMode",
                          ),
                          ProfileWidget(
                            icon: Icon(Icons.language),
                            title: "language",
                          ),

                          ProfileWidget(
                            icon: Icon(Icons.settings),
                            title: "settings",
                          ),
                          Gap(2.sh),
                          ProfileWidget(
                            icon: Icon(Icons.support_agent_outlined),
                            title: "help&support",
                          ),

                          LogoutFeatureWidget(),
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
