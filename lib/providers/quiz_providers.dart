import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/question.dart';
import '../domain/quiz/quiz_notifier.dart';
import '../domain/quiz/quiz_state.dart';
import 'repository_providers.dart';

/// 퀴즈 설정 파라미터
class QuizConfig {
  final bool timerEnabled;
  final int timeLimit;

  const QuizConfig({
    this.timerEnabled = true,
    this.timeLimit = 30,
  });

  QuizConfig copyWith({
    bool? timerEnabled,
    int? timeLimit,
  }) {
    return QuizConfig(
      timerEnabled: timerEnabled ?? this.timerEnabled,
      timeLimit: timeLimit ?? this.timeLimit,
    );
  }
}

/// 퀴즈 설정 Provider
final quizConfigProvider = StateProvider<QuizConfig>((ref) {
  return const QuizConfig();
});

/// 퀴즈 Notifier Provider
final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
  final questionRepo = ref.watch(questionRepositoryProvider);
  final historyRepo = ref.watch(quizHistoryRepositoryProvider);
  final srsService = ref.watch(srsServiceProvider);
  final config = ref.watch(quizConfigProvider);

  return QuizNotifier(
    questionRepository: questionRepo,
    historyRepository: historyRepo,
    srsService: srsService,
    timerEnabled: config.timerEnabled,
    timeLimit: config.timeLimit,
  );
});

// === Derived Providers ===

/// 현재 퀴즈 진행 단계
final quizPhaseProvider = Provider<QuizPhase>((ref) {
  return ref.watch(quizProvider.select((s) => s.phase));
});

/// 현재 문제
final currentQuestionProvider = Provider<Question?>((ref) {
  return ref.watch(quizProvider.select((s) => s.currentQuestion));
});

/// 현재 선택지
final currentOptionsProvider = Provider<List<String>>((ref) {
  return ref.watch(quizProvider.select((s) => s.currentOptions));
});

/// 진행 상황 텍스트 (예: "3/10")
final progressTextProvider = Provider<String>((ref) {
  final state = ref.watch(quizProvider);
  return '${state.currentNumber}/${state.totalCount}';
});

/// 남은 시간
final remainingTimeProvider = Provider<int>((ref) {
  return ref.watch(quizProvider.select((s) => s.remainingSeconds));
});

/// 타이머 진행률 (0.0 ~ 1.0)
final timerProgressProvider = Provider<double>((ref) {
  final state = ref.watch(quizProvider);
  if (!state.timerEnabled || state.timeLimit == 0) return 1.0;
  return state.remainingSeconds / state.timeLimit;
});

/// 힌트 사용 가능 여부
final canUseHintProvider = Provider<bool>((ref) {
  return ref.watch(quizProvider.select((s) => s.canUseHint));
});

/// 힌트 텍스트 (힌트가 표시 중일 때만 반환)
final hintTextProvider = Provider<String?>((ref) {
  final state = ref.watch(quizProvider);
  return state.hintVisible ? state.hintText : null;
});

/// 퀴즈 결과 (완료 시)
final quizResultProvider = Provider<QuizResultData?>((ref) {
  final state = ref.watch(quizProvider);
  final session = state.session;
  if (state.phase != QuizPhase.completed || session == null) {
    return null;
  }

  return QuizResultData(
    totalCount: session.totalCount,
    correctCount: session.correctCount,
    wrongCount: session.wrongCount,
    accuracy: session.accuracy,
    duration: session.duration,
  );
});

/// 퀴즈 결과 데이터
class QuizResultData {
  final int totalCount;
  final int correctCount;
  final int wrongCount;
  final double accuracy;
  final Duration duration;

  const QuizResultData({
    required this.totalCount,
    required this.correctCount,
    required this.wrongCount,
    required this.accuracy,
    required this.duration,
  });

  int get accuracyPercent => (accuracy * 100).round();

  String get durationText {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes}m ${seconds}s';
  }
}
