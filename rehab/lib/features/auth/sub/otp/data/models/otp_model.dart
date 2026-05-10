import 'package:rehab/features/auth/sub/otp/domain/entities/otp_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'otp_model.freezed.dart';
part 'otp_model.g.dart';

@freezed
abstract class OtpModel with _$OtpModel {
  const factory OtpModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _OtpModel;

  factory OtpModel.fromJson(Map<String, Object?> json) => _$OtpModelFromJson(json);
}



extension OtpModelMapper on OtpModel {
  OtpEntity toEntity() {
    return OtpEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
