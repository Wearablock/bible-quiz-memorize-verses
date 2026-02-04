import 'dart:io';
import 'package:flutter/foundation.dart';
import 'app_config.dart';

/// 광고 설정 및 ID 관리
///
/// 광고 ID 값은 [AppConfig]에서 관리됩니다.
/// 새로운 앱을 만들 때는 [AppConfig]의 광고 ID만 수정하세요.
class AdConfig {
  AdConfig._();

  /// 광고 활성화 여부
  static bool get adsEnabled => true;

  /// 테스트 모드 (디버그 빌드 시 자동 적용)
  static bool get isTestMode => kDebugMode;

  /// 전면 광고 최소 간격 (초)
  static const int interstitialMinIntervalSeconds =
      AppConfig.interstitialMinIntervalSeconds;

  // ============================================================
  // 배너 광고 ID
  // ============================================================
  static String get bannerAdUnitId {
    if (isTestMode) {
      return Platform.isAndroid
          ? AppConfig.testBannerAdIdAndroid
          : AppConfig.testBannerAdIdIos;
    }
    return Platform.isAndroid
        ? AppConfig.bannerAdIdAndroid
        : AppConfig.bannerAdIdIos;
  }

  // ============================================================
  // 전면 광고 ID
  // ============================================================
  static String get interstitialAdUnitId {
    if (isTestMode) {
      return Platform.isAndroid
          ? AppConfig.testInterstitialAdIdAndroid
          : AppConfig.testInterstitialAdIdIos;
    }
    return Platform.isAndroid
        ? AppConfig.interstitialAdIdAndroid
        : AppConfig.interstitialAdIdIos;
  }

  // ============================================================
  // 보상형 광고 ID
  // ============================================================
  static String get rewardedAdUnitId {
    if (isTestMode) {
      return Platform.isAndroid
          ? AppConfig.testRewardedAdIdAndroid
          : AppConfig.testRewardedAdIdIos;
    }
    return Platform.isAndroid
        ? AppConfig.rewardedAdIdAndroid
        : AppConfig.rewardedAdIdIos;
  }

  // ============================================================
  // 앱 ID (AndroidManifest, Info.plist에 설정 필요)
  // ============================================================
  // Android: ca-app-pub-8841058711613546~7288319575
  // iOS: ca-app-pub-8841058711613546~9283492751
  // 테스트: ca-app-pub-3940256099942544~3347511713 (Android)
  // 테스트: ca-app-pub-3940256099942544~1458002511 (iOS)
}
