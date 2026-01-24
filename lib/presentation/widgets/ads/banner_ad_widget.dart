import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../core/config/ad_config.dart';
import '../../../core/services/ad_service.dart';

/// 배너 광고 위젯
/// - Adaptive Banner로 화면 너비에 맞춤
/// - 광고 로드 전 placeholder 표시
class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  final AdService _adService = AdService();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 화면 너비를 가져와서 광고 로드
    final width = MediaQuery.of(context).size.width;
    _adService.loadBannerAd(width);
  }

  @override
  Widget build(BuildContext context) {
    // 광고 비활성화 시 빈 공간
    if (!AdConfig.adsEnabled) {
      return const SizedBox.shrink();
    }

    return ListenableBuilder(
      listenable: _adService,
      builder: (context, _) {
        final bannerAd = _adService.bannerAd;

        // 광고 로드 전 placeholder
        if (bannerAd == null) {
          return Container(
            height: 50,
            color: Colors.transparent,
          );
        }

        // 광고 표시
        return Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: bannerAd.size.height.toDouble(),
          child: AdWidget(ad: bannerAd),
        );
      },
    );
  }
}
