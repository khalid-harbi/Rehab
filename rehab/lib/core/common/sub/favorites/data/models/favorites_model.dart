import 'package:rehab/core/common/sub/favorites/domain/entities/favorites_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorites_model.freezed.dart';
part 'favorites_model.g.dart';

@freezed
abstract class FavoritesModel with _$FavoritesModel {
  const factory FavoritesModel({
    required int id,
    required String userId,
    required int homeId,
    required DateTime createdAt,
  }) = _FavoritesModel;

  factory FavoritesModel.fromJson(Map<String, Object?> json) =>
      _$FavoritesModelFromJson(json);
}

extension FavoritesModelMapper on FavoritesModel {
  FavoritesEntity toEntity() {
    return FavoritesEntity(
      id: id,
      userId: userId,
      homeId: homeId,
      createdAt: createdAt,
    );
  }
}
