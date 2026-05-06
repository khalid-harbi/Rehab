import 'package:rehab/core/constants/app_enums.dart';

extension UserRoleSelector on String {
  UserRole toUserRole() {
    switch (toLowerCase().trim()) {
      case 'owner':
        return UserRole.owner;
      default:
        return UserRole.user;
    }
  }
}