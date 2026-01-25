import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/feedback_service.dart';
import '../../../../providers/quiz_providers.dart';
import '../../../../l10n/generated/app_localizations.dart';

class QuizCompleteView extends ConsumerStatefulWidget {
  final VoidCallback onPlayAgain;
  final VoidCallback onExit;

  const QuizCompleteView({
    super.key,
    required this.onPlayAgain,
    required this.onExit,
  });

  @override
  ConsumerState<QuizCompleteView> createState() => _QuizCompleteViewState();
}

class _QuizCompleteViewState extends ConsumerState<QuizCompleteView> {
  bool _feedbackTriggered = false;

  /// 퀴즈 완료 피드백 (점수 기반)
  /// 기준: 50% 이상 통과
  void _triggerFeedback(int accuracyPercent) {
    if (_feedbackTriggered) return;
    _feedbackTriggered = true;

    final isPassed = accuracyPercent >= 50;
    FeedbackService().onQuizComplete(isPassed: isPassed);
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(quizResultProvider);
    final l10n = AppLocalizations.of(context)!;

    if (result == null) {
      return Center(
        child: ElevatedButton(
          onPressed: widget.onExit,
          child: Text(l10n.backToHome),
        ),
      );
    }

    // 결과가 있을 때 피드백 재생 (한 번만)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _triggerFeedback(result.accuracyPercent);
    });

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Trophy icon
          Icon(
            _getTrophyIcon(result.accuracyPercent),
            size: 100,
            color: _getTrophyColor(result.accuracyPercent),
          ),
          const SizedBox(height: 24),

          // Title
          Text(
            l10n.quizComplete,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 32),

          // Score Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    l10n.yourScore,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.outOf(result.correctCount, result.totalCount),
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: _getScoreColor(result.accuracyPercent),
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${result.accuracyPercent}%',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: _getScoreColor(result.accuracyPercent),
                        ),
                  ),
                  const Divider(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.timer_outlined, size: 20),
                      const SizedBox(width: 8),
                      Text(result.durationText),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Message
          Text(
            _getMessage(result.accuracyPercent, l10n),
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: widget.onExit,
                  icon: const Icon(Icons.home),
                  label: Text(l10n.backToHome),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: widget.onPlayAgain,
                  icon: const Icon(Icons.replay),
                  label: Text(l10n.playAgain),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getTrophyIcon(int percent) {
    if (percent >= 90) return Icons.emoji_events;
    if (percent >= 70) return Icons.star;
    if (percent >= 50) return Icons.thumb_up;
    return Icons.school;
  }

  Color _getTrophyColor(int percent) {
    if (percent >= 90) return Colors.amber;
    if (percent >= 70) return Colors.blue;
    if (percent >= 50) return Colors.green;
    return Colors.grey;
  }

  Color _getScoreColor(int percent) {
    if (percent >= 70) return Colors.green;
    if (percent >= 50) return Colors.orange;
    return Colors.red;
  }

  String _getMessage(int percent, AppLocalizations l10n) {
    if (percent >= 90) return l10n.messageOutstanding;
    if (percent >= 70) return l10n.messageGreatJob;
    if (percent >= 50) return l10n.messageGoodEffort;
    return l10n.messageKeepLearning;
  }
}
