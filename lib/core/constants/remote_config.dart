/// GitHub 원격 데이터 동기화 설정
class RemoteConfig {
  RemoteConfig._();

  /// GitHub Raw 콘텐츠 베이스 URL
  static const String baseUrl =
      'https://raw.githubusercontent.com/Wearablock/trivia-quiz/main/github-data';

  /// 버전 체크 타임아웃 (초)
  static const int versionCheckTimeout = 10;

  /// 데이터 다운로드 타임아웃 (초)
  static const int dataDownloadTimeout = 30;

  /// 로컬 저장소 키
  static const String localVersionKey = 'quiz_data_version';
  static const String localDataPrefix = 'quiz_data_';

  /// 지원 카테고리
  static const List<String> categories = [
    'geography',
    'history',
    'science',
    'arts',
    'sports',
    'nature',
    'technology',
    'food',
  ];

  /// 지원 로케일
  static const List<String> locales = [
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
}
