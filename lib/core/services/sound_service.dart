import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

/// 사운드 효과 타입
enum SoundEffect {
  /// 정답 선택 시
  correct,
  /// 오답 선택 시
  wrong,
  /// 타이머 틱
  tick,
  /// 퀴즈 통과 (50% 이상)
  quizPass,
  /// 퀴즈 미통과 (50% 미만)
  quizFail,
  /// 힌트 사용
  hint,
}

/// 사운드 서비스
class SoundService {
  static final SoundService _instance = SoundService._internal();
  factory SoundService() => _instance;
  SoundService._internal();

  final AudioPlayer _player = AudioPlayer();
  bool _enabled = true;

  void setEnabled(bool enabled) {
    _enabled = enabled;
  }

  Future<void> play(SoundEffect effect) async {
    if (!_enabled) return;

    final assetPath = switch (effect) {
      SoundEffect.correct => 'sounds/correct.mp3',
      SoundEffect.wrong => 'sounds/wrong.mp3',
      SoundEffect.tick => 'sounds/tick.mp3',
      SoundEffect.quizPass => 'sounds/correct.mp3',   // 통과: correct.mp3 사용
      SoundEffect.quizFail => 'sounds/complete.mp3',  // 미통과: complete.mp3 사용
      SoundEffect.hint => 'sounds/hint.mp3',
    };

    try {
      await _player.play(AssetSource(assetPath));
    } catch (e) {
      debugPrint('[SoundService] 사운드 재생 실패: $e');
    }
  }

  void dispose() {
    _player.dispose();
  }
}
