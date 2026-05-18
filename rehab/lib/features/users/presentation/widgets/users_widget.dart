import 'package:rehab/core/exports/app_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/core/constants/app_colors.dart' show AppColors;
import 'package:rehab/features/users/domain/entities/users_entity.dart';
import 'package:rehab/features/users/presentation/cubit/users_cubit.dart';
import 'package:rehab/features/users/presentation/widgets/profile_header.dart';
import 'package:rehab/core/utils/localization_helper.dart';
import 'package:rehab/features/users/presentation/widgets/build_chip.dart';
import 'package:rehab/features/users/presentation/widgets/member_since.dart';

class UsersWidget extends HookWidget {
  final UsersEntity user;

  const UsersWidget({super.key, required this.user});

  // ===================================================================
  // ===================================================================
  @override
  Widget build(BuildContext context) {
    // ===================================================================
    final cubit = context.read<UsersCubit>();
    // ===================================================================

    // Manage state using flutter_hooks
    final isExpanded = useState(false);

    // How many answers to show?
    final limit = 4;
    // Ellipsis are '...' and will only be displayed when card is not expanded & there are more answers to show
    final showEllipsis = !isExpanded.value && user.answers.length > limit;
    // .take takes the specified number from the list
    final visibleAnswers = isExpanded.value
        ? user.answers
        : user.answers.take(limit);

    // ===================================================================
    // ===================================================================

    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        width: 320,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(77),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // <<<<<<< HEAD
            Stack(
              children: [
                Container(
                  height: 15.sh,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AnyImageView(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                        width: 100.sw,
                        imagePath: user.imageUrl,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(75),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ProfileHeader(
                  imageUrl: user.imageUrl,
                  matchPercentage: user.matchPercentage,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      getMemberSinceText(context, user.createdAt),
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ===================================================================
            // ===================================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: Alignment.topCenter,
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 10.0,
                    children: [
                      // Map the answers
                      ...visibleAnswers.map((answerEntity) {
                        return buildChip(
                          titleForLocale(
                            context,
                            answerEntity.answerEn,
                            answerEntity.answerAr,
                          ),
                        );
                      }),
                      if (!showEllipsis && isExpanded.value)
                        GestureDetector(
                          onTap: () {
                            if (isExpanded.value) {
                              isExpanded.value = !isExpanded.value;
                            }
                          },
                          child: buildChip('... أقل'),
                        ),

                      if (showEllipsis)
                        GestureDetector(
                          onTap: () {
                            if (user.answers.length > limit) {
                              isExpanded.value = !isExpanded.value;
                            }
                          },
                          child: buildChip('أكثر ...'),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            // ===================================================================
            // ===================================================================
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: () {
                  cubit.createRoom(user);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.background,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Get In Touch',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
