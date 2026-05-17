import 'package:rehab/features/home/domain/entities/home_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
abstract class HomeModel with _$HomeModel {
  @JsonSerializable(fieldRename: .snake)
  const factory HomeModel({
    required int id,
    @Default('') String titleAr,
    @Default('') String titleEn,
    @Default('') String cityAr,
    @Default('') String cityEn,
    @Default('') String districtAr,
    @Default('') String districtEn,
    @Default('') String descriptionAr,
    @Default('') String descriptionEn,
    @Default('') String propertyTypeAr,
    @Default('') String propertyTypeEn,
    @Default([]) List<String> policyAr,
    @Default([]) List<String> policyEn,
    @Default([]) List<String> amenitiesAr,
    @Default([]) List<String> amenitiesEn,
    @Default('') String imageUrl,
    @Default(0.0) double price,
    @Default(0.0) double rating,
    @Default(0) int rooms,
    @Default(0) int bathrooms,
    @Default(true) bool isAvailable,
    @Default(0.0) double area,
    @Default(0.0) double lat,
    @Default(0.0) double lng,
    @Default(0.0) double distance,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, Object?> json) =>
      _$HomeModelFromJson(json);
}

extension HomeModelMapper on HomeModel {
  HomeEntity toEntity() {
    return HomeEntity(
      id: id,
      titleAr: titleAr,
      titleEn: titleEn,
      cityAr: cityAr,
      cityEn: cityEn,
      districtAr: districtAr,
      districtEn: districtEn,
      descriptionAr: descriptionAr,
      descriptionEn: descriptionEn,
      propertyTypeAr: propertyTypeAr,
      propertyTypeEn: propertyTypeEn,
      policyAr: policyAr,
      policyEn: policyEn,
      amenitiesAr: amenitiesAr,
      amenitiesEn: amenitiesEn,
      imageUrl: imageUrl,
      price: price,
      rating: rating,
      rooms: rooms,
      bathrooms: bathrooms,
      isAvailable: isAvailable,
      area: area,
      lat: lat,
      lng: lng,
      distance: distance,
    );
  }
}
