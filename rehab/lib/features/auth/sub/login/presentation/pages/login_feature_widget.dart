import 'package:flutter/material.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
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
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
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
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "أو عبر",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),

                    Gap(2.h),
                    // نفاذ لم يُفعَّل بعد. كان الزر يبدو فعّالًا وonPressed فارغ،
                    // فتضغط المستخدمة ولا يحدث شيء فتظن التطبيق معطّلًا.
                    // الآن يظهر بوضوح أنه قريبًا، ويشرح البديل عند الضغط.
                    const Center(child: _NafathComingSoonButton()),
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

/// زر نفاذ — معطّل بصريًا مع وسم «قريبًا»، ويشرح البديل عند الضغط.
class _NafathComingSoonButton extends StatelessWidget {
  const _NafathComingSoonButton();

  static const Color _nafathTeal = Color(0xFF329691);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      button: true,
      enabled: false,
      label: '${'loginWithNafath'.tr()} — ${'comingSoon'.tr()}',
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: _nafathTeal,
          side: BorderSide(color: _nafathTeal.withAlpha(120)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spaceXl,
            vertical: AppDimensions.spaceMd,
          ),
        ),
        onPressed: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('nafathComingSoon'.tr())));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: 0.75,
              child: Image.asset(
                'assets/icons/nafath_icon.png',
                height: 28,
                color: _nafathTeal,
              ),
            ),

            const Gap(AppDimensions.spaceSm),

            Flexible(
              child: Text(
                'loginWithNafath'.tr(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Gap(AppDimensions.spaceSm),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: _nafathTeal.withAlpha(30),
                borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
              ),
              child: Text(
                'comingSoon'.tr(),
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: _nafathTeal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
