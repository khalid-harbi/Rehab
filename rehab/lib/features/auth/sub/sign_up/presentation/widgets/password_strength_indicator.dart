import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:rehab/core/utils/validators.dart';
import 'package:sizer/sizer.dart';

class PasswordStrengthIndicator extends HookWidget {
  final TextEditingController controller;

  const PasswordStrengthIndicator({required this.controller, super.key});

  Color _getStrengthColor(double strength) {
    if (strength <= 0.34) return Colors.red;
    if (strength <= 0.67) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final passwordRaw = useValueListenable(controller).text;
    final bool isEmpty = passwordRaw.isEmpty;
    final strength = Validators.passwordStrength(passwordRaw);
    if (isEmpty) return const SizedBox.shrink();
    final bool hasLength = passwordRaw.length >= 12;
    final bool hasUppercase = RegExp(r'[A-Z]').hasMatch(passwordRaw);
    final bool hasLowercase = RegExp(r'[a-z]').hasMatch(passwordRaw);
    final bool hasNumber = RegExp(r'\d').hasMatch(passwordRaw);
    final bool hasSpecial = RegExp(
      r'[!@#$%^&*()_\-+=\[{\]};:<>|./?]',
    ).hasMatch(passwordRaw);

    final bool hasSpace = passwordRaw.contains(' ');
    final bool hasRepeated = RegExp(r'(.)\1{3,}').hasMatch(passwordRaw);

    final bool isWeakWord = [
      'password',
      '12345678',
      'qwerty',
      'admin',
      'welcome',
    ].any((weak) => passwordRaw.toLowerCase().contains(weak));

    final bool isPasswordWeakOrCommon = isWeakWord || (passwordRaw.length < 6);

    final bool isSecurityPassed =
        !hasSpace && !hasRepeated && !isPasswordWeakOrCommon;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(1.5.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: isEmpty ? 0.0 : strength,
            backgroundColor: Colors.grey.withAlpha(20),
            valueColor: AlwaysStoppedAnimation<Color>(
              _getStrengthColor(isEmpty ? 0.0 : strength),
            ),
            minHeight: 6,
          ),
        ),
        Gap(2.h),

        Text(
          "متطلبات كلمة المرور:",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        Gap(1.h),

        _buildRequirementItem("على الأقل 12 حرف", hasLength, isEmpty),
        _buildRequirementItem(
          "يحتوي على حرف كبير (A-Z)",
          hasUppercase,
          isEmpty,
        ),
        _buildRequirementItem(
          "يحتوي على حرف صغير (a-z)",
          hasLowercase,
          isEmpty,
        ),
        _buildRequirementItem("يحتوي على رقم (0-9)", hasNumber, isEmpty),
        _buildRequirementItem(
          "يحتوي على رمز خاص (#\$%@!)",
          hasSpecial,
          isEmpty,
        ),

        _buildRequirementItem("لا تحتوي على مسافات", !hasSpace, isEmpty),
        _buildRequirementItem(
          "لا تحتوي على أحرف مكررة متتالية بكثرة",
          !hasRepeated,
          isEmpty,
        ),

        _buildRequirementItem(
          "ليست كلمة مرور شائعة أو ضعيفة",
          isSecurityPassed,
          isEmpty,
        ),
      ],
    );
  }

  Widget _buildRequirementItem(String text, bool isCorrect, bool isEmpty) {
    final Color color = isEmpty
        ? Colors.grey
        : (isCorrect ? Colors.green : Colors.red);

    final IconData icon = isEmpty
        ? Icons.radio_button_unchecked
        : (isCorrect ? Icons.check_circle : Icons.cancel);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(
        children: [
          Icon(icon, color: color, size: 18.sp),
          Gap(2.w),
          Text(
            text,
            style: TextStyle(color: color, fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}
