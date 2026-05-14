import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/core/constants/app_colors.dart' show AppColors;
import 'package:rehab/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:rehab/features/profile/presentation/cubit/profile_state.dart';
import 'package:rehab/features/users/presentation/cubit/users_cubit.dart';
import 'package:rehab/features/users/presentation/widgets/profile_header.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/widgets/localization_helper.dart';
import 'package:rehab/features/users/domain/entities/user_answer_entity.dart';
import 'package:rehab/features/users/presentation/widgets/build_chip.dart';
import 'package:rehab/features/users/presentation/widgets/member_since.dart';

class UsersWidget extends HookWidget {
  final String id;
  final String name;
  final DateTime cratedAt;
  final List<UserAnswerEntity> answers;
  final int matchPercentage;

  const UsersWidget({
    super.key,
    required this.id,
    required this.name,
    required this.cratedAt,
    required this.answers,
    required this.matchPercentage,
  });
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
    final showEllipsis = !isExpanded.value && answers.length > limit;
    // .take takes the specified number from the list
    final visibleAnswers = isExpanded.value ? answers : answers.take(limit);

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
            ProfileHeader(matchPercentage: matchPercentage),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      getMemberSinceText(context, cratedAt),
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
                            if (answers.length > limit) {
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
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  cubit.createRoom(id);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.background,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
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

// class ProfileHeader extends StatelessWidget {
//   const ProfileHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 160,
//       child: Stack(
//         children: [
//           Container(
//             height: 120,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
//               image: DecorationImage(
//                 image: NetworkImage('https://picsum.photos/400/200'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 24,
//             child: BlocBuilder<ProfileCubit, ProfileState>(
//               builder: (context, state) {
//                 if (state is ProfileSuccessState) {
//                   return ClipRRect(
//                     borderRadius: BorderRadius.circular(50.sp),
//                     child: AnyImageView(
//                       imagePath:
//                          state.profile.imageUrl??
//                           "https://placeholder.com/user.png",
//                       width: 40.sp,
//                       height: 40.sp,
//                       fit: BoxFit.cover,
//                       errorWidget: Icon(Icons.person, size: 30.sp),
//                     ),
//                   );
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),
           
//           ),
//           Positioned(
//             bottom: 20,
//             right: 20,
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.black.withAlpha(102),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: const Row(
//                 children: [
//                   Icon(Icons.handshake, color: Colors.red, size: 16),
//                   SizedBox(width: 5),
//                   Text(
//                     'Matches: 75%',
//                     style: TextStyle(color: Colors.white, fontSize: 12),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatItem(
            icon: Icons.star,
            color: Colors.amber,
            value: '5.0',
            label: 'Rating',
          ),
          StatItem(
            icon: Icons.flag,
            color: Colors.blue,
            value: '\$99',
            label: 'Hours',
          ),
          StatItem(
            icon: Icons.access_time_filled,
            color: Colors.purple,
            value: '12',
            label: 'Month',
          ),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String value;
  final String label;

  const StatItem({
    super.key,
    required this.icon,
    required this.color,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 4),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

