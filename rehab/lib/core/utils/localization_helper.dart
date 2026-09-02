import 'package:flutter/material.dart';

bool _isArabic(BuildContext context) =>
    Localizations.localeOf(context).languageCode == 'ar';

/// النص بلغة الواجهة، وإن كان فارغًا فبالّلغة الأخرى.
///
/// كانت الدالة ترجع عمود اللغة المطلوبة دائمًا حتى لو كان فارغًا. وبما أن
/// `add_ad` كان يملأ أعمدة لغة واحدة فقط (حسب لغة التطبيق وقت إضافة
/// الإعلان)، فالإعلان المضاف بالإنجليزية يظهر **فراغًا** في الواجهة العربية
/// والعكس. عرض النص المتاح أفضل من عرض لا شيء.
String titleForLocale(BuildContext context, String en, String ar) {
  final isArabic = _isArabic(context);

  final preferred = (isArabic ? ar : en).trim();
  if (preferred.isNotEmpty) return preferred;

  return (isArabic ? en : ar).trim();
}

/// قائمة بلغة الواجهة، وإن كانت فارغة فبالّلغة الأخرى.
///
/// للمرافق والسياسات. كانت الشاشات تدور على `…En.length` دائمًا، فالإعلان
/// المضاف بالعربية — و`amenities_en` فيه فارغة — لا تظهر مرافقه **ولا
/// سياساته إطلاقًا**، رغم وجود البيانات العربية كاملة.
List<String> listForLocale(
  BuildContext context,
  List<String> en,
  List<String> ar,
) {
  final isArabic = _isArabic(context);

  final preferred = _clean(isArabic ? ar : en);
  if (preferred.isNotEmpty) return preferred;

  return _clean(isArabic ? en : ar);
}

List<String> _clean(List<String> items) =>
    items.map((item) => item.trim()).where((item) => item.isNotEmpty).toList();
