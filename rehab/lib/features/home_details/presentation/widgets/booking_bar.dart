
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';

class BookingBar extends StatelessWidget {
  final HomeEntity home;

  const BookingBar({required this.home});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 20),
      decoration: BoxDecoration(
        color: colors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 18,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          foregroundColor: AppColors.textPrimary,
        ),
       onPressed: home.isAvailable
    ? () {
        context.push(
          Routes.booking,
          extra: home,
        );
      }
    : null,
        child: const Text('احجز الآن'),
      ),
    );
  }
}
