import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/core/utils/localization_helper.dart';
import 'package:rehab/features/ads/domain/entities/ad_entity.dart';
import 'package:rehab/features/ads/presentation/cubit/ads_cubit.dart';
import 'package:rehab/features/ads/presentation/cubit/ads_state.dart';

/// قسم الإعلانات المتحرك أعلى صفحة الهوم.
/// يتنقل تلقائيًا بين البانرات، والضغط على البانر يفتح العقار المرتبط
/// أو الرابط الخارجي إن وُجد.
class AdsCarousel extends HookWidget {
  const AdsCarousel({super.key, required this.homes});

  /// العقارات المحمّلة حاليًا — تُستخدم لفتح تفاصيل العقار المرتبط بالإعلان.
  final List<HomeEntity> homes;

  static const double _height = 132;

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);

    return BlocBuilder<AdsCubit, AdsState>(
      builder: (context, state) {
        if (state is AdsLoadingState || state is AdsInitialState) {
          return const _AdsPlaceholder(height: _height);
        }

        // الإعلانات ليست محتوى أساسيًا — لا نُظهر خطأ للمستخدم، نخفي القسم.
        if (state is! AdsSuccessState || state.ads.isEmpty) {
          return const SizedBox.shrink();
        }

        final ads = state.ads;

        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: _height,
                viewportFraction: 0.86,
                autoPlay: ads.length > 1,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayAnimationDuration: const Duration(milliseconds: 700),
                autoPlayCurve: Curves.easeInOutCubic,
                enlargeCenterPage: true,
                enlargeFactor: 0.12,
                enableInfiniteScroll: ads.length > 1,
                onPageChanged: (index, reason) => currentIndex.value = index,
              ),
              items: ads.map((ad) => _AdBanner(ad: ad, homes: homes)).toList(),
            ),
            if (ads.length > 1) ...[
              const Gap(AppDimensions.spaceSm),
              DotsIndicator(
                dotsCount: ads.length,
                position: currentIndex.value.toDouble(),
                decorator: DotsDecorator(
                  color: AppColors.primary.withAlpha(60),
                  activeColor: AppColors.primary,
                  size: const Size.square(6),
                  activeSize: const Size(16, 6),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _AdBanner extends StatelessWidget {
  const _AdBanner({required this.ad, required this.homes});

  final AdEntity ad;
  final List<HomeEntity> homes;

  Future<void> _onTap(BuildContext context) async {
    if (ad.homeId != null) {
      final home = homes.where((item) => item.id == ad.homeId).firstOrNull;
      if (home != null) {
        context.push(Routes.homeDetails, extra: home);
        return;
      }
    }

    final actionUrl = ad.actionUrl;
    if (actionUrl == null || actionUrl.isEmpty) return;

    final uri = Uri.tryParse(actionUrl);
    if (uri == null) return;

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = titleForLocale(context, ad.titleEn, ad.titleAr);
    final subtitle = titleForLocale(context, ad.subtitleEn, ad.subtitleAr);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spaceXs),
      child: InkWell(
        onTap: () => _onTap(context),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
            boxShadow: AppDimensions.shadowSoft,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  ad.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(color: AppColors.primary.withAlpha(30)),
                ),

                // تدرّج يضمن قراءة النص فوق أي صورة
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        AppColors.primary.withAlpha(230),
                        AppColors.primary.withAlpha(120),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(AppDimensions.spaceLg),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title.isNotEmpty)
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                        ),
                      if (subtitle.isNotEmpty) ...[
                        const Gap(AppDimensions.spaceXs),
                        Text(
                          subtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white.withAlpha(215),
                            fontSize: 11.5,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AdsPlaceholder extends StatelessWidget {
  const _AdsPlaceholder({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.screenPadding + AppDimensions.spaceXs,
      ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColors.primary.withAlpha(16),
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        ),
      ),
    );
  }
}
