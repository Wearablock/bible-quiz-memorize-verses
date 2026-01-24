import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatelessWidget {
  final double value;
  final Color? backgroundColor;
  final Color? valueColor;
  final double height;

  const AnimatedProgressBar({
    super.key,
    required this.value,
    this.backgroundColor,
    this.valueColor,
    this.height = 8,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: SizedBox(
        height: height,
        child: LinearProgressIndicator(
          value: value.clamp(0.0, 1.0),
          backgroundColor: backgroundColor ?? theme.colorScheme.surfaceContainerHighest,
          valueColor: AlwaysStoppedAnimation(
            valueColor ?? theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
