import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String id;
  final String name;
  final String? imageUrl;
  final DateTime createdAt;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, createdAt];
}
