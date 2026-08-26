import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehab/features/booking/domain/entities/booking_entity.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
abstract class BookingModel with _$BookingModel {
  const factory BookingModel({
    required String id,

    @JsonKey(name: 'seeker_id') required String seekerId,

    @JsonKey(name: 'owner_id') required String ownerId,

    @JsonKey(name: 'home_id') required int homeId,

    required double amount,

    @JsonKey(name: 'duration_months') required int durationMonths,

    @JsonKey(name: 'payment_id') required String paymentId,

    required String status,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, Object?> json) =>
      _$BookingModelFromJson(json);
}

extension BookingModelMapper on BookingModel {
  BookingEntity toEntity() {
    return BookingEntity(
      id: id,
      seekerId: seekerId,
      ownerId: ownerId,
      homeId: homeId,
      amount: amount,
      durationMonths: durationMonths,
      paymentId: paymentId,
      status: status,
    );
  }
}
