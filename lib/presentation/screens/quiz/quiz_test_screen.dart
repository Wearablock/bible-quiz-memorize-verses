import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/quiz/quiz_state.dart';
import '../../../providers/quiz_providers.dart';

/// 퀴즈 로직 테스트용 화면
class QuizTestScreen extends ConsumerWidget {
  const QuizTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phase = ref.watch(quizPhaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Test'),
        actions: [
          if (phase == QuizPhase.answering || phase == QuizPhase.answered)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                ref.read(quizProvider.notifier).quitQuiz();
              },
            ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: switch (phase) {
            QuizPhase.initial => _InitialView(ref: ref),
            QuizPhase.loading => const _LoadingView(),
            QuizPhase.answering => _AnsweringView(ref: ref),
            QuizPhase.answered => _AnsweredView(ref: ref),
            QuizPhase.completed => _CompletedView(ref: ref),
            QuizPhase.error => _ErrorView(ref: ref),
          },
        ),
      ),
    );
  }
}

/// 초기 화면 - 퀴즈 시작 버튼
class _InitialView extends StatelessWidget {
  final WidgetRef ref;

  const _InitialView({required this.ref});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.quiz, size: 80, color: Colors.blue),
          const SizedBox(height: 24),
          const Text(
            'Quiz Logic Test',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Select a quiz mode to start',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 32),

          // 카테고리별 퀴즈
          _QuizModeButton(
            title: 'Geography Quiz',
            subtitle: '5 questions',
            icon: Icons.public,
            onPressed: () {
              final locale = Localizations.localeOf(context).toString();
              ref.read(quizProvider.notifier).startCategoryQuiz(
                    categoryId: 'geography',
                    locale: locale,
                    questionCount: 5,
                  );
            },
          ),
          const SizedBox(height: 12),

          // 랜덤 퀴즈
          _QuizModeButton(
            title: 'Random Quiz',
            subtitle: '5 questions from all categories',
            icon: Icons.shuffle,
            onPressed: () {
              final locale = Localizations.localeOf(context).toString();
              ref.read(quizProvider.notifier).startRandomQuiz(
                    locale: locale,
                    questionCount: 5,
                  );
            },
          ),
          const SizedBox(height: 12),

          // 타이머 없이 테스트
          _QuizModeButton(
            title: 'No Timer Quiz',
            subtitle: 'Geography, no time limit',
            icon: Icons.timer_off,
            onPressed: () {
              ref.read(quizConfigProvider.notifier).state = const QuizConfig(
                timerEnabled: false,
              );
              final locale = Localizations.localeOf(context).toString();
              ref.read(quizProvider.notifier).startCategoryQuiz(
                    categoryId: 'geography',
                    locale: locale,
                    questionCount: 5,
                  );
            },
          ),
        ],
      ),
    );
  }
}

class _QuizModeButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuizModeButton({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 로딩 화면
class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading questions...'),
        ],
      ),
    );
  }
}

/// 문제 풀이 화면
class _AnsweringView extends StatelessWidget {
  final WidgetRef ref;

