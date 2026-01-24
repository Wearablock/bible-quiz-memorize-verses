import 'sound_service.dart';
import 'haptic_service.dart';

/// 사운드와 진동을 통합 관리하는 피드백 서비스
class FeedbackService {
  static final FeedbackService _instance = FeedbackService._internal();
  factory FeedbackService() => _instance;
  FeedbackService._internal();

  final SoundService _sound = SoundService();
  final HapticService _haptic = HapticService();

  /// 사운드 활성화 설정
  void setSoundEnabled(bool enabled) {
    _sound.setEnabled(enabled);
  }

  /// 진동 활성화 설정
  void setVibrationEnabled(bool enabled) {
    _haptic.setEnabled(enabled);
  }

  /// 정답 피드백
  Future<void> onCorrectAnswer() async {
    await Future.wait([
      _sound.play(SoundEffect.correct),
      _haptic.trigger(HapticType.success),
    ]);
  }

  /// 오답 피드백
  Future<void> onWrongAnswer() async {
    await Future.wait([
      _sound.play(SoundEffect.wrong),
      _haptic.trigger(HapticType.error),
    ]);
  }

  /// 힌트 사용 피드백
  Future<void> onHintUsed() async {
    await Future.wait([
      _sound.play(SoundEffect.hint),
      _haptic.trigger(HapticType.light),
    ]);
  }

  /// 퀴즈 완료 피드백
  Future<void> onQuizComplete() async {
    await Future.wait([
      _sound.play(SoundEffect.complete),
      _haptic.trigger(HapticType.heavy),
    ]);
  }

  /// 시간 경고 피드백 (5초 이하)
  Future<void> onTimeWarning() async {
    await _haptic.trigger(HapticType.warning);
  }

  /// 버튼 탭 피드백
  Future<void> onTap() async {
    await _haptic.trigger(HapticType.light);
  }

  void dispose() {
    _sound.dispose();
  }
}
