import 'package:flutter/services.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';

/// الآب بار الموحّد لكل أقسام التطبيق — بنفس شكل هيدر الهوم:
/// خلفية أساسية بحواف سفلية دائرية ونص أبيض. العنوان وحده يتغيّر مع كل صفحة.
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  // ــــــ الشكل المشترك، يستخدمه هيدر الهوم أيضًا ــــــ

  static const double height = 64;

  static const RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(AppDimensions.radiusXl),
    ),
  );

  static const TextStyle titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.3,
  );

  @override
  Size get preferredSize => const Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      titleSpacing: AppDimensions.screenPadding,
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primary,
      surfaceTintColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      shape: shape,
      title: Text(title, style: titleStyle),
      actions: [...?actions, const Gap(AppDimensions.spaceSm)],
    );
  }
}
