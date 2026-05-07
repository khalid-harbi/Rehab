import 'package:equatable/equatable.dart';

class UsersEntity extends Equatable {
  final String id;
  final String name;
  final DateTime createdAt;

  const UsersEntity({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, createdAt];
}
