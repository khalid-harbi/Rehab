// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => _HomeModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  city: json['city'] as String,
  district: json['district'] as String,
  imageUrl: json['image_url'] as String,
  price: (json['price'] as num).toDouble(),
  rating: (json['rating'] as num).toDouble(),
  rooms: (json['rooms'] as num).toInt(),
  bathrooms: (json['bathrooms'] as num).toInt(),
  description: json['description'] as String,
  isAvailable: json['is_available'] as bool,
  propertyType: json['property_type'] as String,
  area: (json['area'] as num).toDouble(),
);

Map<String, dynamic> _$HomeModelToJson(_HomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'city': instance.city,
      'district': instance.district,
      'image_url': instance.imageUrl,
      'price': instance.price,
      'rating': instance.rating,
      'rooms': instance.rooms,
      'bathrooms': instance.bathrooms,
      'description': instance.description,
      'is_available': instance.isAvailable,
      'property_type': instance.propertyType,
      'area': instance.area,
    };
