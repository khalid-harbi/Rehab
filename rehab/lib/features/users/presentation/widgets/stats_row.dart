import 'package:flutter/material.dart';
import 'package:rehab/features/users/presentation/widgets/stats_item.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatItem(
            icon: Icons.star,
            color: Colors.amber,
            value: '5.0',
            label: 'Rating',
          ),
          StatItem(
            icon: Icons.flag,
            color: Colors.blue,
            value: '\$99',
            label: 'Hours',
          ),
          StatItem(
            icon: Icons.access_time_filled,
            color: Colors.purple,
            value: '12',
            label: 'Month',
          ),
        ],
      ),
    );
  }
}
