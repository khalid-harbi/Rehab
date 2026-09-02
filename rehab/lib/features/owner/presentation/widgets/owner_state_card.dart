import 'dart:ui' as ui;

import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';

/// بطاقة رقم صغيرة في لوحة المالك.
///
/// كانت البطاقات كبيرة بحجم بطاقة العقار، فثلاثة أرقام تملأ الشاشة الأولى
/// كلها. صارت صفًّا واحدًا مضغوطًا: الأرقام معلومة مساندة، لا بطلة الشاشة.
/// السطح والحواف والظل من نفس توكنز كاردات صفحة المستخدمة.
class OwnerStatCard extends StatelessWidget {
  const OwnerStatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.onTap,
  });

  final String label;
  final String value;
  final IconData icon;

  /// عند تمريره تصير البطاقة قابلة للضغط فعلًا — لا سهمًا بلا وظيفة.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isRtl = Directionality.of(context) == ui.TextDirection.rtl;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        boxShadow: AppDimensions.shadowSoft,
      ),
      child: Material(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
              border: Border.all(color: AppColors.border.withAlpha(120)),
            ),
            padding: const EdgeInsets.all(AppDimensions.spaceMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: scheme.primary.withAlpha(20),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusSm,
                        ),
                      ),
                      child: Icon(
                        icon,
                        size: AppDimensions.iconMd,
                        color: scheme.primary,
                      ),
                    ),

                    const Spacer(),

                    if (onTap != null)
                      Icon(
                        // السهم يتبع اتجاه اللغة — كان ثابتًا فيشير للخارج
                        // في الواجهة العربية.
                        isRtl
                            ? Icons.chevron_right_rounded
                            : Icons.chevron_left_rounded,
                        size: AppDimensions.iconMd,
                        color: scheme.primary.withAlpha(140),
                      ),
                  ],
                ),

                const Gap(AppDimensions.spaceMd),

                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    value,
                    maxLines: 1,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),

                const Gap(2),

                Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                    height: 1.35,
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
