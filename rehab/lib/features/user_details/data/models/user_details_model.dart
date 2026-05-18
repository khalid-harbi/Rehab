import 'package:rehab/features/user_details/domain/entities/user_details_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_details_model.freezed.dart';
part 'user_details_model.g.dart';

@freezed
abstract class UserDetailsModel with _$UserDetailsModel {
  const factory UserDetailsModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _UserDetailsModel;

  factory UserDetailsModel.fromJson(Map<String, Object?> json) => _$UserDetailsModelFromJson(json);
}



extension UserDetailsModelMapper on UserDetailsModel {
  UserDetailsEntity toEntity() {
    return UserDetailsEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
