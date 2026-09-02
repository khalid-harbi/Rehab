import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/core/utils/localization_helper.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_cubit.dart';

/// ورقة إجراءات العقار.
///
/// مبدأ التوزيع: الإجراء الأكثر تكرارًا (إظهار/إخفاء) يبقى بنقرة واحدة على
/// البطاقة نفسها، وما يقلّ تكراره أو يَعظُم أثره يسكن هنا خلف خطوة إضافية.
/// والحذف آخر عنصر، بلون الخطأ، مفصولًا بخط — فلا تصله الإبهام مصادفة.
Future<void> showOwnerPropertyActions(
  BuildContext context,
  HomeEntity home,
) async {
  final cubit = context.read<OwnerCubit>();
  final theme = Theme.of(context);

  await showModalBottomSheet<void>(
    context: context,
    backgroundColor: theme.colorScheme.surface,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDimensions.radiusXl),
      ),
    ),
    builder: (sheetContext) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // عنوان العقار يؤكّد للمالكة أي إعلان تتصرّف فيه — مهم حين تكون
          // البطاقات متشابهة.
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppDimensions.spaceXl,
              0,
              AppDimensions.spaceXl,
              AppDimensions.spaceMd,
            ),
            child: Text(
              titleForLocale(sheetContext, home.titleEn, home.titleAr),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          _ActionTile(
            icon: Icons.edit_outlined,
            label: 'editListing'.tr(),
            onTap: () async {
              Navigator.pop(sheetContext);

              // بلا انتظار العودة تبقى البطاقة على بياناتها قبل التعديل.
              await context.push(Routes.addAd, extra: home);
              await cubit.refresh();
            },
          ),

          _ActionTile(
            icon: Icons.visibility_outlined,
            label: 'previewAsSeeker'.tr(),
            onTap: () {
              Navigator.pop(sheetContext);
              context.push(Routes.homeDetails, extra: home);
            },
          ),

          const Divider(
            height: AppDimensions.spaceXl,
            indent: 20,
            endIndent: 20,
          ),

          _ActionTile(
            icon: Icons.delete_outline_rounded,
            label: 'deleteListing'.tr(),
            isDestructive: true,
            onTap: () async {
              Navigator.pop(sheetContext);

              final confirmed = await _confirmDelete(context, home);
              if (confirmed) cubit.deletePropertyMethod(home.id);
            },
          ),

          const Gap(AppDimensions.spaceSm),
        ],
      ),
    ),
  );
}

/// تأكيد الحذف — يذكر اسم العقار لا «هل أنت متأكدة؟» المجرّدة، ويقول
/// صراحةً أن الفعل لا رجعة فيه.
Future<bool> _confirmDelete(BuildContext context, HomeEntity home) async {
  final theme = Theme.of(context);

  final result = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
      ),
      title: Text('deleteListingTitle'.tr()),
      content: Text(
        'deleteListingBody'.tr(
          namedArgs: {
            'title': titleForLocale(context, home.titleEn, home.titleAr),
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext, false),
          child: Text('cancel'.tr()),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: theme.colorScheme.error,
          ),
          onPressed: () => Navigator.pop(dialogContext, true),
          child: Text('delete'.tr()),
        ),
      ],
    ),
  );

  return result ?? false;
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final color = isDestructive
        ? theme.colorScheme.error
        : theme.colorScheme.primary;

    return ListTile(
      leading: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: color.withAlpha(20),
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        ),
        child: Icon(icon, size: AppDimensions.iconLg, color: color),
      ),
      title: Text(
        label,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: isDestructive ? color : null,
        ),
      ),
      onTap: onTap,
    );
  }
}
