import 'package:flutter/material.dart';

/// ============================================================================
/// Quiz App Boilerplate - 앱 전역 설정
/// ============================================================================
///
/// 새로운 퀴즈 앱을 만들 때 이 파일만 수정하면 됩니다.
/// 아래 설정들을 새 앱에 맞게 변경하세요.
///
/// ## 추가로 수동 변경이 필요한 파일들:
/// - pubspec.yaml: name, description
/// - android/app/build.gradle.kts: applicationId, namespace
/// - android/app/src/main/AndroidManifest.xml: android:label, AdMob App ID
/// - ios/Runner/Info.plist: CFBundleDisplayName, GADApplicationIdentifier
/// - Xcode: Bundle Identifier
/// - assets/data/: 퀴즈 데이터 (categories.json, questions/)
/// - assets/icon/app_icon.png: 앱 아이콘
/// - assets/splash/: 스플래시 이미지
///
/// ## 예시: 영화 퀴즈 앱으로 변경할 경우
/// ```dart
/// static const String appName = 'Movie Quiz';
/// static const String appDisplayName = 'Movie Quiz - Cinema Master';
/// static const Color primaryColor = Color(0xFFE50914);  // Netflix Red
/// static const List<String> categories = ['action', 'comedy', 'drama', ...];
/// static const String removeAdsProductId = 'movie_quiz_remove_ads';
/// ```
///
class AppConfig {
  AppConfig._();

  // ============================================================================
  // 앱 기본 정보
  // ============================================================================
  // [변경 필수] 새 앱 이름으로 수정하세요

  /// 앱 이름 (MaterialApp title)
  static const String appName = 'Bible Quiz';

  /// 앱 표시 이름 (홈 화면에 표시)
  /// [주의] AndroidManifest.xml, Info.plist에도 동일하게 설정 필요
  static const String appDisplayName = 'Bible Quiz - Memorize Verses';

  // ============================================================================
  // 테마 색상
  // ============================================================================
  // [변경 권장] 앱 브랜드에 맞는 색상으로 변경하세요
  //
  // 예시 - 영화 퀴즈:
  //   primaryColor = Color(0xFFE50914)  // Netflix Red
  //   secondaryColor = Color(0xFF221F1F)  // Dark Gray
  //
  // 예시 - 과학 퀴즈:
  //   primaryColor = Color(0xFF2196F3)  // Blue
  //   secondaryColor = Color(0xFF1565C0)  // Dark Blue
  //
  // 예시 - 자연 퀴즈:
  //   primaryColor = Color(0xFF4CAF50)  // Green
  //   secondaryColor = Color(0xFF2E7D32)  // Dark Green

  /// 메인 브랜드 색상 (Navy Blue 테마)
  static const Color primaryColor = Color(0xFF1A237E);        // Navy Blue (인디고)
  static const Color primaryDarkColor = Color(0xFF0D1642);    // Dark Navy
  static const Color primaryLightColor = Color(0xFF3949AB);   // Light Navy

  /// 보조 색상 (Gold 테마)
  static const Color secondaryColor = Color(0xFFC9A227);      // Gold
  static const Color secondaryLightColor = Color(0xFFD4AF37); // Light Gold

  /// 강조 색상
  static const Color accentColor = Color(0xFFB8860B);         // Dark Gold

  /// 배경 색상
  static const Color surfaceLightColor = Color(0xFFFAF8F5);   // Warm White
  static const Color surfaceDarkColor = Color(0xFF121212);    // Dark

  /// 텍스트 대비 색상
  static const Color onPrimaryColor = Color(0xFFFFFFFF);      // White on Navy
  static const Color onSecondaryColor = Color(0xFF1A1A1A);    // Dark on Gold

  /// 피드백 색상 (일반적으로 변경 불필요)
  static const Color correctColor = Color(0xFF4CAF50);        // Green
  static const Color wrongColor = Color(0xFFF44336);          // Red

  // ============================================================================
  // 카테고리 설정
  // ============================================================================
  // [변경 필수] 새 앱의 퀴즈 카테고리로 변경하세요
  // categories.json 파일과 일치해야 합니다
  //
  // 예시 - 영화 퀴즈:
  //   categories = ['action', 'comedy', 'drama', 'horror', 'romance', 'scifi']
  //   categoryColors = {
  //     'action': Color(0xFFFF5722),
  //     'comedy': Color(0xFFFFEB3B),
  //     'drama': Color(0xFF3F51B5),
  //     ...
  //   }

  /// 카테고리 목록 (assets/data/categories.json과 일치해야 함)
  static const List<String> categories = [
    'love',         // 사랑
    'faith',        // 믿음
    'hope',         // 소망
    'prayer',       // 기도
    'forgiveness',  // 용서
    'wisdom',       // 지혜
    'comfort',      // 위로
    'strength',     // 힘/용기
    'salvation',    // 구원
    'psalms',       // 시편
    'proverbs',     // 잠언
    'jesus',        // 예수님 말씀
  ];

  /// 카테고리별 색상
  static const Map<String, Color> categoryColors = {
    'love': Color(0xFFE91E63),        // Pink
    'faith': Color(0xFF3F51B5),       // Indigo
    'hope': Color(0xFF00BCD4),        // Cyan
    'prayer': Color(0xFF9C27B0),      // Purple
    'forgiveness': Color(0xFF4CAF50), // Green
    'wisdom': Color(0xFFFF9800),      // Orange
    'comfort': Color(0xFF03A9F4),     // Light Blue
    'strength': Color(0xFFF44336),    // Red
    'salvation': Color(0xFFFFEB3B),   // Yellow
    'psalms': Color(0xFF2196F3),      // Blue
    'proverbs': Color(0xFF795548),    // Brown
    'jesus': Color(0xFF8D6E63),       // Brown Light
  };

