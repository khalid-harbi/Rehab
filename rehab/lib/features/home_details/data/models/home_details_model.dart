import 'package:rehab/features/home_details/domain/entities/home_details_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_details_model.freezed.dart';
part 'home_details_model.g.dart';

@freezed
abstract class HomeDetailsModel with _$HomeDetailsModel {
  const factory HomeDetailsModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _HomeDetailsModel;

  factory HomeDetailsModel.fromJson(Map<String, Object?> json) => _$HomeDetailsModelFromJson(json);
}



extension HomeDetailsModelMapper on HomeDetailsModel {
  HomeDetailsEntity toEntity() {
    return HomeDetailsEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
