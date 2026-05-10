
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: DefaultTextStyle.merge(
        style: const TextStyle(color: Colors.white),
        child: const Text(
        'المكان جميل وهادئ، مناسب جدًا للسكن وموقعه قريب من الخدمات.',
        ),
      ),
    );
  }
}
