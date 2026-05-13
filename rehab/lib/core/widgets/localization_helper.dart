import 'package:flutter/material.dart';

String titleForLocale(BuildContext context, String en, String ar) {
  final language = Localizations.localeOf(context).languageCode;
  return language == 'ar' ? ar : en;
}
