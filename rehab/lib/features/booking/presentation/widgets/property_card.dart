import 'package:flutter/material.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';

class PropertyCard extends StatelessWidget {
  final HomeEntity home;

  const PropertyCard({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: AppColors.secondary, blurRadius: 7)],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              home.imageUrl,
              width: 88,
              height: 88,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  home.title,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${home.city} - ${home.district}',
                  style: textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                Text('مؤثثة', style: TextStyle(color: colors.primary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
