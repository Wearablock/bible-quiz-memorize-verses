import 'package:drift/drift.dart';

/// 퀴즈 기록 테이블
class QuizHistory extends Table {
  /// 자동 증가 ID
  IntColumn get id => integer().autoIncrement()();

  /// 문제 ID (예: "q_geo_001")
  TextColumn get questionId => text()();

  /// 카테고리 ID (예: "geography")
  TextColumn get categoryId => text()();

  /// 정답 여부
  BoolColumn get isCorrect => boolean()();

  /// 선택한 답 (null = 시간 초과 또는 스킵)
  TextColumn get selectedAnswer => text().nullable()();

  /// 답변 시간
  DateTimeColumn get answeredAt => dateTime()();

  /// 인덱스: 문제 ID로 빠른 조회
  @override
  List<Set<Column>> get uniqueKeys => [];

  /// 인덱스 설정
  @override
  List<String> get customConstraints => [];
}
