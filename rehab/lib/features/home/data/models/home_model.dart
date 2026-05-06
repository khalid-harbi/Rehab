import 'package:rehab/features/home/domain/entities/home_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
abstract class HomeModel with _$HomeModel {
  const factory HomeModel({
   required String id,
    required String title,
    required String city,
    required String district,

    @JsonKey(name: 'image_url')
    required String imageUrl,

    required double price,
    required double rating,
    required int rooms,
    required int bathrooms,
    required String description,

    @JsonKey(name: 'is_available')
    required bool isAvailable,
    
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, Object?> json) => _$HomeModelFromJson(json);
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
    );
  }
  }
