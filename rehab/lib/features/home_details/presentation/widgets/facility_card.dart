import 'package:flutter/material.dart';

class FacilityCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const FacilityCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.primary),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 17,
            backgroundColor: colors.primary,
            child: Icon(icon, size: 18, color: colors.onSurface),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
