import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/core/widgets/loading_widget.dart';
import 'package:rehab/features/users/presentation/cubit/users_cubit.dart';
import 'package:rehab/features/users/presentation/cubit/users_state.dart';
import 'package:rehab/features/users/presentation/widgets/users_widget.dart';

class UsersFeatureScreen extends HookWidget {
  const UsersFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Matching')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<UsersCubit, UsersState>(
          // ===================================================================
          listenWhen: (previous, current) =>
              current is UsersRoomCreatedState || current is UsersErrorState,
          // ===================================================================
          listener: (context, state) async {
            if (state is UsersRoomCreatedState) {
              await context.push(Routes.conversation, extra: state.room);
              if (context.mounted) {
                context.pop(true);
              }
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

                case UsersSuccessState _:
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.users.length,

                          itemBuilder: (context, index) {
                            return UsersWidget(
                              id: (state.users[index].id),
                              name: (state.users[index].name),
                              cratedAt: (state.users[index].createdAt),
                            );
                          },
                        ),
                      ),
                    ],
                  );

                case UsersErrorState _:
                  return Center(child: Text(state.message));

                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
