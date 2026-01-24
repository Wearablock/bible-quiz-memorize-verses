import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/database_providers.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'widgets/overall_stats_card.dart';
import 'widgets/category_stats_list.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.stats),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(overallStatsProvider);
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            OverallStatsCard(),
            SizedBox(height: 24),
            CategoryStatsList(),
          ],
        ),
      ),
    );
  }
}
