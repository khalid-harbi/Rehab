// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => _HomeModel(
  id: json['id'] as String,
  title: json['title'] as String,
  city: json['city'] as String,
  district: json['district'] as String,
  imageUrl: json['imageUrl'] as String,
  price: (json['price'] as num).toDouble(),
  rating: (json['rating'] as num).toDouble(),
  rooms: (json['rooms'] as num).toInt(),
  bathrooms: (json['bathrooms'] as num).toInt(),
  description: json['description'] as String,
  isAvailable: json['isAvailable'] as bool,
);

Map<String, dynamic> _$HomeModelToJson(_HomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'city': instance.city,
      'district': instance.district,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'rating': instance.rating,
      'rooms': instance.rooms,
      'bathrooms': instance.bathrooms,
      'description': instance.description,
      'isAvailable': instance.isAvailable,
    };
