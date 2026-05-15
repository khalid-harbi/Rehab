import 'package:rehab/features/auth/sub/google_log_in/domain/entities/google_log_in_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'google_log_in_model.freezed.dart';
part 'google_log_in_model.g.dart';

@freezed
abstract class GoogleLogInModel with _$GoogleLogInModel {
  const factory GoogleLogInModel({
    required int id,
    required String name,
    required String email,
    String? imageUrl,
  }) = _GoogleLogInModel;

  factory GoogleLogInModel.fromJson(Map<String, Object?> json) =>
      _$GoogleLogInModelFromJson(json);
}

extension GoogleLogInModelMapper on GoogleLogInModel {
  GoogleLogInEntity toEntity() {
    return GoogleLogInEntity(id: id, name: name, email: email, imageUrl: imageUrl);
  }
}
