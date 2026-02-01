import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

/// 사운드 효과 타입 (정답/오답만 사용)
enum SoundEffect {
  /// 정답 선택 시
  correct,
  /// 오답 선택 시
  wrong,
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
