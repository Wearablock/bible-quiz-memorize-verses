import 'package:equatable/equatable.dart';

/// 문제 메타데이터 (언어 무관)
class QuestionMeta extends Equatable {
  final String id; // "q_geography_001"
  final String categoryId; // "geography"
  final int difficulty; // 1 (쉬움), 2 (보통), 3 (어려움)

  const QuestionMeta({
    required this.id,
    required this.categoryId,
    required this.difficulty,
  });

  factory QuestionMeta.fromJson(Map<String, dynamic> json) {
    return QuestionMeta(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      difficulty: json['difficulty'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'difficulty': difficulty,
    };
  }

  @override
  List<Object?> get props => [id, categoryId, difficulty];
}

/// 문제 콘텐츠 (언어별)
class QuestionContent extends Equatable {
  final String question; // 질문
  final String correct; // 정답
  final List<String> wrong; // 오답 3개
  final String? hint; // 힌트 (보상형 광고 후 제공)
  final String? explanation; // 해설 (선택)

  const QuestionContent({
    required this.question,
    required this.correct,
    required this.wrong,
    this.hint,
    this.explanation,
  });

  factory QuestionContent.fromJson(Map<String, dynamic> json) {
    return QuestionContent(
      question: json['question'] as String,
      correct: json['correct'] as String,
      wrong: List<String>.from(json['wrong'] as List),
      hint: json['hint'] as String?,
      explanation: json['explanation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'correct': correct,
      'wrong': wrong,
      if (hint != null) 'hint': hint,
      if (explanation != null) 'explanation': explanation,
    };
  }

  @override
  List<Object?> get props => [question, correct, wrong, hint, explanation];
}

/// 통합 문제 모델 (메타 + 콘텐츠)
class Question extends Equatable {
  final String id;
  final String categoryId;
  final int difficulty;
  final String question;
  final String correct;
  final List<String> wrong;
  final String? hint;
  final String? explanation;

  const Question({
    required this.id,
    required this.categoryId,
    required this.difficulty,
    required this.question,
    required this.correct,
    required this.wrong,
    this.hint,
    this.explanation,
  });

  /// 메타와 콘텐츠를 결합하여 Question 생성
  factory Question.fromMetaAndContent({
    required QuestionMeta meta,
    required QuestionContent content,
  }) {
    return Question(
      id: meta.id,
      categoryId: meta.categoryId,
      difficulty: meta.difficulty,
      question: content.question,
      correct: content.correct,
      wrong: content.wrong,
      hint: content.hint,
      explanation: content.explanation,
    );
  }

  /// 섞인 선택지 목록 반환
  List<String> getShuffledOptions() {
    final options = [correct, ...wrong];
    options.shuffle();
    return options;
  }

  /// 특정 답이 정답인지 확인
  bool isCorrectAnswer(String answer) {
    return answer == correct;
  }

  @override
  List<Object?> get props => [
        id,
        categoryId,
        difficulty,
        question,
        correct,
        wrong,
        hint,
        explanation,
      ];
}
