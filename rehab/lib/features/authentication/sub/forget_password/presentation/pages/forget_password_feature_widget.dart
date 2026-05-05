import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/features/authentication/sub/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:rehab/features/authentication/sub/forget_password/presentation/cubit/forget_password_state.dart';

class ForgetPasswordFeatureWidget extends HookWidget {
  const ForgetPasswordFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();

    return BlocProvider(
      create: (context) => ForgetPasswordCubit(GetIt.I.get()),
      child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordLoading) {
            context.showLoading();
          } else {
            context.hideLoading();
          }

          if (state is ForgetPasswordSuccess) {
            context.showSnackBar(
              "تم إرسال رابط استعادة كلمة المرور إلى بريدك الإلكتروني 📩",
            );
            context.pop();
          }

          if (state is ForgetPasswordError) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.lock_reset_rounded,
                  size: 80,
                  color: AppColors.success,
                ),
                const SizedBox(height: 24),

                const Text(
                  "نسيت كلمة المرور؟",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  "أدخل بريدك الإلكتروني لإرسال رابط تعيين كلمة المرور الجديدة.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "البريد الإلكتروني",
                    hintText: "example@mail.com",
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isNotEmpty) {
                      context
                          .read<ForgetPasswordCubit>()
                          .sendResetPasswordEmail(emailController.text);
                    } else {
                      context.showSnackBar(
                        "يرجى إدخال البريد الإلكتروني أولاً",
                        isError: true,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: AppColors.success,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "إرسال رابط الاستعادة",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 16),

                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text(
                    "العودة لتسجيل الدخول",
                    style: TextStyle(
                      fontWeight: .bold,
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
