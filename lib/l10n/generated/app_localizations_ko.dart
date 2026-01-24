// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '글로벌 상식 퀴즈';

  @override
  String get home => '홈';

  @override
  String get stats => '통계';

  @override
  String get review => '오답';

  @override
  String get settings => '설정';

  @override
  String get quickQuiz => '빠른 퀴즈';

  @override
  String get quickQuizDescription => '모든 카테고리에서 랜덤 10문제';

  @override
  String get categories => '카테고리';

  @override
  String get yourStats => '내 통계';

  @override
  String get answered => '푼 문제';

  @override
  String get correct => '정답률';

  @override
  String get questions => '문제';

  @override
  String question(int current, int total) {
    return '$total문제 중 $current번';
  }

  @override
  String get correctAnswer => '정답입니다!';

  @override
  String get wrongAnswer => '틀렸습니다!';

  @override
  String theCorrectAnswerIs(String answer) {
    return '정답: $answer';
  }

  @override
  String get next => '다음';

  @override
  String get finish => '완료';

  @override
  String get quizComplete => '퀴즈 완료!';

  @override
  String get yourScore => '점수';

  @override
  String outOf(int correct, int total) {
    return '$total문제 중 $correct개 정답';
  }

  @override
  String get playAgain => '다시 풀기';

  @override
  String get backToHome => '홈으로';

  @override
  String get wrongAnswers => '틀린 문제';

  @override
  String get noWrongAnswers => '틀린 문제가 없습니다!';

  @override
  String get reviewAll => '전체 복습';

  @override
  String get start => '시작';

  @override
  String wrongCount(int count) {
    return '$count개 오답';
  }

  @override
  String get recentWrong => '최근 오답';

  @override
  String get yourAnswer => '내 답';

  @override
  String get correctAnswerLabel => '정답';

  @override
  String hoursAgo(int hours) {
    return '$hours시간 전';
  }

  @override
  String get categoryGeography => '지리';

  @override
  String get categoryHistory => '역사';

  @override
  String get categoryScience => '과학';

  @override
  String get categoryArts => '예술/문화';

  @override
  String get categorySports => '스포츠';

  @override
  String get categoryNature => '자연';

  @override
  String get categoryTechnology => '기술/발명';

  @override
  String get categoryFood => '음식/생활';

  @override
  String get soundEffects => '효과음';

  @override
  String get soundEffectsDescription => '정답/오답 시 효과음 재생';

  @override
  String get vibration => '진동';

  @override
  String get vibrationDescription => '피드백 시 진동';

  @override
  String get theme => '테마';

  @override
  String get themeLight => '라이트';

  @override
  String get themeDark => '다크';

  @override
  String get themeSystem => '시스템';

  @override
  String get selectTheme => '테마 선택';

  @override
  String get language => '언어';

  @override
  String get selectLanguage => '언어 선택';

  @override
  String get systemDefault => '시스템 기본값';

  @override
  String get about => '정보';

  @override
  String get aboutDescription => '전 세계의 퀴즈로 지식을 테스트하세요!';

  @override
  String get resetAllData => '모든 데이터 초기화';

  @override
  String get resetAllDataTitle => '모든 데이터를 초기화할까요?';

  @override
  String get resetAllDataMessage => '퀴즈 기록과 설정이 모두 삭제됩니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String get cancel => '취소';

  @override
  String get reset => '초기화';

  @override
  String get dataResetSuccess => '모든 데이터가 초기화되었습니다';

  @override
  String get exitQuiz => '퀴즈 종료';

  @override
  String get progressWillBeLost => '진행 상황이 사라집니다.';

  @override
  String get exit => '종료';

  @override
  String get loadingQuestions => '문제 로딩 중...';

  @override
  String get timeUp => '시간 초과!';

  @override
  String get showHint => '힌트 보기';

  @override
  String get watchAdForHint => '광고를 시청하고 힌트를 확인하세요';

  @override
  String get watching => '시청 중';

  @override
  String get loading => '로딩...';

  @override
  String get adLoadingMessage => '광고를 불러오는 중입니다. 잠시 후 다시 시도해주세요.';

  @override
  String get messageOutstanding => '훌륭해요! 당신은 퀴즈 마스터입니다!';

  @override
  String get messageGreatJob => '잘했어요! 계속 화이팅!';

  @override
  String get messageGoodEffort => '좋은 노력이에요! 연습하면 완벽해집니다!';

  @override
  String get messageKeepLearning => '계속 배워요! 다음엔 더 잘할 거예요!';

  @override
  String get oopsSomethingWentWrong => '앗! 문제가 발생했습니다';

  @override
  String get goBack => '돌아가기';

  @override
  String get tryAgain => '다시 시도';

  @override
  String get overallProgress => '전체 진행률';

  @override
  String get categoryProgress => '카테고리별 진행률';

  @override
  String get accuracy => '정확도';

  @override
  String get accuracyRate => '정답률';

  @override
  String get unique => '고유';

  @override
  String get unableToLoadStats => '통계를 불러올 수 없습니다';

  @override
  String get youreDoingGreat => '잘하고 있어요!';

  @override
  String get leaderboardComingSoon => '리더보드가 곧 출시됩니다!';

  @override
  String get termsOfService => '이용약관';

  @override
  String get privacyPolicy => '개인정보처리방침';

  @override
  String get support => '고객지원';
}
