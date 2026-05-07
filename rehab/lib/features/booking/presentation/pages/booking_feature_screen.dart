import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/features/booking/presentation/widgets/mounth_buttom.dart';
import 'package:rehab/features/booking/presentation/widgets/price_row.dart';
import 'package:rehab/features/booking/presentation/widgets/property_card.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';

class BookingFeatureScreen extends StatefulWidget {
  final HomeEntity home;

  const BookingFeatureScreen({
    super.key,
    required this.home,
  });

  @override
  State<BookingFeatureScreen> createState() => _BookingFeatureScreenState();
}

class _BookingFeatureScreenState extends State<BookingFeatureScreen> {
  int selectedMonths = 6;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final monthlyPrice = widget.home.price;
    final total = monthlyPrice * selectedMonths;

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: Column(
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
                    backgroundColor: Colors.white.withOpacity(.25),
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
                    PropertyCard(home: widget.home),

                    const SizedBox(height: 24),

                    Text(
                      'تاريخ الانتقال',
                      style: theme.textTheme.titleMedium,
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      textAlign: TextAlign.right,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: 'خمس / رمضان / هجري',
                        suffixIcon: Icon(Icons.calendar_month_outlined),
                        prefixIcon: Icon(Icons.calendar_today_outlined),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'مدة الإقامة',
                      style: theme.textTheme.titleMedium,
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        MonthButton(
                          title: '3 شهور',
                          value: 3,
                          selectedValue: selectedMonths,
                          onTap: () {
                            setState(() {
                              selectedMonths = 3;
                            });
                          },
                        ),
                        const SizedBox(width: 12),
                        MonthButton(
                          title: '6 شهور',
                          value: 6,
                          selectedValue: selectedMonths,
                          onTap: () {
                            setState(() {
                              selectedMonths = 6;
                            });
                          },
                        ),
                        const SizedBox(width: 12),
                        MonthButton(
                          title: '12 شهور',
                          value: 12,
                          selectedValue: selectedMonths,
                          onTap: () {
                            setState(() {
                              selectedMonths = 12;
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: colors.primary.withOpacity(.06),
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
                            value: '$selectedMonths شهور',
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
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('التالي'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

