import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/features/auth/sub/otp/presentation/cubit/otp_cubit.dart';
import 'package:rehab/features/auth/sub/otp/presentation/cubit/otp_state.dart';
import 'package:sizer/sizer.dart';

class OtpFeatureScreen extends HookWidget {
  final String email;

  const OtpFeatureScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OtpCubit>();

    final controllers = List.generate(6, (_) => useTextEditingController());

    final focusNodes = List.generate(6, (_) => useFocusNode());

    String otpCode() {
      return controllers.map((controller) => controller.text).join();
    }

    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpLoadingState) {
          context.showLoading();
        } else {
          context.hideLoading();
        }

        if (state is OtpSuccessState) {
          Navigator.pop(context);
          context.go(Routes.home);
        }

        if (state is OtpResendSuccessState) {
          context.showSnackBar('codeSentAgain'.tr(), isError: false);
        }

        if (state is OtpErrorState) {
          context.showSnackBar(state.message, isError: true);
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 85.sw,
              height: 58.h,
              padding: EdgeInsets.all(22),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // GestureDetector(
                  //   onTap: () => context.go(Routes.auth),
                  //   child: Container(
                  //     height: 42,
                  //     width: 42,
                  //     decoration: BoxDecoration(
                  //       color: AppColors.surface.withValues(alpha: 0.35),
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: Icon(
                  //       Icons.arrow_back_ios_new_rounded,
                  //       color: AppColors.textSecondary,
                  //       size: 18,
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: AppColors.surface.withValues(alpha: 0.35),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.textSecondary,
                        size: 18,
                      ),
                    ),
                  ),
                  Gap(10),
                  Center(
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: AppColors.surface.withValues(alpha: 0.35),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.mark_email_read_rounded,
                        color: AppColors.textSecondary,
                        size: 40,
                      ),
                    ),
                  ),
                  Gap(24),
                  Text(
                    'Verification Code',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(10),
                  Text(
                    'Enter the 6 digit code sent to your email to verify your account',
                    style: TextStyle(
                      color: AppColors.textSecondary.withValues(alpha: 0.8),
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                  Gap(28),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 10.w,
                        height: 60,
                        child: TextField(
                          controller: controllers[index],
                          focusNode: focusNodes[index],
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(1),
                          ],
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: AppColors.surface.withValues(
                              alpha: 0.35,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: AppColors.surface.withValues(alpha: 0.8),
                                width: 1.4,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              index == 5
                                  ? null
                                  : focusNodes[index + 1].requestFocus();
                            } else {
                              index == 0
                                  ? null
                                  : focusNodes[index - 1].requestFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),

                  Gap(26),

                  BlocBuilder<OtpCubit, OtpState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          final code = otpCode();

                          if (code.length == 6) {
                            cubit.verifyOtpMethod(email: email, token: code);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                        child: state is OtpLoadingState
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Verify code'),
                      );
                    },
                  ),

                  Gap(18),

                  Center(
                    child: Text(
                      'Did not receive the code?',
                      style: TextStyle(
                        color: AppColors.textSecondary.withValues(alpha: 0.8),
                        fontSize: 14,
                      ),
                    ),
                  ),

                  Gap(8),

                  Center(
                    child: GestureDetector(
                      // كان الاستدعاء معلّقًا لأن الدالة كانت غير قابلة
                      // للوصول — الزر كان يبدو فعّالًا ولا يفعل شيئًا.
                      onTap: () => cubit.resendOtpMethod(email: email),
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
