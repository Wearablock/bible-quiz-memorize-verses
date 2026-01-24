import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/feedback_service.dart';
import '../../../../providers/quiz_providers.dart';
import '../../../../l10n/generated/app_localizations.dart';
import 'option_button.dart';

class AnswerResultView extends ConsumerStatefulWidget {
  const AnswerResultView({super.key});

  @override
  ConsumerState<AnswerResultView> createState() => _AnswerResultViewState();
}

class _AnswerResultViewState extends ConsumerState<AnswerResultView> {
  bool _feedbackTriggered = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _triggerFeedback();
  }

  void _triggerFeedback() {
    if (_feedbackTriggered) return;
    _feedbackTriggered = true;

    final state = ref.read(quizProvider);
    final feedback = FeedbackService();

    if (state.isCorrect) {
      feedback.onCorrectAnswer();
    } else {
      feedback.onWrongAnswer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizProvider);
    final question = state.currentQuestion;
    final l10n = AppLocalizations.of(context)!;

    if (question == null) return const SizedBox.shrink();

    final isCorrect = state.isCorrect;
    final selectedAnswer = state.selectedAnswer;
    final isLastQuestion = state.currentNumber >= state.totalCount;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Result Header
          Icon(
            isCorrect ? Icons.check_circle : Icons.cancel,
            size: 72,
            color: isCorrect ? Colors.green : Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            isCorrect
                ? l10n.correctAnswer
                : (selectedAnswer == null ? l10n.timeUp : l10n.wrongAnswer),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: isCorrect ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Question & Answers
          Expanded(
            child: Card(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.question,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),

                    // Answer options with result
                    ...state.currentOptions.map((option) {
                      final isThisCorrect = option == question.correct;
                      final isThisSelected = option == selectedAnswer;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: OptionButton(
                          text: option,
                          onPressed: () {},
                          isCorrect: isThisCorrect,
                          isSelected: isThisSelected,
                          showResult: true,
                        ),
                      );
                    }),

                    // Explanation
                    if (question.explanation != null) ...[
                      const Divider(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.info_outline,
                              color: Colors.grey.shade600, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              question.explanation!,
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Next Button
          ElevatedButton(
            onPressed: () {
              ref.read(quizProvider.notifier).nextQuestion();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(isLastQuestion ? l10n.finish : l10n.next),
          ),
        ],
      ),
    );
  }
}
