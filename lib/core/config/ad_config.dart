import 'dart:io';
import 'package:flutter/foundation.dart';

/// 광고 설정 및 ID 관리
class AdConfig {
  AdConfig._();

  /// 광고 활성화 여부
  static bool get adsEnabled => true;

  /// 테스트 모드 (디버그 빌드 시 자동 적용)
  static bool get isTestMode => kDebugMode;

  /// 전면 광고 최소 간격 (초)
  static const int interstitialMinIntervalSeconds = 60;

  // ============================================================
  // 배너 광고 ID
  // ============================================================
  static String get bannerAdUnitId {
    if (isTestMode) {
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111' // Android 테스트
          : 'ca-app-pub-3940256099942544/2934735716'; // iOS 테스트
    }
    return Platform.isAndroid
        ? 'ca-app-pub-8841058711613546/1726640787' // Android 실제 ID
        : 'ca-app-pub-8841058711613546/2575536644'; // iOS 실제 ID
  }

  // ============================================================
  // 전면 광고 ID
  // ============================================================
  static String get interstitialAdUnitId {
    if (isTestMode) {
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712' // Android 테스트
          : 'ca-app-pub-3940256099942544/4411468910'; // iOS 테스트
    }
    return Platform.isAndroid
        ? 'ca-app-pub-8841058711613546/9413559115' // Android 실제 ID
        : 'ca-app-pub-8841058711613546/8020586390'; // iOS 실제 ID
  }

  // ============================================================
  // 보상형 광고 ID
  // ============================================================
  static String get rewardedAdUnitId {
    if (isTestMode) {
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/5224354917' // Android 테스트
          : 'ca-app-pub-3940256099942544/1712485313'; // iOS 테스트
    }
    return Platform.isAndroid
        ? 'ca-app-pub-8841058711613546/4915254367' // Android 실제 ID
        : 'ca-app-pub-8841058711613546/3836647423'; // iOS 실제 ID
  }

  // ============================================================
  // 앱 ID (AndroidManifest, Info.plist에 설정 필요)
  // ============================================================
  // Android: ca-app-pub-8841058711613546~1163711616
  // iOS: ca-app-pub-8841058711613546~5102956627
  // 테스트: ca-app-pub-3940256099942544~3347511713 (Android)
  // 테스트: ca-app-pub-3940256099942544~1458002511 (iOS)
}
