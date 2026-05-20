import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final bool isAvailable;

  const StatusBadge({super.key, required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isAvailable ? 'متاح للحجز الآن' : 'غير متاح حاليًا',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
