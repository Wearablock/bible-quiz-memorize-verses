import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/quiz_history.dart';

part 'quiz_history_dao.g.dart';

/// 카테고리별 통계
class CategoryStats {
  final String categoryId;
  final int totalAnswered;
  final int correctCount;
  final int wrongCount;

  CategoryStats({
    required this.categoryId,
    required this.totalAnswered,
    required this.correctCount,
    required this.wrongCount,
  });

  double get accuracy =>
      totalAnswered == 0 ? 0.0 : correctCount / totalAnswered;

  int get accuracyPercent => (accuracy * 100).round();
}

/// 전체 통계
class OverallStats {
  final int totalAnswered;
  final int correctCount;
  final int wrongCount;
  final int uniqueQuestions;

  OverallStats({
    required this.totalAnswered,
    required this.correctCount,
    required this.wrongCount,
    required this.uniqueQuestions,
  });

  double get accuracy =>
      totalAnswered == 0 ? 0.0 : correctCount / totalAnswered;

  int get accuracyPercent => (accuracy * 100).round();
}

@DriftAccessor(tables: [QuizHistory])
class QuizHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$QuizHistoryDaoMixin {
  QuizHistoryDao(super.db);

  /// 답변 기록 저장
  Future<int> recordAnswer({
    required String questionId,
    required String categoryId,
    required bool isCorrect,
    String? selectedAnswer,
  }) {
    return into(quizHistory).insert(
      QuizHistoryCompanion.insert(
        questionId: questionId,
        categoryId: categoryId,
        isCorrect: isCorrect,
        selectedAnswer: Value(selectedAnswer),
        answeredAt: DateTime.now(),
      ),
    );
  }

  /// 특정 문제의 최근 기록 조회
  Future<QuizHistoryData?> getLatestQuestionHistory(String questionId) {
    return (select(quizHistory)
          ..where((t) => t.questionId.equals(questionId))
          ..orderBy([(t) => OrderingTerm.desc(t.answeredAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  /// 특정 문제를 푼 적이 있는지 확인
  Future<bool> hasAnswered(String questionId) async {
    final result = await getLatestQuestionHistory(questionId);
    return result != null;
  }

  /// 특정 문제를 맞춘 적이 있는지 확인
  Future<bool> hasCorrectlyAnswered(String questionId) async {
    final count = await (select(quizHistory)
          ..where((t) =>
              t.questionId.equals(questionId) & t.isCorrect.equals(true)))
        .get();
    return count.isNotEmpty;
  }

  /// 카테고리별 통계 조회
  Future<CategoryStats> getCategoryStats(String categoryId) async {
    final results = await (select(quizHistory)
          ..where((t) => t.categoryId.equals(categoryId)))
        .get();

    final correctCount = results.where((r) => r.isCorrect).length;

    return CategoryStats(
      categoryId: categoryId,
      totalAnswered: results.length,
      correctCount: correctCount,
      wrongCount: results.length - correctCount,
    );
  }

  /// 전체 통계 조회
  Future<OverallStats> getOverallStats() async {
    final results = await select(quizHistory).get();
    final correctCount = results.where((r) => r.isCorrect).length;
    final uniqueQuestions = results.map((r) => r.questionId).toSet().length;

    return OverallStats(
      totalAnswered: results.length,
      correctCount: correctCount,
      wrongCount: results.length - correctCount,
      uniqueQuestions: uniqueQuestions,
    );
  }

  /// 틀린 문제 ID 목록 (가장 최근 시도 기준)
  Future<List<String>> getWrongQuestionIds({String? categoryId}) async {
    // 각 문제의 가장 최근 시도만 고려
    var query = select(quizHistory);

    if (categoryId != null) {
      query = query..where((t) => t.categoryId.equals(categoryId));
    }

    final results = await (query
          ..orderBy([(t) => OrderingTerm.desc(t.answeredAt)]))
        .get();

    // 문제별 가장 최근 기록만 유지
    final latestByQuestion = <String, QuizHistoryData>{};
    for (final result in results) {
      latestByQuestion.putIfAbsent(result.questionId, () => result);
    }

    // 틀린 문제만 필터링
    return latestByQuestion.entries
        .where((e) => !e.value.isCorrect)
        .map((e) => e.key)
        .toList();
  }

  /// 푼 문제 ID 목록
  Future<List<String>> getAnsweredQuestionIds({String? categoryId}) async {
    var query = select(quizHistory);

    if (categoryId != null) {
      query = query..where((t) => t.categoryId.equals(categoryId));
    }

    final results = await query.get();
    return results.map((r) => r.questionId).toSet().toList();
  }

  /// 최근 틀린 문제 기록 (UI 표시용)
  Future<List<QuizHistoryData>> getRecentWrongAnswers({
    int limit = 10,
    String? categoryId,
  }) async {
    var query = select(quizHistory)
      ..where((t) => t.isCorrect.equals(false))
      ..orderBy([(t) => OrderingTerm.desc(t.answeredAt)])
      ..limit(limit);

    if (categoryId != null) {
      query = query..where((t) => t.categoryId.equals(categoryId));
    }

    return query.get();
  }

  /// 기록 전체 삭제
  Future<int> clearAllHistory() {
    return delete(quizHistory).go();
  }

  /// 특정 카테고리 기록 삭제
  Future<int> clearCategoryHistory(String categoryId) {
    return (delete(quizHistory)
          ..where((t) => t.categoryId.equals(categoryId)))
        .go();
  }

  /// 전체 기록 스트림 (실시간 업데이트)
  Stream<List<QuizHistoryData>> watchAllHistory() {
    return (select(quizHistory)
          ..orderBy([(t) => OrderingTerm.desc(t.answeredAt)]))
        .watch();
  }

  /// 전체 통계 스트림
  Stream<OverallStats> watchOverallStats() {
    return select(quizHistory).watch().map((results) {
      final correctCount = results.where((r) => r.isCorrect).length;
      final uniqueQuestions = results.map((r) => r.questionId).toSet().length;

      return OverallStats(
        totalAnswered: results.length,
        correctCount: correctCount,
        wrongCount: results.length - correctCount,
        uniqueQuestions: uniqueQuestions,
      );
    });
  }
}
