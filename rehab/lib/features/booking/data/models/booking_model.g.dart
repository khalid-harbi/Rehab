// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingModel _$BookingModelFromJson(Map<String, dynamic> json) =>
    _BookingModel(
      id: json['id'] as String,
      seekerId: json['seeker_id'] as String,
      ownerId: json['owner_id'] as String,
      homeId: (json['home_id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      durationMonths: (json['duration_months'] as num).toInt(),
      paymentId: json['payment_id'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$BookingModelToJson(_BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seeker_id': instance.seekerId,
      'owner_id': instance.ownerId,
      'home_id': instance.homeId,
      'amount': instance.amount,
      'duration_months': instance.durationMonths,
      'payment_id': instance.paymentId,
      'status': instance.status,
    };
