import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:rehab/features/booking/presentation/widgets/month_buttom.dart';
import 'package:rehab/features/booking/presentation/widgets/price_row.dart';
import 'package:rehab/features/booking/presentation/widgets/property_card.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';

class BookingFeatureScreen extends HookWidget {
  final HomeEntity home;

  const BookingFeatureScreen({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    // Hooks for state management
    final selectedMonths = useState<int>(6);
    final moveInDate = useState<DateTime?>(null);
    final dateController = useTextEditingController();
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final monthlyPrice = home.price;
    final total = monthlyPrice * selectedMonths.value;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white.withAlpha(26),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    color: Colors.white,
                    onPressed: () => context.pop(),
                  ),
                ),

                const Spacer(),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Gap(20),

                    Text(
                      'إتمام الحجز',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      'الخطوة 1 من 3',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PropertyCard(home: home),

                  Gap(24),

                  Text('تاريخ الانتقال', style: theme.textTheme.titleMedium),

                  Gap(8),

                  TextFormField(
                    controller: dateController,
                    textAlign: TextAlign.right,
                    readOnly: true,
                    onTap: () async {
                      // Get the current date to prevent booking in the past
                      final now = DateTime.now();

                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: moveInDate.value ?? now,
                        firstDate: now,
                        // Allow booking up to 2 years in advance
                        lastDate: DateTime(now.year + 2),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: colors.primary,
                                onPrimary: Colors.white,
                                onSurface: colors.onSurface,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (pickedDate != null) {
                        moveInDate.value = pickedDate;
                        // Format the date to match the hint text style (DD / MM / YYYY)
                        dateController.text =
                            '${pickedDate.day} / ${pickedDate.month} / ${pickedDate.year}';
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'اليوم / الشهر / السنة',
                      suffixIcon: Icon(Icons.calendar_month_outlined),
                      prefixIcon: Icon(Icons.calendar_today_outlined),
                    ),
                  ),

                  // ==========================================
                  Gap(20),

                  Text('مدة الإقامة', style: theme.textTheme.titleMedium),

                  Gap(12),

                  Row(
                    children: [
                      MonthButton(
                        title: '3 شهور',
                        value: 3,
                        selectedValue: selectedMonths.value,
                        onTap: () {
                          selectedMonths.value = 3;
                        },
                      ),

                      Gap(12),

                      MonthButton(
                        title: '6 شهور',
                        value: 6,
                        selectedValue: selectedMonths.value,
                        onTap: () {
                          selectedMonths.value = 6;
                        },
                      ),

                      Gap(12),

                      MonthButton(
                        title: '12 شهور',
                        value: 12,
                        selectedValue: selectedMonths.value,
                        onTap: () {
                          selectedMonths.value = 12;
                        },
                      ),
                    ],
                  ),

                  Gap(24),

                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: colors.primary.withAlpha(26),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        PriceRow(
                          title: 'الإيجار الشهري',
                          value: '${monthlyPrice.toStringAsFixed(0)} ريال',
                        ),

                        PriceRow(
                          title: 'مدة الإقامة',
                          value: '${selectedMonths.value} شهور',
                        ),

                        PriceRow(
                          title: 'التأمين',
                          value: '${monthlyPrice.toStringAsFixed(0)} ريال',
                        ),

                        const Divider(height: 28),

                        PriceRow(
                          title: 'الإجمالي',
                          value: '${total.toStringAsFixed(0)} ريال',
                          isTotal: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  context.showPaymentBottomSheet(
                    amount: total,
                    description: 'Booking for ${home.titleAr}',
                    onPaid: () async {
                      debugPrint(' ON PAID STARTED');

                      try {
                        await context.read<BookingCubit>().createBookingMethod(
                          homeId: home.id,
                          amount: total,
                          durationMonths: selectedMonths.value,
                          paymentId: 'moyasar_test_payment',
                        );

                        debugPrint(' BOOKING SAVED');

                        if (context.mounted) {
                          context.showSnackBar('تم الدفع وإتمام الحجز بنجاح');
                          context.pop();
                        }
                      } catch (error) {
                        debugPrint(' BOOKING ERROR: $error');

                        if (context.mounted) {
                          context.showSnackBar('فشل حفظ الحجز', isError: true);
                        }
                      }
                    },
                  );
                },
                child: Text("اتمام الحجز "),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
