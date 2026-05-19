import 'package:flutter/material.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSwitchWidget extends StatefulWidget {
  const LanguageSwitchWidget({super.key});

  @override
  State<LanguageSwitchWidget> createState() => _LanguageSwitchWidgetState();
}

class _LanguageSwitchWidgetState extends State<LanguageSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final String leftText = isArabic ? 'E' : 'EN';
    final String rightText = isArabic ? 'ع' : 'AR';

    return GestureDetector(
      onTap: () {
        if (isArabic) {
          context.setLocale(Locale('en'));
        } else {
          context.setLocale(Locale('ar'));
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 90,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: isArabic ? 48 : 4,
              right: isArabic ? 4 : 48,
              top: 3,
              bottom: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withAlpha(60),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      leftText,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isArabic ? Colors.white : Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      rightText,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isArabic ? Colors.black54 : Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
