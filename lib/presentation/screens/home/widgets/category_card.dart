import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppColors.getCategoryColor(category.id);
    final locale = Localizations.localeOf(context);
    final langCode = locale.languageCode;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color,
                color.withOpacity(0.7),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  _getCategoryIcon(category.id),
                  color: Colors.white,
                  size: 32,
                ),
                const Spacer(),
                Text(
                  category.getName(langCode),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
