import 'package:equatable/equatable.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';

class MyBookingsEntity extends Equatable {
  final String id;

  final String seekerId;

  final String ownerId;

  final int homeId;

  final double amount;

  final int durationMonths;

  final String paymentId;

  final String status;

  final HomeEntity home;

  const MyBookingsEntity({
    required this.id,
    required this.seekerId,
    required this.ownerId,
    required this.homeId,
    required this.amount,
    required this.durationMonths,
    required this.paymentId,
    required this.status,
    required this.home,
  });

  @override
  List<Object?> get props => [
    id,
    seekerId,
    ownerId,
    homeId,
    amount,
    durationMonths,
    paymentId,
    status,
    home,
  ];
}
