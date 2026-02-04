import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/category_utils.dart';
import '../../../../providers/repository_providers.dart';

class WrongAnswerTile extends ConsumerWidget {
  final String questionId;

  const WrongAnswerTile({
    super.key,
    required this.questionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryId = _extractCategoryId(questionId);
    final color = AppColors.getCategoryColor(categoryId);
    final locale = Localizations.localeOf(context);
    final localeStr = locale.toLanguageTag().replaceAll('-', '_');
    final categoriesAsync = ref.watch(categoriesProvider);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getCategoryIcon(categoryId),
            color: color,
            size: 20,
          ),
        ),
        title: Text(
          _getLocalizedCategoryName(categoriesAsync, categoryId, locale.languageCode),
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: FutureBuilder<String>(
          future: _loadQuestionText(ref, localeStr),
          builder: (context, snapshot) {
            final questionText = snapshot.data ?? '...';
            return Text(
              _truncateText(questionText, 40),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            );
          },
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }

  /// 문제 텍스트 로드
  Future<String> _loadQuestionText(WidgetRef ref, String locale) async {
    try {
      final repository = ref.read(questionRepositoryProvider);
      final questions = await repository.getQuestionsByIds(
        questionIds: [questionId],
        locale: locale,
      );
      if (questions.isNotEmpty) {
        return questions.first.question;
      }
    } catch (e) {
      debugPrint('[WrongAnswerTile] 문제 텍스트 로드 실패 ($questionId): $e');
    }
    return '...';
  }

  /// 텍스트 자르기
  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  String _extractCategoryId(String questionId) {
    return CategoryUtils.extractCategoryIdOrUnknown(questionId);
  }

  String _getLocalizedCategoryName(
    AsyncValue<List<dynamic>> categoriesAsync,
    String categoryId,
    String languageCode,
  ) {
    return categoriesAsync.when(
      data: (categories) {
        final category = categories.cast<dynamic>().firstWhere(
              (c) => c.id == categoryId,
              orElse: () => null,
            );
        if (category != null) {
          return category.getName(languageCode);
        }
        // Fallback: capitalize first letter
        if (categoryId.isEmpty) return categoryId;
        return categoryId[0].toUpperCase() + categoryId.substring(1);
      },
      loading: () => categoryId,
      error: (e, st) => categoryId,
    );
  }

  IconData _getCategoryIcon(String categoryId) {
    switch (categoryId) {
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
