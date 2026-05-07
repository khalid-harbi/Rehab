import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rehab/core/widgets/loading_widget.dart';
import 'package:rehab/features/users/presentation/cubit/users_cubit.dart';
import 'package:rehab/features/users/presentation/cubit/users_state.dart';

class UsersFeatureScreen extends HookWidget {
  const UsersFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users Feature Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: BlocBuilder<UsersCubit, UsersState>(
            builder: (context, state) {
              switch (state) {
                case UsersInitialState _:
                  return LoadingWidget();
                case UsersSuccessState _:
                  return Column(
                    children: [
                      ListView.builder(
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.person),
                            title: Text(state.users[index].name),
                            subtitle: Text(
                              state.users[index].createdAt.toString(),
                            ),
                          );
                        },
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        primary: false,
                      ),
                    ],
                  );
                case UsersErrorState _:
                  return Center(child: Text(state.message));
                default:
                  return SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
