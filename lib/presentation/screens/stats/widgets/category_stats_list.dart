import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../providers/repository_providers.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../widgets/common/animated_progress_bar.dart';

class CategoryStatsList extends ConsumerWidget {
  const CategoryStatsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final categories = ref.watch(categoriesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.categoryProgress,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        categories.when(
          data: (list) => Column(
            children: list.map((category) {
              return _CategoryStatTile(
                categoryId: category.id,
                categoryName: category.getName(
                  Localizations.localeOf(context).languageCode,
                ),
              );
            }).toList(),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text('Error: $e'),
        ),
      ],
    );
  }
}

class _CategoryStatTile extends ConsumerWidget {
  final String categoryId;
  final String categoryName;

  const _CategoryStatTile({
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final color = AppColors.getCategoryColor(categoryId);

    return FutureBuilder(
      future: ref.read(quizHistoryRepositoryProvider).getCategoryStats(categoryId),
      builder: (context, snapshot) {
        final stats = snapshot.data;
        final answered = stats?.totalAnswered ?? 0;
        final accuracy = stats?.accuracyPercent ?? 0;

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        categoryName,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Text(
                      '$answered ${l10n.answered.toLowerCase()}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: AnimatedProgressBar(
                        value: accuracy / 100,
                        valueColor: color,
                        height: 8,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '$accuracy%',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
