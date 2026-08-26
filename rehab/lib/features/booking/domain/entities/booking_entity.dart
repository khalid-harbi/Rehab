import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  final String id;
  final String seekerId;
  final String ownerId;
  final int homeId;
  final double amount;
  final int durationMonths;
  final String paymentId;
  final String status;

  const BookingEntity({
    required this.id,
    required this.seekerId,
    required this.ownerId,
    required this.homeId,
    required this.amount,
    required this.durationMonths,
    required this.paymentId,
    required this.status,
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
  ];
}
