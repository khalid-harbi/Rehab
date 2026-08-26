import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/core/utils/localization_helper.dart';
import 'package:rehab/features/home/presentation/cubit/home_cubit.dart';
import 'package:rehab/features/home/presentation/widgets/home_image_carousel.dart';

/// كارد العقار — مضغوط: كل المعلومات فوق الصورة مع تدرّج داكن يبرز النص.
class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.home, this.compact = false});

  final HomeEntity home;

  /// نسخة أصغر تُستخدم في القوائم الأفقية داخل صفحة الهوم.
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final height = compact ? 148.0 : 176.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 0 : AppDimensions.screenPadding,
        vertical: AppDimensions.spaceSm,
      ),
      child: InkWell(
        onTap: () => context.push(Routes.homeDetails, extra: home),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
            boxShadow: AppDimensions.shadowRaised,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
            child: Stack(
              fit: StackFit.expand,
              children: [
                HomeImageCarousel(
                  images: home.imageUrls.isNotEmpty
                      ? home.imageUrls
                      : [home.imageUrl],
                  height: height,
                  borderRadius: BorderRadius.zero,
                  showIndicator: false,
                ),

                // التدرّج الذي يجعل النص مقروءًا فوق أي صورة
                const DecoratedBox(
                  decoration: BoxDecoration(gradient: AppDimensions.imageScrim),
                ),

                _TopBadges(home: home),
                _BottomInfo(home: home, compact: compact),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBadges extends StatelessWidget {
  const _TopBadges({required this.home});

  final HomeEntity home;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppDimensions.spaceMd,
      left: AppDimensions.spaceMd,
      right: AppDimensions.spaceMd,
      child: Row(
        children: [
          _Pill(
            icon: Icons.star_rounded,
            iconColor: Colors.amber,
            label: home.rating.toStringAsFixed(1),
          ),

          const Spacer(),

          if (home.distance != null && home.distance! > 0.1)
            _Pill(
              icon: Icons.near_me_rounded,
              label: '${home.distance!.toStringAsFixed(1)} كم',
            ),
        ],
      ),
    );
  }
}

class _BottomInfo extends StatelessWidget {
  const _BottomInfo({required this.home, required this.compact});

  final HomeEntity home;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: AppDimensions.spaceMd,
      right: AppDimensions.spaceMd,
      bottom: AppDimensions.spaceMd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            titleForLocale(context, home.titleEn, home.titleAr),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: compact ? 14 : 15,
              fontWeight: FontWeight.bold,
              shadows: const [Shadow(color: Color(0x99000000), blurRadius: 8)],
            ),
          ),

          const Gap(AppDimensions.spaceXs),

          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: AppDimensions.iconSm,
                color: Colors.white70,
              ),
              const Gap(AppDimensions.spaceXs),
              Expanded(
                child: Text(
                  '${titleForLocale(context, home.cityEn, home.cityAr)}'
                  ' · '
                  '${titleForLocale(context, home.propertyTypeEn, home.propertyTypeAr)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ),
            ],
          ),

          const Gap(AppDimensions.spaceSm),

          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spaceMd,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
                ),
                child: Text(
                  '${home.price.toStringAsFixed(0)} ريال/شهريًا',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const Spacer(),

              _GlassIconButton(
                icon: Icons.map_outlined,
                onPressed: () => context.read<HomeCubit>().openMapLocation(
                  home.lat,
                  home.lng,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.icon, required this.label, this.iconColor});

  final IconData icon;
  final String label;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(110),
        borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: AppDimensions.iconSm,
            color: iconColor ?? Colors.white,
          ),
          const Gap(AppDimensions.spaceXs),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  const _GlassIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withAlpha(60),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 32,
          height: 32,
          child: Icon(icon, size: AppDimensions.iconMd, color: Colors.white),
        ),
      ),
    );
  }
}
