// import 'package:rehab/features/lifestyle/domain/entities/lifestyle_choice_entity.dart';

// class LifestyleChoiceModel {
//   final String id;
//   final String optionId;
//   final String valueEn;
//   final String valueAr;

//   const LifestyleChoiceModel({
//     required this.id,
//     required this.optionId,
//     required this.valueEn,
//     required this.valueAr,
//   });

//   factory LifestyleChoiceModel.fromJson(Map<String, dynamic> json) {
//     return LifestyleChoiceModel(
//       id: json['id'] as String,
//       optionId: json['option_id'] as String,
//       valueEn: json['value_en'] as String,
//       valueAr: json['value_ar'] as String,
//     );
//   }

//   LifestyleChoiceEntity toEntity() => LifestyleChoiceEntity(
//         id: id,
//         optionId: optionId,
//         valueEn: valueEn,
//         valueAr: valueAr,
//       );
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehab/features/lifestyle/domain/entities/lifestyle_choice_entity.dart';

part 'lifestyle_choice_model.freezed.dart';
part 'lifestyle_choice_model.g.dart';

@freezed
abstract class LifestyleChoiceModel with _$LifestyleChoiceModel {
  const factory LifestyleChoiceModel({
    required String id,
    required String optionId,
    required String valueEn,
    required String valueAr,
  }) = _LifestyleChoiceModel;

  factory LifestyleChoiceModel.fromJson(Map<String, Object?> json) =>
      _$LifestyleChoiceModelFromJson(json);
}

extension LifestyleChoiceModelMapper on LifestyleChoiceModel {
  LifestyleChoiceEntity toEntity() {
    return LifestyleChoiceEntity(
      id: id,
      optionId: optionId,
      valueEn: valueEn,
      valueAr: valueAr,
    );
  }
}
