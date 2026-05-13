import 'package:flutter/widgets.dart';
import 'package:rehab/core/widgets/localization_helper.dart';

String getMemberSinceText(BuildContext context, DateTime createdAt) {
  final now = DateTime.now();
  final difference = now.difference(createdAt);
  final totalDays = difference.inDays;

  if (totalDays < 30) {
    if (totalDays == 0) {
      return titleForLocale(context, 'Member since today', 'عضو منذ اليوم');
    }
    return titleForLocale(
      context,
      'Member for $totalDays days',
      'عضو منذ $totalDays يوم',
    );
  } else if (totalDays < 365) {
    final months = totalDays ~/ 30;
    final days = totalDays % 30;

    if (days == 0) {
      return titleForLocale(
        context,
        'Member for $months months',
        'عضو منذ $months شهر',
      );
    }
    return titleForLocale(
      context,
      'Member for $months months and $days days',
      'عضو منذ $months شهر و $days يوم',
    );
  } else {
    final years = totalDays ~/ 365;
    final months = (totalDays % 365) ~/ 30;

    if (months == 0) {
      return titleForLocale(
        context,
        'Member for $years years',
        'عضو منذ $years سنة',
      );
    }
    return titleForLocale(
      context,
      'Member for $years years and $months months',
      'عضو منذ $years سنة و $months شهر',
    );
  }
}
