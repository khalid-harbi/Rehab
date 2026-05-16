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
    @Default(
      'https://ui-avatars.com/api/?name=Placeholder&background=random&length=1',
    )
    String imageUrl,
    @Default([]) List<UserAnswersModel> answers,
    @Default(0) int matchPercentage,
  }) = _UsersModel;

  factory UsersModel.fromJson(Map<String, Object?> json) =>
      _$UsersModelFromJson(json);
}

extension UsersModelMapper on UsersModel {
  UsersEntity toEntity() {
    String finalUrl = imageUrl;
    if (imageUrl.contains('name=Placeholder')) {
      // Replace "Placeholder" with the actual user's name
      // .trim() and .replaceAll to make the name URL-friendly
      final encodedName = name.trim().replaceAll(' ', '+');
      finalUrl =
          'https://ui-avatars.com/api/?name=$encodedName&background=random&length=1';
    }
    return UsersEntity(
      id: id,
      name: name,
      createdAt: createdAt,
      imageUrl: finalUrl,
      answers: answers.map((a) => a.toEntity()).toList(),
      matchPercentage: matchPercentage,
    );
  }
}
