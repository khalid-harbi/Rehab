import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehab/features/ads/domain/entities/ad_entity.dart';

part 'ad_model.freezed.dart';
part 'ad_model.g.dart';

@freezed
abstract class AdModel with _$AdModel {
  @JsonSerializable(fieldRename: .snake)
  const factory AdModel({
    required int id,
    @Default('') String titleAr,
    @Default('') String titleEn,
    @Default('') String subtitleAr,
    @Default('') String subtitleEn,
    @Default('') String imageUrl,
    String? actionUrl,
    int? homeId,
    @Default(true) bool isActive,
    @Default(0) int sortOrder,
  }) = _AdModel;

  factory AdModel.fromJson(Map<String, Object?> json) =>
      _$AdModelFromJson(json);
}

extension AdModelMapper on AdModel {
  AdEntity toEntity() {
    return AdEntity(
      id: id,
      titleAr: titleAr,
      titleEn: titleEn,
      subtitleAr: subtitleAr,
      subtitleEn: subtitleEn,
      imageUrl: imageUrl,
      actionUrl: actionUrl,
      homeId: homeId,
    );
  }
}
