// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_answers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserAnswersModel _$UserAnswersModelFromJson(Map<String, dynamic> json) =>
    _UserAnswersModel(
      id: json['id'] as String,
      answerEn: json['answer_en'] as String,
      answerAr: json['answer_ar'] as String,
    );

Map<String, dynamic> _$UserAnswersModelToJson(_UserAnswersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer_en': instance.answerEn,
      'answer_ar': instance.answerAr,
    };
