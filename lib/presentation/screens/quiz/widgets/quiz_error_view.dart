import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/quiz_providers.dart';
import '../../../../l10n/generated/app_localizations.dart';

class QuizErrorView extends ConsumerWidget {
  final VoidCallback onRetry;
  final VoidCallback onExit;

  const QuizErrorView({
    super.key,
    required this.onRetry,
    required this.onExit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizProvider);
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 80, color: Colors.red),
            const SizedBox(height: 24),
            Text(
              l10n.oopsSomethingWentWrong,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              state.errorMessage ?? 'Unknown error',
              style: TextStyle(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: onExit,
                  child: Text(l10n.goBack),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: onRetry,
                  child: Text(l10n.tryAgain),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
