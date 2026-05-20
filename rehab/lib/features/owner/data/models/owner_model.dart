import 'package:rehab/features/owner/domain/entities/owner_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'owner_model.freezed.dart';
part 'owner_model.g.dart';

@freezed
abstract class OwnerModel with _$OwnerModel {
  const factory OwnerModel({
    required double totalRevenue,
    required int propertyCount,
    required int paidBookingsCount,
  }) = _OwnerModel;

  factory OwnerModel.fromJson(Map<String, Object?> json) =>
      _$OwnerModelFromJson(json);
}

extension OwnerModelMapper on OwnerModel {
  OwnerEntity toEntity() {
    return OwnerEntity(
      totalRevenue: totalRevenue,
      propertyCount: propertyCount,
      paidBookingsCount: paidBookingsCount,
    );
  }
}
