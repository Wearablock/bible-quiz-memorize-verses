import 'package:drift/drift.dart';

/// 학습 기록 테이블 (SRS - Spaced Repetition System)
/// 각 문제별 학습 상태와 복습 스케줄을 관리
class StudyRecords extends Table {
  /// 자동 증가 ID
  IntColumn get id => integer().autoIncrement()();

  /// 문제 ID (예: "q_love_001") - 고유값
  TextColumn get questionId => text().unique()();

  /// 카테고리 ID (예: "love")
  TextColumn get categoryId => text()();

  /// 현재 레벨 (0: 오답, 1~4: 학습중, 5: 마스터리)
  IntColumn get level => integer().withDefault(const Constant(0))();

  /// 다음 복습 예정 시간
  DateTimeColumn get nextReviewAt => dateTime()();

  /// 마지막 학습 시간
  DateTimeColumn get lastStudiedAt => dateTime()();

  /// 정답 횟수
  IntColumn get correctCount => integer().withDefault(const Constant(0))();

  /// 오답 횟수
  IntColumn get wrongCount => integer().withDefault(const Constant(0))();

  /// 생성 시간
  DateTimeColumn get createdAt => dateTime()();

  /// 수정 시간
  DateTimeColumn get updatedAt => dateTime()();
}
