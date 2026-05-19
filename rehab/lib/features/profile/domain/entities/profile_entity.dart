import 'package:equatable/equatable.dart';
import 'package:rehab/core/constants/app_enums.dart';
import 'package:rehab/core/extensions/user_role_extension.dart';

class ProfileEntity extends Equatable {
  final String id;
  final String name;
  final String? imageUrl;
  final String role;
  final DateTime createdAt;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.role,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, role, createdAt];
  UserRole get userRoleEnum => role.toUserRole();
  bool get isOwner => userRoleEnum == UserRole.owner;
}
