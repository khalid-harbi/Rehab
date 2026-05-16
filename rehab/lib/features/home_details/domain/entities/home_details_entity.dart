import 'package:equatable/equatable.dart';

class HomeDetailsEntity extends Equatable {
  final String policy ; 

  const HomeDetailsEntity({
   required this.policy
  });

  @override
  List<Object?> get props => [policy];
}
