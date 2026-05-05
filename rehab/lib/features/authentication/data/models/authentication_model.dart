import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehab/features/authentication/domain/entities/authentication_entity.dart';
part 'authentication_model.freezed.dart';
part 'authentication_model.g.dart';

@freezed
abstract class AuthModel with _$AuthModel {
  const factory AuthModel({
    @JsonKey(defaultValue: false) required bool isLogin,
    bool? isUser,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, Object?> json) =>
      _$AuthModelFromJson(json);
}

extension AuthModelMapper on AuthModel {
  AuthEntity toEntity() {
    return AuthEntity(isLogin: isLogin, isUser: isUser);
  }
}
