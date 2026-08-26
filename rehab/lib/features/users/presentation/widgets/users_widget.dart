import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/utils/localization_helper.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';
import 'package:rehab/features/users/presentation/cubit/users_cubit.dart';
import 'package:rehab/features/users/presentation/widgets/member_since.dart';

/// كارد المستخدم في صفحة التوافق — صف مضغوط: صورة، بيانات، نسبة توافق،
/// وسمات نمط الحياة كشيبس صغيرة، بنفس لغة كاردات العقارات.
class UsersWidget extends HookWidget {
  const UsersWidget({super.key, required this.user});

  final UsersEntity user;

  /// عدد السمات الظاهرة قبل «+n».
  static const int _visibleTraits = 3;

  static const double _avatarSize = 62;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersCubit>();

    final traits = user.answers
        .map(
          (answer) => titleForLocale(context, answer.answerEn, answer.answerAr),
        )
        .where((trait) => trait.trim().isNotEmpty)
        .toList();

    final visible = traits.take(_visibleTraits).toList();
    final hidden = traits.length - visible.length;

    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.spaceMd),
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      decoration: AppDimensions.surfaceCard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                child: AnyImageView(
                  imagePath: user.imageUrl,
                  width: _avatarSize,
                  height: _avatarSize,
                  fit: BoxFit.cover,
                  errorWidget: Container(
                    width: _avatarSize,
                    height: _avatarSize,
                    color: AppColors.primary.withAlpha(25),
                    child: const Icon(
                      Icons.person,
                      size: AppDimensions.iconLg,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),

              const Gap(AppDimensions.spaceMd),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    const Gap(2),

                    Text(
                      getMemberSinceText(context, user.createdAt),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),

                    if (visible.isNotEmpty) ...[
                      const Gap(AppDimensions.spaceSm),
                      Wrap(
                        spacing: AppDimensions.spaceXs,
                        runSpacing: AppDimensions.spaceXs,
                        children: [
                          ...visible.map((trait) => _TraitChip(label: trait)),
                          if (hidden > 0) _TraitChip(label: '+$hidden'),
                        ],
                      ),
                    ],
                  ],
                ),
              ),

              const Gap(AppDimensions.spaceSm),

              _MatchBadge(percentage: user.matchPercentage),
            ],
          ),

          const Gap(AppDimensions.spaceMd),

          SizedBox(
            width: double.infinity,
            height: 38,
            child: ElevatedButton.icon(
              onPressed: () => cubit.createRoom(user.id),
              icon: const Icon(
                Icons.chat_bubble_outline_rounded,
                size: AppDimensions.iconSm,
              ),
              label: Text(
                "getInTouch".tr(),
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TraitChip extends StatelessWidget {
  const _TraitChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(18),
        borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class _MatchBadge extends StatelessWidget {
  const _MatchBadge({required this.percentage});

  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceSm,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.favorite_rounded,
            size: AppDimensions.iconXs,
            color: Colors.white,
          ),
          const Gap(AppDimensions.spaceXs),
          Text(
            '$percentage%',
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
