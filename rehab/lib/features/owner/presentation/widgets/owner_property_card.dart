import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/features/home/presentation/widgets/home_card.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_cubit.dart';
import 'package:rehab/features/owner/presentation/widgets/owner_property_actions.dart';

/// بطاقة عقار كما تراها المالكة.
///
/// جوهر الفكرة: هي **نفس** `HomeCard` التي تراها الباحثة عن سكن — نفس الصورة
/// والتدرّج والشارات والسعر — مضافًا إليها شريط تحكم أسفلها. فالمالكة ترى
/// إعلانها بعين المستخدمة أولًا، ثم تتصرّف فيه.
///
/// كان لدى المالكة كارد مختلف تمامًا (صورة مربعة 84 بكسل بجانب نص)، فتُدير
/// إعلانًا لا يشبه ما يُعرض فعلًا.
class OwnerPropertyCard extends StatelessWidget {
  const OwnerPropertyCard({super.key, required this.home});

  final HomeEntity home;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.screenPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // العقار المخفي يبهت — إشارة بصرية فورية قبل قراءة أي نص.
          Opacity(
            opacity: home.isAvailable ? 1 : 0.5,
            child: HomeCard(home: home, compact: true),
          ),

          _ControlBar(home: home),

          const Gap(AppDimensions.spaceSm),
        ],
      ),
    );
  }
}

/// شريط التحكم الملتصق أسفل الكارد: حالة الإعلان ومفتاح إظهاره.
class _ControlBar extends StatelessWidget {
  const _ControlBar({required this.home});

  final HomeEntity home;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    final color = home.isAvailable ? scheme.primary : AppColors.textSecondary;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceMd,
        vertical: AppDimensions.spaceXs,
      ),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: AppColors.border.withAlpha(120)),
        boxShadow: AppDimensions.shadowSoft,
      ),
      child: Row(
        children: [
          Icon(
            home.isAvailable
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            size: AppDimensions.iconMd,
            color: color,
          ),

          const Gap(AppDimensions.spaceSm),

          Expanded(
            child: Text(
              home.isAvailable
                  ? "availableForBooking".tr()
                  : "notAvailableForBooking".tr(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),

          // الإظهار/الإخفاء أكثر ما تفعله المالكة، فيبقى بنقرة واحدة.
          Switch(
            value: home.isAvailable,
            // مساحة اللمس الافتراضية للمفتاح تُضخّم ارتفاع الشريط بلا داع.
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: (_) => _toggle(context),
          ),

          // التعديل والمعاينة والحذف خلف خطوة واحدة — أقل تكرارًا وأعظم أثرًا.
          IconButton(
            onPressed: () => showOwnerPropertyActions(context, home),
            tooltip: 'manageListing'.tr(),
            visualDensity: VisualDensity.compact,
            icon: Icon(
              Icons.more_horiz_rounded,
              color: theme.textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }

  /// إخفاء عقار متاح يستحق تأكيدًا — الباحثات تفقده من النتائج فورًا.
  Future<void> _toggle(BuildContext context) async {
    final cubit = context.read<OwnerCubit>();

    if (home.isAvailable) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
          ),
          title: Text("hideListingTitle".tr()),
          content: Text("hideListingBody".tr()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: Text("cancel".tr()),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: Text("confirm".tr()),
            ),
          ],
        ),
      );

      if (confirmed != true) return;
    }

    cubit.togglePropertyAvailabilityMethod(home.id, home.isAvailable);
  }
}
