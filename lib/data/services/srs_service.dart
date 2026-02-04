import '../../core/constants/srs_constants.dart';
import '../../core/utils/category_utils.dart';
import '../database/app_database.dart';
import '../repositories/study_record_repository.dart';
import '../repositories/quiz_history_repository.dart';

/// SRS (Spaced Repetition System) 서비스
/// 망각곡선 기반 간격 반복 학습 비즈니스 로직
class SrsService {
  final StudyRecordRepository _studyRecordRepository;
  final QuizHistoryRepository _quizHistoryRepository;

  SrsService({
    required StudyRecordRepository studyRecordRepository,
    required QuizHistoryRepository quizHistoryRepository,
  })  : _studyRecordRepository = studyRecordRepository,
        _quizHistoryRepository = quizHistoryRepository;

  /// 정답 처리 (SRS + 퀴즈 기록 모두 업데이트)
  Future<void> processCorrectAnswer({
    required String questionId,
    required String categoryId,
    String? selectedAnswer,
  }) async {
    // 1. 퀴즈 기록 저장
    await _quizHistoryRepository.recordAnswer(
      questionId: questionId,
      categoryId: categoryId,
      isCorrect: true,
      selectedAnswer: selectedAnswer,
    );

    // 2. SRS 학습 기록 업데이트 (레벨 업)
    await _studyRecordRepository.markCorrect(
      questionId: questionId,
      categoryId: categoryId,
    );
  }

  /// 오답 처리 (SRS + 퀴즈 기록 모두 업데이트)
  Future<void> processWrongAnswer({
    required String questionId,
    required String categoryId,
    String? selectedAnswer,
  }) async {
    // 1. 퀴즈 기록 저장
    await _quizHistoryRepository.recordAnswer(
      questionId: questionId,
      categoryId: categoryId,
      isCorrect: false,
      selectedAnswer: selectedAnswer,
    );

    // 2. SRS 학습 기록 업데이트 (레벨 0으로 강등)
    await _studyRecordRepository.markWrong(
      questionId: questionId,
      categoryId: categoryId,
    );
  }

  /// 답변 처리 (정답/오답 자동 분기)
  Future<void> processAnswer({
    required String questionId,
    required bool isCorrect,
    String? selectedAnswer,
  }) async {
    final categoryId = CategoryUtils.extractCategoryIdOrUnknown(questionId);

    if (isCorrect) {
      await processCorrectAnswer(
        questionId: questionId,
        categoryId: categoryId,
        selectedAnswer: selectedAnswer,
      );
    } else {
      await processWrongAnswer(
        questionId: questionId,
        categoryId: categoryId,
        selectedAnswer: selectedAnswer,
      );
    }
  }

  /// 복습 필요 개수 조회
  Future<int> getReviewDueCount() {
    return _studyRecordRepository.getReviewDueCount();
  }

  /// 복습 필요 개수 스트림
  Stream<int> watchReviewDueCount() {
    return _studyRecordRepository.watchReviewDueCount();
  }

  /// 오답 복습 대상 문제 ID 목록
  Future<List<String>> getWrongReviewQuestionIds() async {
    final records = await _studyRecordRepository.getWrongReviewRecords();
    return records.map((r) => r.questionId).toList();
  }

  /// 간격 반복 복습 대상 문제 ID 목록
  Future<List<String>> getSpacedReviewQuestionIds() async {
    final records = await _studyRecordRepository.getSpacedReviewRecords();
    return records.map((r) => r.questionId).toList();
  }

  /// 전체 복습 대상 문제 ID 목록 (오답 + 간격 반복)
  Future<List<String>> getAllReviewQuestionIds() async {
    final records = await _studyRecordRepository.getReviewDueRecords(
      limit: SrsConstants.maxWrongReview + SrsConstants.maxSpacedReview,
    );
    return records.map((r) => r.questionId).toList();
  }

  /// 복습 세션 데이터 조회
  Future<ReviewSessionData> getReviewSessionData() async {
    final wrongRecords = await _studyRecordRepository.getWrongReviewRecords();
    final spacedRecords = await _studyRecordRepository.getSpacedReviewRecords();

    return ReviewSessionData(
      wrongReviewIds: wrongRecords.map((r) => r.questionId).toList(),
      spacedReviewIds: spacedRecords.map((r) => r.questionId).toList(),
    );
  }

  /// 학습 기록 조회
  Future<StudyRecord?> getStudyRecord(String questionId) {
    return _studyRecordRepository.getStudyRecord(questionId);
  }

  /// 전체 진행률 통계
  Future<SrsProgressStats> getProgressStats() async {
    final stats = await _studyRecordRepository.getProgressStats();
    return SrsProgressStats(
      total: stats['total'] ?? 0,
      mastered: stats['mastered'] ?? 0,
      inProgress: stats['inProgress'] ?? 0,
      wrong: stats['wrong'] ?? 0,
    );
  }

  /// 모든 학습 기록 초기화
  Future<void> resetAllProgress() async {
    await _studyRecordRepository.clearAllRecords();
  }
}

/// 복습 세션 데이터
class ReviewSessionData {
  final List<String> wrongReviewIds;
  final List<String> spacedReviewIds;

  ReviewSessionData({
    required this.wrongReviewIds,
    required this.spacedReviewIds,
  });

  List<String> get allReviewIds => [...wrongReviewIds, ...spacedReviewIds];

  int get totalCount => wrongReviewIds.length + spacedReviewIds.length;

  bool get isEmpty => totalCount == 0;
}

/// SRS 진행률 통계
class SrsProgressStats {
  final int total;
  final int mastered;
  final int inProgress;
  final int wrong;

  SrsProgressStats({
    required this.total,
    required this.mastered,
    required this.inProgress,
    required this.wrong,
  });

  int get notStarted => 0; // 전체 문제 수를 알아야 계산 가능

  double get masteryRate => total > 0 ? mastered / total : 0.0;

  int get masteryPercent => (masteryRate * 100).round();
}
