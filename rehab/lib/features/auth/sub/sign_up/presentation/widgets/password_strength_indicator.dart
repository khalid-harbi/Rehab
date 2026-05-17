import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/utils/validators.dart';

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
    final passwordText = useValueListenable(controller).text;
    final passwordStrength = Validators.passwordStrength(passwordText);

    if (passwordText.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        Gap(1.5.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: passwordStrength,
            backgroundColor: Colors.white24,
            valueColor: AlwaysStoppedAnimation<Color>(
              _getStrengthColor(passwordStrength),
            ),
            minHeight: 6,
          ),
        ),
      ],
    );
  }
}
