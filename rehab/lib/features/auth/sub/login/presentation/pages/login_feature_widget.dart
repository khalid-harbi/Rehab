import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/constants/app_enums.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/core/utils/validators.dart';
import 'package:rehab/features/auth/presentation/widgets/auth_widget.dart';
import 'package:rehab/features/auth/sub/forget_password/presentation/pages/forget_password_feature_widget.dart';
import 'package:rehab/features/auth/sub/login/presentation/cubit/login_cubit.dart';
import 'package:rehab/features/auth/sub/login/presentation/cubit/login_state.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginFeatureScreen extends HookWidget {
  const LoginFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final emailController = useTextEditingController(text: 'ka14x2@gmail.com');
    final passwordController = useTextEditingController(text: '12345678');
    final globalKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            context.hideLoading();
            switch (state) {
              case LoginLoadingState _:
                context.showLoading();

              case LoginSuccessState _:
                if (state.role == UserRole.owner) {
                context.go(Routes.owner);
                } else if (state.role == UserRole.user) {
                  context.go(Routes.home);
                }
              case LoginErrorState _:
                context.showSnackBar(state.message, isError: true);
              default:
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Form(
                key: globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(5.h),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "welcomeBack".tr(),
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "قم بتسجيل الدخول للمتابعة",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Gap(6.h),

                    TextFieldWidget(
                      label: "البريد الإلكتروني",
                      controller: emailController,
                      hint: "example@mail.com",
                      icon: Icons.email_outlined,
                      validator: Validators.validateRequired,
                    ),

                    Gap(2.h),
                    // todo : add visible and non visible beside the password
                    TextFieldWidget(
                      label: "كلمة المرور",
                      controller: passwordController,
                      hint: "••••••••",
                      icon: Icons.lock_outline,
                      isPassword: true,
                      validator: Validators.validateRequired,
                    ),

                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => const ForgetPasswordFeatureWidget(),
                        );
                      },
                      child: const Text(
                        "نسيت كلمة المرور ؟",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Gap(4.h),
                    // OtpFeatureWidget(email: emailController.text),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 60),
                        elevation: 8,
                        shadowColor: AppColors.primary.withAlpha(40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          cubit.getLoginMethod(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      child: const Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Gap(3.h),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text(
                    //       "ليس لديك حساب؟",
                    //       style: TextStyle(color: Colors.grey),
                    //     ),
                    //     TextButton(
                    //       onPressed: () => context.push(Routes.signUp),
                    //       child: const Text(
                    //         "سجل الان",
                    //         style: TextStyle(
                    //           color: AppColors.success,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
