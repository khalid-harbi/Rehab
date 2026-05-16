import 'package:rehab/core/exports/app_exports.dart';

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
