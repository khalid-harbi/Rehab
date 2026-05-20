import 'package:equatable/equatable.dart';

class OwnerEntity extends Equatable {
  final double totalRevenue;
  final int propertyCount;
  final int paidBookingsCount;
  const OwnerEntity({
    required this.totalRevenue,
    required this.propertyCount,
    required this.paidBookingsCount,
  });

  @override
  List<Object?> get props => [totalRevenue];
}
