// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => _HomeModel(
  id: (json['id'] as num).toInt(),
  ownerId: json['owner_id'] as String,
  titleAr: json['title_ar'] as String? ?? '',
  titleEn: json['title_en'] as String? ?? '',
  cityAr: json['city_ar'] as String? ?? '',
  cityEn: json['city_en'] as String? ?? '',
  districtAr: json['district_ar'] as String? ?? '',
  districtEn: json['district_en'] as String? ?? '',
  descriptionAr: json['description_ar'] as String? ?? '',
  descriptionEn: json['description_en'] as String? ?? '',
  propertyTypeAr: json['property_type_ar'] as String? ?? '',
  propertyTypeEn: json['property_type_en'] as String? ?? '',
  policyAr:
      (json['policy_ar'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  policyEn:
      (json['policy_en'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  amenitiesAr:
      (json['amenities_ar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  amenitiesEn:
      (json['amenities_en'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  imageUrl: json['image_url'] as String? ?? '',
  imageUrls:
      (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  price: (json['price'] as num?)?.toDouble() ?? 0.0,
  rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
  rooms: (json['rooms'] as num?)?.toInt() ?? 0,
  bathrooms: (json['bathrooms'] as num?)?.toInt() ?? 0,
  isAvailable: json['is_available'] as bool? ?? true,
  area: (json['area'] as num?)?.toDouble() ?? 0.0,
  lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
  lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
  distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$HomeModelToJson(_HomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'title_ar': instance.titleAr,
      'title_en': instance.titleEn,
      'city_ar': instance.cityAr,
      'city_en': instance.cityEn,
      'district_ar': instance.districtAr,
      'district_en': instance.districtEn,
      'description_ar': instance.descriptionAr,
      'description_en': instance.descriptionEn,
      'property_type_ar': instance.propertyTypeAr,
      'property_type_en': instance.propertyTypeEn,
      'policy_ar': instance.policyAr,
      'policy_en': instance.policyEn,
      'amenities_ar': instance.amenitiesAr,
      'amenities_en': instance.amenitiesEn,
      'image_url': instance.imageUrl,
      'image_urls': instance.imageUrls,
      'price': instance.price,
      'rating': instance.rating,
      'rooms': instance.rooms,
      'bathrooms': instance.bathrooms,
      'is_available': instance.isAvailable,
      'area': instance.area,
      'lat': instance.lat,
      'lng': instance.lng,
      'distance': instance.distance,
    };
