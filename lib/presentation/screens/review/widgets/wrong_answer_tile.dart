import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/generated/app_localizations.dart';

class WrongAnswerTile extends StatelessWidget {
  final String questionId;

  const WrongAnswerTile({
    super.key,
    required this.questionId,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final categoryId = _extractCategoryId(questionId);
    final color = AppColors.getCategoryColor(categoryId);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getCategoryIcon(categoryId),
            color: color,
            size: 20,
          ),
        ),
        title: Text(
          _getCategoryName(categoryId, l10n),
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          questionId,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey,
              ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }

  String _extractCategoryId(String questionId) {
    const prefixMap = {
      'q_geo_': 'geography',
      'q_his_': 'history',
      'q_sci_': 'science',
      'q_art_': 'arts',
      'q_spo_': 'sports',
      'q_nat_': 'nature',
      'q_tec_': 'technology',
      'q_foo_': 'food',
    };

    for (final entry in prefixMap.entries) {
      if (questionId.startsWith(entry.key)) {
        return entry.value;
      }
    }
    return 'unknown';
  }

  String _getCategoryName(String categoryId, AppLocalizations l10n) {
    switch (categoryId) {
      case 'geography':
        return l10n.categoryGeography;
      case 'history':
        return l10n.categoryHistory;
      case 'science':
        return l10n.categoryScience;
      case 'arts':
        return l10n.categoryArts;
      case 'sports':
        return l10n.categorySports;
      case 'nature':
        return l10n.categoryNature;
      case 'technology':
        return l10n.categoryTechnology;
      case 'food':
        return l10n.categoryFood;
      default:
        return categoryId;
    }
  }

  IconData _getCategoryIcon(String categoryId) {
    switch (categoryId) {
      case 'geography':
        return Icons.public;
      case 'history':
        return Icons.history_edu;
      case 'science':
        return Icons.science;
      case 'arts':
        return Icons.palette;
      case 'sports':
        return Icons.sports_soccer;
      case 'nature':
        return Icons.eco;
      case 'technology':
        return Icons.computer;
      case 'food':
        return Icons.restaurant;
      default:
        return Icons.quiz;
    }
  }
}
