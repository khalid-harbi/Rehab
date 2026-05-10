import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/core/utils/validators.dart';
import 'package:rehab/features/auth/presentation/widgets/auth_widget.dart';
import 'package:rehab/features/auth/sub/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:rehab/features/auth/sub/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:sizer/sizer.dart';

class SignUpFeatureScreen extends HookWidget {
  const SignUpFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final usernameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final globalKey = GlobalKey<FormState>();

    return Scaffold(
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          context.hideLoading();
          switch (state) {
            case SignUpLoadingState _:
              context.showLoading();

            case SignUpSuccessState _:
              context.go(Routes.home);

            case SignUpErrorState _:
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
                  Gap(2.h),
                  const Text(
                    "إنشاء حساب",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    " انشئ حسابك وانضم إلينا",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Gap(5.h),
                  TextFieldWidget(
                    label: "اسم المستخدم",
                    controller: usernameController,
                    hint: "أدخل اسمك",
                    icon: Icons.person_outline,
                    validator: Validators.validateRequired,
                  ),

                  Gap(2.h),
                  TextFieldWidget(
                    label: "البريد الإلكتروني",
                    controller: emailController,
                    hint: "example@mail.com",
                    icon: Icons.email_outlined,
                    validator: Validators.validateEmail,
                  ),

                  Gap(2.h),
                  TextFieldWidget(
                    label: "كلمة المرور",
                    controller: passwordController,
                    hint: "••••••••",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    validator: Validators.validatePassword,
                  ),

                  Gap(6.h),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 60),
                      elevation: 8,
                      shadowColor: AppColors.success.withAlpha(40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        cubit.getSignUpMethod(
                          username: usernameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    child: const Text(
                      "أنشئ حسابك",
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
                  //       "لديك حساب بالفعل؟ ",
                  //       style: TextStyle(color: Colors.grey),
                  //     ),
                  //     TextButton(
                  //       onPressed: () => context.push(Routes.login),
                  //       child: const Text(
                  //         "تسجيل الدخول",
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
    );
  }
}
