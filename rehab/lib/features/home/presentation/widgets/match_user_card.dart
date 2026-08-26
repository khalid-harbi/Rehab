import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';

/// كارد مصغّر لقسم «التوافق» — صورة بنسبة عمودية، والاسم ونسبة التوافق فوقها.
class MatchUserCard extends StatelessWidget {
  const MatchUserCard({super.key, required this.user});

  final UsersEntity user;

  static const double _width = 116;
  static const double _height = 148;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(Routes.userDetails, extra: user),
      borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
          boxShadow: AppDimensions.shadowSoft,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnyImageView(
                imagePath: user.imageUrl,
                width: _width,
                height: _height,
                fit: BoxFit.cover,
                errorWidget: Container(
                  color: AppColors.primary.withAlpha(30),
                  child: const Icon(
                    Icons.person,
                    size: 34,
                    color: AppColors.primary,
                  ),
                ),
              ),

              const DecoratedBox(
                decoration: BoxDecoration(gradient: AppDimensions.imageScrim),
              ),

              // نسبة التوافق
              Positioned(
                top: AppDimensions.spaceSm,
                right: AppDimensions.spaceSm,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusPill,
                    ),
                  ),
                  child: Text(
                    '${user.matchPercentage}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Positioned(
                left: AppDimensions.spaceSm,
                right: AppDimensions.spaceSm,
                bottom: AppDimensions.spaceSm,
                child: Text(
                  user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    shadows: [Shadow(color: Color(0x99000000), blurRadius: 6)],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
