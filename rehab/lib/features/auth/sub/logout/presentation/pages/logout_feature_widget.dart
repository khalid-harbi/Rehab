import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/features/auth/sub/logout/presentation/cubit/logout_cubit.dart';
import 'package:rehab/features/auth/sub/logout/presentation/cubit/logout_state.dart';

class LogoutFeatureWidget extends StatelessWidget {
  const LogoutFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<LogoutCubit>();

          return Column(
            children: [
              BlocListener<LogoutCubit, LogoutState>(
                listener: (context, state) {
                  context.hideLoading();
                  switch (state) {
                    case LogoutLoadingState _:
                      context.showLoading();

                    case LogoutSuccessState _:
                      context.go(Routes.auth);

                    case LogoutErrorState _:
                      context.showSnackBar(state.message, isError: true);

                    default:
                  }
                },

                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.logout_sharp, color: Colors.red),
                    title: Text("logout".tr()),
                    onTap: () => context.showLogoutDialog(context, cubit),
                    tileColor: Theme.of(context).cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
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
