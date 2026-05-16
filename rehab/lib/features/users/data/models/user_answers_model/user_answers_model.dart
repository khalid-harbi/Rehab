import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehab/features/users/domain/entities/user_answer_entity.dart';

part 'user_answers_model.freezed.dart';
part 'user_answers_model.g.dart';

@freezed
abstract class UserAnswersModel with _$UserAnswersModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserAnswersModel({
    required String id,
    required String answerEn,
    required String answerAr,
  }) = _UserAnswersModel;

  factory UserAnswersModel.fromJson(Map<String, Object?> json) =>
      _$UserAnswersModelFromJson(json);
}

extension UserAnswersModelMapper on UserAnswersModel {
  UserAnswerEntity toEntity() {
    return UserAnswerEntity(id: id, answerEn: answerEn, answerAr: answerAr);
  }
}
