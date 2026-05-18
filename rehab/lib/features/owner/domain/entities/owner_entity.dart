import 'package:equatable/equatable.dart';

class OwnerEntity extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final double totalRevenue;

  const OwnerEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.totalRevenue,
    
  });

  @override
  List<Object?> get props => [firstName, lastName, id , totalRevenue];
}
