import 'package:equatable/equatable.dart';

class OwnerEntity extends Equatable {
  final double totalRevenue;

  const OwnerEntity({
    required this.totalRevenue,
    
  });

  @override
  List<Object?> get props => [ totalRevenue];
}