  const _AnsweringView({required this.ref});

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizProvider);
    final question = state.currentQuestion;
    final options = state.currentOptions;
    final timerProgress = ref.watch(timerProgressProvider);
    final remainingTime = ref.watch(remainingTimeProvider);
    final canUseHint = ref.watch(canUseHintProvider);
    final hintText = ref.watch(hintTextProvider);

    if (question == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 진행 상황 & 타이머
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Question ${state.currentNumber}/${state.totalCount}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (state.timerEnabled)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: remainingTime <= 10 ? Colors.red.shade100 : Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '${remainingTime}s',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: remainingTime <= 10 ? Colors.red : Colors.blue,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),

        // 타이머 바
        if (state.timerEnabled)
          LinearProgressIndicator(
            value: timerProgress,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation(
              timerProgress > 0.3 ? Colors.blue : Colors.red,
            ),
          ),
        const SizedBox(height: 24),

        // 문제
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  question.question,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                // 힌트 버튼
                if (canUseHint) ...[
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: () {
                      // 실제 앱에서는 여기서 보상형 광고를 표시
                      // 테스트용으로 바로 힌트 사용
                      ref.read(quizProvider.notifier).useHint();
                    },
                    icon: const Icon(Icons.lightbulb_outline),
                    label: const Text('Show Hint (Ad)'),
                  ),
                ],
                // 힌트 표시
                if (hintText != null) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.lightbulb, color: Colors.amber),
                        const SizedBox(width: 8),
                        Expanded(child: Text(hintText)),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        // 선택지
        Expanded(
          child: ListView.separated(
            itemCount: options.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final option = options[index];
              return _OptionButton(
                text: option,
                onPressed: () {
                  ref.read(quizProvider.notifier).selectAnswer(option);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _OptionButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 2,
        ),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

/// 답변 후 결과 화면
class _AnsweredView extends StatelessWidget {
  final WidgetRef ref;

  const _AnsweredView({required this.ref});

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizProvider);
    final question = state.currentQuestion;
    final isCorrect = state.isCorrect;
    final selectedAnswer = state.selectedAnswer;

    if (question == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 결과 아이콘
        Icon(
          isCorrect ? Icons.check_circle : Icons.cancel,
          size: 80,
          color: isCorrect ? Colors.green : Colors.red,
        ),
        const SizedBox(height: 16),
        Text(
          isCorrect ? 'Correct!' : (selectedAnswer == null ? 'Time Up!' : 'Wrong!'),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isCorrect ? Colors.green : Colors.red,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),

        // 정답 표시
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.question,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                if (selectedAnswer != null && !isCorrect)
                  _AnswerRow(
                    label: 'Your answer',
                    answer: selectedAnswer,
                    isCorrect: false,
                  ),
                _AnswerRow(
                  label: 'Correct answer',
                  answer: question.correct,
                  isCorrect: true,
                ),
                if (question.explanation != null) ...[
                  const Divider(height: 24),
                  Text(
                    question.explanation!,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ],
            ),
          ),
        ),
        const Spacer(),

        // 다음 버튼
        ElevatedButton(
          onPressed: () {
            ref.read(quizProvider.notifier).nextQuestion();
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            state.session!.currentIndex + 1 >= state.session!.totalCount
                ? 'See Results'
                : 'Next Question',
          ),
        ),
      ],
    );
  }
}

class _AnswerRow extends StatelessWidget {
  final String label;
  final String answer;
  final bool isCorrect;

  const _AnswerRow({
    required this.label,
    required this.answer,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            isCorrect ? Icons.check : Icons.close,
            size: 20,
            color: isCorrect ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(answer)),
        ],
      ),
    );
  }
}

/// 완료 화면
class _CompletedView extends StatelessWidget {
  final WidgetRef ref;

  const _CompletedView({required this.ref});

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(quizResultProvider);

    if (result == null) {
      return Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(quizProvider.notifier).reset();
          },
          child: const Text('Start New Quiz'),
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.emoji_events, size: 80, color: Colors.amber),
          const SizedBox(height: 24),
          const Text(
            'Quiz Complete!',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),

          // 결과 카드
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _ResultRow(label: 'Score', value: '${result.correctCount}/${result.totalCount}'),
                  const Divider(height: 24),
                  _ResultRow(label: 'Accuracy', value: '${result.accuracyPercent}%'),
                  const Divider(height: 24),
                  _ResultRow(label: 'Time', value: result.durationText),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 메시지
          Text(
            _getResultMessage(result.accuracyPercent),
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 32),

          // 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  ref.read(quizConfigProvider.notifier).state = const QuizConfig();
                  ref.read(quizProvider.notifier).reset();
                },
                icon: const Icon(Icons.replay),
                label: const Text('Try Again'),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getResultMessage(int percent) {
    if (percent >= 90) return 'Perfect! 🎉';
    if (percent >= 70) return 'Great job! 👏';
    if (percent >= 50) return 'Good effort! 💪';
    return 'Keep practicing! 📚';
  }
}

class _ResultRow extends StatelessWidget {
  final String label;
  final String value;

  const _ResultRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

/// 에러 화면
class _ErrorView extends StatelessWidget {
  final WidgetRef ref;

  const _ErrorView({required this.ref});

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 80, color: Colors.red),
          const SizedBox(height: 24),
          const Text(
            'Oops! Something went wrong',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            state.errorMessage ?? 'Unknown error',
            style: TextStyle(color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              ref.read(quizProvider.notifier).reset();
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
