import '../database/daos/quiz_history_dao.dart';
import '../database/app_database.dart';
import '../models/quiz_session.dart';

class QuizHistoryRepository {
  final QuizHistoryDao _dao;

  QuizHistoryRepository(this._dao);

  /// 답변 기록 저장
  Future<void> recordAnswer({
    required String questionId,
    required String categoryId,
    required bool isCorrect,
    String? selectedAnswer,
  }) async {
    await _dao.recordAnswer(
      questionId: questionId,
      categoryId: categoryId,
      isCorrect: isCorrect,
      selectedAnswer: selectedAnswer,
    );
  }

  /// 퀴즈 세션 결과 일괄 저장
  Future<void> saveSessionResults(QuizSession session) async {
    for (final result in session.results) {
      // 문제 ID에서 카테고리 추출
      final categoryId = _extractCategoryFromQuestionId(result.questionId);

      await _dao.recordAnswer(
        questionId: result.questionId,
        categoryId: categoryId,
        isCorrect: result.isCorrect,
        selectedAnswer: result.selectedAnswer,
      );
    }
  }

  /// 카테고리별 통계 조회
  Future<CategoryStats> getCategoryStats(String categoryId) {
    return _dao.getCategoryStats(categoryId);
  }

  /// 전체 통계 조회
  Future<OverallStats> getOverallStats() {
    return _dao.getOverallStats();
  }

  /// 전체 통계 스트림
  Stream<OverallStats> watchOverallStats() {
    return _dao.watchOverallStats();
  }

  /// 틀린 문제 ID 목록
  Future<List<String>> getWrongQuestionIds({String? categoryId}) {
    return _dao.getWrongQuestionIds(categoryId: categoryId);
  }

  /// 푼 문제 ID 목록
  Future<List<String>> getAnsweredQuestionIds({String? categoryId}) {
    return _dao.getAnsweredQuestionIds(categoryId: categoryId);
  }

  /// 특정 문제 맞춘 적 있는지 확인
  Future<bool> hasCorrectlyAnswered(String questionId) {
    return _dao.hasCorrectlyAnswered(questionId);
  }

  /// 최근 틀린 문제 기록
  Future<List<QuizHistoryData>> getRecentWrongAnswers({
    int limit = 10,
    String? categoryId,
  }) {
    return _dao.getRecentWrongAnswers(limit: limit, categoryId: categoryId);
  }

  /// 전체 기록 삭제
  Future<void> clearAllHistory() {
    return _dao.clearAllHistory();
  }

  /// 문제 ID에서 카테고리 추출
  String _extractCategoryFromQuestionId(String questionId) {
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
}
