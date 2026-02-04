import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/database_providers.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../widgets/common/animated_progress_bar.dart';

class OverallStatsCard extends ConsumerWidget {
  const OverallStatsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final stats = ref.watch(overallStatsProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: stats.when(
          data: (data) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.overallProgress,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),

              // Main stats row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _StatColumn(
                    value: '${data.totalAnswered}',
                    label: l10n.answered,
                    icon: Icons.quiz,
                    color: Colors.blue,
                  ),
                  _StatColumn(
                    value: '${data.correctCount}',
                    label: l10n.correct,
                    icon: Icons.check_circle,
                    color: Colors.green,
                  ),
                  _StatColumn(
                    value: '${data.accuracyPercent}%',
                    label: l10n.accuracy,
                    icon: Icons.percent,
                    color: Colors.purple,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Accuracy bar
              Text(l10n.accuracyRate,
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 8),
              AnimatedProgressBar(
                value: data.accuracyPercent / 100,
                valueColor: _getAccuracyColor(data.accuracyPercent),
                height: 12,
              ),
            ],
          ),
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: CircularProgressIndicator(),
            ),
          ),
          error: (e, _) => Center(child: Text('Error: $e')),
        ),
      ),
    );
  }

  Color _getAccuracyColor(int percent) {
    if (percent >= 70) return Colors.green;
    if (percent >= 50) return Colors.orange;
    return Colors.red;
  }
}

class _StatColumn extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color color;

  const _StatColumn({
    required this.value,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ],
    );
  }
}
