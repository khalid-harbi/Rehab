import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/booking/domain/use_cases/booking_use_case.dart';
import 'package:rehab/features/booking/presentation/cubit/booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingUseCase _bookingUseCase;

  BookingCubit(this._bookingUseCase) : super(BookingInitialState());

  Future<void> createBookingMethod({
    required int homeId,
    required double amount,
    required int durationMonths,
    required String paymentId,
  }) async {
    emit(BookingLoadingState());

    final result = await _bookingUseCase.createBooking(
      homeId: homeId,
      amount: amount,
      durationMonths: durationMonths,
      paymentId: paymentId,
    );

    result.when(
      (success) {
        emit(BookingSuccessState());
      },
      (whenError) {
        emit(BookingErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }
}