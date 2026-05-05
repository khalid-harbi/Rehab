import 'package:rehab/features/authentication/sub/logout/domain/entities/logout_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'logout_model.freezed.dart';
part 'logout_model.g.dart';

@freezed
abstract class LogoutModel with _$LogoutModel {
  const factory LogoutModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _LogoutModel;

  factory LogoutModel.fromJson(Map<String, Object?> json) => _$LogoutModelFromJson(json);
}



extension LogoutModelMapper on LogoutModel {
  LogoutEntity toEntity() {
    return LogoutEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
