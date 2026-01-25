import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/question.dart';
import '../../data/models/quiz_session.dart';
import '../../data/repositories/question_repository.dart';
import '../../data/repositories/quiz_history_repository.dart';
import 'quiz_state.dart';

class QuizNotifier extends StateNotifier<QuizState> {
  final QuestionRepository _questionRepository;
  final QuizHistoryRepository _historyRepository;

  Timer? _timer;
  static const _uuid = Uuid();

  QuizNotifier({
    required QuestionRepository questionRepository,
    required QuizHistoryRepository historyRepository,
    bool timerEnabled = true,
    int timeLimit = 30,
  })  : _questionRepository = questionRepository,
        _historyRepository = historyRepository,
        super(QuizState(
          timerEnabled: timerEnabled,
          timeLimit: timeLimit,
          remainingSeconds: timeLimit,
        ));

  // === Quiz Lifecycle ===

  /// 카테고리별 퀴즈 시작
  Future<void> startCategoryQuiz({
    required String categoryId,
    required String locale,
    int questionCount = 10,
  }) async {
    state = state.copyWith(phase: QuizPhase.loading);

    try {
      // 이미 푼 문제 ID 조회 (안 푼 문제 우선)
      final answeredIds = await _historyRepository.getAnsweredQuestionIds(
        categoryId: categoryId,
      );

      final questions = await _questionRepository.getQuestionsByCategory(
        categoryId: categoryId,
        locale: locale,
        limit: questionCount,
        shuffle: true,
        answeredIds: answeredIds,
      );

      if (questions.isEmpty) {
        state = state.copyWith(
          phase: QuizPhase.error,
          errorMessage: 'No questions available',
        );
        return;
      }

      _initializeSession(questions);
    } catch (e) {
      state = state.copyWith(
        phase: QuizPhase.error,
        errorMessage: e.toString(),
      );
    }
  }

  /// 랜덤 퀴즈 시작
  Future<void> startRandomQuiz({
    required String locale,
    int questionCount = 10,
    List<String>? categoryIds,
  }) async {
    state = state.copyWith(phase: QuizPhase.loading);

    try {
      // 이미 푼 문제 ID 조회 (안 푼 문제 우선)
      final answeredIds = await _historyRepository.getAnsweredQuestionIds();

      final questions = await _questionRepository.getRandomQuestions(
        locale: locale,
        count: questionCount,
        categoryIds: categoryIds,
        answeredIds: answeredIds,
      );

      if (questions.isEmpty) {
        state = state.copyWith(
          phase: QuizPhase.error,
          errorMessage: 'No questions available',
        );
        return;
      }

      _initializeSession(questions);
    } catch (e) {
      state = state.copyWith(
        phase: QuizPhase.error,
        errorMessage: e.toString(),
      );
    }
  }

  /// 오답 복습 퀴즈 시작
  Future<void> startReviewQuiz({
    required String locale,
    String? categoryId,
    int? limit,
  }) async {
    state = state.copyWith(phase: QuizPhase.loading);

    try {
      // 틀린 문제 ID 가져오기
      final wrongIds = await _historyRepository.getWrongQuestionIds(
        categoryId: categoryId,
      );

      if (wrongIds.isEmpty) {
        state = state.copyWith(
          phase: QuizPhase.error,
          errorMessage: 'No wrong answers to review',
        );
        return;
      }

      // 제한 적용
      final targetIds = limit != null && limit < wrongIds.length
          ? (wrongIds..shuffle()).take(limit).toList()
          : wrongIds;

      // 문제 로드
      final questions = await _questionRepository.getQuestionsByIds(
        questionIds: targetIds,
        locale: locale,
      );

      if (questions.isEmpty) {
        state = state.copyWith(
          phase: QuizPhase.error,
          errorMessage: 'Failed to load questions',
        );
        return;
      }

      _initializeSession(questions);
    } catch (e) {
      state = state.copyWith(
        phase: QuizPhase.error,
        errorMessage: e.toString(),
      );
    }
  }

  /// 세션 초기화
  void _initializeSession(List<Question> questions) {
    final session = QuizSession(
      id: _uuid.v4(),
      startedAt: DateTime.now(),
      questions: questions,
    );

    state = state.copyWith(
      phase: QuizPhase.answering,
      session: session,
      currentOptions: questions.first.getShuffledOptions(),
      clearSelectedAnswer: true,
      hintUsed: false,
      hintVisible: false,
      remainingSeconds: state.timeLimit,
    );

    _startTimer();
  }

  // === Answer Handling ===

  /// 답변 선택
  void selectAnswer(String answer) {
    if (state.phase != QuizPhase.answering) return;
    if (state.session == null) return;

    _stopTimer();

    // 세션에 답변 기록
    state.session!.submitAnswer(answer);

    state = state.copyWith(
      phase: QuizPhase.answered,
      selectedAnswer: answer,
    );

    // 기록 저장 (비동기)
    _saveAnswerHistory(answer);
  }

  /// 시간 초과 처리
  void handleTimeUp() {
    if (state.phase != QuizPhase.answering) return;

    _stopTimer();

    // 시간 초과 = 오답 처리 (null 답변)
    state.session?.submitAnswer(null);

    state = state.copyWith(
      phase: QuizPhase.answered,
      clearSelectedAnswer: true,
    );

    // 기록 저장
    _saveAnswerHistory(null);
  }

  /// 답변 기록 저장
  Future<void> _saveAnswerHistory(String? answer) async {
    final question = state.currentQuestion;
    if (question == null) return;

    await _historyRepository.recordAnswer(
      questionId: question.id,
      categoryId: question.categoryId,
      isCorrect: answer == question.correct,
      selectedAnswer: answer,
    );
  }

  // === Navigation ===

  /// 다음 문제로 이동
  void nextQuestion() {
    if (state.phase != QuizPhase.answered) return;
    if (state.session == null) return;

    state.session!.moveToNext();

    if (state.session!.isCompleted) {
      state = state.copyWith(phase: QuizPhase.completed);
    } else {
      state = state.copyWith(
        phase: QuizPhase.answering,
        currentOptions: state.session!.currentQuestion.getShuffledOptions(),
        clearSelectedAnswer: true,
        hintUsed: false,
        hintVisible: false,
        remainingSeconds: state.timeLimit,
      );

      _startTimer();
    }
  }

  /// 퀴즈 종료 (중도 포기)
  void quitQuiz() {
    _stopTimer();
    state = state.copyWith(phase: QuizPhase.completed);
  }

  /// 퀴즈 재시작
  void reset() {
    _stopTimer();
    state = QuizState(
      timerEnabled: state.timerEnabled,
      timeLimit: state.timeLimit,
      remainingSeconds: state.timeLimit,
    );
  }

  // === Hint System ===

  /// 힌트 사용 (보상형 광고 후 호출)
  void useHint() {
    if (!state.canUseHint) return;

    state = state.copyWith(
      hintUsed: true,
      hintVisible: true,
    );
  }

  /// 힌트 표시/숨김 토글
  void toggleHintVisibility() {
    if (!state.hintUsed) return;

    state = state.copyWith(
      hintVisible: !state.hintVisible,
    );
  }

  // === Timer ===

  void _startTimer() {
    if (!state.timerEnabled) return;

    _stopTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.remainingSeconds > 0) {
        state = state.copyWith(
          remainingSeconds: state.remainingSeconds - 1,
        );
      } else {
        handleTimeUp();
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  /// 타이머 일시정지
  void pauseTimer() {
    _stopTimer();
  }

  /// 타이머 재개
  void resumeTimer() {
    if (state.phase == QuizPhase.answering) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }
}
