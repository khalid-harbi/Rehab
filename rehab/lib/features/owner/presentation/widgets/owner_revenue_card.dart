import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/utils/formatters.dart';

/// بطاقة الدخل — أول ما تراه المالكة، والرقم الوحيد في اللوحة الذي يستحق
/// حجمًا كبيرًا. تجمع ما كان مفرّقًا على بطاقتين (إجمالي الدخل + عدد الحجوزات
/// المدفوعة) في جملة واحدة مقروءة: «كم دخلتُ، ومن كم حجز».
///
/// بلون العلامة وحوافه الدائرية وظله، بنفس لغة كاردات صفحة المستخدمة.
class OwnerRevenueCard extends StatelessWidget {
  const OwnerRevenueCard({
    super.key,
    required this.totalRevenue,
    required this.paidBookings,
  });

  /// null أثناء التحميل — فيظهر مكان الرقم شريط رمادي بدل قفزة في التخطيط.
  final double? totalRevenue;
  final int paidBookings;

  @override
  Widget build(BuildContext context) {
    final revenue = totalRevenue;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
        boxShadow: AppDimensions.shadowRaised,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF7A2557), AppColors.primary],
            ),
          ),
          child: Stack(
            children: [
              // دائرة ضوء خفيفة تكسر مسطّح اللون — زخرفة صامتة لا تزاحم النص.
              Positioned(
                top: -34,
                left: -18,
                child: Container(
                  width: 118,
                  height: 118,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withAlpha(18),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(AppDimensions.spaceXl),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "totalRevenue".tr(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white.withAlpha(180),
                              fontSize: 12,
                            ),
                          ),

                          const Gap(AppDimensions.spaceSm),

                          if (revenue == null)
                            const _ValuePlaceholder()
                          else
                            _Amount(value: revenue),

                          const Gap(AppDimensions.spaceMd),

                          _BookingsPill(count: paidBookings),
                        ],
                      ),
                    ),

                    const Gap(AppDimensions.spaceMd),

                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withAlpha(38),
                      ),
                      child: const Icon(
                        Icons.trending_up_rounded,
                        color: Colors.white,
                        size: AppDimensions.iconLg,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Amount extends StatelessWidget {
  const _Amount({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    // الرقم والعملة في سطر واحد: الرقم ضخم، والعملة أصغر فلا تسرق الانتباه.
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Formatters.formatAmount(value),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
              height: 1.1,
            ),
          ),

          const Gap(AppDimensions.spaceXs),

          Text(
            "riyal".tr(),
            style: TextStyle(
              color: Colors.white.withAlpha(190),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingsPill extends StatelessWidget {
  const _BookingsPill({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceMd,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(38),
        borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            size: AppDimensions.iconSm,
            color: Colors.white,
          ),

          const Gap(AppDimensions.spaceXs),

          Text(
            "fromPaidBookings".plural(count),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ValuePlaceholder extends StatelessWidget {
  const _ValuePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(45),
        borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
      ),
    );
  }
}
