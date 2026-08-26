import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/extensions/user_list_extension.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/core/widgets/loading_widget.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:rehab/features/users/presentation/cubit/users_cubit.dart';
import 'package:rehab/features/users/presentation/cubit/users_state.dart';
import 'package:rehab/features/users/presentation/widgets/users_widget.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/widgets/app_top_bar.dart';
import 'package:rehab/core/constants/app_colors.dart';

class UsersFeatureScreen extends HookWidget {
  const UsersFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ===================================================================
    final cubit = context.read<UsersCubit>();
    // ===================================================================
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppTopBar(title: "matching".tr()),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.screenPadding,
        ),
        child: BlocListener<UsersCubit, UsersState>(
          // ===================================================================
          listenWhen: (previous, current) =>
              current is UsersRoomCreatedState || current is UsersErrorState,

          // ===================================================================
          listener: (context, state) async {
            if (state is UsersRoomCreatedState) {
              await context.push(Routes.conversation, extra: state.room);

              await cubit.loadedUser();

              if (!context.mounted) return;

              context.read<ChatCubit>().fetchRooms();
            } else if (state is UsersErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("حدث خطأ: ${state.message}")),
              );
            }
          },
          child: BlocBuilder<UsersCubit, UsersState>(
            builder: (context, state) {
              switch (state) {
                case UsersInitialState _:
                  return const LoadingWidget();

                case UsersLoadingState _:
                  return const LoadingWidget();

                case UsersSuccessState _:
                  final displayUsers = state.users.filteredAndSortedMatches;

                  // ==========================================
                  // Check if the list is empty here
                  // ==========================================
                  if (displayUsers.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person_off_outlined,
                            size: 44,
                            color: AppColors.textSecondary.withAlpha(120),
                          ),
                          const SizedBox(height: AppDimensions.spaceMd),
                          Text(
                            "noMatchesYet".tr(),
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.only(
                      top: AppDimensions.spaceSm,
                      bottom: AppDimensions.spaceXl,
                    ),
                    itemCount: displayUsers.length,
                    itemBuilder: (context, index) =>
                        UsersWidget(user: displayUsers[index]),
                  );

                case UsersErrorState _:
                  return Center(child: Text(state.message));

                case UsersRoomCreatedState _:
                  return const LoadingWidget();

                default:
                  return const LoadingWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
