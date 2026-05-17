import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/user_details/presentation/cubit/user_details_cubit.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';

class UserDetailsFeatureScreen extends StatelessWidget {
  final UsersEntity? fetchedUser;
  const UserDetailsFeatureScreen({super.key, this.fetchedUser});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<UserDetailsCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: Column(children: [Text(fetchedUser!.id), Text(fetchedUser!.name)]),
    );
  }
}
