import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/category.dart';
import '../../../providers/repository_providers.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../quiz/quiz_screen.dart';
import '../quiz/quiz_mode.dart';
import 'widgets/category_card.dart';
import 'widgets/quick_quiz_card.dart';
import 'widgets/stats_summary_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final categories = ref.watch(categoriesProvider);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              floating: true,
              title: Text(l10n.appTitle),
              actions: [
                IconButton(
                  icon: const Icon(Icons.leaderboard_outlined),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.leaderboardComingSoon)),
                    );
                  },
                ),
              ],
            ),

            // Content
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Quick Quiz Card
                  QuickQuizCard(
                    onTap: () => _startQuickQuiz(context, ref),
                  ),
                  const SizedBox(height: 24),

                  // Stats Summary
                  const StatsSummaryCard(),
                  const SizedBox(height: 24),

                  // Categories Header
                  Text(
                    l10n.categories,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                ]),
              ),
            ),

            // Categories Grid
            categories.when(
              data: (list) => SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.2,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final category = list[index];
                      return CategoryCard(
                        category: category,
                        onTap: () => _startCategoryQuiz(context, ref, category),
                      );
                    },
                    childCount: list.length,
                  ),
                ),
              ),
              loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, _) => SliverFillRemaining(
                child: Center(child: Text('Error: $e')),
              ),
            ),

            // Bottom padding
            const SliverPadding(padding: EdgeInsets.only(bottom: 16)),
          ],
        ),
      ),
    );
  }

  void _startQuickQuiz(BuildContext context, WidgetRef ref) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const QuizScreen(mode: QuizMode.random),
      ),
    );
  }

  void _startCategoryQuiz(
      BuildContext context, WidgetRef ref, Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(
          mode: QuizMode.category,
          categoryId: category.id,
        ),
      ),
    );
  }
}
