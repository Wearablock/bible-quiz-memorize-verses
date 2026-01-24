import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/quiz_providers.dart';

class TimerDisplay extends ConsumerWidget {
  const TimerDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remainingTime = ref.watch(remainingTimeProvider);
    final isLowTime = remainingTime <= 10;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isLowTime ? Colors.red.shade100 : Colors.blue.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.timer,
            size: 18,
            color: isLowTime ? Colors.red : Colors.blue,
          ),
          const SizedBox(width: 4),
          Text(
            '${remainingTime}s',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isLowTime ? Colors.red : Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
