// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifestyle_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LifestyleOptionModel _$LifestyleOptionModelFromJson(
  Map<String, dynamic> json,
) => _LifestyleOptionModel(
  id: json['id'] as String,
  titleEn: json['title_en'] as String,
  titleAr: json['title_ar'] as String,
  slug: json['slug'] as String,
);

Map<String, dynamic> _$LifestyleOptionModelToJson(
  _LifestyleOptionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title_en': instance.titleEn,
  'title_ar': instance.titleAr,
  'slug': instance.slug,
};
