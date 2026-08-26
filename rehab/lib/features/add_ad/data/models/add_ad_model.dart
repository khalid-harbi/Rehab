import 'package:rehab/features/add_ad/domain/entities/add_ad_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_ad_model.freezed.dart';
part 'add_ad_model.g.dart';

@freezed
abstract class AddAdModel with _$AddAdModel {
  const factory AddAdModel({
    required int id,
    required String firstName,
    required String lastName,
  }) = _AddAdModel;

  factory AddAdModel.fromJson(Map<String, Object?> json) =>
      _$AddAdModelFromJson(json);
}

extension AddAdModelMapper on AddAdModel {
  AddAdEntity toEntity() {
    return AddAdEntity(id: id, firstName: firstName, lastName: lastName);
  }
}
