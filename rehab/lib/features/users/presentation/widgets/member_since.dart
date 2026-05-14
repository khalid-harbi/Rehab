import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

String getMemberSinceText(BuildContext context, DateTime createdAt) {
  final now = DateTime.now();
  final difference = now.difference(createdAt);
  final totalDays = difference.inDays;

  if (totalDays < 30) {
    if (totalDays == 0) {
      return "memberSinceToday".tr();
    }
    return "${"memberFor".tr()} $totalDays ${"day".tr()}";
  } else if (totalDays < 365) {
    final months = totalDays ~/ 30;
    final days = totalDays % 30;

    if (days == 0) {
      return "${"memberFor".tr()} $months ${"month".tr()}";
    }
    return "${"memberFor".tr()} $months ${"month".tr()} ${"and".tr()} $days ${"day".tr()}";
  } else {
    final years = totalDays ~/ 365;
    final months = (totalDays % 365) ~/ 30;

    if (months == 0) {
      return "${"memberFor".tr()} $years ${"year".tr()}";
    }
    return "${"memberFor".tr()} $years ${"year".tr()} ${"and".tr()} $months ${"month".tr()}";
  }
}
