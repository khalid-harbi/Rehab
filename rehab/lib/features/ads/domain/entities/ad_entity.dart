import 'package:equatable/equatable.dart';

class AdEntity extends Equatable {
  final int id;
  final String titleAr;
  final String titleEn;
  final String subtitleAr;
  final String subtitleEn;
  final String imageUrl;
  final String? actionUrl;
  final int? homeId;

  const AdEntity({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.subtitleAr,
    required this.subtitleEn,
    required this.imageUrl,
    this.actionUrl,
    this.homeId,
  });

  @override
  List<Object?> get props => [
    id,
    titleAr,
    titleEn,
    subtitleAr,
    subtitleEn,
    imageUrl,
    actionUrl,
    homeId,
  ];
}
