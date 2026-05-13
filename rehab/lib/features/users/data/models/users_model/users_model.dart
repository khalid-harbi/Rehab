import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehab/features/users/data/models/user_answers_model/user_answers_model.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';
part 'users_model.freezed.dart';
part 'users_model.g.dart';

@freezed
abstract class UsersModel with _$UsersModel {
  @JsonSerializable(fieldRename: .snake)
  const factory UsersModel({
    required String id,
    required String name,
    required DateTime createdAt,
    @Default([]) List<UserAnswersModel> answers,
    @Default(0) int matchPercentage, 
  }) = _UsersModel;

  factory UsersModel.fromJson(Map<String, Object?> json) =>
      _$UsersModelFromJson(json);
}

extension UsersModelMapper on UsersModel {
  UsersEntity toEntity() {
    return UsersEntity(
      id: id,
      name: name,
      createdAt: createdAt,
      answers: answers.map((a) => a.toEntity()).toList(),
      matchPercentage: matchPercentage,
    );
  }
}
