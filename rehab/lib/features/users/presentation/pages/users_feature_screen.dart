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

class UsersFeatureScreen extends HookWidget {
  const UsersFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ===================================================================
    final cubit = context.read<UsersCubit>();
    // ===================================================================
    return Scaffold(
      appBar: AppBar(
        title: Text("Matching".tr(), style: TextStyle(fontSize: 36)),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<UsersCubit, UsersState>(
          // ===================================================================
          listenWhen: (previous, current) =>
              current is UsersRoomCreatedState || current is UsersErrorState,
          // ===================================================================
          listener: (context, state) async {
            if (state is UsersRoomCreatedState) {
              await context.push(
                Routes.conversation,
                extra: state.room,
              );

              // Refresh users when coming back
              if (context.mounted) {
                await cubit.loadedUser();
              }
              // Refresh rooms
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
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: displayUsers.length,

                          itemBuilder: (context, index) {
                            final user = displayUsers[index];
                            return UsersWidget(user: user);
                          },
                        ),
                      ),
                    ],
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
