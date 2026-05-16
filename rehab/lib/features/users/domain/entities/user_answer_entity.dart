import 'package:equatable/equatable.dart';

class UserAnswerEntity extends Equatable {
  final String id;
  final String answerEn;
  final String answerAr;

  const UserAnswerEntity({
    required this.id,
    required this.answerEn,
    required this.answerAr,
  });

  @override
  List<Object?> get props => [id, answerEn, answerAr];
}
