import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final int id;
  final String titleAr;
  final String titleEn;
  final String cityAr;
  final String cityEn;
  final String districtAr;
  final String districtEn;
  final String descriptionAr;
  final String descriptionEn;
  final String propertyTypeAr;
  final String propertyTypeEn;
  final List<String> policyAr;
  final List<String> policyEn;
  final List<String> amenitiesAr;
  final List<String> amenitiesEn;
  final String imageUrl;
  final List<String> imageUrls;
  final double price;
  final double rating;
  final int rooms;
  final int bathrooms;
  final bool isAvailable;
  final double area;
  final double lat;
  final double lng;
  final double? distance;

  const HomeEntity({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.cityAr,
    required this.cityEn,
    required this.districtAr,
    required this.districtEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.propertyTypeAr,
    required this.propertyTypeEn,
    required this.policyAr,
    required this.policyEn,
    required this.amenitiesAr,
    required this.amenitiesEn,
    required this.imageUrl,
    required this.imageUrls,
    required this.price,
    required this.rating,
    required this.rooms,
    required this.bathrooms,
    required this.isAvailable,
    required this.area,
    required this.lat,
    required this.lng,
    this.distance,
  });

  @override
  List<Object?> get props => [
    id,
    titleAr,
    titleEn,
    cityAr,
    cityEn,
    districtAr,
    districtEn,
    descriptionAr,
    descriptionEn,
    propertyTypeAr,
    propertyTypeEn,
    policyAr,
    policyEn,
    amenitiesAr,
    amenitiesEn,
    imageUrl,
    imageUrls,
    price,
    rating,
    rooms,
    bathrooms,
    isAvailable,
    area,
    lat,
    lng,
    distance,
  ];
}
