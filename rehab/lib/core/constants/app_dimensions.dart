import 'package:flutter/material.dart';
import 'package:rehab/core/constants/app_colors.dart';

/// توكنز التصميم — مصدر واحد للمسافات والحواف وأحجام الأيقونات والظلال،
/// عشان كل الشاشات تطلع متناسقة بدل أرقام متفرقة في كل ودجت.
abstract class AppDimensions {
  AppDimensions._();

  // ــــــ المسافات ــــــ
  static const double spaceXs = 4;
  static const double spaceSm = 8;
  static const double spaceMd = 12;
  static const double spaceLg = 16;
  static const double spaceXl = 24;

  /// الهامش الأفقي الموحّد لكل محتوى الصفحة.
  static const double screenPadding = 16;

  // ــــــ الحواف ــــــ
  static const double radiusSm = 10;
  static const double radiusMd = 14;
  static const double radiusLg = 18;
  static const double radiusXl = 24;
  static const double radiusPill = 100;

  // ــــــ الأيقونات ــــــ
  static const double iconXs = 12;
  static const double iconSm = 14;
  static const double iconMd = 18;
  static const double iconLg = 22;

  // ــــــ الظلال ــــــ

  /// ظل خفيف للكاردات والأسطح المرفوعة.
  static const List<BoxShadow> shadowSoft = [
    BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4)),
  ];

  /// ظل أوضح للعناصر البارزة (كارد العقار، أزرار الإجراء).
  static const List<BoxShadow> shadowRaised = [
    BoxShadow(color: Color(0x1F000000), blurRadius: 18, offset: Offset(0, 8)),
  ];

  /// تدرّج داكن أسفل الصور — يضمن قراءة النص فوق أي صورة.
  static const LinearGradient imageScrim = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.0, 0.45, 1.0],
    colors: [Color(0xE0000000), Color(0x66000000), Color(0x00000000)],
  );

  // ــــــ أنماط جاهزة ــــــ

  static BoxDecoration get surfaceCard => BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(radiusLg),
    border: Border.all(color: AppColors.border.withAlpha(120)),
    boxShadow: shadowSoft,
  );
}
