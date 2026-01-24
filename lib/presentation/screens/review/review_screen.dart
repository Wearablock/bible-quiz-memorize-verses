import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/repository_providers.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../quiz/quiz_screen.dart';
import '../quiz/quiz_mode.dart';
import 'widgets/wrong_answer_tile.dart';

class ReviewScreen extends ConsumerWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.review),
      ),
      body: FutureBuilder<List<String>>(
        future: ref.read(quizHistoryRepositoryProvider).getWrongQuestionIds(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final wrongIds = snapshot.data ?? [];

          if (wrongIds.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.celebration,
                      size: 80, color: Colors.green.shade300),
                  const SizedBox(height: 16),
                  Text(
                    l10n.noWrongAnswers,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.youreDoingGreat,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              // Review button
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuizScreen(
                          mode: QuizMode.review,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: Text('${l10n.reviewAll} (${wrongIds.length})'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                ),
              ),

              // Wrong answers list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: wrongIds.length,
                  itemBuilder: (context, index) {
                    return WrongAnswerTile(questionId: wrongIds[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
