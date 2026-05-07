import 'package:rehab/features/booking/domain/entities/booking_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
abstract class BookingModel with _$BookingModel {
  const factory BookingModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, Object?> json) => _$BookingModelFromJson(json);
}



extension BookingModelMapper on BookingModel {
  BookingEntity toEntity() {
    return BookingEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
