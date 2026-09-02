import 'package:equatable/equatable.dart';
import 'package:rehab/core/constants/app_enums.dart';

class AuthEntity extends Equatable {
  final bool isLogin;
  final bool? isUser;

  /// دور صاحبة الجلسة الحالية.
  ///
  /// كان مفقودًا تمامًا، فشاشة السبلاش لا تعرف إن كانت الجلسة المحفوظة
  /// لمالكة أو لباحثة عن سكن — وتُرسل الجميع إلى شاشة المستخدمة.
  /// يبقى null حين لا توجد جلسة، أو حين لا صف لها في `profiles`.
  final UserRole? role;

  const AuthEntity({required this.isLogin, this.isUser, this.role});

  @override
  List<Object?> get props => [isLogin, isUser, role];
}
