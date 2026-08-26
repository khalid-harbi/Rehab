import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/features/my_bookings/domain/use_cases/my_bookings_use_case.dart';
import 'package:rehab/features/my_bookings/presentation/cubit/my_bookings_state.dart';

@injectable
class MyBookingsCubit extends Cubit<MyBookingsState> {
  final MyBookingsUseCase _myBookingsUseCase;

  MyBookingsCubit(this._myBookingsUseCase) : super(MyBookingsInitialState());

  Future<void> getMyBookingsMethod() async {
    emit(MyBookingsLoadingState());

    final result = await _myBookingsUseCase.getMyBookings();

    result.when(
      (success) {
        emit(MyBookingsSuccessState(bookings: success));
      },
      (whenError) {
        emit(MyBookingsErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
