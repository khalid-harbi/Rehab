import 'package:equatable/equatable.dart';
import 'package:rehab/features/users/domain/entities/user_answer_entity.dart';

class UsersEntity extends Equatable {
  final String id;
  final String name;
  final DateTime createdAt;
  final List<UserAnswerEntity> answers;
  final int matchPercentage;

  const UsersEntity({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.answers,
    required this.matchPercentage,
  });

  @override
  List<Object?> get props => [id, name, createdAt, matchPercentage];
}
