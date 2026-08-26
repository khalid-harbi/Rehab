import 'package:flutter/services.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/widgets/app_top_bar.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';

/// هيدر قصير مثبّت على الآب بار — صورة المستخدم والترحيب فقط.
class HomeHeaderAppBar extends StatelessWidget {
  const HomeHeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: AppTopBar.height,
      titleSpacing: AppDimensions.screenPadding,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primary,
      surfaceTintColor: AppColors.primary,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      shape: AppTopBar.shape,
      title: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is! ProfileSuccessState) {
            return const SizedBox.shrink();
          }

          return Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24, width: 1.5),
                ),
                child: ClipOval(
                  child: AnyImageView(
                    imagePath: state.profile.imageUrl ?? '',
                    width: 38,
                    height: 38,
                    fit: BoxFit.cover,
                    errorWidget: const Icon(
                      Icons.person,
                      size: AppDimensions.iconLg,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const Gap(AppDimensions.spaceMd),

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "howAreYou".tr(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withAlpha(170),
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      "${"hi".tr()} ${state.profile.name}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
