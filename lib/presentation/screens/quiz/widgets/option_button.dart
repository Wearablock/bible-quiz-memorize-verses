import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool? isCorrect;
  final bool isSelected;
  final bool showResult;

  const OptionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isCorrect,
    this.isSelected = false,
    this.showResult = false,
  });

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    Color? borderColor;
    Color textColor = Theme.of(context).colorScheme.onSurface;

    if (showResult) {
      if (isCorrect == true) {
        backgroundColor = Colors.green.shade50;
        borderColor = Colors.green;
        textColor = Colors.green.shade900;
      } else if (isSelected && isCorrect == false) {
        backgroundColor = Colors.red.shade50;
        borderColor = Colors.red;
        textColor = Colors.red.shade900;
      }
    }

    return Material(
      color: backgroundColor ?? Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: showResult ? null : onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? Theme.of(context).colorScheme.outline,
              width: borderColor != null ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: showResult && (isCorrect == true || isSelected)
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
              if (showResult && isCorrect == true)
                const Icon(Icons.check_circle, color: Colors.green)
              else if (showResult && isSelected && isCorrect == false)
                const Icon(Icons.cancel, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
