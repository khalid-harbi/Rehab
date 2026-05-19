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

class LoginFeatureScreen extends HookWidget {
  const LoginFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final emailController = useTextEditingController(text: 'ka14x2@gmail.com');
    // final emailController = useTextEditingController(
    //   text: 'usertest@gmail.com',
    // );
    // final emailController = useTextEditingController(text: 'otp@gmail.com');
    final passwordController = useTextEditingController(text: '12345678');
    final globalKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.primary,

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
                    Gap(4.h),
                    Text(
                      "welcomeBack".tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "قم بتسجيل الدخول للمتابعة",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),

                    Gap(1.h),

                    TextFieldWidget(
                      label: "البريد الإلكتروني",
                      controller: emailController,
                      hint: "example@mail.com",
                      icon: Icons.email_outlined,
                      validator: Validators.validateRequired,
                    ),

                    Gap(1.h),
                    TextFieldWidget(
                      label: "كلمة المرور",
                      controller: passwordController,
                      hint: "", //todo: no need
                      icon: Icons.lock_outline,
                      isPassword: true,
                      validator: Validators.validateRequired,
                    ),

                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
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
                            color: AppColors.background,

                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.background,
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
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Gap(2.h),

                    Row(
                      children: [
                        Expanded(child: Divider(thickness: 1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "أو عبر",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(child: Divider(thickness: 1)),
                      ],
                    ),

                    Gap(2.h),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF329691),
                          foregroundColor: Colors.white, // لون النص والأيقونة
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 75,
                            vertical: 8,
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/icons/nafath_icon.png',
                              height: 40,
                              color: Colors.white,
                            ),
                            Gap(2.sw),
                            const Text(
                              'تسجيل الدخول عبر ',
                              style: TextStyle(fontSize: 16, fontWeight: .bold),
                            ),
                          ],
                        ),
                      ),
                    ),
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

class SocialAuthButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;

  const SocialAuthButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      onPressed: onTap,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Gap(10),
          Text(
            label,
            style: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
