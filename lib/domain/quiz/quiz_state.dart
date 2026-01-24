import 'package:equatable/equatable.dart';
import '../../data/models/question.dart';
import '../../data/models/quiz_session.dart';

/// 퀴즈 진행 단계
enum QuizPhase {
  /// 초기 상태 (문제 로딩 전)
  initial,

  /// 문제 로딩 중
  loading,

  /// 문제 표시 중 (답변 대기)
  answering,

  /// 답변 제출됨 (결과 표시)
  answered,

  /// 퀴즈 완료
  completed,

  /// 에러 발생
  error,
}

/// 퀴즈 상태
class QuizState extends Equatable {
  /// 현재 진행 단계
  final QuizPhase phase;

  /// 퀴즈 세션
  final QuizSession? session;

  /// 현재 문제의 셔플된 선택지
  final List<String> currentOptions;

  /// 선택한 답변 (answered 상태에서 사용)
  final String? selectedAnswer;

  /// 힌트 사용 여부
  final bool hintUsed;

  /// 힌트 표시 여부
  final bool hintVisible;

  /// 남은 시간 (초)
  final int remainingSeconds;

  /// 타이머 활성화 여부
  final bool timerEnabled;

  /// 문제당 시간 제한 (초)
  final int timeLimit;

  /// 에러 메시지
  final String? errorMessage;

  const QuizState({
    this.phase = QuizPhase.initial,
    this.session,
    this.currentOptions = const [],
    this.selectedAnswer,
    this.hintUsed = false,
    this.hintVisible = false,
    this.remainingSeconds = 30,
    this.timerEnabled = true,
    this.timeLimit = 30,
    this.errorMessage,
  });

  // === Getters ===

  /// 현재 문제
  Question? get currentQuestion =>
      session != null && !session!.isCompleted
          ? session!.currentQuestion
          : null;

  /// 현재 문제 번호 (1-based)
  int get currentNumber => session?.currentNumber ?? 0;

  /// 총 문제 수
  int get totalCount => session?.totalCount ?? 0;

  /// 진행률 (0.0 ~ 1.0)
  double get progress => session?.progress ?? 0.0;

  /// 정답 여부
  bool get isCorrect => selectedAnswer == currentQuestion?.correct;

  /// 시간 초과 여부
  bool get isTimeUp => timerEnabled && remainingSeconds <= 0;

  /// 힌트 텍스트
  String? get hintText => currentQuestion?.hint;

  /// 힌트 사용 가능 여부
  bool get canUseHint =>
      !hintUsed && hintText != null && phase == QuizPhase.answering;

  // === Copy Methods ===

  QuizState copyWith({
    QuizPhase? phase,
    QuizSession? session,
    List<String>? currentOptions,
    String? selectedAnswer,
    bool clearSelectedAnswer = false,
    bool? hintUsed,
    bool? hintVisible,
    int? remainingSeconds,
    bool? timerEnabled,
    int? timeLimit,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return QuizState(
      phase: phase ?? this.phase,
      session: session ?? this.session,
      currentOptions: currentOptions ?? this.currentOptions,
      selectedAnswer:
          clearSelectedAnswer ? null : (selectedAnswer ?? this.selectedAnswer),
      hintUsed: hintUsed ?? this.hintUsed,
      hintVisible: hintVisible ?? this.hintVisible,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      timerEnabled: timerEnabled ?? this.timerEnabled,
      timeLimit: timeLimit ?? this.timeLimit,
      errorMessage:
          clearErrorMessage ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
        phase,
        session,
        currentOptions,
        selectedAnswer,
        hintUsed,
        hintVisible,
        remainingSeconds,
        timerEnabled,
        timeLimit,
        errorMessage,
      ];
}
