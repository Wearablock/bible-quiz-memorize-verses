import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

/// 진동 피드백 타입
enum HapticType {
  light,
  medium,
  heavy,
  success,
  error,
  warning,
}

/// 진동 피드백 서비스
class HapticService {
  static final HapticService _instance = HapticService._internal();
  factory HapticService() => _instance;
  HapticService._internal();

  bool _enabled = true;
  bool? _hasVibrator;

  void setEnabled(bool enabled) {
    _enabled = enabled;
  }

  Future<void> trigger(HapticType type) async {
    if (!_enabled) return;

    // 진동 지원 확인
    if (_hasVibrator == null) {
      _hasVibrator = await Vibration.hasVibrator();
    }
    if (_hasVibrator != true) return;

    switch (type) {
      case HapticType.light:
        HapticFeedback.lightImpact();
        break;
      case HapticType.medium:
        HapticFeedback.mediumImpact();
        break;
      case HapticType.heavy:
        HapticFeedback.heavyImpact();
        break;
      case HapticType.success:
        // 정답: 짧은 2회 진동
        await Vibration.vibrate(pattern: [0, 50, 50, 50]);
        break;
      case HapticType.error:
        // 오답: 긴 1회 진동
        await Vibration.vibrate(duration: 200);
        break;
      case HapticType.warning:
        // 경고: 빠른 3회 진동
        await Vibration.vibrate(pattern: [0, 30, 30, 30, 30, 30]);
        break;
    }
  }
}
