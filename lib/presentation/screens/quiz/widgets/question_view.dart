import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../providers/quiz_providers.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../widgets/common/animated_progress_bar.dart';
import 'option_button.dart';
import 'hint_section.dart';
import 'timer_display.dart';

class QuestionView extends ConsumerWidget {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizProvider);
    final question = state.currentQuestion;
    final options = state.currentOptions;
    final l10n = AppLocalizations.of(context)!;

    if (question == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Progress & Timer Row
          Row(
            children: [
              // Progress text
              Text(
                l10n.question(state.currentNumber, state.totalCount),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              // Timer
              if (state.timerEnabled) const TimerDisplay(),
            ],
          ),
          const SizedBox(height: 8),

          // Progress bar
          AnimatedProgressBar(
            value: state.progress,
            valueColor: AppColors.getCategoryColor(question.categoryId),
          ),
          const SizedBox(height: 24),

          // Question Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    question.question,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const HintSection(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Options
          Expanded(
            child: ListView.separated(
              itemCount: options.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return OptionButton(
                  text: options[index],
                  onPressed: () {
                    ref.read(quizProvider.notifier).selectAnswer(options[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
