
import 'dart:ui';

import 'package:flutter/material.dart';

class MonthButton extends StatelessWidget {
  final String title;
  final int value;
  final int selectedValue;
  final VoidCallback onTap;

  const MonthButton({
    required this.title,
    required this.value,
    required this.selectedValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isSelected = value == selectedValue;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? colors.primary : colors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: colors.primary),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : colors.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}