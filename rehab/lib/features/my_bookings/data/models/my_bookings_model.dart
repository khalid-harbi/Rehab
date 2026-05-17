import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehab/features/home/data/models/home_model.dart';
import 'package:rehab/features/my_bookings/domain/entities/my_bookings_entity.dart';

part 'my_bookings_model.freezed.dart';
part 'my_bookings_model.g.dart';

@freezed
abstract class MyBookingsModel with _$MyBookingsModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MyBookingsModel({
    required String id,

    required String seekerId,

    required String ownerId,

    required int homeId,

    required double amount,

    required int durationMonths,

    required String paymentId,

    required String status,

    @JsonKey(name: 'home')
    required HomeModel home,
  }) = _MyBookingsModel;

  factory MyBookingsModel.fromJson(Map<String, Object?> json) =>
      _$MyBookingsModelFromJson(json);
}

extension MyBookingsModelMapper on MyBookingsModel {
  MyBookingsEntity toEntity() {
    return MyBookingsEntity(
      id: id,
      seekerId: seekerId,
      ownerId: ownerId,
      homeId: homeId,
      amount: amount,
      durationMonths: durationMonths,
      paymentId: paymentId,
      status: status,
      home: home.toEntity(),
    );
  }
}