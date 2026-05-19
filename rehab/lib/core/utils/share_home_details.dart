 import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';
import 'package:share_plus/share_plus.dart';

void shareHomeDetails(BuildContext context, HomeEntity home) {
    final isArabic = context.locale.languageCode == 'ar';

    final String shareText = isArabic
        ? '''
🏠 عقار مميز متاح للإيجار ✨

📋 تفاصيل العقار:
• العنوان: ${home.titleAr}
• الموقع: ${home.cityAr} - ${home.districtAr}
• المساحة: ${home.area} م²
• التقييم: ⭐ ${home.rating}
• السعر: ${home.price} ريال / الشهر
'''
        : '''
🏠 Premium property available for rent ✨

📋 Property Details:
• Title: ${home.titleEn}
• Location: ${home.cityEn} - ${home.districtEn}
• Area: ${home.area} m²
• Rating: ⭐ ${home.rating}
• Price: ${home.price} SAR / Month
''';
    SharePlus.instance.share(
      ShareParams(
        text: shareText,
        subject: isArabic ? 'تفاصيل العقار' : 'Property Details',
      ),
    );
  }