import 'package:equatable/equatable.dart';

class GoogleLogInEntity extends Equatable {
  final int id;

  final String name;
  final String email;
  final String? imageUrl;

  const GoogleLogInEntity({
    required this.id,
    required this.name,
    required this.email,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [name, email, imageUrl];
}
