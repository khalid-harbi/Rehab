import 'dart:ui';
import 'package:flutter/material.dart';

class HeartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    // Start at the top center dip of the heart (moved slightly higher)
    path.moveTo(width / 2, height * 0.30);

    // Left curve down to the bottom tip
    path.cubicTo(
      0.0,
      0.0, // Pulls the top-left shoulder up and out
      0.0,
      height * 0.65, // Creates the plump curve on the left side
      width / 2,
      height * 0.95, // Ends at the bottom point
    );

    // Right curve back up to the top dip
    path.cubicTo(
      width,
      height * 0.65, // Creates the plump curve on the right side
      width,
      0.0, // Pulls the top-right shoulder up and out
      width / 2,
      height * 0.30, // Ends back at the starting center dip
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false; // Or return true if size changes dynamically
}
