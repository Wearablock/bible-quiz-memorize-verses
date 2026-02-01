/// 카테고리 관련 유틸리티
class CategoryUtils {
  CategoryUtils._();

  /// 문제 ID 접두사 → 카테고리 ID 매핑
  static const Map<String, String> prefixToCategoryMap = {
    'q_love_': 'love',
    'q_faith_': 'faith',
    'q_hope_': 'hope',
    'q_prayer_': 'prayer',
    'q_forgive_': 'forgiveness',
    'q_wisdom_': 'wisdom',
    'q_comfort_': 'comfort',
    'q_strength_': 'strength',
    'q_salv_': 'salvation',
    'q_psalm_': 'psalms',
    'q_prov_': 'proverbs',
    'q_jesus_': 'jesus',
  };

  /// 전체 카테고리 ID 목록
  static const List<String> allCategoryIds = [
    'love',
    'faith',
    'hope',
    'prayer',
    'forgiveness',
    'wisdom',
    'comfort',
    'strength',
    'salvation',
    'psalms',
    'proverbs',
    'jesus',
  ];

  /// 문제 ID에서 카테고리 ID 추출
  /// 예: "q_love_001" -> "love"
  /// 반환: 카테고리 ID 또는 null (매핑 실패 시)
  static String? extractCategoryId(String questionId) {
    for (final entry in prefixToCategoryMap.entries) {
      if (questionId.startsWith(entry.key)) {
        return entry.value;
      }
    }
    return null;
  }

  /// 문제 ID에서 카테고리 ID 추출 (기본값 포함)
  /// 예: "q_love_001" -> "love"
  /// 매핑 실패 시 'unknown' 반환
  static String extractCategoryIdOrUnknown(String questionId) {
    return extractCategoryId(questionId) ?? 'unknown';
  }
}
