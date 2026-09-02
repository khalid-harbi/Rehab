import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/my_bookings/presentation/cubit/my_bookings_cubit.dart';
import 'package:rehab/features/my_bookings/presentation/cubit/my_bookings_state.dart';

class MyBookingsFeatureScreen extends StatelessWidget {
  const MyBookingsFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حجوزاتي')),
      body: BlocBuilder<MyBookingsCubit, MyBookingsState>(
        builder: (context, state) {
          if (state is MyBookingsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MyBookingsErrorState) {
            return Center(child: Text(state.message));
          }

          if (state is MyBookingsSuccessState) {
            if (state.bookings.isEmpty) {
              return const Center(child: Text('لا توجد حجوزات حتى الآن'));
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.bookings.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final booking = state.bookings[index];
                final home = booking.home;

                return Card(
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        home.imageUrls[0],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey[200],
                            child: const Icon(
                              Icons.image_not_supported,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                    title: Text(home.titleAr),
                    subtitle: Text(
                      '${booking.durationMonths} شهور - ${booking.amount.toStringAsFixed(0)} ريال',
                    ),
                    trailing: Text(
                      booking.status,
                      style: TextStyle(color: Colors.green, fontWeight: .bold),
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
