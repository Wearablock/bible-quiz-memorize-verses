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
      // Bible Quiz Categories
      case 'love':
        return Icons.favorite;
      case 'faith':
        return Icons.church;
      case 'hope':
        return Icons.anchor;
      case 'prayer':
        return Icons.self_improvement;
      case 'forgiveness':
        return Icons.handshake;
      case 'wisdom':
        return Icons.lightbulb;
      case 'comfort':
        return Icons.healing;
      case 'strength':
        return Icons.shield;
      case 'salvation':
        return Icons.brightness_7;
      case 'psalms':
        return Icons.music_note;
      case 'proverbs':
        return Icons.menu_book;
      case 'jesus':
        return Icons.auto_stories;
      default:
        return Icons.quiz;
    }
  }
}
