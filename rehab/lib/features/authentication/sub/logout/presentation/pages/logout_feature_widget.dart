import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rehab/features/authentication/sub/logout/presentation/cubit/logout_cubit.dart';


class LogoutFeatureWidget extends StatelessWidget {
  const LogoutFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final _ = context.read<LogoutCubit>();
          return Column(children: [
              
              ],
            );
        },
      ),
    );
  }
}
