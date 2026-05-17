// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:gap/gap.dart';
// import 'package:rehab/core/constants/app_colors.dart';
// import 'package:rehab/core/extensions/context_extensions.dart';
// import 'package:rehab/core/utils/validators.dart';
// import 'package:rehab/features/auth/presentation/widgets/auth_widget.dart';
// import 'package:rehab/features/auth/sub/sign_up/presentation/cubit/sign_up_cubit.dart';
// import 'package:rehab/features/auth/sub/sign_up/presentation/cubit/sign_up_state.dart';
// import 'package:sizer/sizer.dart';

// class SignUpFeatureScreen extends HookWidget {
//   const SignUpFeatureScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<SignUpCubit>();
//     final usernameController = useTextEditingController();
//     final emailController = useTextEditingController();
//     final passwordController = useTextEditingController();
//     final globalKey = GlobalKey<FormState>();

//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       body: BlocListener<SignUpCubit, SignUpState>(
//         listener: (context, state) {
//           context.hideLoading();
//           switch (state) {
//             case SignUpLoadingState _:
//               context.showLoading();

//             case SignUpSuccessState _:
//               openOtpBottomSheet(context, emailController.text);
//             // context.go(Routes.home);

//             case SignUpErrorState _:
//               context.showSnackBar(state.message, isError: true);

//             default:
//           }
//         },
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.sp),
//             child: Form(
//               key: globalKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Gap(4.h),
//                   Text(
//                     "إنشاء حساب",
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const Text(
//                     " انشئ حسابك وانضم إلينا",
//                     style: TextStyle(fontSize: 20, color: Colors.white),
//                   ),
//                   Gap(5.h),
//                   TextFieldWidget(
//                     label: "اسم المستخدم",
//                     controller: usernameController,
//                     hint: "أدخل اسمك",
//                     icon: Icons.person_outline,
//                     validator: Validators.validateRequired,
//                   ),

//                   Gap(2.h),
//                   TextFieldWidget(
//                     label: "البريد الإلكتروني",
//                     controller: emailController,
//                     hint: "example@mail.com",
//                     icon: Icons.email_outlined,
//                     validator: Validators.validateEmail,
//                   ),
//                   Gap(2.h),
//                   TextFieldWidget(
//                     label: "كلمة المرور",
//                     controller: passwordController,
//                     hint: "",

//                     icon: Icons.lock_outline,
//                     isPassword: true,
//                     validator: Validators.validatePassword,
//                   ),
//                   Gap(2.h),
//                   LinearProgressIndicator(
//                     value: Validators.passwordStrength(passwordController.text),
//                   ),

//                   Gap(6.h),

//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.background,
//                       foregroundColor: Colors.white,
//                       minimumSize: Size(double.infinity, 60),
//                       elevation: 8,
//                       shadowColor: AppColors.primary.withAlpha(40),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                     ),
//                     onPressed: () {
//                       if (globalKey.currentState!.validate()) {
//                         cubit.getSignUpMethod(
//                           name: usernameController.text,
//                           email: emailController.text,
//                           password: passwordController.text,
//                         );
//                       }
//                     },
//                     child: const Text(
//                       "أنشئ حسابك",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Gap(3.h),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PasswordInputScreen extends StatelessWidget {
//   PasswordInputScreen({super.key});

//   // تعريف الكنترولر في StatelessWidget عادي جداً
//   final _passwordController = TextEditingController();

//   // دالة ذكية لتحديد لون المؤشر بناءً على القيمة
//   Color _getStrengthColor(double strength) {
//     if (strength <= 0.34) return Colors.red;    // ضعيف
//     if (strength <= 0.67) return Colors.orange; // متوسط
//     return Colors.green;                        // قوي
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // 1. حقل إدخال كلمة المرور (لا يحتاج onChanged الآن)
//             TextFormField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//               ),
//               validator: Validators.validatePassword,
//             ),
            
//             const SizedBox(height: 15),

//             // 2. مراقب التغييرات الذكي (يستمع للكنترولر مباشرة)
//             ValueListenableBuilder<TextEditingValue>(
//               valueListenable: _passwordController,
//               builder: (context, value, child) {
//                 // حساب القوة بناءً على النص الحالي في الكنترولر
//                 final strength = Validators.passwordStrength(value.text);

//                 // يمكنك إخفاء المؤشر تماماً إذا كان الحقل فارغاً
//                 if (value.text.isEmpty) return const SizedBox.shrink();

//                 return ClipRRect(
//                   borderRadius: BorderRadius.circular(4),
//                   child: LinearProgressIndicator(
//                     value: strength,
//                     backgroundColor: Colors.grey[200],
//                     valueColor: AlwaysStoppedAnimation<Color>(
//                       _getStrengthColor(strength),
//                     ),
//                     minHeight: 6,
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; // سنستخدم ميزات الهوكس هنا
import 'package:gap/gap.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/utils/validators.dart';
import 'package:rehab/features/auth/presentation/widgets/auth_widget.dart';
import 'package:rehab/features/auth/sub/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:rehab/features/auth/sub/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:sizer/sizer.dart';

class SignUpFeatureScreen extends HookWidget {
  const SignUpFeatureScreen({super.key});

  // دالة مساعدة لتحديد لون المؤشر بناءً على القوة
  Color _getStrengthColor(double strength) {
    if (strength <= 0.34) return Colors.red;    // ضعيف
    if (strength <= 0.67) return Colors.orange; // متوسط
    return Colors.green;                        // قوي
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final usernameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final globalKey = GlobalKey<FormState>();

    // 🟢 السطر السحري: هذا الهوك يجعل الشاشة تستمع لأي حرف يكتب في الباسوورد فوراً
    final passwordText = useValueListenable(passwordController).text;
    
    // حساب القوة بناءً على النص المتغير
    final passwordStrength = Validators.passwordStrength(passwordText);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          context.hideLoading();
          switch (state) {
            case SignUpLoadingState _:
              context.showLoading();
            case SignUpSuccessState _:
              openOtpBottomSheet(context, emailController.text);
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
                  Gap(4.h),
                  const Text(
                    "إنشاء حساب",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    " انشئ حسابك وانضم إلينا",
                    style: TextStyle(fontSize: 20, color: Colors.white),
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
                    hint: "",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    validator: Validators.validatePassword,
                  ),
                  
                  // 🟢 التعديل هنا: إضافة المؤشر المحمي والمزين
                  if (passwordText.isNotEmpty) ...[
                    Gap(1.5.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: passwordStrength,
                        backgroundColor: Colors.white24, // خلفية شفافة تليق باللون الرئيسي لشاشتك
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _getStrengthColor(passwordStrength),
                        ),
                        minHeight: 6,
                      ),
                    ),
                  ],

                  Gap(6.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.background,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 60),
                      elevation: 8,
                      shadowColor: AppColors.primary.withAlpha(40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        cubit.getSignUpMethod(
                          name: usernameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    child: const Text(
                      "أنشئ حسابك",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Gap(3.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}