import 'package:rehab/features/users/domain/entities/users_entity.dart';

extension UserMatchingExtension on List<UsersEntity> {
  List<UsersEntity> get filteredAndSortedMatches {
    // Filter out users with 0% match
    final filteredUsers = where((user) => user.matchPercentage > 0).toList();

    // Sort from highest to lowest
    filteredUsers.sort(
      (first, second) =>
          second.matchPercentage.compareTo(first.matchPercentage),
    );

    return filteredUsers;
  }
}
