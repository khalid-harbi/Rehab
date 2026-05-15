import 'package:flutter/material.dart';

class PolicyItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const PolicyItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, color: colors.primary, size: 20),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
    );
  }
}