  /// 카테고리 색상 가져오기
  static Color getCategoryColor(String categoryId) {
    return categoryColors[categoryId] ?? primaryColor;
  }

  // ============================================================================
  // 지원 로케일
  // ============================================================================
  // 15개 언어 지원 (일반적으로 변경 불필요)

  static const List<String> supportedLocales = [
    'en',       // English
    'ko',       // 한국어
    'ja',       // 日本語
    'zh',       // 简体中文
    'zh-Hant',  // 繁體中文
    'es',       // Español
    'fr',       // Français
    'de',       // Deutsch
    'pt',       // Português
    'it',       // Italiano
    'ru',       // Русский
    'ar',       // العربية
    'th',       // ไทย
    'vi',       // Tiếng Việt
    'id',       // Bahasa Indonesia
  ];

  // ============================================================================
  // 광고 설정 (AdMob)
  // ============================================================================
  // [변경 필수] AdMob 콘솔에서 발급받은 ID로 교체하세요
  //
  // AdMob 콘솔: https://admob.google.com
  // 1. 새 앱 등록
  // 2. 광고 단위 생성 (배너, 전면, 보상형)
  // 3. 아래 ID들을 교체
  //
  // [주의] App ID는 네이티브 파일에서도 변경 필요:
  //   - AndroidManifest.xml: com.google.android.gms.ads.APPLICATION_ID
  //   - Info.plist: GADApplicationIdentifier

  // ----- 프로덕션 광고 ID -----
  // TODO: AdMob에서 발급받은 실제 ID로 교체하세요

  /// Android 배너 광고 ID
  static const String bannerAdIdAndroid = 'ca-app-pub-8841058711613546/1726640787';
  /// iOS 배너 광고 ID
  static const String bannerAdIdIos = 'ca-app-pub-8841058711613546/2575536644';

  /// Android 전면 광고 ID
  static const String interstitialAdIdAndroid = 'ca-app-pub-8841058711613546/9413559115';
  /// iOS 전면 광고 ID
  static const String interstitialAdIdIos = 'ca-app-pub-8841058711613546/8020586390';

  /// Android 보상형 광고 ID
  static const String rewardedAdIdAndroid = 'ca-app-pub-8841058711613546/4915254367';
  /// iOS 보상형 광고 ID
  static const String rewardedAdIdIos = 'ca-app-pub-8841058711613546/3836647423';

  // ----- 테스트 광고 ID (디버그 모드용, 변경 불필요) -----

  static const String testBannerAdIdAndroid = 'ca-app-pub-3940256099942544/6300978111';
  static const String testBannerAdIdIos = 'ca-app-pub-3940256099942544/2934735716';

  static const String testInterstitialAdIdAndroid = 'ca-app-pub-3940256099942544/1033173712';
  static const String testInterstitialAdIdIos = 'ca-app-pub-3940256099942544/4411468910';

  static const String testRewardedAdIdAndroid = 'ca-app-pub-3940256099942544/5224354917';
  static const String testRewardedAdIdIos = 'ca-app-pub-3940256099942544/1712485313';

  /// 전면 광고 최소 간격 (초)
  static const int interstitialMinIntervalSeconds = 60;

  // ============================================================================
  // 인앱 결제 (IAP)
  // ============================================================================
  // [변경 필수] 스토어에 등록한 상품 ID로 교체하세요
  //
  // Google Play Console: 인앱 상품 > 관리되는 상품
  // App Store Connect: 앱 내 구입 > 비소모성
  //
  // 예시: 'movie_quiz_remove_ads', 'science_quiz_premium'

  /// 광고 제거 상품 ID (스토어에 등록한 ID와 일치해야 함)
  static const String removeAdsProductId = 'bible_quiz_memorize_verses_remove_ads';

  /// 프리미엄 상태 저장 키 (SharedPreferences, 일반적으로 변경 불필요)
  static const String premiumStorageKey = 'is_premium';

  // ============================================================================
  // 원격 데이터 동기화
  // ============================================================================
  // [변경 권장] GitHub 저장소 URL을 새 앱 저장소로 변경하세요
  //
  // 예시: 'https://raw.githubusercontent.com/YourOrg/movie-quiz/main/github-data'

  /// GitHub Raw 콘텐츠 베이스 URL
  /// TODO: 실제 GitHub 저장소 생성 후 URL 업데이트 필요
  static const String remoteDataBaseUrl =
      'https://raw.githubusercontent.com/Wearablock/bible-quiz-memorize-verses/main/github-data';

  /// 타임아웃 설정 (일반적으로 변경 불필요)
  static const int versionCheckTimeout = 10;
  static const int dataDownloadTimeout = 30;

  /// 로컬 저장소 키 (일반적으로 변경 불필요)
  static const String localVersionKey = 'quiz_data_version';
  static const String localDataPrefix = 'quiz_data_';

  // ============================================================================
  // 앱 URL (약관, 개인정보처리방침, 고객지원)
  // ============================================================================
  // [변경 필수] 새 앱의 GitHub Pages URL로 변경하세요
  //
  // 예시: 'https://yourorg.github.io/movie-quiz'

  /// 문서 베이스 URL
  /// TODO: GitHub Pages 설정 후 URL 업데이트 필요
  static const String docsBaseUrl = 'https://wearablock.github.io/bible-quiz-memorize-verses';

  /// 이용약관 URL
  static const String termsUrl = '$docsBaseUrl/terms.html';

  /// 개인정보처리방침 URL
  static const String privacyUrl = '$docsBaseUrl/privacy.html';

  /// 고객지원 URL
  static const String supportUrl = '$docsBaseUrl/support.html';
}
