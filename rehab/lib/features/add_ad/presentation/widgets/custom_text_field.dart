import 'package:flutter/material.dart';
import 'package:rehab/core/constants/app_dimensions.dart';

/// حقل إدخال موحّد لنموذج إضافة الإعلان.
///
/// يعتمد على `inputDecorationTheme` في الثيم بدل أن يفرض ألوانه، فيتبدّل
/// مع الوضع الداكن تلقائيًا. ولا يفرض محاذاة يمين حتى لا ينكسر في الإنجليزية.
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.maxLines = 1,
    this.controller,
    this.keyboardType,
    this.validator,
    this.isRequired = false,
    this.textInputAction,
  });

  final String label;
  final String hint;
  final int maxLines;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  /// يضيف نجمة إلى التسمية ويمنع تخطّي الحقل عند التحقق.
  final bool isRequired;

  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            children: isRequired
                ? [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                  ]
                : null,
          ),
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),

        const SizedBox(height: AppDimensions.spaceSm),

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          textInputAction: textInputAction,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }
}
