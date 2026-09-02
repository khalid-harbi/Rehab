import 'package:flutter/material.dart';

/// سطر سياسة في تفاصيل العقار.
///
/// كان `Text` عاريًا داخل `Row` بلا `Expanded`، فلا حدّ لعرضه: أي سياسة
/// تتجاوز سطرًا واحدًا تخرج عن الشاشة وتظهر أشرطة التجاوز الصفراء.
/// الآن يلتف النص على أسطر، والأيقونة تُحاذي أوّل سطر لا وسط الفقرة.
class PolicyItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const PolicyItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(icon, color: theme.colorScheme.primary, size: 20),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
