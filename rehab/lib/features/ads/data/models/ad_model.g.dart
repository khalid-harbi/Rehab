// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdModel _$AdModelFromJson(Map<String, dynamic> json) => _AdModel(
  id: (json['id'] as num).toInt(),
  titleAr: json['title_ar'] as String? ?? '',
  titleEn: json['title_en'] as String? ?? '',
  subtitleAr: json['subtitle_ar'] as String? ?? '',
  subtitleEn: json['subtitle_en'] as String? ?? '',
  imageUrl: json['image_url'] as String? ?? '',
  actionUrl: json['action_url'] as String?,
  homeId: (json['home_id'] as num?)?.toInt(),
  isActive: json['is_active'] as bool? ?? true,
  sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$AdModelToJson(_AdModel instance) => <String, dynamic>{
  'id': instance.id,
  'title_ar': instance.titleAr,
  'title_en': instance.titleEn,
  'subtitle_ar': instance.subtitleAr,
  'subtitle_en': instance.subtitleEn,
  'image_url': instance.imageUrl,
  'action_url': instance.actionUrl,
  'home_id': instance.homeId,
  'is_active': instance.isActive,
  'sort_order': instance.sortOrder,
};
