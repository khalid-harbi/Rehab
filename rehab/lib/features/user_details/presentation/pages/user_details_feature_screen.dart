import 'package:flutter/material.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/utils/localization_helper.dart';
import 'package:rehab/core/widgets/Custom_liquid_progress_indicator.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';
import 'package:rehab/features/users/presentation/widgets/member_since.dart';

class UserDetailsFeatureScreen extends StatelessWidget {
  final UsersEntity? fetchedUser;
  const UserDetailsFeatureScreen({super.key, this.fetchedUser});

  @override
  Widget build(BuildContext context) {
    // Safety check
    if (fetchedUser == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Not Found')),
        body: const Center(child: Text('User data is missing.')),
      );
    }

    final user = fetchedUser!;

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(user.name),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: .center,
              children: [
                Transform.translate(
                  offset: const Offset(0, -15),
                  child: CustomLiquidProgressIndicator(
                    matchPercentage: user.matchPercentage,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withAlpha(50),
                  ),
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage: NetworkImage(user.imageUrl),
                    backgroundColor: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
            // ===================================================================
            // Large Match Percentage Heart (Moved to Top)
            // ===================================================================

            // ===================================================================
            // Smaller Profile Image (Moved Below)
            // ===================================================================

            // ===================================================================
            // Member since
            // ===================================================================
            const SizedBox(height: 8),
            Text(
              getMemberSinceText(context, user.createdAt),
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withAlpha(180),
              ),
            ),
            const SizedBox(height: 40),

            // ===================================================================
            // All Answers Display
            // ===================================================================
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 12.0,
                runSpacing: 16.0,
                alignment: WrapAlignment.center,
                children: user.answers.map((answerEntity) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      titleForLocale(
                        context,
                        answerEntity.answerEn,
                        answerEntity.answerAr,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
