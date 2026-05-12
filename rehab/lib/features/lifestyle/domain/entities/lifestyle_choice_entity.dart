import 'package:equatable/equatable.dart';

class LifestyleChoiceEntity extends Equatable {
  final String id;
  final String optionId;
  final String valueEn;
  final String valueAr;

  const LifestyleChoiceEntity({
    required this.id,
    required this.optionId,
    required this.valueEn,
    required this.valueAr,
  });

  @override
  List<Object?> get props => [id, optionId, valueEn, valueAr];
}
