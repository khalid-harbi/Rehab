import 'package:equatable/equatable.dart';

class LifestyleOptionEntity extends Equatable {
  final String id;
  final String titleEn;
  final String titleAr;
  final String slug;

  const LifestyleOptionEntity({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.slug,
  });

  @override
  List<Object?> get props => [id, titleEn, titleAr, slug];
}
