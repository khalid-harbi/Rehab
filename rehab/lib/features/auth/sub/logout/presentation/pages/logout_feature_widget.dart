import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/features/auth/sub/logout/presentation/cubit/logout_cubit.dart';
import 'package:rehab/features/auth/sub/logout/presentation/cubit/logout_state.dart';
import 'package:sizer/sizer.dart';

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
                child: ElevatedButton(
                  onPressed: () => context.showLogoutDialog(context, cubit),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFEBEE),
                    foregroundColor: const Color(0xFFD32F2F),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Color(0xFFFFCDD2),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.logout_rounded, color: Colors.red, size: 30),
                      Gap(5.sw),
                      const Text(
                        "تسجيل الخروج",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
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
