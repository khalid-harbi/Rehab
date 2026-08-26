import 'package:equatable/equatable.dart';
import 'package:rehab/features/ads/domain/entities/ad_entity.dart';

abstract class AdsState extends Equatable {
  const AdsState();

  @override
  List<Object?> get props => [];
}

class AdsInitialState extends AdsState {}

class AdsLoadingState extends AdsState {}

class AdsSuccessState extends AdsState {
  final List<AdEntity> ads;
  const AdsSuccessState({required this.ads});

  @override
  List<Object?> get props => [ads];
}

class AdsErrorState extends AdsState {
  final String message;
  const AdsErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
