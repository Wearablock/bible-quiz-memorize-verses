import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import '../models/question.dart';

class QuestionRepository {
  /// 로케일별 문제 캐시: {locale: {categoryId: {questionId: QuestionContent}}}
  final Map<String, Map<String, Map<String, QuestionContent>>> _contentCache =
      {};

  /// 지원하는 로케일 목록
  static const supportedLocales = [
    'en',
    'ko',
    'ja',
    'zh',
    'zh-Hant',
    'es',
    'fr',
    'de',
    'pt',
    'it',
    'ru',
    'ar',
    'th',
    'vi',
    'id',
  ];

  /// 카테고리별 문제 로드
  Future<List<Question>> getQuestionsByCategory({
    required String categoryId,
    required String locale,
    int? limit,
    bool shuffle = true,
  }) async {
    final contents = await _loadCategoryContent(categoryId, locale);

    var questions = contents.entries.map((entry) {
      return Question(
        id: entry.key,
        categoryId: categoryId,
        difficulty: _extractDifficulty(entry.key),
        question: entry.value.question,
        correct: entry.value.correct,
        wrong: entry.value.wrong,
        hint: entry.value.hint,
        explanation: entry.value.explanation,
      );
    }).toList();

    if (shuffle) {
      questions.shuffle(Random());
    }

    if (limit != null && limit < questions.length) {
      questions = questions.take(limit).toList();
    }

    return questions;
  }

  /// 특정 문제 ID 목록으로 문제 로드
  Future<List<Question>> getQuestionsByIds({
    required List<String> questionIds,
    required String locale,
  }) async {
    final questions = <Question>[];

    for (final id in questionIds) {
      final categoryId = _extractCategoryId(id);
      if (categoryId == null) continue;

      final contents = await _loadCategoryContent(categoryId, locale);
      final content = contents[id];

      if (content != null) {
        questions.add(Question(
          id: id,
          categoryId: categoryId,
          difficulty: _extractDifficulty(id),
          question: content.question,
          correct: content.correct,
          wrong: content.wrong,
          hint: content.hint,
          explanation: content.explanation,
        ));
      }
    }

    return questions;
  }

  /// 랜덤 문제 로드 (여러 카테고리에서)
  Future<List<Question>> getRandomQuestions({
    required String locale,
    required int count,
    List<String>? categoryIds,
    List<String>? excludeIds,
  }) async {
    final allQuestions = <Question>[];
    final categories = categoryIds ??
        [
          'geography',
          'history',
          'science',
          'arts',
          'sports',
          'nature',
          'technology',
          'food',
        ];

    for (final categoryId in categories) {
      try {
        final questions = await getQuestionsByCategory(
          categoryId: categoryId,
          locale: locale,
          shuffle: false,
        );
        allQuestions.addAll(questions);
      } catch (_) {
        // 카테고리 로드 실패 시 무시
      }
    }

    // 제외할 문제 필터링
    var filtered = allQuestions;
    if (excludeIds != null && excludeIds.isNotEmpty) {
      filtered =
          allQuestions.where((q) => !excludeIds.contains(q.id)).toList();
    }

    // 셔플 후 제한
    filtered.shuffle(Random());
    return filtered.take(count).toList();
  }

  /// 카테고리 콘텐츠 로드 (캐싱)
  Future<Map<String, QuestionContent>> _loadCategoryContent(
    String categoryId,
    String locale,
  ) async {
    // 캐시 확인
    if (_contentCache[locale]?[categoryId] != null) {
      return _contentCache[locale]![categoryId]!;
    }

    // 로케일 폴백 처리
    final effectiveLocale = await _getEffectiveLocale(locale, categoryId);

    // JSON 로드
    final jsonString = await rootBundle.loadString(
      'assets/data/questions/$effectiveLocale/$categoryId.json',
    );
    final jsonData = json.decode(jsonString) as Map<String, dynamic>;

    // 파싱
    final contents = <String, QuestionContent>{};
    jsonData.forEach((key, value) {
      contents[key] = QuestionContent.fromJson(value as Map<String, dynamic>);
    });

    // 캐시 저장
    _contentCache[locale] ??= {};
    _contentCache[locale]![categoryId] = contents;

    return contents;
  }

  /// 유효한 로케일 결정 (폴백 로직)
  Future<String> _getEffectiveLocale(String locale, String categoryId) async {
    // 요청된 로케일 먼저 시도
    if (await _assetExists(
        'assets/data/questions/$locale/$categoryId.json')) {
      return locale;
    }

    // 언어 코드만 시도 (예: zh-Hant -> zh)
    if (locale.contains('-')) {
      final langCode = locale.split('-').first;
      if (await _assetExists(
          'assets/data/questions/$langCode/$categoryId.json')) {
        return langCode;
      }
    }

    // 영어 폴백
    return 'en';
  }

  /// 에셋 존재 여부 확인
  Future<bool> _assetExists(String path) async {
    try {
      await rootBundle.loadString(path);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// 문제 ID에서 카테고리 ID 추출
  /// 예: "q_geo_001" -> "geography"
  String? _extractCategoryId(String questionId) {
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
    return null;
  }

  /// 문제 ID에서 난이도 추출 (기본값: 2)
  int _extractDifficulty(String questionId) {
    // 현재 데이터 구조에서는 난이도 정보가 없으므로 기본값 반환
    // 추후 메타데이터 추가 시 확장 가능
    return 2;
  }

  /// 특정 로케일 캐시 초기화
  void clearLocaleCache(String locale) {
    _contentCache.remove(locale);
  }

  /// 전체 캐시 초기화
  void clearAllCache() {
    _contentCache.clear();
  }
}
