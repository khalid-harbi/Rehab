// import 'package:rehab/features/lifestyle/domain/entities/lifestyle_option_entity.dart';

// class LifestyleOptionModel {
//   final String id;
//   final String titleEn;
//   final String titleAr;
//   final String slug;

//   const LifestyleOptionModel({
//     required this.id,
//     required this.titleEn,
//     required this.titleAr,
//     required this.slug,
//   });

//   factory LifestyleOptionModel.fromJson(Map<String, dynamic> json) {
//     return LifestyleOptionModel(
//       id: json['id'] as String,
//       titleEn: json['title_en'] as String,
//       titleAr: json['title_ar'] as String,
//       slug: json['slug'] as String,
//     );
//   }

//   LifestyleOptionEntity toEntity() => LifestyleOptionEntity(
//         id: id,
//         titleEn: titleEn,
//         titleAr: titleAr,
//         slug: slug,
//       );
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehab/features/lifestyle/domain/entities/lifestyle_option_entity.dart';
part 'lifestyle_option_model.freezed.dart';
part 'lifestyle_option_model.g.dart';

@freezed
abstract class LifestyleOptionModel with _$LifestyleOptionModel {
  const factory LifestyleOptionModel({
    required String id,
    required String titleEn,
    required String titleAr,
    required String slug,
  }) = _LifestyleOptionModel;

  factory LifestyleOptionModel.fromJson(Map<String, Object?> json) =>
      _$LifestyleOptionModelFromJson(json);
}

extension LifestyleOptionModelMapper on LifestyleOptionModel {
  LifestyleOptionEntity toEntity() {
    return LifestyleOptionEntity(
      id: id,
      titleEn: titleEn,
      titleAr: titleAr,
      slug: slug,
    );
  }
}
