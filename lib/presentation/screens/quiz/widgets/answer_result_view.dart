import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

                    // Bible Verse Section
                    if (question.fullVerse != null ||
                        question.verseRef != null) ...[
                      const Divider(height: 24),
                      _buildVerseSection(context, question),
                    ],

                    // Explanation
                    if (question.explanation != null) ...[
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.lightbulb_outline,
                              color: Colors.amber.shade700, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              question.explanation!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
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

  Widget _buildVerseSection(BuildContext context, question) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Verse Reference (e.g., John 3:16)
          if (question.verseRef != null)
            Row(
              children: [
                Icon(
                  Icons.menu_book,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    question.verseRef!,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Copy button
                if (question.fullVerse != null)
                  IconButton(
                    icon: const Icon(Icons.copy, size: 20),
                    onPressed: () => _copyVerse(context, question),
                    tooltip: 'Copy',
                    visualDensity: VisualDensity.compact,
                  ),
              ],
            ),

          // Full Verse Text
          if (question.fullVerse != null) ...[
            const SizedBox(height: 12),
            Text(
              '"${question.fullVerse!}"',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _copyVerse(BuildContext context, question) {
    final text = '${question.fullVerse ?? ''}\n- ${question.verseRef ?? ''}';
    Clipboard.setData(ClipboardData(text: text.trim()));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Verse copied'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
