import 'dart:ui' as ui;

import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';

/// عنوان قسم في صفحة الهوم مع زر «عرض المزيد».
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.icon,
    this.onShowMore,
  });

  final String title;
  final IconData icon;

  /// إن كانت null يُخفى زر «عرض المزيد» (لا يوجد مزيد لعرضه).
  final VoidCallback? onShowMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.screenPadding,
        AppDimensions.spaceXl,
        AppDimensions.spaceSm,
        AppDimensions.spaceMd,
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: AppDimensions.iconMd),

          const Gap(AppDimensions.spaceSm),

          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                letterSpacing: -0.2,
              ),
            ),
          ),

          if (onShowMore != null)
            TextButton(
              onPressed: onShowMore,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spaceSm,
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "showMore".tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const Gap(2),
                  Icon(
                    // السهم يتبع اتجاه اللغة
                    Directionality.of(context) == ui.TextDirection.rtl
                        ? Icons.chevron_right_rounded
                        : Icons.chevron_left_rounded,
                    size: AppDimensions.iconMd,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
