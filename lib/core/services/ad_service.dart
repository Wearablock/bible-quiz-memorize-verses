import 'dart:io';
import 'package:flutter/widgets.dart' show Orientation;
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import '../config/ad_config.dart';
import 'iap_service.dart';

/// 광고 서비스 (싱글톤)
/// - 배너, 전면, 보상형 광고 관리
class AdService extends ChangeNotifier {
  // 싱글톤 패턴
  static final AdService _instance = AdService._internal();
  factory AdService() => _instance;
  AdService._internal();

  // 초기화 상태
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // ============================================================
  // 배너 광고
  // ============================================================
  BannerAd? _bannerAd;
  bool _isBannerAdLoaded = false;
  double? _bannerScreenWidth;

  bool get isBannerAdLoaded => _isBannerAdLoaded;
  BannerAd? get bannerAd => _isBannerAdLoaded ? _bannerAd : null;

  // ============================================================
  // 전면 광고
  // ============================================================
  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdReady = false;
  DateTime? _lastInterstitialShowTime;

  bool get isInterstitialAdReady => _isInterstitialAdReady;

  // ============================================================
  // 보상형 광고
  // ============================================================
  RewardedAd? _rewardedAd;
  bool _isRewardedAdReady = false;

  bool get isRewardedAdReady => _isRewardedAdReady;

  // ============================================================
  // 초기화
  // ============================================================

  /// AdMob SDK 초기화 (앱 시작 시 한 번 호출)
  Future<void> initialize() async {
    if (_isInitialized) return;
    if (!AdConfig.adsEnabled) return;

    try {
      // iOS 14.5+ ATT 권한 요청
      if (Platform.isIOS) {
        final status = await AppTrackingTransparency.trackingAuthorizationStatus;
        if (status == TrackingStatus.notDetermined) {
          await Future.delayed(const Duration(milliseconds: 500));
          await AppTrackingTransparency.requestTrackingAuthorization();
        }
      }

      await MobileAds.instance.initialize();
      _isInitialized = true;
      debugPrint('[AdService] 초기화 완료');
    } catch (e) {
      debugPrint('[AdService] 초기화 실패: $e');
      _isInitialized = false;
    }
  }

  /// 전면/보상형 광고 미리 로드
  Future<void> preloadAds() async {
    if (!_isInitialized || !AdConfig.adsEnabled) return;

    await Future.wait([
      _loadInterstitialAd(),
      _loadRewardedAd(),
    ]);
  }

  // ============================================================
  // 배너 광고
  // ============================================================

  /// 배너 광고 로드 (화면 너비 기반 Adaptive 사이즈)
  Future<void> loadBannerAd(double screenWidth) async {
    if (!AdConfig.adsEnabled) return;

    // 이미 같은 너비로 로드된 경우 스킵
    if (_isBannerAdLoaded && _bannerScreenWidth == screenWidth) return;
    _bannerScreenWidth = screenWidth;

    // 기존 광고 정리
    await _bannerAd?.dispose();
    _isBannerAdLoaded = false;

    // Adaptive Banner 사이즈 계산
    final AdSize? adaptiveSize = await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      screenWidth.toInt(),
    );

    final AdSize adSize = adaptiveSize ?? AdSize.banner;

    _bannerAd = BannerAd(
      adUnitId: AdConfig.bannerAdUnitId,
      size: adSize,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _isBannerAdLoaded = true;
          notifyListeners();
          debugPrint('[AdService] 배너 광고 로드 성공: ${adSize.width}x${adSize.height}');
        },
        onAdFailedToLoad: (ad, error) {
          _isBannerAdLoaded = false;
          ad.dispose();
          debugPrint('[AdService] 배너 광고 로드 실패: ${error.message}');
        },
      ),
    );

    await _bannerAd!.load();
  }

  // ============================================================
  // 전면 광고
  // ============================================================

  /// 전면 광고 로드
  Future<void> _loadInterstitialAd() async {
    if (_isInterstitialAdReady) return;

    await InterstitialAd.load(
      adUnitId: AdConfig.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdReady = true;
          debugPrint('[AdService] 전면 광고 로드 성공');

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _interstitialAd = null;
              _isInterstitialAdReady = false;
              _loadInterstitialAd(); // 재로드
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _interstitialAd = null;
              _isInterstitialAdReady = false;
              _loadInterstitialAd();
            },
          );
        },
        onAdFailedToLoad: (error) {
          _isInterstitialAdReady = false;
          debugPrint('[AdService] 전면 광고 로드 실패: ${error.message}');
        },
      ),
    );
  }

  /// 전면 광고 표시 (퀴즈 종료 시)
  Future<bool> showInterstitialAd() async {
    if (!AdConfig.adsEnabled) return false;

    // 프리미엄 사용자는 전면 광고 스킵
    if (IAPService().isPremium) {
      debugPrint('[AdService] 프리미엄 사용자 - 전면 광고 스킵');
      return false;
    }

    // 최소 간격 체크
    if (_lastInterstitialShowTime != null) {
      final elapsed = DateTime.now().difference(_lastInterstitialShowTime!);
      if (elapsed.inSeconds < AdConfig.interstitialMinIntervalSeconds) {
        debugPrint('[AdService] 전면 광고 간격 미충족: ${elapsed.inSeconds}초');
        return false;
      }
    }

    if (!_isInterstitialAdReady || _interstitialAd == null) {
      debugPrint('[AdService] 전면 광고 미준비');
      return false;
    }

    _lastInterstitialShowTime = DateTime.now();
    await _interstitialAd!.show();
    return true;
  }

  // ============================================================
  // 보상형 광고
  // ============================================================

  /// 보상형 광고 로드
  Future<void> _loadRewardedAd() async {
    if (_isRewardedAdReady) return;

    await RewardedAd.load(
      adUnitId: AdConfig.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isRewardedAdReady = true;
          notifyListeners();
          debugPrint('[AdService] 보상형 광고 로드 성공');

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _rewardedAd = null;
              _isRewardedAdReady = false;
              notifyListeners();
              _loadRewardedAd(); // 재로드
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _rewardedAd = null;
              _isRewardedAdReady = false;
              notifyListeners();
              _loadRewardedAd();
            },
          );
        },
        onAdFailedToLoad: (error) {
          _isRewardedAdReady = false;
          notifyListeners();
          debugPrint('[AdService] 보상형 광고 로드 실패: ${error.message}');
        },
      ),
    );
  }

  /// 보상형 광고 표시 (힌트 보기 시)
  Future<bool> showRewardedAd({
    required void Function() onRewarded,
  }) async {
    if (!AdConfig.adsEnabled) {
      onRewarded();
      return true;
    }

    // 프리미엄 사용자는 광고 없이 보상 지급
    if (IAPService().isPremium) {
      debugPrint('[AdService] 프리미엄 사용자 - 광고 없이 보상 지급');
      onRewarded();
      return true;
    }

    if (!_isRewardedAdReady || _rewardedAd == null) {
      debugPrint('[AdService] 보상형 광고 미준비');
      return false;
    }

    bool rewarded = false;

    await _rewardedAd!.show(
      onUserEarnedReward: (ad, reward) {
        rewarded = true;
        onRewarded();
        debugPrint('[AdService] 보상 획득: ${reward.amount} ${reward.type}');
      },
    );

    return rewarded;
  }

  // ============================================================
  // 정리
  // ============================================================

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    _bannerAd = null;
    _interstitialAd = null;
    _rewardedAd = null;
    _isBannerAdLoaded = false;
    _isInterstitialAdReady = false;
    _isRewardedAdReady = false;
    super.dispose();
  }
}
