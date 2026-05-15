import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/features/auth/sub/otp/presentation/cubit/otp_cubit.dart';
import 'package:rehab/features/auth/sub/otp/presentation/cubit/otp_state.dart';

class LogInWithOtpFeatureScreen extends HookWidget {
  const LogInWithOtpFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LogInWithOtpCubit>();

    final emailController = useTextEditingController(
      text: "amasinaif@gmail.com",
    );
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocListener<LogInWithOtpCubit, LogInWithOtpState>(
              listener: (context, state) {
                // Always hide loading before handling new state
                context.hideLoading();
                switch (state) {
                  // Loading state
                  case LogInWithOtpLoadingState _:
                    context.showLoading();

                  // Success state
                  // case LogInWithOtpSuccessState _:
                  // Navigator.push(
                  //   context,
                  //   // MaterialPageRoute(
                  //   //   builder: (context) => OtpVerificationFeatureWidget(
                  //   //     email: emailController.text,
                  //   //   ),
                  //   // ),
                  // ); // Error state
                  case LogInWithOtpErrorState _:
                    context.showSnackBar(state.message, isError: true);
                }
              },
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(15),

                    // Email field
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "البريد الإلكتروني",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    Gap(20),

                    // Login button
                    ElevatedButton(
                      child: const Text("إرسال رمز التحقق"),
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        cubit.getLogInWithOtpMethod(
                          email: emailController.text,
                        );
                      },
                      
                    ),
                    Gap(20),
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
