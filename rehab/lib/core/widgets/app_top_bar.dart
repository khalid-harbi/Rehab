import 'package:flutter/services.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';

/// الآب بار الموحّد لكل أقسام التطبيق — بنفس شكل هيدر الهوم:
/// خلفية أساسية بحواف سفلية دائرية ونص أبيض. العنوان وحده يتغيّر مع كل صفحة.
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    super.key,
    required this.title,
    this.actions,
    this.showBack = false,
  });

  final String title;
  final List<Widget>? actions;

  /// زر الرجوع.
  ///
  /// شاشات التبويبات جذور بلا رجوع، فالافتراضي إخفاؤه. أما الشاشات المدفوعة
  /// بـ `push` — «عقاراتي» مثلًا — فبدونه تُحبس المستخدمة داخل الشاشة، إذ
  /// أن `automaticallyImplyLeading: false` يمنع الزر التلقائي.
  final bool showBack;

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
      leading: showBack ? const _BackButton() : null,
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

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    // في العربية يتقدّم القارئ يسارًا، فسهم الرجوع يشير يمينًا.
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return IconButton(
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () => Navigator.of(context).maybePop(),
      icon: Icon(
        isRtl ? Icons.arrow_forward_rounded : Icons.arrow_back_rounded,
        color: Colors.white,
      ),
    );
  }
}
