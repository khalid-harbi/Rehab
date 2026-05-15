import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final bool isLogin;
  final bool? isUser;
  

  const AuthEntity({required this.isLogin, this.isUser});

  @override
  List<Object?> get props => [isLogin, isUser];
}
