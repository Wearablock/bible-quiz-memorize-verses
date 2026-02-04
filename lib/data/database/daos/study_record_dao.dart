import 'package:drift/drift.dart';
import '../../../core/constants/srs_constants.dart';
import '../app_database.dart';
import '../tables/study_records.dart';

part 'study_record_dao.g.dart';

@DriftAccessor(tables: [StudyRecords])
class StudyRecordDao extends DatabaseAccessor<AppDatabase>
    with _$StudyRecordDaoMixin {
  StudyRecordDao(super.db);

  /// 오늘 자정 시간 계산
  DateTime _getTodayMidnight() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  /// 다음 복습 시간 계산 (자정 기준)
  DateTime _calculateNextReview(int level) {
    final todayMidnight = _getTodayMidnight();
    final days = SrsConstants.getIntervalDays(level);
    return todayMidnight.add(Duration(days: days));
  }

  /// 학습 기록 조회 (questionId로)
  Future<StudyRecord?> getStudyRecord(String questionId) {
    return (select(studyRecords)
          ..where((t) => t.questionId.equals(questionId)))
        .getSingleOrNull();
  }

  /// 학습 기록 생성
  Future<int> createStudyRecord({
    required String questionId,
    required String categoryId,
    required int level,
    required DateTime nextReviewAt,
    required int correctCount,
    required int wrongCount,
  }) {
    final now = DateTime.now();
    return into(studyRecords).insert(
      StudyRecordsCompanion.insert(
        questionId: questionId,
        categoryId: categoryId,
        level: Value(level),
        nextReviewAt: nextReviewAt,
        lastStudiedAt: now,
        correctCount: Value(correctCount),
        wrongCount: Value(wrongCount),
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  /// 학습 기록 업데이트
  Future<bool> updateStudyRecord({
    required String questionId,
    required int level,
    required DateTime nextReviewAt,
    int? correctCount,
    int? wrongCount,
  }) {
    final now = DateTime.now();
    return (update(studyRecords)
          ..where((t) => t.questionId.equals(questionId)))
        .write(
          StudyRecordsCompanion(
            level: Value(level),
            nextReviewAt: Value(nextReviewAt),
            lastStudiedAt: Value(now),
            correctCount:
                correctCount != null ? Value(correctCount) : const Value.absent(),
            wrongCount:
                wrongCount != null ? Value(wrongCount) : const Value.absent(),
            updatedAt: Value(now),
          ),
        )
        .then((rows) => rows > 0);
  }

  /// 정답 처리
  Future<void> markCorrect(String questionId, String categoryId) async {
    final record = await getStudyRecord(questionId);

    if (record == null) {
      // 신규 학습: 레벨 1로 시작
      await createStudyRecord(
        questionId: questionId,
        categoryId: categoryId,
        level: 1,
        nextReviewAt: _calculateNextReview(1),
        correctCount: 1,
        wrongCount: 0,
      );
    } else {
      // 기존 학습: 레벨 업
      final newLevel = (record.level + 1).clamp(0, SrsConstants.masteryLevel);
      await updateStudyRecord(
        questionId: questionId,
        level: newLevel,
        nextReviewAt: _calculateNextReview(newLevel),
        correctCount: record.correctCount + 1,
      );
    }
  }

  /// 오답 처리
  Future<void> markWrong(String questionId, String categoryId) async {
    final record = await getStudyRecord(questionId);
    final tomorrowMidnight = _getTodayMidnight().add(const Duration(days: 1));

    if (record == null) {
      // 신규 학습 중 오답
      await createStudyRecord(
        questionId: questionId,
        categoryId: categoryId,
        level: 0,
        nextReviewAt: tomorrowMidnight,
        correctCount: 0,
        wrongCount: 1,
      );
    } else {
      // 기존 학습 중 오답: 레벨 0으로 강등
      await updateStudyRecord(
        questionId: questionId,
        level: 0,
        nextReviewAt: tomorrowMidnight,
        wrongCount: record.wrongCount + 1,
      );
    }
  }

  /// 복습 필요한 문제 조회
  /// - 마스터리 미달성 (level < masteryLevel)
  /// - 복습 시간 도래 (nextReviewAt <= now)
  /// - 오늘 이미 학습하지 않음 (lastStudiedAt < todayMidnight)
  Future<List<StudyRecord>> getReviewDueRecords({int? limit}) async {
    final now = DateTime.now();
    final todayMidnight = _getTodayMidnight();

    var query = select(studyRecords)
      ..where((t) =>
          t.level.isSmallerThanValue(SrsConstants.masteryLevel) &
          t.nextReviewAt.isSmallerOrEqualValue(now) &
          t.lastStudiedAt.isSmallerThanValue(todayMidnight))
      ..orderBy([
        (t) => OrderingTerm.asc(t.level), // 레벨 낮은 순 (오답 우선)
        (t) => OrderingTerm.asc(t.nextReviewAt), // 복습 예정일 오래된 순
      ]);

    if (limit != null) {
      query = query..limit(limit);
    }

    return query.get();
  }

  /// 오답 복습 대상 조회 (Level 0)
  Future<List<StudyRecord>> getWrongReviewRecords({int? limit}) async {
    final now = DateTime.now();
    final todayMidnight = _getTodayMidnight();

    var query = select(studyRecords)
      ..where((t) =>
          t.level.equals(0) &
          t.nextReviewAt.isSmallerOrEqualValue(now) &
          t.lastStudiedAt.isSmallerThanValue(todayMidnight))
      ..orderBy([(t) => OrderingTerm.asc(t.nextReviewAt)]);

    if (limit != null) {
      query = query..limit(limit);
    }

    return query.get();
  }

  /// 간격 반복 복습 대상 조회 (Level 1+)
  Future<List<StudyRecord>> getSpacedReviewRecords({int? limit}) async {
    final now = DateTime.now();
    final todayMidnight = _getTodayMidnight();

    var query = select(studyRecords)
      ..where((t) =>
          t.level.isBiggerThanValue(0) &
          t.level.isSmallerThanValue(SrsConstants.masteryLevel) &
          t.nextReviewAt.isSmallerOrEqualValue(now) &
          t.lastStudiedAt.isSmallerThanValue(todayMidnight))
      ..orderBy([
        (t) => OrderingTerm.asc(t.level),
        (t) => OrderingTerm.asc(t.nextReviewAt),
      ]);

    if (limit != null) {
      query = query..limit(limit);
    }

    return query.get();
  }

  /// 복습 필요 개수 조회
  Future<int> getReviewDueCount() async {
    final now = DateTime.now();
    final todayMidnight = _getTodayMidnight();

    final countExpr = studyRecords.id.count();
    final query = selectOnly(studyRecords)
      ..where(studyRecords.level.isSmallerThanValue(SrsConstants.masteryLevel) &
          studyRecords.nextReviewAt.isSmallerOrEqualValue(now) &
          studyRecords.lastStudiedAt.isSmallerThanValue(todayMidnight))
      ..addColumns([countExpr]);

    final result = await query.getSingle();
    return result.read(countExpr) ?? 0;
  }

  /// 복습 필요 개수 스트림 (실시간 업데이트)
  Stream<int> watchReviewDueCount() {
    final now = DateTime.now();
    final todayMidnight = _getTodayMidnight();

    final countExpr = studyRecords.id.count();
    final query = selectOnly(studyRecords)
      ..where(studyRecords.level.isSmallerThanValue(SrsConstants.masteryLevel) &
          studyRecords.nextReviewAt.isSmallerOrEqualValue(now) &
          studyRecords.lastStudiedAt.isSmallerThanValue(todayMidnight))
      ..addColumns([countExpr]);

    return query.watchSingle().map((result) => result.read(countExpr) ?? 0);
  }

  /// 카테고리별 학습 기록 조회
  Future<List<StudyRecord>> getRecordsByCategory(String categoryId) {
    return (select(studyRecords)
          ..where((t) => t.categoryId.equals(categoryId))
          ..orderBy([(t) => OrderingTerm.asc(t.level)]))
        .get();
  }

  /// 전체 진행률 조회
  Future<Map<String, int>> getProgressStats() async {
    final totalCount = studyRecords.id.count();
    final masteredCount = studyRecords.id.count(
      filter: studyRecords.level.isBiggerOrEqualValue(SrsConstants.masteryLevel),
    );
    final inProgressCount = studyRecords.id.count(
      filter: studyRecords.level.isBiggerThanValue(0) &
          studyRecords.level.isSmallerThanValue(SrsConstants.masteryLevel),
    );
    final wrongCount = studyRecords.id.count(
      filter: studyRecords.level.equals(0),
    );

    final query = selectOnly(studyRecords)
      ..addColumns([totalCount, masteredCount, inProgressCount, wrongCount]);

    final result = await query.getSingle();

    return {
      'total': result.read(totalCount) ?? 0,
      'mastered': result.read(masteredCount) ?? 0,
      'inProgress': result.read(inProgressCount) ?? 0,
      'wrong': result.read(wrongCount) ?? 0,
    };
  }

  /// 모든 학습 기록 삭제
  Future<int> clearAllRecords() {
    return delete(studyRecords).go();
  }

  /// 특정 카테고리 학습 기록 삭제
  Future<int> clearCategoryRecords(String categoryId) {
    return (delete(studyRecords)
          ..where((t) => t.categoryId.equals(categoryId)))
        .go();
  }
}
