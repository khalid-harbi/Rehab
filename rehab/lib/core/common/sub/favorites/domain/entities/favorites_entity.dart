import 'package:rehab/core/exports/app_exports.dart';

class FavoritesEntity extends Equatable {
  final int id;
  final String userId;
  final int homeId;
  final DateTime createdAt;

  const FavoritesEntity({
    required this.id,
    required this.userId,
    required this.homeId,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id , userId, homeId, createdAt];
}
