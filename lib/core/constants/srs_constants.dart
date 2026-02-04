/// SRS (Spaced Repetition System) 상수 정의
/// 망각곡선 기반 간격 반복 학습 시스템
class SrsConstants {
  SrsConstants._();

  /// 복습 간격 (일 단위)
  /// Level 0: 오답 상태 → 1일 후
  /// Level 1: 첫 정답 → 1일 후
  /// Level 2: 복습 1회 성공 → 3일 후
  /// Level 3: 복습 2회 성공 → 7일 후
  /// Level 4: 복습 3회 성공 → 14일 후
  /// Level 5: 마스터리 → 30일 후 (유지 복습)
  static const List<int> reviewIntervals = [1, 1, 3, 7, 14, 30];

  /// 마스터리 레벨 (최대 레벨)
  static const int masteryLevel = 5;

  /// 세션당 최대 오답 복습 수
  static const int maxWrongReview = 10;

  /// 세션당 최대 간격 반복 복습 수
  static const int maxSpacedReview = 10;

  /// 레벨에 따른 복습 간격 반환
  static int getIntervalDays(int level) {
    final clampedLevel = level.clamp(0, masteryLevel);
    return reviewIntervals[clampedLevel];
  }

  /// 레벨이 마스터리인지 확인
  static bool isMastered(int level) {
    return level >= masteryLevel;
  }
}
