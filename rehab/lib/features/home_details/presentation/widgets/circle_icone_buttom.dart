import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CircleIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return CircleAvatar(
      backgroundColor: colors.surface,
      child: IconButton(
        icon: Icon(icon, color: colors.onSurface),
        onPressed: onTap,
      ),
    );
  }
}
