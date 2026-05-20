import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rehab/core/constants/app_colors.dart';

class TextFieldWidget extends HookWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final String? Function(String?)? validator;

  const TextFieldWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(isPassword);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // todo: add keyboard type
        TextFormField(
          controller: controller,
          obscureText: obscureText.value,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.primary, fontSize: 14),
            prefixIcon: Icon(icon, color: AppColors.primary),

            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      obscureText.value = !obscureText.value;
                    },
                  )
                : null,

            // filled: true,
            fillColor: Colors.white54,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: AppColors.secondary,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
