import 'package:rehab/features/home/domain/entities/home_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
abstract class HomeModel with _$HomeModel {
  const factory HomeModel({
    required int id,

    @Default('') String title,
    @Default('') String city,
    @Default('') String district,
    @JsonKey(name: 'image_url', defaultValue: '') required String imageUrl,
    @Default(0.0) double price,
    @Default(0.0) double rating,
    @Default(0) int rooms,
    @Default(0) int bathrooms,
    @Default('') String description,
    @JsonKey(name: 'is_available') @Default(false) bool isAvailable,
    @JsonKey(name: 'property_type') @Default('') String propertyType,
    @Default(0.0) double area,
    required String policy,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, Object?> json) =>
      _$HomeModelFromJson(json);
}

extension HomeModelMapper on HomeModel {
  HomeEntity toEntity() {
    return HomeEntity(
      id: id,
      title: title,
      city: city,
      district: district,
      imageUrl: imageUrl,
      price: price,
      rating: rating,
      rooms: rooms,
      bathrooms: bathrooms,
      description: description,
      isAvailable: isAvailable,
      propertyType: propertyType,
      area: area,
      policy: policy,
    );
  }
}
