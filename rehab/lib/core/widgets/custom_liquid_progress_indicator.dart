import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:rehab/core/utils/heart_clipper.dart';

class CustomLiquidProgressIndicator extends StatefulWidget {
  final int matchPercentage;
  const CustomLiquidProgressIndicator({
    super.key,
    required this.matchPercentage,
  });

  @override
  State<CustomLiquidProgressIndicator> createState() =>
      _CustomLiquidProgressIndicatorState();
}

class _CustomLiquidProgressIndicatorState
    extends State<CustomLiquidProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    // Convert percentage to a decimal between 0.0 and 1.0
    final double percentValue = widget.matchPercentage / 100.0;

    return SizedBox(
      height: 160,
      width: 160,
      child: LiquidCustomProgressIndicator(
        value: percentValue,
        valueColor: const AlwaysStoppedAnimation(Colors.red),
        backgroundColor: Colors.red.withAlpha(50),
        direction: Axis.vertical,
        shapePath: HeartClipper().getClip(const Size(160, 160)),
        center: Text(
          '${widget.matchPercentage}%',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
