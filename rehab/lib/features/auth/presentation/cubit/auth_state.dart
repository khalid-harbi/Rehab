import 'package:equatable/equatable.dart';
import 'package:rehab/core/constants/app_enums.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthSuccessState extends AuthState {
  final bool isLogin;

  /// دور صاحبة الجلسة — تحتاجه شاشة السبلاش لتوجّه المالكة إلى لوحتها
  /// بدل شاشة المستخدمة. null حين لا جلسة أو لا صف في `profiles`.
  final UserRole? role;

  const AuthSuccessState({required this.isLogin, this.role});
  @override
  List<Object?> get props => [isLogin, role];
}

class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
