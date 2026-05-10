import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/features/auth/sub/otp/presentation/cubit/otp_cubit.dart';
import 'package:rehab/features/auth/sub/otp/presentation/cubit/otp_state.dart';

class OtpFeatureWidget extends StatelessWidget {
  final String email;
  const OtpFeatureWidget({super.key, required this.email});
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    return BlocProvider(
      create: (context) => OtpCubit(GetIt.I.get()),
      child: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state is OtpSuccessState) {
            context.go(Routes.home);
          } else if (state is OtpErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("أدخل رمز التحقق المرسل لإيميلك"),
              const SizedBox(height: 20),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                onCompleted: (pin) {
                  context.read<OtpCubit>().verifyOtpMethod(
                    email: email,
                    token: pin,
                  );
                },
              ),
              if (state is OtpLoadingState) CircularProgressIndicator(),
            ],
          );
        },
      ),
    );
  }
}
