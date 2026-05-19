import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

String getMemberSinceText(BuildContext context, DateTime createdAt) {
  final now = DateTime.now();
  final difference = now.difference(createdAt);
  final totalDays = difference.inDays;

  if (totalDays == 0) {
    return "memberSinceToday".tr();
  }

  final prefix = "memberFor".tr();

  if (totalDays < 30) {
    return "$prefix${"day".plural(totalDays)}";
  } else if (totalDays < 365) {
    final months = totalDays ~/ 30;
    final days = totalDays % 30;

    if (days == 0) {
      return "$prefix${"month".plural(months)}";
    }
    return "$prefix${"month".plural(months)}${"and".tr()}${"day".plural(days)}";
  } else {
    final years = totalDays ~/ 365;
    final months = (totalDays % 365) ~/ 30;

    if (months == 0) {
      return "$prefix${"year".plural(years)}";
    }
    return "$prefix${"year".plural(years)}${"and".tr()}${"month".plural(months)}";
  }
}
