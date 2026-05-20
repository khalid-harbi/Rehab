import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final int id;
  final String ownerId;
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
    required this.ownerId,
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

  HomeEntity copyWith({
    int? id,
    String? ownerId,
    String? titleAr,
    String? titleEn,
    String? cityAr,
    String? cityEn,
    String? districtAr,
    String? districtEn,
    String? descriptionAr,
    String? descriptionEn,
    String? propertyTypeAr,
    String? propertyTypeEn,
    List<String>? policyAr,
    List<String>? policyEn,
    List<String>? amenitiesAr,
    List<String>? amenitiesEn,
    String? imageUrl,
    List<String>? imageUrls,
    double? price,
    double? rating,
    int? rooms,
    int? bathrooms,
    bool? isAvailable,
    double? area,
    double? lat,
    double? lng,
    double? distance,
  }) {
    return HomeEntity(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      titleAr: titleAr ?? this.titleAr,
      titleEn: titleEn ?? this.titleEn,
      cityAr: cityAr ?? this.cityAr,
      cityEn: cityEn ?? this.cityEn,
      districtAr: districtAr ?? this.districtAr,
      districtEn: districtEn ?? this.districtEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      propertyTypeAr: propertyTypeAr ?? this.propertyTypeAr,
      propertyTypeEn: propertyTypeEn ?? this.propertyTypeEn,
      policyAr: policyAr ?? this.policyAr,
      policyEn: policyEn ?? this.policyEn,
      amenitiesAr: amenitiesAr ?? this.amenitiesAr,
      amenitiesEn: amenitiesEn ?? this.amenitiesEn,
      imageUrl: imageUrl ?? this.imageUrl,
      imageUrls: imageUrls ?? this.imageUrls,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      rooms: rooms ?? this.rooms,
      bathrooms: bathrooms ?? this.bathrooms,
      isAvailable: isAvailable ?? this.isAvailable,
      area: area ?? this.area,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      distance: distance ?? this.distance,
    );
  }

  @override
  List<Object?> get props => [
    id,
    ownerId,
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
