import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/booking/domain/use_cases/booking_use_case.dart';
import 'package:rehab/features/booking/presentation/cubit/booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingUseCase _bookingUseCase;

  BookingCubit(this._bookingUseCase) : super(BookingInitialState());

  Future<void> getBookingMethod() async {
    final result = await _bookingUseCase.getBooking();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
