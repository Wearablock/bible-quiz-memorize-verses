import '../database/daos/study_record_dao.dart';
import '../database/app_database.dart';
import '../../core/constants/srs_constants.dart';

/// 학습 기록 Repository
/// StudyRecordDao를 래핑하여 비즈니스 로직 제공
class StudyRecordRepository {
  final StudyRecordDao _dao;

  StudyRecordRepository(this._dao);

  /// 학습 기록 조회
  Future<StudyRecord?> getStudyRecord(String questionId) {
    return _dao.getStudyRecord(questionId);
  }

  /// 정답 처리 (레벨 업)
  Future<void> markCorrect({
    required String questionId,
    required String categoryId,
  }) {
    return _dao.markCorrect(questionId, categoryId);
  }

  /// 오답 처리 (레벨 0으로 강등)
  Future<void> markWrong({
    required String questionId,
    required String categoryId,
  }) {
    return _dao.markWrong(questionId, categoryId);
  }

  /// 복습 필요한 전체 문제 조회
  Future<List<StudyRecord>> getReviewDueRecords({int? limit}) {
    return _dao.getReviewDueRecords(limit: limit);
  }

  /// 오답 복습 대상 조회 (Level 0)
  Future<List<StudyRecord>> getWrongReviewRecords({int? limit}) {
    return _dao.getWrongReviewRecords(
      limit: limit ?? SrsConstants.maxWrongReview,
    );
  }

  /// 간격 반복 복습 대상 조회 (Level 1+)
  Future<List<StudyRecord>> getSpacedReviewRecords({int? limit}) {
    return _dao.getSpacedReviewRecords(
      limit: limit ?? SrsConstants.maxSpacedReview,
    );
  }

  /// 복습 필요 개수 조회
  Future<int> getReviewDueCount() {
    return _dao.getReviewDueCount();
  }

  /// 복습 필요 개수 스트림
  Stream<int> watchReviewDueCount() {
    return _dao.watchReviewDueCount();
  }

  /// 카테고리별 학습 기록 조회
  Future<List<StudyRecord>> getRecordsByCategory(String categoryId) {
    return _dao.getRecordsByCategory(categoryId);
  }

  /// 전체 진행률 통계
  Future<Map<String, int>> getProgressStats() {
    return _dao.getProgressStats();
  }

  /// 모든 학습 기록 삭제
  Future<void> clearAllRecords() {
    return _dao.clearAllRecords();
  }

  /// 특정 카테고리 학습 기록 삭제
  Future<void> clearCategoryRecords(String categoryId) {
    return _dao.clearCategoryRecords(categoryId);
  }
}
