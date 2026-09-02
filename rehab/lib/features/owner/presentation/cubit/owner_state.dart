import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/features/owner/domain/entities/owner_entity.dart';

abstract class OwnerState extends Equatable {
  const OwnerState();

  @override
  List<Object?> get props => [];
}

class OwnerInitialState extends OwnerState {
  const OwnerInitialState();
}

class OwnerLoadingState extends OwnerState {}

class OwnerSuccessState extends OwnerState {
  final OwnerEntity? owner;
  final List<HomeEntity> homes;

  /// خطأ عابر في تبديل إتاحة عقار — يُعرض كـ SnackBar فوق اللوحة بدل
  /// إسقاط الشاشة كلها إلى حالة خطأ.
  final String? toggleError;

  const OwnerSuccessState({
    this.owner,
    this.homes = const [],
    this.toggleError,
  });

  OwnerSuccessState copyWith({
    OwnerEntity? owner,
    List<HomeEntity>? homes,
    String? toggleError,
  }) {
    return OwnerSuccessState(
      owner: owner ?? this.owner,
      homes: homes ?? this.homes,
      // لا يُحمل الخطأ إلى الحالة التالية: يُعرض مرة واحدة ثم يُنسى.
      toggleError: toggleError,
    );
  }

  @override
  List<Object?> get props => [owner, homes, toggleError];
}

class OwnerErrorState extends OwnerState {
  final String message;

  const OwnerErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
